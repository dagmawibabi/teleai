import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:shelf/shelf.dart';
import 'package:triangle_companion/app/controller.dart';
import 'package:triangle_companion/core/activity.dart';
import 'package:triangle_companion/core/config.dart';
import 'package:triangle_companion/core/mcp_server.dart';
import 'package:triangle_companion/core/path_guard.dart';

void main() {
  late Directory tmp, shared, outside;
  late CompanionConfig config;
  late McpServer server;
  var allow = true;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('tc_test');
    shared = await Directory(p.join(tmp.path, 'Shared')).create();
    outside = await Directory(p.join(tmp.path, 'Secret')).create();
    await File(p.join(shared.path, 'notes.txt')).writeAsString('hello from the pc\nsecond line');
    await File(p.join(outside.path, 'secret.txt')).writeAsString('nope');
    config = CompanionConfig(token: 'test-token', folders: [SharedFolder(shared.path, writable: true)], askOnPc: true);
    allow = true;
    server = McpServer(
      config: () => config,
      tools: CompanionController.tools,
      log: ActivityLog(tmp.path),
      approve: (_, _) async => allow,
      baseUrl: () => 'https://pc.example.ts.net',
      tempDir: tmp.path,
    );
  });

  tearDown(() async {
    await server.dispose();
    await tmp.delete(recursive: true);
  });

  Future<Response> post(Object body, {String? auth = 'Bearer test-token', String path = 'mcp', Map<String, String> extra = const {}}) =>
      server.handle(Request('POST', Uri.parse('http://127.0.0.1/$path'),
          body: jsonEncode(body), headers: {'content-type': 'application/json', 'authorization': ?auth, ...extra}));

  Future<Map<String, dynamic>> rpc(String method, [Map<String, dynamic>? params]) async {
    final r = await post({'jsonrpc': '2.0', 'id': 1, 'method': method, 'params': ?params});
    expect(r.statusCode, 200);
    return jsonDecode(await r.readAsString()) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> call(String tool, Map<String, dynamic> args) async =>
      (await rpc('tools/call', {'name': tool, 'arguments': args}))['result'] as Map<String, dynamic>;

  test('rejects missing or wrong tokens, accepts header or path token', () async {
    expect((await post({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}, auth: null)).statusCode, 401);
    expect((await post({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}, auth: 'Bearer wrong')).statusCode, 401);
    expect((await post({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}, auth: null, path: 'mcp/test-token')).statusCode, 200);
    expect((await post({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}, extra: {'origin': 'https://evil.example'})).statusCode, 403);
  });

  test('speaks the MCP handshake the way omni_ai expects', () async {
    // omni_ai probes server/discover first and falls back on -32601.
    final discover = await rpc('server/discover', {});
    expect(discover['error']['code'], -32601);
    final init = await rpc('initialize', {'protocolVersion': '2025-03-26', 'capabilities': {}, 'clientInfo': {'name': 'omni_ai'}});
    expect(init['result']['protocolVersion'], '2025-03-26');
    expect(init['result']['serverInfo']['name'], 'triangle-companion');
    final note = await post({'jsonrpc': '2.0', 'method': 'notifications/initialized'});
    expect(note.statusCode, 202);
  });

  test('lists only tools whose switch is on', () async {
    var names = [for (final t in (await rpc('tools/list'))['result']['tools'] as List) t['name']];
    expect(names, containsAll(['pc_info', 'list_folder', 'read_file', 'delete']));
    expect(names, isNot(contains('screenshot')));
    expect(names, isNot(contains('run_command')));
    config = config.copyWith(seeScreen: true, runCommands: true);
    names = [for (final t in (await rpc('tools/list'))['result']['tools'] as List) t['name']];
    expect(names, containsAll(['screenshot', 'run_command']));
  });

  test('reads and searches inside shared folders only', () async {
    final list = await call('list_folder', {'path': 'Shared'});
    expect(list['structuredContent']['entries'].first['name'], 'notes.txt');
    final read = await call('read_file', {'path': 'Shared/notes.txt'});
    expect(read['structuredContent']['text'], startsWith('hello from the pc'));
    final found = await call('search_files', {'query': '*.txt', 'containing': 'second'});
    expect((found['structuredContent']['results'] as List).length, 1);

    for (final sneaky in [
      p.join(outside.path, 'secret.txt'),
      'Shared/../Secret/secret.txt',
      r'Shared\..\Secret\secret.txt',
      '${p.join(shared.path, 'notes.txt')}:stream',
      r'\\server\share\x',
    ]) {
      final r = await call('read_file', {'path': sneaky});
      expect(r['isError'], true, reason: sneaky);
    }
  });

  test('a junction inside a shared folder cannot reach outside it', () async {
    final link = p.join(shared.path, 'escape');
    final made = await Process.run('cmd', ['/c', 'mklink', '/J', link, outside.path]);
    if (made.exitCode != 0) return; // No rights to make junctions here.
    final r = await call('read_file', {'path': p.join(link, 'secret.txt')});
    expect(r['isError'], true);
  });

  test('changes ask first, and respect read-only folders', () async {
    allow = false;
    var r = await call('write_file', {'path': 'Shared/new.txt', 'content': 'x'});
    expect(r['isError'], true);
    expect(File(p.join(shared.path, 'new.txt')).existsSync(), false);

    allow = true;
    r = await call('write_file', {'path': 'Shared/new.txt', 'content': 'x'});
    expect(r['isError'], isNot(true));
    expect(File(p.join(shared.path, 'new.txt')).readAsStringSync(), 'x');

    r = await call('write_file', {'path': 'Shared/new.txt', 'content': 'y'});
    expect(r['isError'], true, reason: 'create mode must not replace');

    config = config.copyWith(folders: [SharedFolder(shared.path)]);
    r = await call('make_folder', {'path': 'Shared/sub'});
    expect(r['isError'], true);
  });

  test('share_file gives a link that downloads the file', () async {
    final r = await call('share_file', {'path': 'Shared/notes.txt'});
    final url = Uri.parse(r['structuredContent']['url'] as String);
    expect(url.host, 'pc.example.ts.net');
    final res = await server.handle(Request('GET', Uri.parse('http://127.0.0.1${url.path}')));
    expect(res.statusCode, 200);
    expect(await res.readAsString(), startsWith('hello'));
    final bad = await server.handle(Request('GET', Uri.parse('http://127.0.0.1/files/0000/notes.txt')));
    expect(bad.statusCode, 404);
  });

  test('paused refuses calls', () async {
    config = config.copyWith(paused: true);
    final r = await call('pc_info', {});
    expect(r['isError'], true);
  });

  test('allowed login', () async {
    config = config.copyWith(allowedLogin: 'me@example.com');
    expect((await post({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}, extra: {'tailscale-user-login': 'other@example.com'})).statusCode, 403);
    expect((await post({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}, extra: {'tailscale-user-login': 'Me@Example.com'})).statusCode, 200);
  });

  test('screenshot works on this PC', () async {
    config = config.copyWith(seeScreen: true);
    final r = await call('screenshot', {'max_width': 800});
    expect(r['isError'], isNot(true), reason: '${r['content']}');
    expect(r['structuredContent']['width'], lessThanOrEqualTo(800));
  });

  Future<int> from(String ip, {Map<String, String> headers = const {}}) async => (await server.handle(Request(
        'POST',
        Uri.parse('http://127.0.0.1/mcp'),
        body: jsonEncode({'jsonrpc': '2.0', 'id': 1, 'method': 'ping'}),
        headers: {'authorization': 'Bearer test-token', ...headers},
        context: {'shelf.io.connection_info': _Conn(ip)},
      ))).statusCode;

  test('home Wi-Fi answers private addresses only', () async {
    config = config.copyWith(mode: NetworkMode.homeWifi);
    expect(await from('192.168.1.50'), 200);
    expect(await from('10.0.0.7'), 200);
    expect(await from('172.20.1.1'), 200);
    expect(await from('8.8.8.8'), 403);
    expect(await from('100.101.102.103'), 403, reason: 'not a home-network range');
    expect(await from('127.0.0.1'), 200);
  });

  test('Tailscale mode refuses anything but 127.0.0.1', () async {
    expect(await from('192.168.1.50'), 403);
    expect(await from('127.0.0.1'), 200);
  });

  test('a made-up Tailscale login header from the Wi-Fi is not trusted', () async {
    config = config.copyWith(mode: NetworkMode.homeWifi, allowedLogin: 'me@example.com');
    // allowedLogin only applies to Tailscale; on the Wi-Fi the caller is its address.
    expect(await from('192.168.1.50', headers: {'tailscale-user-login': 'me@example.com'}), 200);
    config = config.copyWith(mode: NetworkMode.tailscale);
    expect(await from('127.0.0.1', headers: {'tailscale-user-login': 'other@example.com'}), 403);
  });

  test('PathGuard refuses with no folders', () {
    expect(() => PathGuard(const []).resolve(r'C:\x'), throwsA(isA<ToolRefused>()));
  });
}

class _Conn implements HttpConnectionInfo {
  _Conn(String ip) : remoteAddress = InternetAddress(ip);
  @override
  final InternetAddress remoteAddress;
  @override
  int get remotePort => 50000;
  @override
  int get localPort => 8765;
}
