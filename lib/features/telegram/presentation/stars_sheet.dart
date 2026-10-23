import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/telegram_store.dart';
import '../data/telegram_tools.dart';
import 'expression_panel.dart' show StickerImage;
import 'tg_avatar.dart';

const starGold = Color(0xFFFFB300);

/// A post's Stars: how many it got, its top supporters, and giving some.
Future<void> showStarSheet(BuildContext context, td.Message message) => showModalBottomSheet<void>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  backgroundColor: AppColors.surface,
  builder: (_) => _StarSheet(message: message),
);

class _StarSheet extends ConsumerStatefulWidget {
  const _StarSheet({required this.message});
  final td.Message message;

  @override
  ConsumerState<_StarSheet> createState() => _StarSheetState();
}

class _StarSheetState extends ConsumerState<_StarSheet> {
  int? _balance;
  bool _sending = false;
  int _amount = 1;

  @override
  void initState() {
    super.initState();
    ref.read(toolRunnerProvider).starBalance().then((b) {
      if (mounted) setState(() => _balance = b);
    }).catchError((Object _) {});
  }

  Future<void> _send() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Send $_amount Star${_amount == 1 ? '' : 's'}?'),
        content: const Text('They go to the owner of this channel or chat, and can\'t be taken back.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Send')),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _sending = true);
    try {
      await ref.read(toolRunnerProvider).sendStars(widget.message.chatId, widget.message.id, _amount);
      if (!mounted) return;
      Navigator.pop(context);
      showSnack(context, 'Sent $_amount ⭐', icon: Icons.star_rounded);
    } catch (e) {
      if (mounted) {
        setState(() => _sending = false);
        showSnack(context, 'Couldn\'t send Stars: $e', icon: Icons.error_outline_rounded);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final reactions = widget.message.interactionInfo?.reactions;
    final total = reactions?.reactions.where((r) => r.type is td.ReactionTypePaid).fold<int>(0, (n, r) => n + r.totalCount) ?? 0;
    final reactors = reactions?.paidReactors ?? const <td.PaidReactor>[];
    final enough = _balance == null || _balance! >= _amount;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l + MediaQuery.viewInsetsOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.star_rounded, color: starGold, size: 28),
                const SizedBox(width: Space.s),
                Text('${NumberFormat.decimalPattern().format(total)} Stars', style: context.text.titleLarge),
                const Spacer(),
                if (_balance != null)
                  Text('You have ${NumberFormat.decimalPattern().format(_balance)} ⭐', style: context.text.bodySmall),
              ],
            ),
            if (reactors.isNotEmpty) ...[
              const SizedBox(height: Space.m),
              Text('TOP SUPPORTERS', style: context.text.labelSmall),
              const SizedBox(height: Space.s),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 220),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final p in reactors)
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: p.isAnonymous || p.senderId == null
                            ? const CircleAvatar(radius: 16, backgroundColor: AppColors.surface3, child: Icon(Icons.person_off_outlined, size: 16))
                            : TgAvatar(
                                userId: p.senderId is td.MessageSenderUser ? (p.senderId as td.MessageSenderUser).userId : null,
                                chatId: p.senderId is td.MessageSenderChat ? (p.senderId as td.MessageSenderChat).chatId : null,
                                title: store.senderName(p.senderId!),
                                size: 32,
                              ),
                        title: Text(p.isMe ? 'You' : (p.isAnonymous || p.senderId == null ? 'Anonymous' : store.senderName(p.senderId!))),
                        trailing: Text('${p.starCount} ⭐', style: const TextStyle(color: starGold, fontWeight: FontWeight.w600)),
                      ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: Space.l),
            Text('GIVE STARS', style: context.text.labelSmall),
            const SizedBox(height: Space.s),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final n in const [1, 5, 10, 25, 50, 100, 500])
                  ChoiceChip(
                    label: Text('$n ⭐'),
                    selected: _amount == n,
                    onSelected: (_) => setState(() => _amount = n),
                  ),
              ],
            ),
            const SizedBox(height: Space.m),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: starGold, foregroundColor: Colors.black),
              onPressed: _sending || !enough ? null : _send,
              icon: _sending
                  ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                  : const Icon(Icons.star_rounded),
              label: Text(enough ? 'Send $_amount Star${_amount == 1 ? '' : 's'}' : 'Not enough Stars (buy them in Telegram)'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Who reacted to a message, and with what.
Future<void> showReactorsSheet(BuildContext context, td.Message message) => showModalBottomSheet<void>(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  backgroundColor: AppColors.surface,
  builder: (_) => _ReactorsSheet(message: message),
);

class _ReactorsSheet extends ConsumerStatefulWidget {
  const _ReactorsSheet({required this.message});
  final td.Message message;

  @override
  ConsumerState<_ReactorsSheet> createState() => _ReactorsSheetState();
}

class _ReactorsSheetState extends ConsumerState<_ReactorsSheet> {
  List<td.AddedReaction>? _list;
  String? _error;

  @override
  void initState() {
    super.initState();
    ref
        .read(telegramClientProvider)
        .send<td.AddedReactions>(
          td.GetMessageAddedReactions(chatId: widget.message.chatId, messageId: widget.message.id, offset: '', limit: 100),
          limited: true,
        )
        .then((r) {
          if (mounted) setState(() => _list = r.reactions);
        })
        .catchError((Object e) {
          // Channels don't say who reacted; only the counts are public.
          if (mounted) setState(() => _error = 'Telegram only shows the counts here, not who reacted.');
        });
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    final reactions = widget.message.interactionInfo?.reactions?.reactions ?? const <td.MessageReaction>[];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(Space.l, 0, Space.l, Space.l),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Reactions', style: context.text.titleLarge),
            const SizedBox(height: Space.m),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final r in reactions)
                  Chip(
                    avatar: ReactionIcon(type: r.type, size: 18),
                    label: Text(NumberFormat.decimalPattern().format(r.totalCount)),
                  ),
              ],
            ),
            const SizedBox(height: Space.m),
            if (_error != null)
              Text(_error!, style: context.text.bodySmall)
            else if (_list == null)
              const Padding(padding: EdgeInsets.all(Space.l), child: Center(child: CircularProgressIndicator(strokeWidth: 2)))
            else
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.5),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (final a in _list!)
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: TgAvatar(
                          userId: a.senderId is td.MessageSenderUser ? (a.senderId as td.MessageSenderUser).userId : null,
                          chatId: a.senderId is td.MessageSenderChat ? (a.senderId as td.MessageSenderChat).chatId : null,
                          title: store.senderName(a.senderId),
                          size: 32,
                        ),
                        title: Text(a.isOutgoing ? 'You' : store.senderName(a.senderId)),
                        trailing: ReactionIcon(type: a.type, size: 22),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// A reaction as a picture: the emoji, a gold star for paid ones, or the
/// custom emoji's image.
class ReactionIcon extends ConsumerStatefulWidget {
  const ReactionIcon({super.key, required this.type, this.size = 16});
  final td.ReactionType type;
  final double size;

  @override
  ConsumerState<ReactionIcon> createState() => _ReactionIconState();
}

/// Custom emoji stickers by id, fetched once for the whole app.
final Map<int, Future<td.Sticker?>> _customEmoji = {};

class _ReactionIconState extends ConsumerState<ReactionIcon> {
  td.Sticker? _sticker;

  @override
  void initState() {
    super.initState();
    if (widget.type case td.ReactionTypeCustomEmoji(:final customEmojiId)) {
      final client = ref.read(telegramClientProvider);
      _customEmoji[customEmojiId] ??= client
          .send<td.Stickers>(td.GetCustomEmojiStickers(customEmojiIds: [customEmojiId]), limited: true)
          .then<td.Sticker?>((s) => s.stickers.firstOrNull)
          .catchError((Object _) => null);
      _customEmoji[customEmojiId]!.then((s) {
        if (mounted && s != null) setState(() => _sticker = s);
      });
    }
  }

  @override
  Widget build(BuildContext context) => switch (widget.type) {
    td.ReactionTypeEmoji(:final emoji) => Text(emoji, style: TextStyle(fontSize: widget.size * 0.85, height: 1.1)),
    td.ReactionTypePaid() => Icon(Icons.star_rounded, color: starGold, size: widget.size + 2),
    _ => _sticker == null
        ? Icon(Icons.auto_awesome_rounded, size: widget.size, color: AppColors.text2)
        : StickerImage(sticker: _sticker!, size: widget.size + 2),
  };
}
