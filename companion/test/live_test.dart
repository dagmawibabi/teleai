// The live screen over a real socket: frames arrive, flow control holds,
// and input is refused while control is off.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:triangle_companion/app/controller.dart';
import 'package:triangle_companion/core/activity.dart';
import 'package:triangle_companion/core/config.dart';
import 'package:triangle_companion/core/mcp_server.dart';
import 'package:triangle_companion/native/capture.dart';

void main() {
  late Directory tmp;
  late McpServer server;
  var config = const CompanionConfig(token: 'tok', port: 0, seeScreen: true);

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('tc_live');
    config = const CompanionConfig(token: 'tok', port: 0, seeScreen: true);
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

  test('native capture makes a JPEG quickly', () {
    final m = listMonitors();
    expect(m, isNotEmpty);
    expect(m.first.primary, true);
    final src = (x: m.first.x, y: m.first.y, width: m.first.width, height: m.first.height);
    final size = fit(src, 1280);
    final watch = Stopwatch()..start();
    late Frame f;
    for (var i = 0; i < 10; i++) {
      f = captureJpeg(src, outWidth: size.width, outHeight: size.height, quality: 55);
    }
    final ms = watch.elapsedMilliseconds / 10;
    // ignore: avoid_print
    print('capture+encode ${size.width}x${size.height}: ${ms.toStringAsFixed(1)} ms, ${(f.jpeg.length / 1024).round()} KB');
    expect(f.jpeg.sublist(0, 2), [0xFF, 0xD8]);
    expect(ms, lessThan(150));
  });

  test('streams frames with flow control', () async {
    final ws = await WebSocket.connect('ws://127.0.0.1:${server.port}/live?token=tok');
    final infos = <Map>[];
    final frames = <Uint8List>[];
    final errors = <String>[];
    final firstFrame = Completer<void>();
    ws.listen((m) {
      if (m is List<int>) {
        frames.add(Uint8List.fromList(m));
        if (!firstFrame.isCompleted) firstFrame.complete();
      } else {
        final j = jsonDecode(m as String) as Map;
        if (j['t'] == 'info') infos.add(j);
        if (j['t'] == 'error') errors.add('${j['m']}');
      }
    });
    ws.add(jsonEncode({'t': 'config', 'w': 960, 'q': 50, 'monitor': 0}));
    await firstFrame.future.timeout(const Duration(seconds: 10));
    expect(frames.first.sublist(0, 2), [0xFF, 0xD8]);
    expect(infos.last['monitors'], isNotEmpty);

    // Without acks, at most the two credits' worth arrive.
    await Future<void>.delayed(const Duration(milliseconds: 800));
    expect(frames.length, lessThanOrEqualTo(2));

    // Input is refused while "Control mouse & keyboard" is off.
    ws.add(jsonEncode({'t': 'click', 'x': 0.5, 'y': 0.5}));
    await Future<void>.delayed(const Duration(milliseconds: 300));
    expect(errors.join(), contains('watch-only'));
    await ws.close();
  });

  test('frame rate with acks while the screen changes', () async {
    final ws = await WebSocket.connect('ws://127.0.0.1:${server.port}/live?token=tok');
    var count = 0;
    var bytes = 0;
    ws.listen((m) {
      if (m is List<int>) {
        count++;
        bytes += m.length;
        ws.add('{"t":"ack"}');
      }
    });
    ws.add(jsonEncode({'t': 'config', 'w': 1280, 'q': 55}));
    final watch = Stopwatch()..start();
    // A moving window title keeps changing the picture: a timer redraws nothing
    // here, so this measures frames when something changes, at worst.
    await Future<void>.delayed(const Duration(seconds: 3));
    final secs = watch.elapsedMilliseconds / 1000;
    // ignore: avoid_print
    print('live: $count frames in ${secs.toStringAsFixed(1)} s, avg ${count == 0 ? 0 : (bytes / count / 1024).round()} KB');
    expect(count, greaterThan(0));
    await ws.close();
  });

  test('refuses a wrong token and a switched-off screen', () async {
    await expectLater(WebSocket.connect('ws://127.0.0.1:${server.port}/live?token=nope'), throwsA(isA<WebSocketException>()));
    config = config.copyWith(seeScreen: false);
    await expectLater(WebSocket.connect('ws://127.0.0.1:${server.port}/live?token=tok'), throwsA(isA<WebSocketException>()));
  });

  test('/live/info tells Triangle this is a companion', () async {
    final client = HttpClient();
    final req = await client.getUrl(Uri.parse('http://127.0.0.1:${server.port}/live/info?token=tok'));
    final res = await req.close();
    final body = jsonDecode(await res.transform(utf8.decoder).join()) as Map;
    expect(res.statusCode, 200);
    expect(body['name'], 'triangle-companion');
    expect(body['live'], true);
    client.close();
  });
}
