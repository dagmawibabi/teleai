import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Pieces shared by the Privacy & security and Storage & data screens, in
/// the Settings look: grouped cards with a small caps label, tinted icon
/// badges, and a ring chart.

class Group extends StatelessWidget {
  const Group({super.key, this.label, required this.children, this.trailing, this.padded = false});
  final String? label;
  final Widget? trailing;
  final List<Widget> children;

  /// Pad the content instead of laying tiles edge to edge.
  final bool padded;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (label != null)
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.xs, Space.l, Space.xs, Space.xs),
          child: Row(
            children: [
              Expanded(child: Text(label!.toUpperCase(), style: context.text.labelSmall)),
              ?trailing,
            ],
          ),
        ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(Radii.xl),
          border: Border.all(color: AppColors.line),
        ),
        clipBehavior: Clip.antiAlias,
        padding: padded ? const EdgeInsets.all(Space.l) : null,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final (i, c) in children.indexed) ...[
                if (i > 0 && !padded) const Divider(height: 1, indent: 64),
                c,
              ],
            ],
          ),
        ),
      ),
    ],
  );
}

class IconBadge extends StatelessWidget {
  const IconBadge(this.icon, {super.key, this.color, this.size = 36});
  final IconData icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.activeAccent;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: c.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(Radii.m)),
      child: Icon(icon, size: size * 0.55, color: c),
    );
  }
}

class Pill extends StatelessWidget {
  const Pill(this.label, {super.key, this.color});
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.text2;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: c.withValues(alpha: 0.14), borderRadius: BorderRadius.circular(99)),
      child: Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: c)),
    );
  }
}

/// A ring split into coloured parts (a donut chart), or a single progress
/// ring when [parts] has one value and [max] is set.
class Ring extends StatelessWidget {
  const Ring({super.key, required this.parts, this.max, this.size = 150, this.stroke = 14, this.child});
  final List<(double, Color)> parts;
  final double? max;
  final double size;
  final double stroke;
  final Widget? child;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: CustomPaint(
      painter: _RingPainter(parts, max, stroke),
      child: Center(child: child),
    ),
  );
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.parts, this.max, this.stroke);
  final List<(double, Color)> parts;
  final double? max;
  final double stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(stroke / 2, stroke / 2, size.width - stroke, size.height - stroke);
    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..color = AppColors.surface3;
    canvas.drawArc(rect, 0, math.pi * 2, false, track);
    final total = max ?? parts.fold<double>(0, (a, p) => a + p.$1);
    if (total <= 0) return;
    var start = -math.pi / 2;
    final gap = parts.length > 1 ? 0.035 : 0.0;
    for (final (v, c) in parts) {
      final sweep = math.pi * 2 * (v / total);
      if (sweep <= gap) continue;
      canvas.drawArc(
        rect,
        start + gap / 2,
        sweep - gap,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..strokeCap = parts.length == 1 ? StrokeCap.round : StrokeCap.butt
          ..color = c,
      );
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.parts != parts || old.max != max;
}

/// A thin bar showing [value] of [max].
class Meter extends StatelessWidget {
  const Meter({super.key, required this.value, required this.max, required this.color});
  final double value, max;
  final Color color;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(99),
    child: LinearProgressIndicator(
      value: max <= 0 ? 0 : (value / max).clamp(0, 1),
      minHeight: 4,
      color: color,
      backgroundColor: AppColors.surface3,
    ),
  );
}

/// Asks before something that can't be undone.
Future<bool> confirm(
  BuildContext context, {
  required String title,
  required String body,
  required String action,
  bool danger = false,
}) async =>
    await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(
            style: danger ? FilledButton.styleFrom(backgroundColor: AppColors.danger, foregroundColor: Colors.white) : null,
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(action),
          ),
        ],
      ),
    ) ??
    false;
