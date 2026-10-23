import 'dart:ui';

import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Frosted glass: whatever scrolls underneath shows through, blurred.
class Glass extends StatelessWidget {
  const Glass({
    super.key,
    required this.child,
    this.radius = 999,
    this.padding = EdgeInsets.zero,
    this.blur = 22,
    this.opacity = 0.62,
  });

  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final double blur;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: AppColors.surface2.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A round glass button for floating headers.
class GlassIconButton extends StatelessWidget {
  const GlassIconButton({super.key, required this.icon, required this.onTap, this.tooltip, this.size = 44});
  final IconData icon;
  final VoidCallback? onTap;
  final String? tooltip;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: Glass(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: SizedBox.square(dimension: size, child: Icon(icon, size: 22, color: AppColors.text)),
          ),
        ),
      ),
    );
  }
}
