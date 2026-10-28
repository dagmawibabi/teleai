import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:omni_ai/omni_ai.dart' show MemoryItem;

import '../../../app/theme.dart';
import '../../../core/widgets/app_sheet.dart';
import '../memory.dart';

/// Everything the assistant remembers, editable.
class MemoryScreen extends ConsumerWidget {
  const MemoryScreen({super.key});

  Future<void> _forget(BuildContext context, WidgetRef ref, MemoryItem m) async {
    if (!await confirmDelete(
      context,
      title: 'Forget this?',
      message: '“${m.text.length > 120 ? '${m.text.substring(0, 120)}…' : m.text}”\n\nThe assistant won\'t know it any more.',
      action: 'Forget',
    )) {
      return;
    }
    await ref.read(memoryProvider.notifier).remove(m.id);
    if (context.mounted) showSnack(context, 'Forgotten');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Memory')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.text,
        foregroundColor: AppColors.bg,
        onPressed: () => showMemoryEditor(context),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Remember'),
      ),
      body: memories.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(Space.x4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bookmarks_outlined, size: 40, color: AppColors.text3),
                    const SizedBox(height: Space.m),
                    Text(
                      'Nothing remembered yet.\nTell the assistant "remember that…" or add something here. '
                      'Memories stay on this phone and are part of every conversation.',
                      textAlign: TextAlign.center,
                      style: context.text.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, 96),
              itemCount: memories.length,
              separatorBuilder: (_, _) => const SizedBox(height: Space.s),
              itemBuilder: (_, i) {
                final m = memories[memories.length - 1 - i];
                return Material(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(Radii.l),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(Radii.l),
                    onTap: () => showMemoryEditor(context, memory: m),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(Space.l, Space.m, Space.xs, Space.m),
                      child: Row(
                        children: [
                          Icon(Icons.bookmark_outline_rounded, size: 20, color: AppColors.accent),
                          const SizedBox(width: Space.m),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(m.text, style: context.text.bodyMedium),
                                const SizedBox(height: 2),
                                Text(
                                  [
                                    DateFormat('d MMM y').format(m.updatedAt),
                                    if (m.tags.isNotEmpty) m.tags.map((t) => '#$t').join(' '),
                                  ].join(' · '),
                                  style: context.text.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            tooltip: 'Forget',
                            icon: Icon(Icons.delete_outline_rounded, size: 20, color: AppColors.text3),
                            onPressed: () => _forget(context, ref, m),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

/// Adds a memory, or edits [memory]: its text and tags, in a sheet.
Future<void> showMemoryEditor(BuildContext context, {MemoryItem? memory}) =>
    showFormSheet<void>(context, builder: (_) => _MemoryEditor(memory: memory));

class _MemoryEditor extends ConsumerStatefulWidget {
  const _MemoryEditor({this.memory});
  final MemoryItem? memory;

  @override
  ConsumerState<_MemoryEditor> createState() => _MemoryEditorState();
}

class _MemoryEditorState extends ConsumerState<_MemoryEditor> {
  late final _text = TextEditingController(text: widget.memory?.text ?? '');
  final _tag = TextEditingController();
  late final List<String> _tags = [...?widget.memory?.tags];

  static const _examples = [
    'Reply to my mom in Amharic',
    'I work 9 to 5 on weekdays',
    'Call me Dag',
    'Keep summaries under five bullets',
  ];

  @override
  void dispose() {
    _text.dispose();
    _tag.dispose();
    super.dispose();
  }

  void _addTag() {
    final t = _tag.text.trim().replaceAll('#', '').replaceAll(' ', '_');
    if (t.isNotEmpty && !_tags.contains(t)) setState(() => _tags.add(t));
    _tag.clear();
  }

  Future<void> _save() async {
    final text = _text.text.trim();
    if (text.isEmpty) return;
    final store = ref.read(memoryProvider.notifier);
    final m = widget.memory;
    m == null ? await store.add(text, tags: _tags) : await store.update(m.id, content: text, tags: _tags);
    if (mounted) Navigator.pop(context);
  }

  Future<void> _forget() async {
    final m = widget.memory!;
    if (!await confirmDelete(context, title: 'Forget this?', message: 'The assistant won\'t know it any more.', action: 'Forget')) {
      return;
    }
    await ref.read(memoryProvider.notifier).remove(m.id);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.memory != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(Space.s),
              decoration: BoxDecoration(color: AppColors.accentDim, borderRadius: BorderRadius.circular(Radii.m)),
              child: Icon(editing ? Icons.edit_note_rounded : Icons.bookmark_add_outlined, color: AppColors.accent),
            ),
            const SizedBox(width: Space.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(editing ? 'Edit memory' : 'Remember', style: context.text.titleMedium),
                  Text(
                    editing
                        ? 'Saved ${DateFormat('d MMM y, HH:mm').format(widget.memory!.updatedAt)}'
                        : 'Part of every conversation, on this phone only',
                    style: context.text.bodySmall,
                  ),
                ],
              ),
            ),
            if (editing)
              IconButton(
                tooltip: 'Forget',
                icon: Icon(Icons.delete_outline_rounded, color: AppColors.danger),
                onPressed: _forget,
              ),
          ],
        ),
        const SizedBox(height: Space.l),
        TextField(
          controller: _text,
          autofocus: !editing,
          minLines: 3,
          maxLines: 8,
          textCapitalization: TextCapitalization.sentences,
          onChanged: (_) => setState(() {}),
          decoration: const InputDecoration(hintText: 'What should the assistant remember?'),
        ),
        if (!editing && _text.text.isEmpty) ...[
          const SizedBox(height: Space.s),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final e in _examples)
                ActionChip(
                  label: Text(e),
                  onPressed: () => setState(() => _text.text = e),
                ),
            ],
          ),
        ],
        const SizedBox(height: Space.l),
        Text('TAGS', style: context.text.labelSmall),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            for (final t in _tags)
              InputChip(
                label: Text('#$t'),
                onDeleted: () => setState(() => _tags.remove(t)),
              ),
            SizedBox(
              width: 140,
              child: TextField(
                controller: _tag,
                decoration: const InputDecoration(hintText: 'Add a tag', isDense: true),
                onSubmitted: (_) => _addTag(),
              ),
            ),
          ],
        ),
        const SizedBox(height: Space.xl),
        FilledButton(
          onPressed: _text.text.trim().isEmpty ? null : _save,
          child: Text(editing ? 'Save' : 'Remember'),
        ),
      ],
    );
  }
}
