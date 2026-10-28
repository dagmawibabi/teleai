import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme.dart';
import '../data/telegram_store.dart';
import '../data/telegram_tools.dart';
import 'tg_avatar.dart';

/// Chats the account can write in, Saved Messages first, then by latest
/// activity; [q] filters by title.
List<ChatInfo> postableChats(TelegramStore store, String q) {
  final me = store.me?.id;
  return store.chats.values
      .where((c) => c.title.isNotEmpty && c.isListed && store.canPost(c))
      .where((c) => q.isEmpty || c.title.toLowerCase().contains(q))
      .toList()
    ..sort((a, b) {
      if (a.id == me) return -1;
      if (b.id == me) return 1;
      return (b.lastMessage?.date ?? 0).compareTo(a.lastMessage?.date ?? 0);
    });
}

/// One chat to write in, picked from a searchable list; null when closed.
Future<int?> pickChat(BuildContext context, {required String title}) => showModalBottomSheet<int>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  useSafeArea: true,
  builder: (_) => DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.8,
    maxChildSize: 0.95,
    builder: (_, scroll) => _ChatPicker(title: title, scroll: scroll),
  ),
);

class _ChatPicker extends ConsumerStatefulWidget {
  const _ChatPicker({required this.title, required this.scroll});
  final String title;
  final ScrollController scroll;

  @override
  ConsumerState<_ChatPicker> createState() => _ChatPickerState();
}

class _ChatPickerState extends ConsumerState<_ChatPicker> {
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final me = store.me?.id;
    final chats = postableChats(store, _q.toLowerCase().trim());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
          child: Align(alignment: Alignment.centerLeft, child: Text(widget.title, style: context.text.titleMedium)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.l),
          child: TextField(
            autofocus: false,
            onChanged: (v) => setState(() => _q = v),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search chats',
              prefixIcon: Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: widget.scroll,
            itemCount: chats.length,
            itemBuilder: (_, i) {
              final c = chats[i];
              return ListTile(
                leading: c.id == me ? const SavedAvatar(size: 40) : TgAvatar(chatId: c.id, title: c.title, size: 40),
                title: Text(c.id == me ? 'Saved Messages' : c.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(store.kindOf(c).name, style: context.text.bodySmall),
                onTap: () => Navigator.pop(context, c.id),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Forwards [messageIds] from [fromChatId] to any number of chats, with
/// Telegram's options to hide the sender or drop captions.
Future<void> showForwardSheet(BuildContext context, int fromChatId, List<int> messageIds) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  showDragHandle: true,
  useSafeArea: true,
  builder: (_) => DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.8,
    maxChildSize: 0.95,
    builder: (_, scroll) => _ForwardPicker(fromChatId: fromChatId, messageIds: messageIds, scroll: scroll),
  ),
);

class _ForwardPicker extends ConsumerStatefulWidget {
  const _ForwardPicker({required this.fromChatId, required this.messageIds, required this.scroll});
  final int fromChatId;
  final List<int> messageIds;
  final ScrollController scroll;

  @override
  ConsumerState<_ForwardPicker> createState() => _ForwardPickerState();
}

class _ForwardPickerState extends ConsumerState<_ForwardPicker> {
  final Set<int> _to = {};
  String _q = '';
  bool _hideSender = false;
  bool _noCaptions = false;
  bool _sending = false;

  Future<void> _send() async {
    setState(() => _sending = true);
    final runner = ref.read(toolRunnerProvider);
    final store = ref.read(telegramStoreProvider);
    final failed = <String>[];
    for (final id in _to) {
      try {
        await runner.forwardTo(
          id,
          widget.fromChatId,
          widget.messageIds,
          hideSender: _hideSender,
          removeCaption: _noCaptions,
        );
      } catch (e) {
        failed.add(store.chat(id)?.title ?? '$id');
      }
    }
    if (!mounted) return;
    Navigator.pop(context);
    showSnack(
      context,
      failed.isEmpty
          ? 'Forwarded to ${_to.length} chat${_to.length == 1 ? '' : 's'}'
          : 'Couldn\'t forward to ${failed.join(', ')}',
      icon: failed.isEmpty ? Icons.forward_rounded : Icons.error_outline_rounded,
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final q = _q.toLowerCase().trim();
    final me = store.me?.id;
    final chats = postableChats(store, q);
    final n = widget.messageIds.length;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.s),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Forward $n message${n == 1 ? '' : 's'}${_to.isEmpty ? '' : ' to ${_to.length}'}',
                  style: context.text.titleMedium,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Space.l),
          child: TextField(
            onChanged: (v) => setState(() => _q = v),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search chats',
              prefixIcon: Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide.none),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: widget.scroll,
            itemCount: chats.length,
            itemBuilder: (_, i) {
              final c = chats[i];
              final on = _to.contains(c.id);
              return ListTile(
                leading: c.id == me
                    ? const SavedAvatar(size: 40)
                    : TgAvatar(chatId: c.id, title: c.title, size: 40),
                title: Text(c.id == me ? 'Saved Messages' : c.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(store.kindOf(c).name, style: context.text.bodySmall),
                trailing: Icon(
                  on ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
                  color: on ? AppColors.accent : AppColors.text3,
                ),
                onTap: () => setState(() => on ? _to.remove(c.id) : _to.add(c.id)),
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.m),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: Space.s,
                  children: [
                    FilterChip(
                      label: const Text('Hide sender name'),
                      selected: _hideSender,
                      onSelected: (v) => setState(() => _hideSender = v),
                    ),
                    FilterChip(
                      label: const Text('Remove captions'),
                      selected: _noCaptions,
                      onSelected: (v) => setState(() => _noCaptions = v),
                    ),
                  ],
                ),
                const SizedBox(height: Space.s),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(minimumSize: const Size(0, 48)),
                    icon: _sending
                        ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.forward_rounded),
                    label: Text(_to.isEmpty ? 'Pick chats' : 'Forward to ${_to.length}'),
                    onPressed: _to.isEmpty || _sending ? null : _send,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
