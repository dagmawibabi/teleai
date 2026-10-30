// Moving the pointer smoothly along a path, in real time, so apps that track
// the movement (drawing, sliders, drag and drop, hover menus) see all of it.

import 'dart:math' as math;

import '../core/path_guard.dart';
import '../native/windows.dart' as win;
import 'tool.dart';

typedef Point = ({int x, int y});

const maxPathPoints = 1000;
const maxPathMs = 25000;
const _frameMs = 16;

var _busy = false;

/// Runs one mouse batch at a time, so two can't fight over the pointer or a
/// held button.
Future<T> oneAtATime<T>(Future<T> Function() run) async {
  if (_busy) throw ToolRefused('Another mouse batch is still running; wait for it to finish.');
  _busy = true;
  try {
    return await run();
  } finally {
    _busy = false;
  }
}

/// [raw] as screen points: a list of {x, y} objects or [x, y] pairs, in pixels
/// of the last screenshot.
List<Point> pathPoints(Object? raw, ToolContext ctx) {
  if (raw is! List || raw.isEmpty) throw ToolRefused('Give points as a list of {x, y}.');
  if (raw.length > maxPathPoints) throw ToolRefused('At most $maxPathPoints points at a time.');
  if (!ctx.screen.taken) throw ToolRefused('Take a screenshot first: x and y are pixels in it.');
  return [
    for (final (i, p) in raw.indexed)
      switch (p) {
        {'x': final num x, 'y': final num y} => ctx.screen.toScreen(x, y),
        [final num x, final num y] => ctx.screen.toScreen(x, y),
        _ => throw ToolRefused('Point ${i + 1} is not {x, y}.'),
      },
  ];
}

/// Every pointer position along [points] for about [frames] frames, spread by
/// distance. Each point is reached exactly, so corners stay sharp.
List<Point> pathFrames(List<Point> points, int frames) {
  double length(Point a, Point b) => math.sqrt(math.pow(b.x - a.x, 2) + math.pow(b.y - a.y, 2));
  var total = 0.0;
  for (var i = 1; i < points.length; i++) {
    total += length(points[i - 1], points[i]);
  }
  final out = <Point>[points.first];
  for (var i = 1; i < points.length; i++) {
    final a = points[i - 1], b = points[i];
    final steps = total == 0 ? 1 : math.max(1, (frames * length(a, b) / total).round());
    for (var s = 1; s <= steps; s++) {
      out.add((x: a.x + ((b.x - a.x) * s / steps).round(), y: a.y + ((b.y - a.y) * s / steps).round()));
    }
  }
  return out;
}

/// Moves along [points] over [durationMs]. With [hold] it goes to the first
/// point, presses that button, moves and lets go, even if something fails;
/// without it the movement starts from where the pointer is. Returns false if
/// [stopAt] came first.
Future<bool> glide(List<Point> points, {int durationMs = 400, String? hold, DateTime? stopAt}) async {
  final frames = pathFrames([if (hold == null) win.cursorPos(), ...points], (durationMs / _frameMs).ceil());
  if (hold != null) {
    win.moveMouse(frames.first.x, frames.first.y);
    win.mouseDown(hold);
    await Future<void>.delayed(const Duration(milliseconds: 30));
  }
  try {
    final watch = Stopwatch()..start();
    for (final (i, f) in frames.indexed) {
      if (stopAt != null && DateTime.now().isAfter(stopAt)) return false;
      win.moveMouse(f.x, f.y);
      final wait = durationMs * (i + 1) ~/ frames.length - watch.elapsedMilliseconds;
      await Future<void>.delayed(Duration(milliseconds: math.max(wait, 0)));
    }
    return true;
  } finally {
    if (hold != null) win.mouseUp(hold);
  }
}
