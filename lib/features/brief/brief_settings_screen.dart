import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../integrations/app_toolkits.dart';
import '../auth/data/auth_controller.dart';
import '../integrations/integrations_store.dart';
import '../settings/data/settings.dart';
import '../telegram/data/telegram_store.dart';
import '../telegram/presentation/chat_actions.dart' show confirmAction;
import '../telegram/presentation/tg_avatar.dart';
import 'brief_prefs.dart';
import 'brief_store.dart';
import 'brief_widget.dart';
import 'widget_customizer_screen.dart';

/// Settings → Brief controls: when briefs are written, which chats and what
/// they cover, and how they read (tone, length, language, instructions).
class BriefSettingsScreen extends ConsumerWidget {
  const BriefSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(briefPrefsProvider);
    final ctl = ref.read(briefPrefsProvider.notifier);
    final s = ref.watch(settingsProvider);
    final store = ref.watch(telegramStoreProvider);
    final connected = ref.watch(integrationsProvider).connected;
    String title(int id) => store.chat(id)?.title ?? p.chatTitles[id] ?? 'Chat $id';

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

    Future<void> addChat({required bool excluded}) async {
      final picked = await showModalBottomSheet<(int, String)>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        backgroundColor: AppColors.surface,
        builder: (_) => _ChatPicker(skip: {...p.chosen, ...p.excluded}),
      );
      if (picked != null) await ctl.choose(picked.$1, picked.$2, excluded: excluded);
    }

    Widget chatChips(Set<int> ids, {required bool excluded}) => Padding(
      padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
      child: Wrap(
        spacing: Space.s,
        runSpacing: Space.s,
        children: [
          for (final id in ids)
            InputChip(
              avatar: TgAvatar(chatId: id, title: title(id), size: 22),
              label: Text(title(id), overflow: TextOverflow.ellipsis),
              onDeleted: () => ctl.drop(id),
            ),
          ActionChip(
            avatar: Icon(excluded ? Icons.block_rounded : Icons.add_rounded, size: 18),
            label: Text(excluded ? 'Leave out a chat' : 'Add a chat'),
            onPressed: () => addChat(excluded: excluded),
          ),
        ],
      ),
    );

    Widget toggle(String label, String sub, bool value, BriefPrefs Function(BriefPrefs, bool) set, {IconData? icon}) =>
        SwitchListTile(
          secondary: icon == null ? null : Icon(icon, color: AppColors.text2),
          title: Text(label),
          subtitle: Text(sub, style: context.text.bodySmall),
          value: value,
          onChanged: (v) => ctl.update((p) => set(p, v)),
        );

    final appNames = [for (final a in connected) appLabel(a)];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brief settings'),
        actions: [
          IconButton(
            tooltip: 'Reset',
            icon: const Icon(Icons.restart_alt_rounded),
            onPressed: () async {
              if (await confirmAction(
                context,
                title: 'Reset brief settings?',
                message: 'Chats, coverage, tone and instructions go back to the defaults.',
                action: 'Reset',
              )) {
                await ctl.reset();
              }
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.x4),
            children: [
              const _Header('Schedule'),
              _Card(
                children: [
                  SwitchListTile(
                    title: const Text('Morning and night briefs'),
                    subtitle: Text(
                      s.briefsScheduled ? 'Written at ${s.briefMorning} and ${s.briefNight}' : 'Only when you ask',
                      style: context.text.bodySmall,
                    ),
                    value: s.briefsScheduled,
                    onChanged: (v) => ref.read(settingsProvider.notifier).setBriefs(scheduled: v),
                  ),
                  if (s.briefsScheduled)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.wb_sunny_outlined, size: 18),
                              label: Text('Morning ${s.briefMorning}'),
                              onPressed: () => pickTime(true),
                            ),
                          ),
                          const SizedBox(width: Space.s),
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.nightlight_outlined, size: 18),
                              label: Text('Night ${s.briefNight}'),
                              onPressed: () => pickTime(false),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const _Header('Chats'),
              if (!ref.watch(telegramConnectedProvider))
                _Card(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.send_rounded, color: AppColors.text2),
                      title: const Text('Telegram isn\'t connected'),
                      subtitle: Text(
                        'Briefs cover your connected apps for now. Connect Telegram under Settings → Apps & web to choose chats.',
                        style: context.text.bodySmall,
                      ),
                    ),
                  ],
                )
              else
              _Card(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Space.l),
                    child: SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<BriefScope>(
                        showSelectedIcon: false,
                        segments: [for (final v in BriefScope.values) ButtonSegment(value: v, label: Text(v.label))],
                        selected: {p.scope},
                        onSelectionChanged: (v) => ctl.update((p) => p.copyWith(scope: v.first)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
                    child: Text(p.scope.explanation, style: context.text.bodySmall),
                  ),
                  if (p.scope == BriefScope.chosen) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
                      child: Text('READ THESE', style: context.text.labelSmall),
                    ),
                    chatChips(p.chosen, excluded: false),
                  ],
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.s),
                    child: Text('NEVER READ OR MENTION', style: context.text.labelSmall),
                  ),
                  chatChips(p.excluded, excluded: true),
                ],
              ),
              const _Header('What to cover'),
              _Card(
                children: [
                  if (p.scope == BriefScope.all) ...[
                    toggle('Private chats', 'People who wrote to you', p.privateChats, (p, v) => p.copyWith(privateChats: v), icon: Icons.person_outline_rounded),
                    toggle('Groups', 'Conversations you are in', p.groups, (p, v) => p.copyWith(groups: v), icon: Icons.groups_outlined),
                    toggle('Channels', 'Posts from channels you follow', p.channels, (p, v) => p.copyWith(channels: v), icon: Icons.campaign_outlined),
                    toggle('Bots', 'Messages from bots', p.bots, (p, v) => p.copyWith(bots: v), icon: Icons.smart_toy_outlined),
                    toggle('Muted chats', 'Off: only when something there is clearly important', p.mutedChats, (p, v) => p.copyWith(mutedChats: v), icon: Icons.notifications_off_outlined),
                  ],
                  toggle('Mentions and replies', 'Anything addressed to you', p.mentions, (p, v) => p.copyWith(mentions: v), icon: Icons.alternate_email_rounded),
                  toggle('Missed calls', 'Calls you didn\'t pick up', p.missedCalls, (p, v) => p.copyWith(missedCalls: v), icon: Icons.phone_missed_outlined),
                  toggle(
                    'Connected apps',
                    !s.hasComposioKey
                        ? 'Add a Composio key and connect Gmail, Calendar, Slack… under Apps & web'
                        : appNames.isEmpty
                        ? 'No apps connected yet (Settings → Apps & web)'
                        : 'Email, calendar and more from ${appNames.join(', ')}',
                    p.apps,
                    (p, v) => p.copyWith(apps: v),
                    icon: Icons.hub_outlined,
                  ),
                ],
              ),
              const _Header('How it reads'),
              _Card(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, Space.l, Space.l, Space.s),
                    child: Text('Tone', style: context.text.titleSmall),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
                    child: Wrap(
                      spacing: Space.s,
                      runSpacing: Space.s,
                      children: [
                        for (final t in BriefTone.values)
                          ChoiceChip(
                            label: Text(t.label),
                            selected: p.tone == t,
                            onSelected: (_) => ctl.update((p) => p.copyWith(tone: t)),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.m),
                    child: Text('Writes ${p.tone.instruction}.', style: context.text.bodySmall),
                  ),
                  const Divider(indent: Space.l, endIndent: Space.l),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.l, Space.s),
                    child: Text('Length', style: context.text.titleSmall),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
                    child: SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<BriefLength>(
                        showSelectedIcon: false,
                        segments: [for (final v in BriefLength.values) ButtonSegment(value: v, label: Text(v.label))],
                        selected: {p.length},
                        onSelectionChanged: (v) => ctl.update((p) => p.copyWith(length: v.first)),
                      ),
                    ),
                  ),
                  const Divider(indent: Space.l, endIndent: Space.l),
                  _TextSetting(
                    title: 'Language',
                    hint: 'e.g. English, Amharic. Empty: the chats\' language',
                    value: p.language,
                    onSave: (v) => ctl.update((p) => p.copyWith(language: v.trim())),
                  ),
                  const Divider(indent: Space.l, endIndent: Space.l),
                  _TextSetting(
                    title: 'Your instructions',
                    hint: 'e.g. Put anything from my manager first. Skip crypto channels. Use bullet points only. '
                        'Always end with a weather line.',
                    value: p.instructions,
                    lines: 5,
                    onSave: (v) => ctl.update((p) => p.copyWith(instructions: v.trim())),
                  ),
                ],
              ),
              const _Header('Home screen'),
              _Card(
                children: [
                  ListTile(
                    leading: const Icon(Icons.widgets_outlined, color: AppColors.text2),
                    title: const Text('Brief widget'),
                    subtitle: Text(
                      'Long-press your home screen → Widgets → Triangle → Brief. It shows the latest brief and opens it when tapped.',
                      style: context.text.bodySmall,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.tune_rounded, color: AppColors.text2),
                    title: const Text('Customize the widget'),
                    subtitle: Text('Text size, colours, opacity, what it shows', style: context.text.bodySmall),
                    trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.text3),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const WidgetCustomizerScreen())),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Refresh the widget'),
                        onPressed: () async {
                          await BriefHomeWidget.publish(ref.read(briefStoreProvider).briefs);
                          if (context.mounted) showSnack(context, 'Widget updated');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(Space.xs, Space.xl, Space.xs, Space.s),
    child: Text(text.toUpperCase(), style: context.text.labelSmall),
  );
}

class _Card extends StatelessWidget {
  const _Card({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(Radii.l),
      border: Border.all(color: AppColors.line),
    ),
    clipBehavior: Clip.antiAlias,
    child: Material(
      type: MaterialType.transparency,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
    ),
  );
}

/// A text setting saved with its check button (or on submit).
class _TextSetting extends StatefulWidget {
  const _TextSetting({required this.title, required this.hint, required this.value, required this.onSave, this.lines = 1});
  final String title;
  final String hint;
  final String value;
  final int lines;
  final Future<void> Function(String) onSave;

  @override
  State<_TextSetting> createState() => _TextSettingState();
}

class _TextSettingState extends State<_TextSetting> {
  late final _ctrl = TextEditingController(text: widget.value);
  bool _dirty = false;

  @override
  void didUpdateWidget(_TextSetting old) {
    super.didUpdateWidget(old);
    if (!_dirty && old.value != widget.value) _ctrl.text = widget.value;
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    await widget.onSave(_ctrl.text);
    if (!mounted) return;
    setState(() => _dirty = false);
    FocusScope.of(context).unfocus();
    showSnack(context, '${widget.title} saved');
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Space.l),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: context.text.titleSmall),
        const SizedBox(height: Space.s),
        TextField(
          controller: _ctrl,
          minLines: widget.lines,
          maxLines: widget.lines == 1 ? 1 : 10,
          onChanged: (_) => setState(() => _dirty = true),
          onSubmitted: widget.lines == 1 ? (_) => _save() : null,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintMaxLines: 4,
            suffixIcon: _dirty ? IconButton(tooltip: 'Save', icon: const Icon(Icons.check_rounded), onPressed: _save) : null,
          ),
        ),
      ],
    ),
  );
}

/// Picks one chat, newest activity first.
class _ChatPicker extends ConsumerStatefulWidget {
  const _ChatPicker({required this.skip});
  final Set<int> skip;

  @override
  ConsumerState<_ChatPicker> createState() => _ChatPickerState();
}

class _ChatPickerState extends ConsumerState<_ChatPicker> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final q = _q.toLowerCase().trim();
    final chats = store.chats.values
        .where((c) => c.title.isNotEmpty && !widget.skip.contains(c.id) && (q.isEmpty || c.title.toLowerCase().contains(q)))
        .toList()
      ..sort((a, b) => (b.lastMessage?.date ?? 0).compareTo(a.lastMessage?.date ?? 0));
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.86,
      minChildSize: 0.4,
      maxChildSize: 1,
      builder: (_, scroll) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
            child: TextField(
              autofocus: true,
              onChanged: (v) => setState(() => _q = v),
              decoration: const InputDecoration(isDense: true, hintText: 'Search chats', prefixIcon: Icon(Icons.search_rounded)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scroll,
              itemCount: chats.length.clamp(0, 300),
              itemBuilder: (_, i) {
                final c = chats[i];
                return ListTile(
                  leading: TgAvatar(chatId: c.id, title: c.title, size: 36),
                  title: Text(c.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(store.kindOf(c).name, style: context.text.bodySmall),
                  onTap: () => Navigator.pop(context, (c.id, c.title)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
