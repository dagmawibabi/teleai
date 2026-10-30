// How mouse paths are planned and read. Nothing here moves the real pointer.

import 'package:flutter_test/flutter_test.dart';
import 'package:triangle_companion/app/controller.dart';
import 'package:triangle_companion/core/config.dart';
import 'package:triangle_companion/core/path_guard.dart';
import 'package:triangle_companion/core/shares.dart';
import 'package:triangle_companion/tools/mouse_path.dart';
import 'package:triangle_companion/tools/tool.dart';

void main() {
  ToolContext context({bool taken = true}) => ToolContext(
        config: const CompanionConfig(token: 't', controlInput: true),
        shares: ShareLinks(),
        baseUrl: 'http://127.0.0.1',
        screen: ScreenMap()
          ..taken = taken
          ..originX = 100
          ..scale = 0.5,
        tempDir: '.',
      );

  test('frames reach every point exactly, in order', () {
    const points = <Point>[(x: 0, y: 0), (x: 100, y: 0), (x: 100, y: 100), (x: 0, y: 100)];
    final frames = pathFrames(points, 30);
    expect(frames.first, points.first);
    expect(frames.last, points.last);
    expect(frames, containsAllInOrder(points));
    expect(frames.length, 31);
    for (var i = 1; i < frames.length; i++) {
      final jump = (frames[i].x - frames[i - 1].x).abs() + (frames[i].y - frames[i - 1].y).abs();
      expect(jump, lessThanOrEqualTo(11));
    }
  });

  test('frames are spread by distance', () {
    final frames = pathFrames(const [(x: 0, y: 0), (x: 10, y: 0), (x: 100, y: 0)], 10);
    expect(frames.where((f) => f.x <= 10).length, lessThan(frames.where((f) => f.x > 10).length));
  });

  test('zero duration and repeated points still finish on the last point', () {
    expect(pathFrames(const [(x: 1, y: 1), (x: 9, y: 9)], 0).last, (x: 9, y: 9));
    expect(pathFrames(const [(x: 5, y: 5), (x: 5, y: 5)], 20).last, (x: 5, y: 5));
  });

  test('points are read as objects or pairs, in screenshot pixels', () {
    final points = pathPoints([
      {'x': 10, 'y': 20},
      [30, 40.0],
    ], context());
    expect(points, [(x: 120, y: 40), (x: 160, y: 80)]);
  });

  test('bad paths are refused with a reason', () {
    expect(() => pathPoints('nope', context()), throwsA(isA<ToolRefused>()));
    expect(() => pathPoints([{'x': 1}], context()), throwsA(isA<ToolRefused>()));
    expect(() => pathPoints(List.filled(maxPathPoints + 1, [1, 1]), context()), throwsA(isA<ToolRefused>()));
    expect(() => pathPoints([[1, 1]], context(taken: false)), throwsA(isA<ToolRefused>()));
  });

  test('only one batch runs at a time, and a failed one frees the mouse', () async {
    final first = oneAtATime(() => Future<void>.delayed(const Duration(milliseconds: 20)));
    await expectLater(oneAtATime(() async {}), throwsA(isA<ToolRefused>()));
    await first;
    await expectLater(oneAtATime<void>(() async => throw StateError('x')), throwsStateError);
    await oneAtATime(() async {});
  });

  test('mouse_path and the new do_actions limit are offered', () {
    final tools = CompanionController.tools;
    final path = tools.firstWhere((t) => t.name == 'mouse_path');
    expect(path.required, ['points']);
    expect(tools.firstWhere((t) => t.name == 'do_actions').description, contains('200'));
  });
}
