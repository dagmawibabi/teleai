import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/theme.dart';
import '../telegram/presentation/content_canvas_screen.dart' show canvasColors;
import 'canvas_store.dart';

/// Asks which Content Canvas folder (or a new one) and saves a link, email,
/// file or app item there. Used from the cards in the chat.
Future<void> saveToCanvas(
  BuildContext context,
  WidgetRef ref, {
  required CanvasKind kind,
  required String title,
  String text = '',
  String url = '',
  String source = '',
  String path = '',
}) async {
  final s = await ref.read(canvasProvider.notifier).ready();
  if (!context.mounted) return;
  final picked = await showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    backgroundColor: AppColors.surface,
    builder: (c) => SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(c).height * 0.6),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
              child: Text('Save “$title” to', style: c.text.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            ListTile(
              leading: lead(const Icon(Icons.create_new_folder_outlined)),
              title: const Text('New folder'),
              onTap: () => Navigator.pop(c, ''),
            ),
            for (final f in [...s.folders]..sort((a, b) => s.pathOf(a).compareTo(s.pathOf(b))))
              ListTile(
                leading: lead(Icon(Icons.folder_rounded, color: canvasColors[f.color % canvasColors.length])),
                title: Text(s.pathOf(f)),
                onTap: () => Navigator.pop(c, f.id),
              ),
          ],
        ),
      ),
    ),
  );
  if (picked == null || !context.mounted) return;
  var folderId = picked;
  if (picked.isEmpty) {
    final ctrl = TextEditingController(text: source);
    final name = await showDialog<String>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text('New folder'),
        content: TextField(controller: ctrl, autofocus: true, decoration: const InputDecoration(hintText: 'Name')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(c, ctrl.text.trim()), child: const Text('Create')),
        ],
      ),
    );
    if (name == null || name.isEmpty) return;
    folderId = (await ref.read(canvasProvider.notifier).createFolder(name)).id;
  }
  await ref.read(canvasProvider.notifier).addSaved(folderId, kind: kind, title: title, text: text, url: url, source: source, path: path);
  if (context.mounted) showSnack(context, 'Saved to the canvas');
}
