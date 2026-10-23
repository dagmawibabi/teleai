import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import 'speaker.dart';

String _speedLabel(double s) =>
    s == s.roundToDouble() ? s.toStringAsFixed(0) : s.toStringAsFixed(2).replaceFirst(RegExp(r'0$'), '');

String _time(Duration d) => '${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';

/// Full read-aloud controls: the part being read, progress, skip and seek,
/// restart, stop and speed.
Future<void> showPlayerSheet(BuildContext context) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (_) => const _PlayerSheet(),
);

class _PlayerSheet extends ConsumerWidget {
  const _PlayerSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final n = ref.watch(speakerProvider);
    Widget btn(IconData icon, String tip, VoidCallback? onTap, {double size = 28}) =>
        IconButton(tooltip: tip, iconSize: size, icon: Icon(icon), onPressed: onTap);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.xl, 0, Space.xl, Space.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(n.speaking ? n.title : 'Nothing playing', style: context.text.titleLarge),
            const SizedBox(height: 2),
            Text(
              n.speaking ? 'Part ${n.index + 1} of ${n.parts.length} · ${n.engineLabel}' : 'Tap the speaker under an answer to hear it',
              style: context.text.bodySmall,
            ),
            const SizedBox(height: Space.l),
            if (n.lastError != null)
              Container(
                padding: const EdgeInsets.all(Space.m),
                margin: const EdgeInsets.only(bottom: Space.m),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(Radii.m),
                  border: Border.all(color: AppColors.warning.withValues(alpha: 0.4)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.error_outline_rounded, size: 18, color: AppColors.warning),
                    const SizedBox(width: Space.s),
                    Expanded(
                      child: Text(
                        'The voice had a problem, so the device voice read instead: ${n.lastError}',
                        style: context.text.bodySmall?.copyWith(color: AppColors.text),
                      ),
                    ),
                  ],
                ),
              ),
            if (n.speaking) ...[
              Container(
                constraints: const BoxConstraints(maxHeight: 180),
                padding: const EdgeInsets.all(Space.l),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(Radii.l),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    n.index < n.parts.length ? n.parts[n.index] : '',
                    style: context.text.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(height: Space.m),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: LinearProgressIndicator(
                  value: n.parts.isEmpty ? 0 : (n.index + (n.playingAudio && n.duration.inMilliseconds > 0 ? n.position.inMilliseconds / n.duration.inMilliseconds : 0)) / n.parts.length,
                  minHeight: 4,
                  backgroundColor: AppColors.surface3,
                ),
              ),
              if (n.playingAudio && n.duration > Duration.zero)
                Padding(
                  padding: const EdgeInsets.only(top: Space.xs),
                  child: Row(
                    children: [
                      Text(_time(n.position), style: context.text.labelSmall),
                      const Spacer(),
                      Text(_time(n.duration), style: context.text.labelSmall),
                    ],
                  ),
                ),
              const SizedBox(height: Space.m),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn(Icons.skip_previous_rounded, 'Previous part', n.index > 0 ? n.previous : null),
                  btn(Icons.replay_10_rounded, 'Back 10 seconds', () => n.seekBy(-10)),
                  const SizedBox(width: Space.s),
                  Material(
                    color: AppColors.text,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: n.loading ? null : n.togglePause,
                      child: SizedBox.square(
                        dimension: 64,
                        child: n.loading
                            ? const Padding(
                                padding: EdgeInsets.all(22),
                                child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.bg),
                              )
                            : Icon(
                                n.paused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                                size: 34,
                                color: AppColors.bg,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Space.s),
                  btn(Icons.forward_10_rounded, 'Forward 10 seconds', () => n.seekBy(10)),
                  btn(Icons.skip_next_rounded, 'Next part', n.index < n.parts.length - 1 ? n.next : null),
                ],
              ),
              const SizedBox(height: Space.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: n.restart,
                    icon: const Icon(Icons.restart_alt_rounded, size: 18),
                    label: const Text('Restart'),
                  ),
                  const SizedBox(width: Space.s),
                  TextButton.icon(
                    style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                    onPressed: () {
                      n.stop();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.stop_rounded, size: 18),
                    label: const Text('Stop'),
                  ),
                ],
              ),
              if (!n.playingAudio)
                Text(
                  'The device voice skips by part; AI voices skip by seconds.',
                  textAlign: TextAlign.center,
                  style: context.text.labelSmall,
                ),
            ],
            const SizedBox(height: Space.l),
            Text('SPEED', style: context.text.labelSmall),
            Row(
              children: [
                const Icon(Icons.slow_motion_video_rounded, size: 18, color: AppColors.text3),
                Expanded(
                  child: Slider(
                    value: n.speed.clamp(0.5, 2.5),
                    min: 0.5,
                    max: 2.5,
                    divisions: 20,
                    label: '${_speedLabel(n.speed)}×',
                    onChanged: (v) => n.setSpeed((v * 20).round() / 20),
                  ),
                ),
                SizedBox(
                  width: 44,
                  child: Text('${_speedLabel(n.speed)}×', textAlign: TextAlign.right, style: context.text.bodyMedium),
                ),
              ],
            ),
            Wrap(
              spacing: 6,
              alignment: WrapAlignment.center,
              children: [
                for (final v in const [0.75, 1.0, 1.25, 1.5, 2.0])
                  ChoiceChip(
                    label: Text('${_speedLabel(v)}×'),
                    selected: (n.speed - v).abs() < 0.01,
                    onSelected: (_) => n.setSpeed(v),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A slim bar above the input while something is being read.
class NowReadingBar extends ConsumerWidget {
  const NowReadingBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final n = ref.watch(speakerProvider);
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: !n.speaking
          ? const SizedBox(width: double.infinity)
          : Padding(
              padding: const EdgeInsets.fromLTRB(Space.m, Space.xs, Space.m, 0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Material(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(Radii.m),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(Radii.m),
                      onTap: () => showPlayerSheet(context),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(Space.m, 4, 4, 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Radii.m),
                          border: Border.all(color: AppColors.line),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.graphic_eq_rounded, size: 18, color: AppColors.accent),
                            const SizedBox(width: Space.s),
                            Expanded(
                              child: Text(
                                n.loading ? 'Preparing voice…' : 'Reading aloud · part ${n.index + 1} of ${n.parts.length}',
                                style: context.text.bodySmall?.copyWith(color: AppColors.text),
                              ),
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              tooltip: n.paused ? 'Resume' : 'Pause',
                              icon: Icon(n.paused ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 20),
                              onPressed: n.togglePause,
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              tooltip: 'Stop',
                              icon: const Icon(Icons.close_rounded, size: 20),
                              onPressed: n.stop,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
