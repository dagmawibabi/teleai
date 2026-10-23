import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../memory.dart';

/// Everything the assistant remembers, editable.
class MemoryScreen extends ConsumerWidget {
  const MemoryScreen({super.key});

  Future<void> _edit(BuildContext context, WidgetRef ref, [Memory? m]) async {
    final ctrl = TextEditingController(text: m?.content ?? '');
    final text = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(m == null ? 'Remember' : 'Edit memory'),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          minLines: 2,
          maxLines: 6,
          decoration: const InputDecoration(hintText: 'e.g. Reply to my mom in Amharic'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, ctrl.text.trim()), child: const Text('Save')),
        ],
      ),
    );
    if (text == null || text.isEmpty) return;
    final store = ref.read(memoryProvider.notifier);
    m == null ? await store.add(text) : await store.update(m.id, content: text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memories = ref.watch(memoryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Memory')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.text,
        foregroundColor: AppColors.bg,
        onPressed: () => _edit(context, ref),
        child: const Icon(Icons.add_rounded),
      ),
      body: memories.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(Space.x4),
                child: Text(
                  'Nothing remembered yet.\nTell the assistant "remember that…" or add something here. '
                  'Memories stay on this phone and are part of every conversation.',
                  textAlign: TextAlign.center,
                  style: context.text.bodySmall,
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
                    onTap: () => _edit(context, ref, m),
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
                                Text(m.content, style: context.text.bodyMedium),
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
                            icon: const Icon(Icons.delete_outline_rounded, size: 20, color: AppColors.text3),
                            onPressed: () => ref.read(memoryProvider.notifier).remove(m.id),
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
