import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../app/theme.dart';
import '../chat/presentation/widgets/message_view.dart';
import '../settings/data/settings.dart';
import '../telegram/presentation/chat_actions.dart' show confirmAction;
import 'brief_settings_screen.dart';
import 'brief_store.dart';

/// Briefs: write one now, see the latest, browse earlier ones, and set the
/// morning and night times.
class BriefScreen extends ConsumerWidget {
  const BriefScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final st = ref.watch(briefStoreProvider);
    final s = ref.watch(settingsProvider);
    final store = ref.read(briefStoreProvider.notifier);
    final latest = st.briefs.firstOrNull;

    Future<void> pickTime(bool morning) async {
      final cur = (morning ? s.briefMorning : s.briefNight).split(':');
      final t = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: int.tryParse(cur.first) ?? 8, minute: int.tryParse(cur.last) ?? 0),
      );
      if (t == null) return;
      final v = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
      await ref.read(settingsProvider.notifier).setBriefs(morning: morning ? v : null, night: morning ? null : v);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brief'),
        actions: [
          IconButton(
            tooltip: 'Brief settings',
            icon: const Icon(Icons.tune_rounded),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const BriefSettingsScreen()),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.x4),
        children: [
          Container(
            padding: const EdgeInsets.all(Space.l),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(Radii.l),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A detailed, priority-ordered rundown of what happened since the last brief across your DMs, groups and '
                  'channels, and your email, calendar, Slack and other connected apps (set in Brief settings). Read-only: '
                  'nothing is sent or marked as read.',
                  style: context.text.bodySmall,
                ),
                const SizedBox(height: Space.m),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(minimumSize: const Size(0, 48)),
                    icon: st.running != null
                        ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.bolt_rounded),
                    label: Text(st.running != null ? 'Writing your ${st.running!.label.toLowerCase()}…' : 'Brief me now'),
                    onPressed: st.running != null
                        ? null
                        : () async {
                            if (!s.hasAnyKey) {
                              showSnack(context, 'Add an AI key in Settings first', icon: Icons.key_off_outlined);
                              return;
                            }
                            final b = await store.generate(BriefKind.manual);
                            if (b != null && context.mounted) {
                              Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => BriefView(brief: b)));
                            }
                          },
                  ),
                ),
                const Divider(height: Space.xl),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Morning and night briefs'),
                  subtitle: Text('Written automatically and sent as a notification', style: context.text.bodySmall),
                  value: s.briefsScheduled,
                  onChanged: (v) => ref.read(settingsProvider.notifier).setBriefs(scheduled: v),
                ),
                if (s.briefsScheduled)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Text('☀️'),
                          label: Text('Morning ${s.briefMorning}'),
                          onPressed: () => pickTime(true),
                        ),
                      ),
                      const SizedBox(width: Space.s),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Text('🌙'),
                          label: Text('Night ${s.briefNight}'),
                          onPressed: () => pickTime(false),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          if (latest != null) ...[
            const SizedBox(height: Space.xl),
            Text('LATEST', style: context.text.labelSmall),
            const SizedBox(height: Space.s),
            _BriefCard(brief: latest, big: true),
          ],
          if (st.briefs.length > 1) ...[
            const SizedBox(height: Space.xl),
            Text('EARLIER · ${st.briefs.length - 1}', style: context.text.labelSmall),
            const SizedBox(height: Space.s),
            for (final b in st.briefs.skip(1)) _BriefCard(brief: b),
          ],
          if (st.briefs.isEmpty && st.running == null)
            Padding(
              padding: const EdgeInsets.all(Space.x4),
              child: Center(child: Text('No briefs yet', style: context.text.bodySmall)),
            ),
        ],
      ),
    );
  }
}

class _BriefCard extends ConsumerWidget {
  const _BriefCard({required this.brief, this.big = false});
  final Brief brief;
  final bool big;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final b = brief;
    final preview = b.text
        .replaceAll(RegExp(r'\[([^\]]*)\]\([^)]*\)'), r'$1')
        .replaceAll(RegExp(r'[#*_>`]'), '')
        .replaceAll(RegExp(r'\n+'), ' ')
        .trim();
    return Padding(
      padding: const EdgeInsets.only(bottom: Space.s),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(Radii.l),
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.l),
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => BriefView(brief: b))),
          onLongPress: () async {
            if (await confirmAction(context, title: 'Delete this brief?', message: 'Only the saved brief goes.', action: 'Delete')) {
              await ref.read(briefStoreProvider.notifier).delete(b.id);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(Space.m),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Radii.l),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(b.kind.emoji, style: TextStyle(fontSize: big ? 26 : 20)),
                const SizedBox(width: Space.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${b.kind.label} · ${DateFormat('EEE d MMM, HH:mm').format(b.at)}',
                        style: context.text.titleSmall,
                      ),
                      Text(
                        'Covers since ${DateFormat('d MMM HH:mm').format(b.since)}',
                        style: context.text.labelSmall,
                      ),
                      const SizedBox(height: Space.xs),
                      Text(
                        b.error ?? (preview.isEmpty ? 'Empty' : preview),
                        maxLines: big ? 5 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.bodySmall?.copyWith(color: b.error != null ? AppColors.danger : null),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One brief in full, with its post chips and the tool calls behind it.
class BriefView extends StatelessWidget {
  const BriefView({super.key, required this.brief});
  final Brief brief;

  @override
  Widget build(BuildContext context) {
    final answer = brief.answer;
    return Scaffold(
      appBar: AppBar(title: Text('${brief.kind.emoji} ${DateFormat('EEE d MMM, HH:mm').format(brief.at)}')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
        children: [
          Text(
            'From ${DateFormat('d MMM HH:mm').format(brief.since)} to ${DateFormat('d MMM HH:mm').format(brief.at)}',
            style: context.text.labelSmall,
          ),
          const SizedBox(height: Space.m),
          if (answer == null)
            Text(brief.error ?? 'Nothing was written.', style: context.text.bodySmall)
          else
            AssistantMessage(entry: answer, posts: brief.conversation.posts, streaming: false),
        ],
      ),
    );
  }
}

/// For the drawer: when the last brief was written.
String briefSubtitle(List<Brief> briefs) {
  final b = briefs.firstOrNull;
  if (b == null) return 'What happened, by priority';
  return 'Last: ${DateFormat('EEE HH:mm').format(b.at)}';
}
