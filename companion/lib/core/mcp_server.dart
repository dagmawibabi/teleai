import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import '../tools/tool.dart';
import 'activity.dart';
import 'config.dart';
import 'live.dart';
import 'network.dart';
import 'path_guard.dart';
import 'shares.dart';

/// Asks the person at the PC before a change. Resolves false on Deny or
/// when nobody answers in time.
typedef Approver = Future<bool> Function(CompanionTool tool, String summary);

/// MCP over Streamable HTTP (plain JSON answers, no server-sent events) at
/// `/mcp`, plus the short-lived download links at `/files/…`. In Tailscale
/// mode it listens on 127.0.0.1 only and Tailscale serve gives it an HTTPS
/// address on the tailnet; in home Wi-Fi mode it listens on every interface
/// and answers only private (home-network) addresses.
class McpServer {
  McpServer({
    required this.config,
    required this.tools,
    required this.log,
    required this.approve,
    required this.baseUrl,
    required this.tempDir,
    this.onSeen,
  });

  final CompanionConfig Function() config;
  final List<CompanionTool> tools;
  final ActivityLog log;
  final Approver approve;

  /// The phone-facing origin, for links in answers.
  final String Function() baseUrl;
  final String tempDir;

  /// Triangle was in touch: who, and the tool it used (empty for none).
  final void Function(String who, String tool)? onSeen;

  final shares = ShareLinks();
  final _screen = ScreenMap();
  late final live = LiveScreen(this);
  HttpServer? _http;
  Timer? _sweeper;

  static const name = 'triangle-companion';
  static const version = '0.2.0';
  static const _versions = ['2025-11-25', '2025-06-18', '2025-03-26', '2024-11-05'];

  /// Approval waits this long; Triangle gives a whole call 45 s.
  static const approvalTimeout = Duration(seconds: 25);

  bool get running => _http != null;
  int? get port => _http?.port;

  Future<void> start() async {
    await stop();
    final c = config();
    final address = c.mode == NetworkMode.homeWifi ? InternetAddress.anyIPv4 : InternetAddress.loopbackIPv4;
    final http = _http = await HttpServer.bind(address, c.port);
    http.autoCompress = true;
    http.listen((r) {
      // The live screen is a WebSocket; everything else goes through shelf.
      if (r.uri.path == '/live' && WebSocketTransformer.isUpgradeRequest(r)) {
        unawaited(_openLive(r));
      } else {
        shelf_io.handleRequest(r, handle);
      }
    });
    _sweeper = Timer.periodic(const Duration(minutes: 1), (_) => shares.sweep());
  }

  Future<void> stop() async {
    _sweeper?.cancel();
    live.disconnectAll();
    await _http?.close(force: true);
    _http = null;
  }

  Future<void> dispose() async {
    await stop();
    live.dispose();
    shares.dispose();
  }

  /// Whether a caller may in: the address rules, the token, and the
  /// Tailscale login. Returns who it is, or the refusal (status, message).
  ({String who, int status, String refusal}) gate(InternetAddress? remote, String? Function(String) header, String? token) {
    // Without a socket (tests), the caller counts as this PC.
    final local = remote == null || remote.isLoopback;
    final c = config();
    if (!local && (c.mode != NetworkMode.homeWifi || !isPrivateIPv4(remote.address))) {
      return (who: '', status: 403, refusal: 'Triangle Companion only answers devices on your home network.');
    }
    // A web page in a browser on the tailnet must not drive the PC.
    final origin = header('origin');
    if (origin != null && origin.isNotEmpty) return (who: '', status: 403, refusal: 'Browser requests are not accepted.');
    final bearer = header('authorization')?.replaceFirst(RegExp(r'^Bearer\s+', caseSensitive: false), '');
    if (!_same(token ?? bearer ?? '', c.token)) {
      return (who: '', status: 401, refusal: 'Pair with the token shown in Triangle Companion on the PC.');
    }
    // Tailscale serve adds the login and connects from 127.0.0.1; from the
    // home network the header could be made up, so the address is shown.
    final who = local ? (header('tailscale-user-login') ?? '') : remote.address;
    if (c.mode == NetworkMode.tailscale && c.allowedLogin.trim().isNotEmpty && who.toLowerCase() != c.allowedLogin.trim().toLowerCase()) {
      return (who: who, status: 403, refusal: 'This PC only answers ${c.allowedLogin}.');
    }
    return (who: who, status: 200, refusal: '');
  }

  Future<void> _openLive(HttpRequest r) async {
    final g = gate(r.connectionInfo?.remoteAddress, r.headers.value, r.uri.queryParameters['token']);
    if (g.status != 200) {
      r.response
        ..statusCode = g.status
        ..write(g.refusal);
      await r.response.close();
      return;
    }
    await live.accept(r, g.who);
  }

  /// The shelf handler; public so tests can call it without a socket.
  Future<Response> handle(Request req) async {
    final remote = (req.context['shelf.io.connection_info'] as HttpConnectionInfo?)?.remoteAddress;
    final segments = req.url.pathSegments;
    if (segments.isNotEmpty && segments.first == 'files' && req.method == 'GET') {
      final g = gate(remote, (_) => null, '');
      // Download links carry their own secret; only the address rules apply.
      if (g.status == 403 && g.who.isEmpty) return Response.forbidden(g.refusal);
      return _file(segments);
    }
    final isLive = segments.length == 2 && segments[0] == 'live' && segments[1] == 'info';
    if (!isLive && (segments.isEmpty || segments.first != 'mcp' || segments.length > 2)) {
      return Response.notFound('Triangle Companion: the MCP endpoint is /mcp.');
    }
    final g = gate(remote, (h) => req.headers[h], isLive ? req.url.queryParameters['token'] : (segments.length == 2 ? segments[1] : null));
    if (g.status != 200) {
      return Response(g.status, body: g.refusal, headers: {if (g.status == 401) 'www-authenticate': 'Bearer'});
    }
    final who = g.who;
    if (isLive) {
      onSeen?.call(who, '');
      return _json(await live.info());
    }

    switch (req.method) {
      case 'POST':
        break;
      case 'DELETE':
        return Response.ok('');
      default:
        return Response(405, headers: {'allow': 'POST, DELETE'});
    }

    Object? body;
    try {
      body = jsonDecode(await req.readAsString());
    } catch (_) {
      return _json(_error(null, -32700, 'Parse error'), status: 400);
    }

    final messages = body is List ? body : [body];
    final answers = <Map<String, dynamic>>[];
    var initialized = false;
    for (final m in messages) {
      if (m is! Map) {
        answers.add(_error(null, -32600, 'Invalid request'));
        continue;
      }
      final message = Map<String, dynamic>.from(m);
      if (message['method'] == 'initialize') initialized = true;
      final answer = await _dispatch(message, who);
      if (answer != null) answers.add(answer);
      onSeen?.call(who, message['method'] == 'tools/call' ? '${(message['params'] as Map?)?['name'] ?? ''}' : '');
    }
    final headers = {if (initialized) 'mcp-session-id': CompanionConfig.newToken()};
    if (answers.isEmpty) return Response(202, headers: headers);
    return _json(body is List ? answers : answers.first, headers: headers);
  }

  Future<Map<String, dynamic>?> _dispatch(Map<String, dynamic> m, String who) async {
    final id = m['id'];
    final method = m['method'];
    final params = m['params'] is Map ? Map<String, dynamic>.from(m['params'] as Map) : <String, dynamic>{};
    // Notifications (no id) and replies to us get no answer.
    if (id == null || method is! String) return null;
    try {
      final result = switch (method) {
        'initialize' => _initialize(params),
        'ping' => <String, dynamic>{},
        'tools/list' => {'tools': [for (final t in _available()) t.toMcp()]},
        'tools/call' => await _call(params, who),
        'resources/list' => {'resources': <Object>[]},
        'resources/templates/list' => {'resourceTemplates': <Object>[]},
        'prompts/list' => {'prompts': <Object>[]},
        _ => null,
      };
      if (result == null) return _error(id, -32601, 'Method not found: $method');
      return {'jsonrpc': '2.0', 'id': id, 'result': result};
    } catch (e) {
      return _error(id, -32603, '$e');
    }
  }

  Map<String, dynamic> _initialize(Map<String, dynamic> params) {
    final asked = '${params['protocolVersion'] ?? ''}';
    return {
      'protocolVersion': _versions.contains(asked) ? asked : _versions.first,
      'capabilities': {
        'tools': {'listChanged': false},
      },
      'serverInfo': {'name': name, 'title': 'Triangle Companion', 'version': version},
      'instructions': 'Tools for the user\'s Windows PC: shared folders, and (when switched on in the companion) '
          'screenshots, mouse and keyboard, clipboard and PowerShell. Start with pc_info. '
          'Download links in answers last a few minutes; fetch them with your download or image tools.',
    };
  }

  /// Tools whose switch is on.
  List<CompanionTool> _available() {
    final c = config();
    return [for (final t in tools) if (t.feature.on(c)) t];
  }

  Future<Map<String, dynamic>> _call(Map<String, dynamic> params, String who) async {
    final name = '${params['name'] ?? ''}';
    final args = params['arguments'] is Map ? Map<String, dynamic>.from(params['arguments'] as Map) : <String, dynamic>{};
    final summary = ActivityLog.summarize(args);
    void record(Outcome o, [String detail = '']) =>
        log.add(ActivityEntry(at: DateTime.now(), tool: name, summary: summary, outcome: o, detail: detail, who: who));

    final c = config();
    final tool = tools.where((t) => t.name == name).firstOrNull;
    if (tool == null) {
      record(Outcome.refused, 'Unknown tool');
      return _toolError('Unknown tool "$name".');
    }
    if (c.paused) {
      record(Outcome.refused, 'Paused');
      return _toolError('The companion is paused on the PC. Ask the user to resume it.');
    }
    if (!tool.feature.on(c)) {
      record(Outcome.refused, '${tool.feature.label} is off');
      return _toolError(tool.feature == Feature.files
          ? 'No folders are shared. The user can add one in Triangle Companion on the PC.'
          : '"${tool.feature.label}" is switched off in Triangle Companion on the PC.');
    }
    if (tool.access != Access.read && c.askOnPc) {
      final ok = await approve(tool, summary).timeout(approvalTimeout, onTimeout: () => false);
      if (!ok) {
        record(Outcome.denied);
        return _toolError('The user did not allow this on the PC.');
      }
    }

    try {
      final ctx = ToolContext(config: c, shares: shares, baseUrl: baseUrl(), screen: _screen, tempDir: tempDir);
      final data = await tool.handler(args, ctx);
      record(Outcome.ok);
      return {
        'content': [
          {'type': 'text', 'text': data is String ? data : jsonEncode(data)},
        ],
        if (data is Map) 'structuredContent': data,
      };
    } on ToolRefused catch (e) {
      record(Outcome.refused, e.message);
      return _toolError(e.message);
    } catch (e) {
      final text = e is FileSystemException ? '${e.message}${e.path == null ? '' : ': ${e.path}'}${e.osError == null ? '' : ' (${e.osError!.message.trim()})'}' : '$e';
      record(Outcome.failed, text);
      return _toolError(text);
    }
  }

  Future<Response> _file(List<String> segments) async {
    if (segments.length < 2) return Response.notFound('');
    final f = shares.open(segments[1]);
    if (f == null || !await f.exists()) return Response.notFound('This link has expired.');
    final name = segments.length > 2 ? segments[2] : 'file';
    return Response.ok(
      f.openRead(),
      headers: {
        'content-type': _mime(name),
        'content-length': '${await f.length()}',
        'content-disposition': 'attachment; filename="${name.replaceAll('"', '')}"',
        'cache-control': 'no-store',
      },
    );
  }

  static String _mime(String name) => switch (name.split('.').last.toLowerCase()) {
        'jpg' || 'jpeg' => 'image/jpeg',
        'png' => 'image/png',
        'gif' => 'image/gif',
        'webp' => 'image/webp',
        'pdf' => 'application/pdf',
        'txt' || 'md' || 'log' || 'csv' => 'text/plain; charset=utf-8',
        'json' => 'application/json',
        'mp3' => 'audio/mpeg',
        'mp4' => 'video/mp4',
        'zip' => 'application/zip',
        _ => 'application/octet-stream',
      };

  static bool _same(String a, String b) {
    // Compare digests so the time taken doesn't leak the token.
    final x = sha256.convert(utf8.encode(a)).bytes, y = sha256.convert(utf8.encode(b)).bytes;
    var diff = 0;
    for (var i = 0; i < x.length; i++) {
      diff |= x[i] ^ y[i];
    }
    return diff == 0 && b.isNotEmpty;
  }

  static Map<String, dynamic> _toolError(String text) => {
        'content': [
          {'type': 'text', 'text': text},
        ],
        'isError': true,
      };

  static Map<String, dynamic> _error(Object? id, int code, String message) =>
      {'jsonrpc': '2.0', 'id': id, 'error': {'code': code, 'message': message}};

  static Response _json(Object body, {int status = 200, Map<String, String> headers = const {}}) =>
      Response(status, body: jsonEncode(body), headers: {'content-type': 'application/json', ...headers});
}
