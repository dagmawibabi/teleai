import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../settings/data/settings.dart';

/// The morning and night briefs, each on or off with its own time. Used on
/// the Brief screen and in Brief settings.
class BriefSchedule extends ConsumerWidget {
  const BriefSchedule({super.key, this.padding = EdgeInsets.zero});

  /// Around each row: none inside a padded card, the card's own in a list.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    final ctl = ref.read(settingsProvider.notifier);
    final morning = s.briefsScheduled && s.briefMorningOn;
    final night = s.briefsScheduled && s.briefNightOn;

    Future<void> set({bool? morningOn, bool? nightOn}) async {
      final m = morningOn ?? morning, n = nightOn ?? night;
      if (morningOn != null) await ctl.setBriefMorningOn(morningOn);
      if (nightOn != null) await ctl.setBriefNightOn(nightOn);
      // Scheduling is on while either brief is.
      await ctl.setBriefs(scheduled: m || n);
    }

    Future<void> pickTime(bool isMorning) async {
      final cur = (isMorning ? s.briefMorning : s.briefNight).split(':');
      final t = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: int.tryParse(cur.first) ?? 8, minute: int.tryParse(cur.last) ?? 0),
      );
      if (t == null) return;
      final v = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
      await ctl.setBriefs(morning: isMorning ? v : null, night: isMorning ? null : v);
    }

    Widget row(bool isMorning) {
      final on = isMorning ? morning : night;
      final time = isMorning ? s.briefMorning : s.briefNight;
      return Padding(
        padding: padding,
        child: Row(
          children: [
            Icon(isMorning ? Icons.wb_sunny_outlined : Icons.nightlight_outlined, color: on ? AppColors.text : AppColors.text3),
            const SizedBox(width: Space.l),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isMorning ? 'Morning brief' : 'Night brief', style: context.text.titleSmall),
                  Text(
                    on ? 'Written at $time and sent as a notification' : 'Off',
                    style: context.text.bodySmall,
                  ),
                ],
              ),
            ),
            if (on)
              TextButton(onPressed: () => pickTime(isMorning), child: Text(time)),
            Switch(
              value: on,
              onChanged: (v) => isMorning ? set(morningOn: v) : set(nightOn: v),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        row(true),
        const SizedBox(height: Space.s),
        row(false),
      ],
    );
  }
}
