import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../../chat/data/chat_controller.dart';
import '../../settings/data/settings.dart';
import '../../telegram/data/telegram_store.dart';
import '../../telegram/presentation/tg_avatar.dart';
import '../watch_engine.dart';
import '../watches.dart';

String watchTrigger(Watch w, TelegramStore store) => switch (w.scope) {
  WatchScope.chats => w.chatIds.map((id) => store.chat(id)?.title ?? 'chat $id').join(', '),
  WatchScope.folder => 'Folder ${store.folders.where((f) => f.id == w.folderId).firstOrNull?.title ?? w.folderId}',
  WatchScope.schedule => w.dailyAt != null ? 'Every day at ${w.dailyAt}' : 'Every ${w.everyMinutes} minutes',
  _ => w.scope.label,
};

IconData watchModeIcon(WatchMode m) => switch (m) {
  WatchMode.notify => Icons.notifications_none_rounded,
  WatchMode.summarize => Icons.short_text_rounded,
  WatchMode.act => Icons.bolt_rounded,
};

/// Watches and routines: what they listen to and what they do.
class WatchesScreen extends ConsumerWidget {
  const WatchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watches = ref.watch(watchStoreProvider);
    final store = ref.watch(telegramStoreProvider);
    final s = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Watches & routines')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.text,
        foregroundColor: AppColors.bg,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const WatchEditor())),
        icon: const Icon(Icons.add_rounded),
        label: const Text('New watch'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, 96),
        children: [
          ValueListenableBuilder<WatchStatus>(
            valueListenable: ref.read(watchEngineProvider).status,
            builder: (context, st, _) => Container(
              margin: const EdgeInsets.only(bottom: Space.m),
              padding: const EdgeInsets.all(Space.m),
              decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(Radii.l)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        st.listening && s.proactive ? Icons.sensors_rounded : Icons.sensors_off_rounded,
                        size: 18,
                        color: st.listening && s.proactive ? AppColors.success : AppColors.text3,
                      ),
                      const SizedBox(width: Space.s),
                      Text(
                        st.listening && s.proactive ? 'Listening' : 'Not listening',
                        style: context.text.titleSmall,
                      ),
                      const Spacer(),
                      Text(
                        '${st.heard} heard · ${st.matched} matched · ${st.opened} chats open',
                        style: context.text.labelSmall,
                      ),
                    ],
                  ),
                  if (st.last != null) ...[
                    const SizedBox(height: Space.xs),
                    Text('Last match: ${st.last}', style: context.text.bodySmall),
                  ],
                  if (st.error != null) ...[
                    const SizedBox(height: Space.xs),
                    Text(st.error!, style: context.text.bodySmall?.copyWith(color: AppColors.warning)),
                  ],
                ],
              ),
            ),
          ),
          if (!s.proactive)
            Container(
              margin: const EdgeInsets.only(bottom: Space.m),
              padding: const EdgeInsets.all(Space.m),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(Radii.m),
              ),
              child: Row(
                children: [
                  const Icon(Icons.pause_circle_outline_rounded, color: AppColors.warning),
                  const SizedBox(width: Space.m),
                  const Expanded(child: Text('Proactivity is off, so every watch is paused.')),
                  TextButton(
                    onPressed: () => ref.read(settingsProvider.notifier).setProactive(true),
                    child: const Text('Turn on'),
                  ),
                ],
              ),
            ),
          if (watches.isEmpty)
            Padding(
              padding: const EdgeInsets.all(Space.x4),
              child: Text(
                'No watches yet. Make one here, or just ask in chat: "tell me when Liya posts", '
                '"answer my DMs while I\'m busy", "every morning at 8 summarise my channels".',
                textAlign: TextAlign.center,
                style: context.text.bodySmall,
              ),
            ),
          for (final w in watches)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.s),
              child: Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(Radii.l),
                child: InkWell(
                  borderRadius: BorderRadius.circular(Radii.l),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => WatchEditor(watch: w))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.s, Space.m),
                    child: Row(
                      children: [
                        Icon(watchModeIcon(w.mode), color: w.enabled ? AppColors.accent : AppColors.text3),
                        const SizedBox(width: Space.m),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(w.name, style: context.text.titleSmall),
                              Text(
                                '${w.mode.label} · ${watchTrigger(w, store)}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: context.text.bodySmall,
                              ),
                              if (w.lastRunAt != null)
                                Text(
                                  'Last ran ${DateFormat('d MMM HH:mm').format(w.lastRunAt!)} · ${w.runs} times',
                                  style: context.text.labelSmall,
                                ),
                            ],
                          ),
                        ),
                        Switch(
                          value: w.enabled,
                          onChanged: (v) => ref.read(watchStoreProvider.notifier).update(w.id, (x) => x.copyWith(enabled: v)),
                        ),
                      ],
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

class WatchEditor extends ConsumerStatefulWidget {
  const WatchEditor({super.key, this.watch});
  final Watch? watch;

  @override
  ConsumerState<WatchEditor> createState() => _WatchEditorState();
}

class _WatchEditorState extends ConsumerState<WatchEditor> {
  late final _name = TextEditingController(text: widget.watch?.name ?? '');
  late final _instructions = TextEditingController(text: widget.watch?.instructions ?? '');
  late WatchScope _scope = widget.watch?.scope ?? WatchScope.chats;
  late WatchMode _mode = widget.watch?.mode ?? WatchMode.notify;
  late List<int> _chatIds = [...?widget.watch?.chatIds];
  late int? _folderId = widget.watch?.folderId;
  late String? _dailyAt = widget.watch?.dailyAt ?? '08:00';
  late int? _every = widget.watch?.everyMinutes;
  late bool _includeMuted = widget.watch?.includeMuted ?? true;

  @override
  void dispose() {
    _name.dispose();
    _instructions.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final store = ref.read(watchStoreProvider.notifier);
    final name = _name.text.trim().isEmpty ? 'Watch' : _name.text.trim();
    if (_scope == WatchScope.chats && _chatIds.isEmpty) {
      showSnack(context, 'Pick at least one chat', icon: Icons.info_outline_rounded);
      return;
    }
    final schedule = _scope == WatchScope.schedule;
    final mode = schedule && _mode == WatchMode.notify ? WatchMode.summarize : _mode;
    if (widget.watch == null) {
      await store.add(
        (id) => Watch(
          id: id,
          name: name,
          scope: _scope,
          mode: mode,
          chatIds: _chatIds,
          folderId: _folderId,
          instructions: _instructions.text.trim(),
          includeMuted: _includeMuted,
          dailyAt: schedule && _every == null ? _dailyAt : null,
          everyMinutes: schedule ? _every : null,
          createdAt: DateTime.now(),
        ),
      );
    } else {
      await store.update(
        widget.watch!.id,
        (w) => Watch(
          id: w.id,
          name: name,
          scope: _scope,
          mode: mode,
          enabled: w.enabled,
          chatIds: _chatIds,
          folderId: _folderId,
          instructions: _instructions.text.trim(),
          includeMuted: _includeMuted,
          dailyAt: schedule && _every == null ? _dailyAt : null,
          everyMinutes: schedule ? _every : null,
          conversationId: w.conversationId,
          lastRunAt: w.lastRunAt,
          runs: w.runs,
          createdAt: w.createdAt,
        ),
      );
    }
    if (mounted) Navigator.pop(context);
  }

  Future<void> _pickChats() async {
    final picked = await Navigator.of(
      context,
    ).push<List<int>>(MaterialPageRoute(builder: (_) => _ChatPicker(selected: _chatIds)));
    if (picked != null) setState(() => _chatIds = picked);
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final w = widget.watch;
    return Scaffold(
      appBar: AppBar(
        title: Text(w == null ? 'New watch' : 'Edit watch'),
        actions: [
          if (w?.conversationId != null)
            IconButton(
              tooltip: 'Open its conversation',
              icon: const Icon(Icons.forum_outlined),
              onPressed: () {
                ref.read(chatControllerProvider.notifier).open(w!.conversationId!);
                Navigator.of(context).popUntil((r) => r.isFirst);
              },
            ),
          if (w != null)
            IconButton(
              tooltip: 'Run now',
              icon: const Icon(Icons.play_arrow_rounded),
              onPressed: () async {
                final problem = await ref.read(watchEngineProvider).runNow(w);
                if (!context.mounted) return;
                showSnack(
                  context,
                  problem ?? 'Ran "${w.name}". Its update is in the chat, with a notification if you were away.',
                  icon: problem == null ? Icons.check_circle_outline_rounded : Icons.info_outline_rounded,
                );
              },
            ),
          if (w != null)
            IconButton(
              tooltip: 'Delete',
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () async {
                await ref.read(watchStoreProvider.notifier).remove(w.id);
                if (context.mounted) Navigator.pop(context);
              },
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
        children: [
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'Name')),
          const SizedBox(height: Space.xl),
          Text('WHEN', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final s in WatchScope.values)
                ChoiceChip(label: Text(s.label), selected: _scope == s, onSelected: (_) => setState(() => _scope = s)),
            ],
          ),
          const SizedBox(height: Space.m),
          if (_scope == WatchScope.chats)
            Material(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(Radii.l),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Radii.l)),
                leading: const Icon(Icons.forum_outlined),
                title: Text(_chatIds.isEmpty ? 'Choose chats' : '${_chatIds.length} chat${_chatIds.length == 1 ? '' : 's'}'),
                subtitle: _chatIds.isEmpty
                    ? null
                    : Text(
                        _chatIds.map((id) => store.chat(id)?.title ?? '$id').join(', '),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: _pickChats,
              ),
            ),
          if (_scope == WatchScope.folder)
            Wrap(
              spacing: 6,
              children: [
                for (final f in store.folders)
                  ChoiceChip(label: Text(f.title), selected: _folderId == f.id, onSelected: (_) => setState(() => _folderId = f.id)),
                if (store.folders.isEmpty) Text('You have no folders.', style: context.text.bodySmall),
              ],
            ),
          if (_scope == WatchScope.schedule) ...[
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: true, label: Text('Daily at')),
                ButtonSegment(value: false, label: Text('Every…')),
              ],
              selected: {_every == null},
              onSelectionChanged: (v) => setState(() => _every = v.first ? null : (_every ?? 60)),
            ),
            const SizedBox(height: Space.m),
            if (_every == null)
              OutlinedButton.icon(
                icon: const Icon(Icons.schedule_rounded),
                label: Text(_dailyAt ?? '08:00'),
                onPressed: () async {
                  final parts = (_dailyAt ?? '08:00').split(':');
                  final t = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1])),
                  );
                  if (t != null) {
                    setState(() => _dailyAt = '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}');
                  }
                },
              )
            else
              Wrap(
                spacing: 6,
                children: [
                  for (final m in const [15, 30, 60, 180, 360])
                    ChoiceChip(
                      label: Text(m < 60 ? '$m min' : '${m ~/ 60} h'),
                      selected: _every == m,
                      onSelected: (_) => setState(() => _every = m),
                    ),
                ],
              ),
          ],
          if (_scope != WatchScope.schedule)
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Include muted chats'),
              value: _includeMuted,
              onChanged: (v) => setState(() => _includeMuted = v),
            ),
          const SizedBox(height: Space.xl),
          Text('THEN', style: context.text.labelSmall),
          const SizedBox(height: Space.s),
          RadioGroup<WatchMode>(
            groupValue: _mode,
            onChanged: (v) => setState(() => _mode = v ?? _mode),
            child: Column(
              children: [
                for (final m in WatchMode.values)
                  if (!(m == WatchMode.notify && _scope == WatchScope.schedule))
                    RadioListTile<WatchMode>(
                      contentPadding: EdgeInsets.zero,
                      value: m,
                      title: Row(children: [Icon(watchModeIcon(m), size: 18), const SizedBox(width: Space.s), Text(m.label)]),
                      subtitle: Text(m.explanation, style: context.text.bodySmall),
                    ),
              ],
            ),
          ),
          if (_mode != WatchMode.notify || _scope == WatchScope.schedule) ...[
            const SizedBox(height: Space.m),
            TextField(
              controller: _instructions,
              minLines: 3,
              maxLines: 8,
              decoration: InputDecoration(
                labelText: 'Instructions',
                alignLabelWithHint: true,
                hintText: _mode == WatchMode.act
                    ? 'e.g. Reply to each new DM politely in their language. If it\'s urgent, notify me.'
                    : 'e.g. Summarise what matters and skip memes.',
              ),
            ),
            if (_mode == WatchMode.act) ...[
              const SizedBox(height: Space.s),
              Text(
                switch (ref.watch(settingsProvider).approvalMode) {
                  ApprovalMode.ask => 'Its actions will wait for your approval. To let it act on its own, change Approvals in Settings.',
                  _ => 'It will act without asking, as Approvals in Settings allow.',
                },
                style: context.text.bodySmall?.copyWith(color: AppColors.warning),
              ),
            ],
          ],
          const SizedBox(height: Space.xxl),
          FilledButton(onPressed: _save, child: const Text('Save')),
        ],
      ),
    );
  }
}

class _ChatPicker extends ConsumerStatefulWidget {
  const _ChatPicker({required this.selected});
  final List<int> selected;

  @override
  ConsumerState<_ChatPicker> createState() => _ChatPickerState();
}

class _ChatPickerState extends ConsumerState<_ChatPicker> {
  late final Set<int> _picked = {...widget.selected};
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final chats = store.chats.values
        .where((c) => c.isListed && c.title.isNotEmpty && (_q.isEmpty || c.title.toLowerCase().contains(_q)))
        .toList()
      ..sort((a, b) {
        final pa = _picked.contains(a.id), pb = _picked.contains(b.id);
        if (pa != pb) return pa ? -1 : 1;
        return (b.lastMessage?.date ?? 0).compareTo(a.lastMessage?.date ?? 0);
      });
    return Scaffold(
      appBar: AppBar(
        title: Text('${_picked.length} selected'),
        actions: [TextButton(onPressed: () => Navigator.pop(context, _picked.toList()), child: const Text('Done'))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
            child: TextField(
              onChanged: (v) => setState(() => _q = v.toLowerCase().trim()),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Search chats',
                prefixIcon: Icon(Icons.search_rounded, size: 20),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (_, i) {
                final c = chats[i];
                return CheckboxListTile(
                  value: _picked.contains(c.id),
                  onChanged: (v) => setState(() => v == true ? _picked.add(c.id) : _picked.remove(c.id)),
                  secondary: TgAvatar(chatId: c.id, title: c.title, size: 38),
                  title: Text(c.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(store.kindOf(c).name, style: context.text.bodySmall),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
