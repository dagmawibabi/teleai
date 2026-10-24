import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/message_content.dart';
import '../data/telegram_store.dart';
import 'chat_list_screen.dart' show shortTime;
import 'chat_view_screen.dart';
import 'tg_avatar.dart';

/// A channel's direct messages: one conversation per person who wrote in,
/// newest first. TDLib sends the topics as updates once asked to load them.
class DirectMessagesTopicsList extends ConsumerStatefulWidget {
  const DirectMessagesTopicsList({super.key, required this.chatId, this.topPadding = 0});
  final int chatId;
  final double topPadding;

  @override
  ConsumerState<DirectMessagesTopicsList> createState() => _DirectMessagesTopicsListState();
}

class _DirectMessagesTopicsListState extends ConsumerState<DirectMessagesTopicsList> {
  bool _loading = false;
  bool _end = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (_loading || _end) return;
    setState(() => _loading = true);
    final store = ref.read(telegramStoreProvider);
    final before = store.directMessagesTopics[widget.chatId]?.length ?? 0;
    try {
      await ref
          .read(telegramClientProvider)
          .send<td.Ok>(td.LoadDirectMessagesChatTopics(chatId: widget.chatId, limit: 50), limited: true);
    } on Object catch (e) {
      // TDLib answers 404 once every topic has been loaded.
      if ('$e'.contains('404')) {
        _end = true;
      } else {
        _error = '$e';
      }
    }
    // The topics arrive as updates just after the call returns.
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if ((store.directMessagesTopics[widget.chatId]?.length ?? 0) == before) _end = true;
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final topics = [...?store.directMessagesTopics[widget.chatId]?.values]..sort((a, b) => b.order.compareTo(a.order));
    if (topics.isEmpty) {
      return Center(
        child: _loading
            ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
            : Padding(
                padding: const EdgeInsets.all(Space.xl),
                child: Text(
                  _error ?? 'No one has messaged the channel yet.',
                  textAlign: TextAlign.center,
                  style: context.text.bodySmall,
                ),
              ),
      );
    }
    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.pixels > n.metrics.maxScrollExtent - 400) _load();
        return false;
      },
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(Space.s, widget.topPadding, Space.s, Space.x4),
        itemCount: topics.length,
        itemBuilder: (context, i) => _TopicRow(chatId: widget.chatId, topic: topics[i]),
      ),
    );
  }
}

class _TopicRow extends ConsumerWidget {
  const _TopicRow({required this.chatId, required this.topic});
  final int chatId;
  final td.DirectMessagesChatTopic topic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(telegramStoreProvider);
    final name = store.senderName(topic.senderId);
    final last = topic.lastMessage;
    var preview = '';
    if (last != null) {
      final g = gistOf(last.content);
      final body = g.kind == 'rich' ? (g.detail ?? '') : (g.text.isNotEmpty ? g.text : (g.detail ?? g.kind));
      preview = '${last.isOutgoing ? 'You: ' : ''}$body'.replaceAll('\n', ' ');
    }
    final unread = topic.unreadCount > 0 || topic.isMarkedAsUnread;
    return InkWell(
      borderRadius: BorderRadius.circular(Radii.l),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => ChatViewScreen(chatId: chatId, threadId: topic.id, threadTitle: name)),
      ),
      onLongPress: () => _actions(context, ref),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Space.s, vertical: 10),
        child: Row(
          children: [
            TgAvatar(
              userId: topic.senderId is td.MessageSenderUser ? (topic.senderId as td.MessageSenderUser).userId : null,
              chatId: topic.senderId is td.MessageSenderChat ? (topic.senderId as td.MessageSenderChat).chatId : null,
              title: name,
              size: 44,
            ),
            const SizedBox(width: Space.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.titleSmall?.copyWith(fontSize: 15),
                        ),
                      ),
                      if (!topic.canSendUnpaidMessages)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(Icons.star_rounded, size: 14, color: AppColors.warning),
                        ),
                      if (last != null) ...[
                        const SizedBox(width: Space.s),
                        Text(shortTime(last.date), style: const TextStyle(fontSize: 12, color: AppColors.text3)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          preview,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13.5, color: AppColors.text2),
                        ),
                      ),
                      if (unread)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(999)),
                          child: Text(
                            topic.unreadCount > 0 ? NumberFormat.compact().format(topic.unreadCount) : ' ',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.bg),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _actions(BuildContext context, WidgetRef ref) async {
    final client = ref.read(telegramClientProvider);
    final unread = topic.unreadCount > 0 || topic.isMarkedAsUnread;
    final choice = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(unread ? Icons.mark_chat_read_outlined : Icons.mark_chat_unread_outlined),
              title: Text(unread ? 'Mark as read' : 'Mark as unread'),
              onTap: () => Navigator.pop(context, 'unread'),
            ),
            ListTile(
              leading: const Icon(Icons.star_outline_rounded),
              title: Text(topic.canSendUnpaidMessages ? 'Charge Stars again' : 'Let them message for free'),
              onTap: () => Navigator.pop(context, 'paid'),
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline_rounded, color: AppColors.danger),
              title: const Text('Delete conversation', style: TextStyle(color: AppColors.danger)),
              onTap: () => Navigator.pop(context, 'delete'),
            ),
          ],
        ),
      ),
    );
    if (choice == null) return;
    try {
      switch (choice) {
        case 'unread':
          await client.send<td.Ok>(
            td.SetDirectMessagesChatTopicIsMarkedAsUnread(chatId: chatId, topicId: topic.id, isMarkedAsUnread: !unread),
          );
        case 'paid':
          await client.send<td.Ok>(
            td.ToggleDirectMessagesChatTopicCanSendUnpaidMessages(
              chatId: chatId,
              topicId: topic.id,
              canSendUnpaidMessages: !topic.canSendUnpaidMessages,
              refundPayments: false,
            ),
          );
        case 'delete':
          if (!context.mounted) return;
          final ok = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Delete this conversation?'),
              content: const Text('Every message in it is deleted for the channel.'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
              ],
            ),
          );
          if (ok == true) {
            await client.send<td.Ok>(td.DeleteDirectMessagesChatTopicHistory(chatId: chatId, topicId: topic.id));
          }
      }
    } catch (e) {
      if (context.mounted) showSnack(context, '$e', icon: Icons.error_outline_rounded);
    }
  }
}
