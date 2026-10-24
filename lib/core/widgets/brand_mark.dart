import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// The mark: a white triangle on black, the same as the launcher icon.
class BrandMark extends StatelessWidget {
  const BrandMark({
    super.key,
    this.size = 32,
    this.color = Colors.white,
    this.background = Colors.black,
  });
  final double size;
  final Color color;

  /// Null draws the triangle alone.
  final Color? background;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: background == null
        ? null
        : BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(size * 0.28),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
    child: CustomPaint(painter: _TrianglePainter(color)),
  );
}

/// The mark's optional little bit of mischief. It is kept separate from
/// [BrandMark] so the app's normal, quiet branding never animates unless the
/// person explicitly turns it on in Settings.
class RainbowBrandMark extends StatefulWidget {
  const RainbowBrandMark({
    super.key,
    this.size = 32,
    this.background = Colors.black,
  });
  final double size;
  final Color? background;

  @override
  State<RainbowBrandMark> createState() => _RainbowBrandMarkState();
}

class _RainbowBrandMarkState extends State<RainbowBrandMark>
    with SingleTickerProviderStateMixin {
  late final AnimationController _hue = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 7),
  )..repeat();

  @override
  void dispose() {
    _hue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _hue,
    builder: (_, _) => BrandMark(
      size: widget.size,
      background: widget.background,
      color: HSVColor.fromAHSV(1, _hue.value * 360, 0.72, 1).toColor(),
    ),
  );
}

class _TrianglePainter extends CustomPainter {
  const _TrianglePainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    // A hollow equilateral triangle centred on its centroid, like the icon:
    // the outer one minus a smaller one whose inradius is the outer's less
    // the stroke, so the outline is even on every side.
    final cx = size.width / 2, cy = size.height / 2;
    Path tri(double side) {
      final h = side * math.sqrt(3) / 2;
      return Path()
        ..moveTo(cx, cy - 2 * h / 3)
        ..lineTo(cx + side / 2, cy + h / 3)
        ..lineTo(cx - side / 2, cy + h / 3)
        ..close();
    }

    final side = size.width * 0.52;
    final inradius = side / (2 * math.sqrt(3));
    final stroke = math.max(1.2, side * 0.085);
    final outline = Path.combine(
      PathOperation.difference,
      tri(side),
      tri(side * (inradius - stroke) / inradius),
    );
    canvas.drawPath(
      outline,
      Paint()
        ..color = color
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(_TrianglePainter old) => old.color != color;
}

class BrandLockup extends StatelessWidget {
  const BrandLockup({super.key, this.markSize = 26});
  final double markSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BrandMark(size: markSize),
        const SizedBox(width: Space.s + 2),
        Text(
          'TeleAI',
          style: context.text.titleMedium?.copyWith(letterSpacing: -0.2),
        ),
      ],
    );
  }
}

/// A skinny pencil, for "new chat".
class PencilIcon extends StatelessWidget {
  const PencilIcon({super.key, this.size = 20, this.color});
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size.square(size),
    painter: _PencilPainter(
      color ?? IconTheme.of(context).color ?? AppColors.text,
    ),
  );
}

class _PencilPainter extends CustomPainter {
  const _PencilPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = math.max(1.2, s * 0.07)
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    canvas.save();
    canvas.translate(s / 2, s / 2);
    canvas.rotate(math.pi / 4);
    // Upright pencil before rotation: a narrow body, a pointed tip below.
    final w = s * 0.17, top = -s * 0.46, shoulder = s * 0.22, tip = s * 0.42;
    final body = Path()
      ..moveTo(-w, top)
      ..lineTo(w, top)
      ..lineTo(w, shoulder)
      ..lineTo(0, tip)
      ..lineTo(-w, shoulder)
      ..close();
    canvas.drawPath(body, p);
    canvas.drawLine(Offset(-w, top + s * 0.14), Offset(w, top + s * 0.14), p);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_PencilPainter old) => old.color != color;
}
