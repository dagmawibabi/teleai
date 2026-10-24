import 'dart:convert';

import 'package:http/http.dart' as http;

class ComposioException implements Exception {
  ComposioException(this.message, {this.status});
  final String message;
  final int? status;

  @override
  String toString() => message;
}

/// An app account the user connected through Composio.
class ConnectedApp {
  const ConnectedApp({required this.id, required this.toolkit, required this.status, this.alias});
  final String id;
  final String toolkit;
  final String status;
  final String? alias;

  bool get active => status == 'ACTIVE';
}

/// A tool from Composio's catalog, as find_app_tools reports it.
class ComposioToolInfo {
  const ComposioToolInfo({required this.slug, required this.name, required this.description, required this.toolkit, this.parameters = const {}});
  final String slug;
  final String name;
  final String description;
  final String toolkit;
  final Map<String, dynamic> parameters;
}

/// Composio's REST API (v3.1), the same calls XIV makes through the
/// TypeScript SDK: a tool-router session per user executes tools and makes
/// connect links, and connected accounts are listed and removed directly.
///
/// Composio keeps the OAuth tokens; this phone only holds the project API
/// key and a user id that names this person's connections.
class ComposioClient {
  ComposioClient(this.apiKey, this.userId);

  final String apiKey;
  final String userId;
  final http.Client _http = http.Client();

  static const base = 'https://backend.composio.dev/api/v3.1';

  /// One session per key and user for the life of the process.
  static final _sessions = <String, String>{};
  String get _sessionKey => '${apiKey.hashCode}:$userId';

  Map<String, String> get _headers => {'x-api-key': apiKey.trim(), 'Content-Type': 'application/json'};

  /// The project API key is `ak_…`; other Composio keys are refused with a
  /// clearer reason than the API gives.
  static String? keyProblem(String key) {
    final k = key.trim();
    if (k.isEmpty) return 'Paste a Composio API key first.';
    if (k.startsWith('ck_')) {
      return 'That is a Connect consumer key. Use the project API key from Composio → Settings → API keys (it starts with ak_).';
    }
    if (k.startsWith('uak_')) return 'That is a user API key. Use the project API key, which starts with ak_.';
    return null;
  }

  /// Null when the key works, or what went wrong.
  static Future<String?> verifyKey(String key) async {
    final problem = keyProblem(key);
    if (problem != null) return problem;
    try {
      final r = await http
          .get(Uri.parse('$base/connected_accounts?limit=1'), headers: {'x-api-key': key.trim()})
          .timeout(const Duration(seconds: 20));
      if (r.statusCode == 200) return null;
      return errorText(r.body);
    } catch (e) {
      return 'Could not reach Composio: $e';
    }
  }

  static String errorText(String body) {
    try {
      final j = jsonDecode(body);
      final e = j is Map ? j['error'] : null;
      if (e is Map && e['message'] != null) {
        final fix = '${e['suggested_fix'] ?? ''}'.trim();
        return fix.isEmpty ? '${e['message']}' : '${e['message']} $fix';
      }
      if (e is String) return e;
      if (j is Map && j['message'] != null) return '${j['message']}';
    } catch (_) {}
    return body.length > 300 ? '${body.substring(0, 300)}…' : body;
  }

  Future<dynamic> _send(String method, String path, {Map<String, dynamic>? body, Duration timeout = const Duration(seconds: 60)}) async {
    final req = http.Request(method, Uri.parse('$base$path'))..headers.addAll(_headers);
    if (body != null) req.body = jsonEncode(body);
    final http.Response r;
    try {
      r = await http.Response.fromStream(await _http.send(req).timeout(timeout));
    } catch (e) {
      throw ComposioException('Could not reach Composio: $e');
    }
    final text = utf8.decode(r.bodyBytes);
    if (r.statusCode < 200 || r.statusCode >= 300) {
      throw ComposioException(
        r.statusCode == 401 || r.statusCode == 403 ? 'Composio refused the API key: ${errorText(text)}' : errorText(text),
        status: r.statusCode,
      );
    }
    if (text.trim().isEmpty) return const {};
    return jsonDecode(text);
  }

  /// The user's tool-router session, made once. Connections are managed
  /// here (connect_app), so Composio's own connection tools are off, and
  /// so is its remote workbench: tools run one at a time, each approved.
  Future<String> _session({bool fresh = false}) async {
    if (!fresh) {
      final cached = _sessions[_sessionKey];
      if (cached != null) return cached;
    }
    final j = await _send('POST', '/tool_router/session', body: {
      'user_id': userId,
      'manage_connections': {'enable': false},
      'workbench': {'enable': false},
    });
    final id = j is Map ? '${j['session_id'] ?? ''}' : '';
    if (id.isEmpty) throw ComposioException('Composio did not return a session.');
    return _sessions[_sessionKey] = id;
  }

  /// Runs a session call, making a new session once if the old one expired.
  Future<dynamic> _inSession(String Function(String id) path, Map<String, dynamic> body) async {
    final id = await _session();
    try {
      return await _send('POST', path(id), body: body, timeout: const Duration(seconds: 120));
    } on ComposioException catch (e) {
      if (e.status != 404 && e.status != 410) rethrow;
      final again = await _session(fresh: true);
      return _send('POST', path(again), body: body, timeout: const Duration(seconds: 120));
    }
  }

  /// Runs one Composio tool as this user. Returns `data`, or throws with the
  /// tool's own error.
  Future<dynamic> execute(String slug, Map<String, dynamic> arguments) async {
    final j = await _inSession((id) => '/tool_router/session/$id/execute', {'tool_slug': slug, 'arguments': arguments});
    if (j is! Map) return j;
    final type = '${j['result_type'] ?? ''}';
    if (type == 'blocked') throw ComposioException('${j['message'] ?? 'Composio blocked the call.'}');
    if (type == 'input_required') throw ComposioException('Composio asked for input this app cannot give. Try again with fuller arguments.');
    final error = j['error'];
    if (type == 'failed' || (error != null && '$error'.isNotEmpty)) {
      throw ComposioException('${error ?? 'The tool failed.'}');
    }
    return j['data'] ?? j;
  }

  /// A Composio-hosted page where the user signs in to [toolkit].
  Future<String> connectLink(String toolkit) async {
    final j = await _inSession((id) => '/tool_router/session/$id/link', {'toolkit': toolkit});
    final url = j is Map ? '${j['redirect_url'] ?? ''}' : '';
    if (url.isEmpty) throw ComposioException('Composio did not return a connect link for $toolkit.');
    return url;
  }

  Future<List<ConnectedApp>> connections() async {
    final out = <ConnectedApp>[];
    String? cursor;
    for (var page = 0; page < 5; page++) {
      final q = {
        'user_ids': userId,
        'limit': '50',
        'cursor': ?cursor,
      };
      final j = await _send('GET', '/connected_accounts?${Uri(queryParameters: q).query}');
      for (final item in (j is Map ? (j['items'] as List? ?? const []) : const [])) {
        if (item is! Map || item['is_disabled'] == true) continue;
        out.add(
          ConnectedApp(
            id: '${item['id']}',
            toolkit: '${(item['toolkit'] as Map?)?['slug'] ?? ''}'.toLowerCase(),
            status: '${item['status'] ?? ''}',
            alias: item['alias'] as String?,
          ),
        );
      }
      cursor = j is Map ? j['next_cursor'] as String? : null;
      if (cursor == null || cursor.isEmpty) break;
    }
    return out;
  }

  Future<void> disconnect(String accountId) async {
    await _send('DELETE', '/connected_accounts/$accountId');
  }

  /// Searches Composio's catalog, for tools TeleAI has no card for.
  Future<List<ComposioToolInfo>> findTools({String? toolkit, String? query, int limit = 10}) async {
    final q = {
      if (toolkit != null && toolkit.isNotEmpty) 'toolkit_slug': toolkit.toLowerCase(),
      if (query != null && query.isNotEmpty) 'search': query,
      'limit': '${limit.clamp(1, 25)}',
    };
    final j = await _send('GET', '/tools?${Uri(queryParameters: q).query}');
    return [
      for (final t in (j is Map ? (j['items'] as List? ?? const []) : const []))
        if (t is Map)
          ComposioToolInfo(
            slug: '${t['slug']}',
            name: '${t['name'] ?? t['slug']}',
            description: '${t['description'] ?? ''}',
            toolkit: '${(t['toolkit'] as Map?)?['slug'] ?? ''}',
            parameters: t['input_parameters'] is Map ? Map<String, dynamic>.from(t['input_parameters'] as Map) : const {},
          ),
    ];
  }

  void close() => _http.close();
}
