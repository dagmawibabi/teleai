import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/td_compat.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/message_content.dart';
import 'rich_message_view.dart';

/// A bot's reply while it streams in: the text so far, a typing shimmer
/// when it hasn't started ("Thinking…"), and Stop when the bot allows it.
class PendingDraftBubble extends ConsumerStatefulWidget {
  const PendingDraftBubble({super.key, required this.update});
  final td.UpdatePendingMessage update;

  @override
  ConsumerState<PendingDraftBubble> createState() => _PendingDraftBubbleState();
}

class _PendingDraftBubbleState extends ConsumerState<PendingDraftBubble> {
  bool _stopping = false;

  Future<void> _stop() async {
    setState(() => _stopping = true);
    final u = widget.update;
    try {
      await ref
          .read(telegramClientProvider)
          .send<td.Ok>(td.StopPendingMessage(chatId: u.chatId, topicId: forumTopic(u.forumTopicId), draftId: u.draftId));
    } catch (e) {
      if (mounted) showSnack(context, '$e', icon: Icons.error_outline_rounded);
    }
    if (mounted) setState(() => _stopping = false);
  }

  @override
  Widget build(BuildContext context) {
    final u = widget.update;
    final g = gistOf(u.content);
    final empty = g.text.trim().isEmpty && u.content is! td.MessageRichMessage;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: Space.s, right: 48),
        padding: const EdgeInsets.fromLTRB(12, 9, 12, 8),
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(Radii.l),
          border: Border.all(color: AppColors.accentDim),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (u.content case td.MessageRichMessage(:final message))
              RichMessageView(message: message)
            else if (empty)
              const Text('Thinking…', style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.text3))
            else
              Text(g.text, style: const TextStyle(fontSize: 15, height: 1.4, color: AppColors.text)),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox.square(dimension: 10, child: CircularProgressIndicator(strokeWidth: 1.5)),
                const SizedBox(width: 6),
                const Text('writing', style: TextStyle(fontSize: 11, color: AppColors.text3)),
                if (u.canStop) ...[
                  const SizedBox(width: Space.m),
                  InkWell(
                    onTap: _stopping ? null : _stop,
                    borderRadius: BorderRadius.circular(999),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.stop_circle_outlined, size: 14, color: AppColors.accent),
                          const SizedBox(width: 3),
                          Text('Stop', style: TextStyle(fontSize: 12, color: AppColors.accent)),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
