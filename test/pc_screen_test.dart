// The PC screen against a stand-in companion over a real WebSocket:
// it shows frames, acknowledges them, and turns taps, long presses and
// scrolls into the right input at the right place.

import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omni_ai/omni_ai.dart' show McpServer;
import 'package:teleai/features/pc/pc_screen.dart';

Future<List<int>> _png(int w, int h) async {
  final rec = ui.PictureRecorder();
  Canvas(rec).drawRect(Rect.fromLTWH(0, 0, w.toDouble(), h.toDouble()), Paint()..color = const Color(0xFF3366FF));
  final img = await rec.endRecording().toImage(w, h);
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  return data!.buffer.asUint8List();
}

void main() {
  test('finds the token in the address or the header', () {
    final a = PcLink.fromServer(McpServer.http('pc', url: 'http://192.168.1.20:8765/mcp/abc'))!;
    expect(a.token, 'abc');
    expect(a.live.toString(), 'ws://192.168.1.20:8765/live?token=abc');
    final b = PcLink.fromServer(McpServer.http('pc', url: 'https://pc.tail.ts.net/mcp', headers: {'Authorization': 'Bearer xyz'}))!;
    expect(b.token, 'xyz');
    expect(b.live.toString(), 'wss://pc.tail.ts.net/live?token=xyz');
    expect(PcLink.fromServer(McpServer.http('linear', url: 'https://mcp.linear.app/sse')), isNull);
  });

  testWidgets('shows frames, acks them and sends input', (tester) async {
    final received = <Map>[];
    var acks = 0, closes = 0;
    late HttpServer server;
    WebSocket? socket;
    await tester.runAsync(() async {
      final frame = await _png(1600, 900);
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
      server.listen((r) async {
        final ws = await WebSocketTransformer.upgrade(r);
        socket = ws;
        ws.listen((m) {
          final j = jsonDecode(m as String) as Map;
          if (j['t'] == 'ack') {
            acks++;
          } else {
            received.add(j);
          }
        }, onDone: () => closes++);
        ws.add(jsonEncode({'t': 'info', 'monitors': [{'x': 0, 'y': 0, 'width': 1600, 'height': 900, 'primary': true}], 'monitor': 0, 'control': true}));
        ws.add(frame);
      });
    });

    // Socket writes made from the widget run in the test's fake time.
    Future<void> settle() async {
      for (var i = 0; i < 3; i++) {
        await tester.pump(const Duration(milliseconds: 20));
        await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 60)));
      }
    }

    final link = PcLink(name: 'pc', origin: Uri.parse('http://127.0.0.1:${server.port}'), token: 't');
    await tester.binding.setSurfaceSize(const Size(400, 800));
    await tester.pumpWidget(ProviderScope(child: MaterialApp(home: PcScreen(link: link))));

    // Let the socket connect and the frame decode.
    for (var i = 0; i < 20 && acks == 0; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 100)));
      await tester.pump();
    }
    expect(acks, greaterThanOrEqualTo(1), reason: 'the frame was shown and acknowledged');
    expect(received.first['t'], 'config');
    expect(find.byType(RawImage), findsOneWidget);

    // The picture is fitted in the middle of the area under the app bar.
    final area = tester.getRect(find.byKey(const Key('pc-surface')));
    await tester.tapAt(area.center);
    await settle();
    final click = received.lastWhere((m) => m['t'] == 'click');
    expect(click['b'], 'left');
    expect((click['x'] as num).toDouble(), closeTo(0.5, 0.02));
    expect((click['y'] as num).toDouble(), closeTo(0.5, 0.02));

    // Long press without moving is a right click.
    final g = await tester.startGesture(area.center);
    await tester.pump(const Duration(milliseconds: 600));
    await g.up();
    await settle();
    expect(received.lastWhere((m) => m['t'] == 'click')['b'], 'right');

    // One finger dragged down scrolls up.
    await tester.dragFrom(area.center, const Offset(0, 120));
    await settle();
    final scrolls = received.where((m) => m['t'] == 'scroll').toList();
    expect(scrolls, isNotEmpty);
    expect(scrolls.fold<num>(0, (s, m) => s + (m['dy'] as num)), greaterThan(0));

    // The app bar switch ends the stream and clears the picture...
    await tester.tap(find.byKey(const Key('pc-viewing')));
    await settle();
    expect(closes, 1);
    expect(find.text('Viewing is off'), findsOneWidget);
    expect(find.byType(RawImage), findsNothing);

    // ...and nothing reaches the PC until it's turned on again.
    final before = received.length;
    await tester.tapAt(area.center);
    await settle();
    expect(received.length, before);

    await tester.tap(find.widgetWithText(FilledButton, 'Turn on viewing'));
    for (var i = 0; i < 20 && find.byType(RawImage).evaluate().isEmpty; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 100)));
      await tester.pump();
    }
    expect(find.byType(RawImage), findsOneWidget);
    expect(find.text('Viewing is off'), findsNothing);

    await tester.runAsync(() async {
      await socket?.close();
      await server.close(force: true);
    });
    await tester.pumpWidget(const SizedBox());
  });
}
