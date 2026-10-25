import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class E2bException implements Exception {
  E2bException(this.message, {this.status});
  final String message;
  final int? status;

  @override
  String toString() => message;
}

/// A running E2B sandbox and what it takes to talk to it.
class E2bSandbox {
  const E2bSandbox({required this.id, required this.domain, this.envdToken, this.trafficToken, this.template = '', required this.startedAt});
  final String id;
  final String domain;
  final String? envdToken;
  final String? trafficToken;
  final String template;
  final DateTime startedAt;
}

/// A sandbox from the account's list.
class E2bSandboxInfo {
  const E2bSandboxInfo({required this.id, required this.template, required this.state, this.startedAt, this.endAt, this.cpus, this.memoryMb});
  final String id;
  final String template;
  final String state;
  final DateTime? startedAt;
  final DateTime? endAt;
  final int? cpus;
  final int? memoryMb;

  Map<String, dynamic> toJson() => {
    'id': id,
    'template': template,
    'state': state,
    'started': ?startedAt?.toIso8601String(),
    'ends': ?endAt?.toIso8601String(),
    'cpus': ?cpus,
    'memory_mb': ?memoryMb,
  };
}

/// One output of a code cell: text, an image (png/jpeg/svg), html, json…
class E2bResult {
  const E2bResult(this.data, {this.main = false});
  final Map<String, dynamic> data;
  final bool main;

  String? get text => data['text'] as String?;
  String? get png => data['png'] as String?;
  String? get jpeg => data['jpeg'] as String?;
}

/// What running a cell produced, as E2B's code interpreter reports it.
class E2bExecution {
  final stdout = <String>[];
  final stderr = <String>[];
  final results = <E2bResult>[];
  Map<String, dynamic>? error;
  int? count;

  String? get text => results.where((r) => r.main).firstOrNull?.text;
}

/// E2B's REST API and code-interpreter server, the calls the JS SDK
/// (@e2b/code-interpreter, which ScholarXIV uses for executePython) makes:
/// sandboxes are created at api.e2b.app, and code runs on the sandbox's
/// Jupyter server (port 49999), which streams NDJSON lines back.
class E2bClient {
  E2bClient(this.apiKey);
  final String apiKey;
  final http.Client _http = http.Client();

  static const domain = 'e2b.app';
  static const api = 'https://api.$domain';
  static const defaultTemplate = 'code-interpreter-v1';
  static const _jupyterPort = 49999;

  /// Languages the code-interpreter template has kernels for.
  static const languages = ['python', 'javascript', 'bash', 'r', 'java'];

  Map<String, String> get _headers => {'X-API-KEY': apiKey.trim(), 'Content-Type': 'application/json'};

  static String errorText(String body) {
    try {
      final j = jsonDecode(body);
      if (j is Map) {
        if (j['message'] != null) return '${j['message']}';
        if (j['error'] is String) return j['error'] as String;
        if (j['error'] is Map && (j['error'] as Map)['message'] != null) return '${(j['error'] as Map)['message']}';
      }
    } catch (_) {}
    return body.length > 300 ? '${body.substring(0, 300)}…' : body;
  }

  /// Null when the key works, or what went wrong.
  static Future<String?> verifyKey(String key) async {
    if (key.trim().isEmpty) return 'Paste an E2B API key first.';
    try {
      final r = await http
          .get(Uri.parse('$api/v2/sandboxes?limit=1'), headers: {'X-API-KEY': key.trim()})
          .timeout(const Duration(seconds: 20));
      return r.statusCode == 200 ? null : errorText(r.body);
    } catch (e) {
      return 'Could not reach E2B: $e';
    }
  }

  Future<dynamic> _send(String method, String path, {Object? body}) async {
    final req = http.Request(method, Uri.parse('$api$path'))..headers.addAll(_headers);
    if (body != null) req.body = jsonEncode(body);
    final http.Response r;
    try {
      r = await http.Response.fromStream(await _http.send(req).timeout(const Duration(seconds: 60)));
    } catch (e) {
      throw E2bException('Could not reach E2B: $e');
    }
    final text = utf8.decode(r.bodyBytes);
    if (r.statusCode < 200 || r.statusCode >= 300) {
      throw E2bException(
        r.statusCode == 401 || r.statusCode == 403 ? 'E2B refused the API key: ${errorText(text)}' : errorText(text),
        status: r.statusCode,
      );
    }
    return text.trim().isEmpty ? null : jsonDecode(text);
  }

  Future<E2bSandbox> create({String template = defaultTemplate, int timeoutSeconds = 600, bool internet = true}) async {
    final j = await _send('POST', '/v2/sandboxes', body: {
      'templateID': template.trim().isEmpty ? defaultTemplate : template.trim(),
      'timeout': timeoutSeconds.clamp(30, 3600),
      'allow_internet_access': internet,
      'metadata': {'app': 'triangle'},
    });
    if (j is! Map || j['sandboxID'] == null) throw E2bException('E2B did not return a sandbox.');
    return E2bSandbox(
      id: '${j['sandboxID']}',
      domain: '${j['domain'] ?? domain}'.isEmpty ? domain : '${j['domain'] ?? domain}',
      envdToken: j['envdAccessToken'] as String?,
      trafficToken: j['trafficAccessToken'] as String?,
      template: '${j['templateID'] ?? template}',
      startedAt: DateTime.now(),
    );
  }

  Future<void> setTimeout(String sandboxId, int seconds) => _send('POST', '/sandboxes/$sandboxId/timeout', body: {'timeout': seconds.clamp(30, 3600)});

  Future<void> kill(String sandboxId) => _send('DELETE', '/sandboxes/$sandboxId');

  Future<List<E2bSandboxInfo>> list() async {
    final j = await _send('GET', '/v2/sandboxes?limit=50');
    return [
      for (final s in (j is List ? j : const []))
        if (s is Map)
          E2bSandboxInfo(
            id: '${s['sandboxID']}',
            template: '${s['alias'] ?? s['templateID'] ?? ''}',
            state: '${s['state'] ?? ''}',
            startedAt: DateTime.tryParse('${s['startedAt']}'),
            endAt: DateTime.tryParse('${s['endAt']}'),
            cpus: (s['cpuCount'] as num?)?.toInt(),
            memoryMb: (s['memoryMB'] as num?)?.toInt(),
          ),
    ];
  }

  /// Runs [code] in [sandbox] and collects its output; [onLine] sees stdout
  /// and stderr as they arrive.
  Future<E2bExecution> run(
    E2bSandbox sandbox,
    String code, {
    String language = 'python',
    Duration timeout = const Duration(seconds: 120),
    void Function(String line, {required bool error})? onLine,
  }) async {
    final req = http.Request('POST', Uri.parse('https://$_jupyterPort-${sandbox.id}.${sandbox.domain}/execute'))
      ..headers.addAll({
        'Content-Type': 'application/json',
        'E2b-Sandbox-Id': sandbox.id,
        'E2b-Sandbox-Port': '$_jupyterPort',
        'E2B-Traffic-Access-Token': ?sandbox.trafficToken,
        'X-Access-Token': ?sandbox.envdToken,
      })
      ..body = jsonEncode({'code': code, if (language != 'python') 'language': language});
    final http.StreamedResponse res;
    try {
      res = await _http.send(req).timeout(const Duration(seconds: 30));
    } catch (e) {
      throw E2bException('Could not reach the sandbox: $e');
    }
    if (res.statusCode < 200 || res.statusCode >= 300) {
      final body = await res.stream.bytesToString();
      throw E2bException(res.statusCode == 502 || res.statusCode == 404 ? 'The sandbox has stopped.' : errorText(body), status: res.statusCode);
    }
    final ex = E2bExecution();
    try {
      await for (final line in res.stream.transform(utf8.decoder).transform(const LineSplitter()).timeout(timeout)) {
        if (line.trim().isEmpty) continue;
        final Map<String, dynamic> msg;
        try {
          msg = Map<String, dynamic>.from(jsonDecode(line) as Map);
        } catch (_) {
          continue;
        }
        switch (msg['type']) {
          case 'stdout':
            ex.stdout.add('${msg['text'] ?? ''}');
            onLine?.call('${msg['text'] ?? ''}', error: false);
          case 'stderr':
            ex.stderr.add('${msg['text'] ?? ''}');
            onLine?.call('${msg['text'] ?? ''}', error: true);
          case 'result':
            ex.results.add(E2bResult({...msg}..remove('type')..remove('is_main_result'), main: msg['is_main_result'] == true));
          case 'error':
            ex.error = {'name': msg['name'], 'value': msg['value'], 'traceback': msg['traceback']};
          case 'number_of_executions':
            ex.count = (msg['execution_count'] as num?)?.toInt();
        }
      }
    } on TimeoutException {
      ex.error = {'name': 'TimeoutError', 'value': 'Execution took longer than ${timeout.inSeconds} s and was cut off.'};
    }
    return ex;
  }

  /// Python that prints a JSON line the app reads back, for file work.
  static String _pyJson(String body) => 'import json, base64, os\n$body';

  Future<Map<String, dynamic>> _pyCall(E2bSandbox s, String body) async {
    final ex = await run(s, _pyJson(body));
    if (ex.error != null) throw E2bException('${ex.error!['name']}: ${ex.error!['value']}');
    final out = ex.stdout.join();
    final start = out.indexOf('__TRIANGLE__');
    if (start < 0) throw E2bException('The sandbox gave no answer.');
    return Map<String, dynamic>.from(jsonDecode(out.substring(start + '__TRIANGLE__'.length).trim()) as Map);
  }

  Future<void> writeFile(E2bSandbox s, String path, Uint8List bytes) async {
    final b64 = base64Encode(bytes);
    await _pyCall(s, '''
p = ${jsonEncode(path)}
os.makedirs(os.path.dirname(os.path.abspath(p)), exist_ok=True)
with open(p, "wb") as f: f.write(base64.b64decode(${jsonEncode(b64)}))
print("__TRIANGLE__" + json.dumps({"ok": True, "size": os.path.getsize(p)}))
''');
  }

  Future<Uint8List> readFile(E2bSandbox s, String path, {int maxBytes = 15 << 20}) async {
    final j = await _pyCall(s, '''
p = ${jsonEncode(path)}
n = os.path.getsize(p)
if n > $maxBytes: raise ValueError(f"{p} is {n} bytes; the limit is $maxBytes")
print("__TRIANGLE__" + json.dumps({"b64": base64.b64encode(open(p, "rb").read()).decode()}))
''');
    return base64Decode('${j['b64']}');
  }

  Future<List<Map<String, dynamic>>> listFiles(E2bSandbox s, String path) async {
    final j = await _pyCall(s, '''
import time
p = ${jsonEncode(path)}
out = []
for e in sorted(os.scandir(p), key=lambda e: (not e.is_dir(), e.name))[:300]:
    st = e.stat()
    out.append({"name": e.name, "path": os.path.join(p, e.name), "dir": e.is_dir(), "size": st.st_size, "modified": time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime(st.st_mtime))})
print("__TRIANGLE__" + json.dumps({"files": out}))
''');
    return [for (final f in (j['files'] as List? ?? const [])) Map<String, dynamic>.from(f as Map)];
  }

  void close() => _http.close();
}
