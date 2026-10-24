import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme.dart';
import '../data/settings.dart';

/// Chooses how long message-triggered watches wait for a conversation to go
/// quiet before the assistant responds.
class WatchTimingScreen extends ConsumerWidget {
  const WatchTimingScreen({super.key});

  /// Every delay offered, in seconds, from instant to eight hours.
  static const steps = [0, 1, 2, 5, 12, 30, 60, 120, 300, 600, 1800, 3600, 7200, 14400, 28800];

  static const _presets = [
    (_Preset('Instant', Icons.bolt_rounded, 'Answers each message right away', 0)),
    (_Preset('Natural', Icons.chat_bubble_outline_rounded, 'Waits for a short burst to finish', 12)),
    (_Preset('Patient', Icons.hourglass_bottom_rounded, 'Lets a conversation settle first', 300)),
    (_Preset('Digest', Icons.inventory_2_outlined, 'Batches a busy hour into one run', 3600)),
  ];

  static const _accent = Color(0xFF8AB4FF);

  static String short(int seconds) {
    if (seconds == 0) return 'Instant';
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) return '${seconds ~/ 60} min';
    return '${seconds ~/ 3600} h';
  }

  static String long(int seconds) {
    if (seconds == 0) return 'Responds right away';
    final unit = seconds < 60
        ? '$seconds second${seconds == 1 ? '' : 's'}'
        : seconds < 3600
        ? '${seconds ~/ 60} minute${seconds ~/ 60 == 1 ? '' : 's'}'
        : '${seconds ~/ 3600} hour${seconds ~/ 3600 == 1 ? '' : 's'}';
    return 'Waits $unit of quiet';
  }

  /// The longest a busy chat waits: four delays, at least 45 s, at most a day.
  static int cap(int seconds) => math.max(seconds, (4 * seconds).clamp(45, 24 * 3600));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = ref.watch(settingsProvider).watchResponseDelaySeconds;
    final ctl = ref.read(settingsProvider.notifier);
    void set(int v) => ctl.setWatchResponseDelay(Duration(seconds: v));
    // The nearest step, for a value set elsewhere (by the assistant, say).
    final index = steps.indexed.reduce((a, b) => (b.$2 - seconds).abs() < (a.$2 - seconds).abs() ? b : a).$1;

    return Scaffold(
      appBar: AppBar(title: const Text('Response timing')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
        children: [
          // The choice, big, with a picture of what it does.
          Container(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.l, Space.l, Space.m),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Radii.xl),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_accent.withValues(alpha: 0.20), _accent.withValues(alpha: 0.04)],
              ),
              border: Border.all(color: _accent.withValues(alpha: 0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, color: _accent, size: 20),
                    const SizedBox(width: Space.s),
                    Text('WATCHES RESPOND', style: context.text.labelSmall?.copyWith(color: _accent, letterSpacing: 1)),
                  ],
                ),
                const SizedBox(height: Space.s),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  child: Text(
                    seconds == 0 ? 'Instantly' : 'After ${short(seconds)}',
                    key: ValueKey(seconds),
                    style: context.text.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  seconds == 0
                      ? 'Each matching message starts the assistant straight away.'
                      : '${long(seconds)} after the newest message, so a burst is answered once. A busy chat still gets a '
                            'reply within ${short(cap(seconds))}.',
                  style: context.text.bodySmall?.copyWith(height: 1.4),
                ),
                const SizedBox(height: Space.l),
                _Timeline(seconds: seconds),
              ],
            ),
          ),
          const SizedBox(height: Space.xl),
          Text('QUICK PICKS', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: Space.s,
            crossAxisSpacing: Space.s,
            childAspectRatio: 1.75,
            children: [
              for (final p in _presets) _PresetCard(preset: p, selected: seconds == p.seconds, onTap: () => set(p.seconds)),
            ],
          ),
          const SizedBox(height: Space.xl),
          Text('FINE-TUNE', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          Container(
            padding: const EdgeInsets.fromLTRB(Space.s, Space.m, Space.s, Space.s),
            decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.l)),
            child: Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: _accent,
                    thumbColor: _accent,
                    inactiveTrackColor: AppColors.surface3,
                    activeTickMarkColor: Colors.white.withValues(alpha: 0.5),
                    inactiveTickMarkColor: AppColors.text3,
                    valueIndicatorColor: _accent,
                    valueIndicatorTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  child: Slider(
                    value: index.toDouble(),
                    min: 0,
                    max: (steps.length - 1).toDouble(),
                    divisions: steps.length - 1,
                    label: short(steps[index]),
                    onChanged: (v) => set(steps[v.round()]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Space.m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final l in const ['Instant', '1 min', '10 min', '1 h', '8 h'])
                        Text(l, style: context.text.labelSmall?.copyWith(color: AppColors.text3)),
                    ],
                  ),
                ),
                const SizedBox(height: Space.s),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final s in steps)
                      ChoiceChip(
                        label: Text(short(s)),
                        selected: s == seconds,
                        showCheckmark: false,
                        visualDensity: VisualDensity.compact,
                        selectedColor: _accent.withValues(alpha: 0.22),
                        side: BorderSide(color: s == seconds ? _accent : AppColors.line),
                        labelStyle: TextStyle(fontSize: 12, color: s == seconds ? _accent : AppColors.text2),
                        onSelected: (_) => set(s),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: Space.xl),
          Text('HOW IT WORKS', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          Container(
            decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.l)),
            child: const Column(
              children: [
                _Point(Icons.restart_alt_rounded, 'The wait restarts with each new message', 'So a flurry of messages becomes one response, not ten.'),
                _Point(Icons.speed_rounded, 'Busy chats are never left waiting', 'If messages keep coming, the watch responds after about four delays (at least 45 s).'),
                _Point(Icons.schedule_rounded, 'Scheduled routines keep their own times', 'This only affects watches that react to new messages.'),
                _Point(Icons.memory_rounded, 'Waiting messages live in memory', 'If the app is fully closed during the wait, they\'re forgotten.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Preset {
  const _Preset(this.name, this.icon, this.about, this.seconds);
  final String name;
  final IconData icon;
  final String about;
  final int seconds;
}

class _PresetCard extends StatelessWidget {
  const _PresetCard({required this.preset, required this.selected, required this.onTap});
  final _Preset preset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const accent = WatchTimingScreen._accent;
    return Material(
      color: selected ? accent.withValues(alpha: 0.12) : AppColors.surface2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Radii.l),
        side: BorderSide(color: selected ? accent : AppColors.line, width: selected ? 1.5 : 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(Radii.l),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Space.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(preset.icon, size: 18, color: selected ? accent : AppColors.text2),
                  const SizedBox(width: 6),
                  Expanded(child: Text(preset.name, style: context.text.titleSmall)),
                  Text(
                    WatchTimingScreen.short(preset.seconds),
                    style: context.text.labelSmall?.copyWith(color: selected ? accent : AppColors.text3),
                  ),
                ],
              ),
              const Spacer(),
              Text(preset.about, maxLines: 2, overflow: TextOverflow.ellipsis, style: context.text.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

/// Messages arriving, the quiet wait, then the assistant's turn.
class _Timeline extends StatelessWidget {
  const _Timeline({required this.seconds});
  final int seconds;

  @override
  Widget build(BuildContext context) {
    const accent = WatchTimingScreen._accent;
    Widget bubble() => Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(color: AppColors.text2, borderRadius: BorderRadius.circular(5)),
    );
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Row(
            children: [
              bubble(),
              const SizedBox(width: 4),
              bubble(),
              const SizedBox(width: 4),
              bubble(),
              const SizedBox(width: Space.s),
              // The wait, longer for longer delays (on a log scale, so seconds
              // and hours both read).
              Expanded(
                child: AnimatedFractionallySizedBox(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  alignment: Alignment.centerLeft,
                  widthFactor: seconds == 0 ? 0.04 : (0.2 + 0.8 * math.log(seconds + 1) / math.log(28801)).clamp(0.2, 1.0),
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(colors: [accent.withValues(alpha: 0.15), accent.withValues(alpha: 0.6)]),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Space.s),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(color: accent, shape: BoxShape.circle),
                child: const Icon(Icons.auto_awesome, size: 14, color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text('messages', style: context.text.labelSmall),
            const Spacer(),
            if (seconds > 0) Text('quiet for ${WatchTimingScreen.short(seconds)}', style: context.text.labelSmall),
            const Spacer(),
            Text('assistant', style: context.text.labelSmall),
          ],
        ),
      ],
    );
  }
}

class _Point extends StatelessWidget {
  const _Point(this.icon, this.title, this.body);
  final IconData icon;
  final String title, body;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, Space.m),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.text2),
        const SizedBox(width: Space.m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.text.titleSmall?.copyWith(fontSize: 14)),
              const SizedBox(height: 2),
              Text(body, style: context.text.bodySmall?.copyWith(height: 1.35)),
            ],
          ),
        ),
      ],
    ),
  );
}
