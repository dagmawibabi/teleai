// The window, system and UI Automation tools on this PC (read-only ones).

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:triangle_companion/app/controller.dart';
import 'package:triangle_companion/core/config.dart';
import 'package:triangle_companion/core/shares.dart';
import 'package:triangle_companion/tools/tool.dart';

void main() {
  late Directory tmp;
  late ToolContext ctx;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('tc_control');
    ctx = ToolContext(
      config: const CompanionConfig(token: 't', seeScreen: true, system: true),
      shares: ShareLinks(),
      baseUrl: 'http://127.0.0.1',
      screen: ScreenMap(),
      tempDir: tmp.path,
    );
  });

  tearDown(() => tmp.delete(recursive: true));

  Future<Map> run(String name, [Map<String, dynamic> args = const {}]) async {
    final watch = Stopwatch()..start();
    final r = await CompanionController.tools.firstWhere((t) => t.name == name).handler(args, ctx) as Map;
    // ignore: avoid_print
    print('$name: ${watch.elapsedMilliseconds} ms');
    return r;
  }

  test('list_windows finds windows with titles and apps', () async {
    final r = await run('list_windows');
    final windows = r['windows'] as List;
    expect(windows, isNotEmpty);
    expect((windows.first as Map)['title'], isNotEmpty);
    // ignore: avoid_print
    print('  ${windows.length} windows, e.g. ${(windows.first as Map)['app']}');
  });

  test('read_window lists controls of a window', () async {
    final windows = (await run('list_windows'))['windows'] as List;
    // Explorer's taskbar is not listed; take the first normal window.
    final id = (windows.firstWhere((w) => w['minimized'] != true) as Map)['window_id'];
    final r = await run('read_window', {'window_id': id, 'max': 60});
    expect(r['elements'], isA<List>());
    // ignore: avoid_print
    print('  "${r['window']}": ${(r['elements'] as List).length} elements');
  }, timeout: const Timeout(Duration(seconds: 40)));

  test('system_status and list_processes', () async {
    final s = await run('system_status');
    expect(s['memory'], isA<Map>());
    expect(s['disks'], isA<List>());
    final p = await run('list_processes', {'limit': 5});
    expect((p['processes'] as List).length, 5);
  }, timeout: const Timeout(Duration(seconds: 60)));

  test('screenshot of one monitor', () async {
    final r = await run('screenshot', {'monitor': 0, 'max_width': 1000});
    expect(r['width'], lessThanOrEqualTo(1000));
  });
}
