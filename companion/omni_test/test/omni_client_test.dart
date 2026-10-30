// The companion against omni_ai's real MCP client, the one Triangle uses,
// over a real socket.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:omni_ai/omni_ai.dart' as omni;
import 'package:path/path.dart' as p;
import 'package:triangle_companion/app/controller.dart';
import 'package:triangle_companion/core/activity.dart';
import 'package:triangle_companion/core/config.dart';
import 'package:triangle_companion/core/mcp_server.dart';
import 'package:triangle_companion/core/network.dart';

void main() {
  late Directory tmp;
  late McpServer server;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('tc_omni');
    final shared = await Directory(p.join(tmp.path, 'Docs')).create();
    await File(p.join(shared.path, 'todo.md')).writeAsString('# Todo\n- ship the companion');
    final config = CompanionConfig(token: 'tok', port: 0, folders: [SharedFolder(shared.path)], askOnPc: false);
    server = McpServer(
      config: () => config,
      tools: CompanionController.tools,
      log: ActivityLog(tmp.path),
      approve: (_, _) async => true,
      baseUrl: () => 'http://127.0.0.1',
      tempDir: tmp.path,
    );
    await server.start();
  });

  tearDown(() async {
    await server.dispose();
    await tmp.delete(recursive: true);
  });

  for (final form in ['token in the address', 'Authorization header']) {
    test('omni_ai connects, lists and calls tools ($form)', () async {
      final url = 'http://127.0.0.1:${server.port}/mcp';
      final mcp = await omni.createMcpClient(form.startsWith('token')
          ? omni.McpServer.http('pc', url: '$url/tok')
          : omni.McpServer.http('pc', url: url, headers: {'Authorization': 'Bearer tok'}));
      try {
        expect(mcp.serverName, 'triangle-companion');
        final tools = await mcp.listTools();
        expect(tools.map((t) => t.name), containsAll(['pc_info', 'list_folder', 'read_file']));

        final info = await mcp.callTool('pc_info', {}) as Map;
        expect(info['computer'], Platform.localHostname);

        final read = await mcp.callTool('read_file', {'path': 'Docs/todo.md'}) as Map;
        expect(read['text'], contains('ship the companion'));

        // Refusals reach the assistant as errors it can read.
        await expectLater(
          mcp.callTool('write_file', {'path': 'Docs/x.md', 'content': 'x'}),
          throwsA(isA<omni.McpException>().having((e) => e.message, 'message', contains('read-only'))),
        );
      } finally {
        await mcp.close();
      }
    });
  }

  test('omni_ai connects over plain http to this PC home-network address', () async {
    final lan = await lanAddresses();
    if (lan.isEmpty) return; // Not on a home network.
    final config = CompanionConfig(token: 'tok', port: 0, mode: NetworkMode.homeWifi, askOnPc: false);
    final wifi = McpServer(
      config: () => config,
      tools: CompanionController.tools,
      log: ActivityLog(tmp.path),
      approve: (_, _) async => true,
      baseUrl: () => 'http://${lan.first.address}',
      tempDir: tmp.path,
    );
    await wifi.start();
    try {
      final url = 'http://${lan.first.address}:${wifi.port}/mcp/tok';
      // Triangle refuses to save plain-http servers outside home networks.
      expect(omni.McpRegistry.isLocalHost(lan.first.address), true);
      final mcp = await omni.createMcpClient(omni.McpServer.http('pc', url: url));
      final info = await mcp.callTool('pc_info', {}) as Map;
      expect(info['computer'], Platform.localHostname);
      await mcp.close();
    } finally {
      await wifi.dispose();
    }
  });

  test('omni_ai gets a clear error for a wrong token', () async {
    await expectLater(
      omni.createMcpClient(omni.McpServer.http('pc', url: 'http://127.0.0.1:${server.port}/mcp/wrong')),
      throwsA(anything),
    );
  });
}
