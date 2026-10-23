import 'package:flutter/material.dart';

import '../../../../app/theme.dart';

/// The model's reasoning, folded to one line unless opened.
class ThinkingBlock extends StatefulWidget {
  const ThinkingBlock({super.key, required this.text, required this.active, this.durationMs});

  final String text;

  /// Still thinking: the label shimmers and the block stays open.
  final bool active;
  final int? durationMs;

  @override
  State<ThinkingBlock> createState() => _ThinkingBlockState();
}

class _ThinkingBlockState extends State<ThinkingBlock> with SingleTickerProviderStateMixin {
  bool _open = false;
  late final AnimationController _shimmer = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));

  @override
  void initState() {
    super.initState();
    if (widget.active) _shimmer.repeat();
  }

  @override
  void didUpdateWidget(ThinkingBlock old) {
    super.didUpdateWidget(old);
    if (widget.active && !_shimmer.isAnimating) _shimmer.repeat();
    if (!widget.active && _shimmer.isAnimating) _shimmer.stop();
  }

  @override
  void dispose() {
    _shimmer.dispose();
    super.dispose();
  }

  String get _label {
    if (widget.active) return 'Thinking';
    final ms = widget.durationMs;
    if (ms == null) return 'Thoughts';
    final s = (ms / 1000).round();
    return s < 1 ? 'Thought briefly' : 'Thought for ${s}s';
  }

  @override
  Widget build(BuildContext context) {
    final open = _open || widget.active;
    final label = Text(_label, style: const TextStyle(fontSize: 13, color: AppColors.text2, fontWeight: FontWeight.w500));
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(Radii.s),
            onTap: widget.active ? null : () => setState(() => _open = !_open),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Space.xs),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.psychology_alt_outlined, size: 16, color: AppColors.text3),
                  const SizedBox(width: Space.s),
                  if (widget.active)
                    AnimatedBuilder(
                      animation: _shimmer,
                      builder: (context, child) => ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (rect) => LinearGradient(
                          colors: const [AppColors.text3, AppColors.text, AppColors.text3],
                          stops: const [0, 0.5, 1],
                          begin: Alignment(-2 + _shimmer.value * 4, 0),
                          end: Alignment(-1 + _shimmer.value * 4, 0),
                        ).createShader(rect),
                        child: child,
                      ),
                      child: label,
                    )
                  else
                    label,
                  if (!widget.active)
                    AnimatedRotation(
                      turns: open ? 0.25 : 0,
                      duration: const Duration(milliseconds: 180),
                      child: const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.text3),
                    ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            alignment: Alignment.topLeft,
            child: !open || widget.text.trim().isEmpty
                ? const SizedBox(width: double.infinity)
                : Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: Space.xs, left: 7),
                    padding: const EdgeInsets.only(left: Space.m + 2),
                    decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppColors.line, width: 2))),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: widget.active ? 160 : double.infinity),
                      child: SingleChildScrollView(
                        reverse: widget.active,
                        physics: widget.active ? const NeverScrollableScrollPhysics() : null,
                        child: Text(
                          widget.text.trim(),
                          style: const TextStyle(fontSize: 13, height: 1.5, color: AppColors.text3),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
