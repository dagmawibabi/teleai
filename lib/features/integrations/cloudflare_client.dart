import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class CloudflareException implements Exception {
  CloudflareException(this.message, {this.status});
  final String message;
  final int? status;

  @override
  String toString() => message;
}

/// R2 credentials for its S3-compatible API, the way ScholarXIV stores
/// files (src/lib/server/storage/r2.ts): an account-scoped endpoint,
/// region "auto", and an access key pair made under R2 → API tokens.
class R2Credentials {
  const R2Credentials({required this.accountId, required this.accessKeyId, required this.secretAccessKey});
  final String accountId;
  final String accessKeyId;
  final String secretAccessKey;

  bool get complete => accountId.isNotEmpty && accessKeyId.isNotEmpty && secretAccessKey.isNotEmpty;
  String get host => '$accountId.r2.cloudflarestorage.com';
}

/// Cloudflare's REST API (v4) with an API token, and R2 objects through the
/// S3 API with SigV4 signatures.
class CloudflareClient {
  CloudflareClient(this.token, {this.accountId = '', this.r2});

  final String token;

  /// The account Workers, Pages, KV and R2 calls use; found from the token
  /// when empty.
  String accountId;
  final R2Credentials? r2;
  final http.Client _http = http.Client();

  static const api = 'https://api.cloudflare.com/client/v4';

  static String errorText(String body) {
    try {
      final j = jsonDecode(body);
      if (j is Map && j['errors'] is List && (j['errors'] as List).isNotEmpty) {
        return (j['errors'] as List).map((e) => e is Map ? '${e['message']}${e['code'] == null ? '' : ' (${e['code']})'}' : '$e').join('; ');
      }
      if (j is Map && j['message'] != null) return '${j['message']}';
    } catch (_) {}
    return body.length > 300 ? '${body.substring(0, 300)}…' : body;
  }

  /// Null when the token works, or what went wrong.
  static Future<String?> verifyToken(String token) async {
    if (token.trim().isEmpty) return 'Paste a Cloudflare API token first.';
    try {
      final r = await http
          .get(Uri.parse('$api/user/tokens/verify'), headers: {'Authorization': 'Bearer ${token.trim()}'})
          .timeout(const Duration(seconds: 20));
      if (r.statusCode == 200) return null;
      // Account-owned tokens verify on their account instead.
      final accounts = await http
          .get(Uri.parse('$api/accounts?per_page=1'), headers: {'Authorization': 'Bearer ${token.trim()}'})
          .timeout(const Duration(seconds: 20));
      return accounts.statusCode == 200 ? null : errorText(r.body);
    } catch (e) {
      return 'Could not reach Cloudflare: $e';
    }
  }

  /// Calls the API; returns `result`, with `result_info` when [paged].
  Future<dynamic> call(String method, String path, {Object? body, Map<String, String>? query, String? rawBody, String? contentType}) async {
    final uri = Uri.parse('$api$path').replace(queryParameters: query == null || query.isEmpty ? null : query);
    final req = http.Request(method, uri)..headers['Authorization'] = 'Bearer ${token.trim()}';
    if (rawBody != null) {
      req.headers['Content-Type'] = contentType ?? 'text/plain';
      req.body = rawBody;
    } else if (body != null) {
      req.headers['Content-Type'] = 'application/json';
      req.body = jsonEncode(body);
    }
    final http.Response r;
    try {
      r = await http.Response.fromStream(await _http.send(req).timeout(const Duration(seconds: 60)));
    } catch (e) {
      throw CloudflareException('Could not reach Cloudflare: $e');
    }
    final text = utf8.decode(r.bodyBytes, allowMalformed: true);
    if (r.statusCode < 200 || r.statusCode >= 300) throw CloudflareException(errorText(text), status: r.statusCode);
    final type = r.headers['content-type'] ?? '';
    if (!type.contains('json')) return text;
    final j = jsonDecode(text);
    if (j is Map && j['success'] == false) throw CloudflareException(errorText(text), status: r.statusCode);
    return j is Map && j.containsKey('result') ? j['result'] : j;
  }

  Future<String> account() async {
    if (accountId.isNotEmpty) return accountId;
    final list = await call('GET', '/accounts', query: {'per_page': '5'});
    if (list is! List || list.isEmpty) throw CloudflareException('This token sees no account. Add the account ID in Settings.');
    return accountId = '${(list.first as Map)['id']}';
  }

  // ---- R2 through the S3 API ------------------------------------------------------

  /// The inner text of each <tag>…</tag> in S3's XML.
  static List<String> _tags(String xml, String tag) => [
    for (final m in RegExp('<$tag>([\\s\\S]*?)</$tag>').allMatches(xml)) m[1]!,
  ];

  static String? _tag(String xml, String tag) {
    final v = _tags(xml, tag).firstOrNull;
    return v?.replaceAll('&amp;', '&').replaceAll('&lt;', '<').replaceAll('&gt;', '>');
  }

  static String _hex(List<int> b) => b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  static List<int> _hmac(List<int> key, String data) => Hmac(sha256, key).convert(utf8.encode(data)).bytes;

  /// S3 path segments are percent-encoded except for unreserved characters.
  static String _encodeKey(String key) => key.split('/').map((s) => Uri.encodeComponent(s).replaceAll('+', '%20')).join('/');

  static String _canonicalQuery(Map<String, String> q) {
    final keys = q.keys.toList()..sort();
    return keys.map((k) => '${Uri.encodeComponent(k)}=${Uri.encodeComponent(q[k]!)}').join('&');
  }

  /// A SigV4-signed request to R2 (service s3, region auto).
  Future<http.Response> s3(String method, String bucket, {String key = '', Map<String, String> query = const {}, Uint8List? body, String? contentType}) async {
    final c = r2;
    if (c == null || !c.complete) {
      throw CloudflareException('R2 files need an R2 access key: add the account ID, access key ID and secret in Settings → Apps & web → Cloudflare.');
    }
    final now = DateTime.now().toUtc();
    String two(int n) => n.toString().padLeft(2, '0');
    final date = '${now.year}${two(now.month)}${two(now.day)}';
    final stamp = '${date}T${two(now.hour)}${two(now.minute)}${two(now.second)}Z';
    final payload = body ?? Uint8List(0);
    final payloadHash = _hex(sha256.convert(payload).bytes);
    final path = '/${Uri.encodeComponent(bucket)}${key.isEmpty ? '' : '/${_encodeKey(key)}'}';
    final query0 = _canonicalQuery(query);
    final headers = <String, String>{
      'host': c.host,
      'x-amz-content-sha256': payloadHash,
      'x-amz-date': stamp,
      'content-type': ?contentType,
    };
    final names = headers.keys.toList()..sort();
    final canonical = [
      method,
      path,
      query0,
      ...names.map((n) => '$n:${headers[n]!.trim()}'),
      '',
      names.join(';'),
      payloadHash,
    ].join('\n');
    final scope = '$date/auto/s3/aws4_request';
    final toSign = ['AWS4-HMAC-SHA256', stamp, scope, _hex(sha256.convert(utf8.encode(canonical)).bytes)].join('\n');
    var k = _hmac(utf8.encode('AWS4${c.secretAccessKey}'), date);
    k = _hmac(k, 'auto');
    k = _hmac(k, 's3');
    k = _hmac(k, 'aws4_request');
    final signature = _hex(_hmac(k, toSign));
    final req = http.Request(method, Uri.parse('https://${c.host}$path${query0.isEmpty ? '' : '?$query0'}'))
      ..headers.addAll({...headers..remove('host')})
      ..headers['Authorization'] =
          'AWS4-HMAC-SHA256 Credential=${c.accessKeyId}/$scope, SignedHeaders=${names.join(';')}, Signature=$signature';
    if (body != null) req.bodyBytes = body;
    try {
      final r = await http.Response.fromStream(await _http.send(req).timeout(const Duration(seconds: 120)));
      if (r.statusCode < 200 || r.statusCode >= 300) {
        final msg = _tag(r.body, 'Message') ?? _tag(r.body, 'Code') ?? 'HTTP ${r.statusCode}';
        throw CloudflareException('R2: $msg', status: r.statusCode);
      }
      return r;
    } on CloudflareException {
      rethrow;
    } catch (e) {
      throw CloudflareException('Could not reach R2: $e');
    }
  }

  /// Objects in [bucket] under [prefix], one folder level when [delimiter].
  Future<Map<String, dynamic>> listObjects(String bucket, {String prefix = '', bool delimiter = true, int max = 200, String? cursor}) async {
    final r = await s3('GET', bucket, query: {
      'list-type': '2',
      'max-keys': '${max.clamp(1, 1000)}',
      if (prefix.isNotEmpty) 'prefix': prefix,
      if (delimiter) 'delimiter': '/',
      'continuation-token': ?cursor,
    });
    final xml = r.body;
    return {
      'bucket': bucket,
      'prefix': prefix,
      'folders': [for (final p in _tags(xml, 'CommonPrefixes')) _tag(p, 'Prefix')],
      'objects': [
        for (final o in _tags(xml, 'Contents'))
          {
            'key': _tag(o, 'Key'),
            'size': int.tryParse(_tag(o, 'Size') ?? ''),
            'modified': _tag(o, 'LastModified'),
            'etag': _tag(o, 'ETag')?.replaceAll('"', '').replaceAll('&quot;', ''),
          },
      ],
      if (_tag(xml, 'IsTruncated') == 'true') 'next_cursor': _tag(xml, 'NextContinuationToken'),
    };
  }

  Future<Uint8List> getObject(String bucket, String key) async => (await s3('GET', bucket, key: key)).bodyBytes;

  Future<void> putObject(String bucket, String key, Uint8List bytes, String contentType) =>
      s3('PUT', bucket, key: key, body: bytes, contentType: contentType);

  Future<void> deleteObject(String bucket, String key) => s3('DELETE', bucket, key: key);

  /// A presigned GET link that works for [expires], for sharing a file.
  String presign(String bucket, String key, {Duration expires = const Duration(hours: 1)}) {
    final c = r2;
    if (c == null || !c.complete) throw CloudflareException('Add an R2 access key in Settings first.');
    final now = DateTime.now().toUtc();
    String two(int n) => n.toString().padLeft(2, '0');
    final date = '${now.year}${two(now.month)}${two(now.day)}';
    final stamp = '${date}T${two(now.hour)}${two(now.minute)}${two(now.second)}Z';
    final scope = '$date/auto/s3/aws4_request';
    final path = '/${Uri.encodeComponent(bucket)}/${_encodeKey(key)}';
    final q = {
      'X-Amz-Algorithm': 'AWS4-HMAC-SHA256',
      'X-Amz-Credential': '${c.accessKeyId}/$scope',
      'X-Amz-Date': stamp,
      'X-Amz-Expires': '${expires.inSeconds.clamp(1, 604800)}',
      'X-Amz-SignedHeaders': 'host',
    };
    final query = _canonicalQuery(q);
    final canonical = ['GET', path, query, 'host:${c.host}', '', 'host', 'UNSIGNED-PAYLOAD'].join('\n');
    final toSign = ['AWS4-HMAC-SHA256', stamp, scope, _hex(sha256.convert(utf8.encode(canonical)).bytes)].join('\n');
    var k = _hmac(utf8.encode('AWS4${c.secretAccessKey}'), date);
    k = _hmac(k, 'auto');
    k = _hmac(k, 's3');
    k = _hmac(k, 'aws4_request');
    return 'https://${c.host}$path?$query&X-Amz-Signature=${_hex(_hmac(k, toSign))}';
  }

  void close() => _http.close();
}
