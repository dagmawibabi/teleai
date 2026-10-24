import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../data/file_loader.dart';
import '../data/message_content.dart';
import '../data/telegram_store.dart';
import 'chat_list_screen.dart' show shortTime;
import 'chat_view_screen.dart';
import '../../../infrastructure/telegram/td_compat.dart';

/// A forum group's topics, pinned first, then by latest activity.
class ForumTopicsList extends ConsumerStatefulWidget {
  const ForumTopicsList({super.key, required this.chatId, this.topPadding = 0});
  final int chatId;
  final double topPadding;

  @override
  ConsumerState<ForumTopicsList> createState() => _ForumTopicsListState();
}

class _ForumTopicsListState extends ConsumerState<ForumTopicsList> {
  final List<td.ForumTopic> _topics = [];
  bool _loading = false;
  bool _end = false;
  String? _error;
  (int, int, int) _offset = (0, 0, 0);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (_loading || _end) return;
    setState(() => _loading = true);
    try {
      final r = await ref
          .read(telegramClientProvider)
          .send<td.ForumTopics>(
            td.GetForumTopics(
              chatId: widget.chatId,
              query: '',
              offsetDate: _offset.$1,
              offsetMessageId: _offset.$2,
              offsetForumTopicId: _offset.$3,
              limit: 50,
            ),
            limited: true,
          );
      _topics.addAll(r.topics.where((t) => _topics.every((x) => x.info.messageThreadId != t.info.messageThreadId)));
      _offset = (r.nextOffsetDate, r.nextOffsetMessageId, r.nextOffsetForumTopicId);
      if (r.topics.isEmpty || r.nextOffsetDate == 0) _end = true;
    } catch (e) {
      _error = '$e';
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final store = ref.watch(telegramStoreProvider);
    if (_topics.isEmpty) {
      return Center(
        child: _loading
            ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
            : Text(_error ?? 'No topics', style: context.text.bodySmall),
      );
    }
    final sorted = [..._topics]..sort((a, b) {
      if (a.isPinned != b.isPinned) return a.isPinned ? -1 : 1;
      return (b.lastMessage?.date ?? 0).compareTo(a.lastMessage?.date ?? 0);
    });
    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.pixels > n.metrics.maxScrollExtent - 400) _load();
        return false;
      },
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(Space.s, widget.topPadding, Space.s, Space.x4),
        itemCount: sorted.length,
        itemBuilder: (context, i) {
          final t = sorted[i];
          final last = t.lastMessage;
          String preview = '';
          if (last != null) {
            final g = gistOf(last.content);
            final who = last.isOutgoing ? 'You' : store.senderName(last.senderId).split(' ').first;
            preview = '$who: ${g.text.isNotEmpty ? g.text : (g.detail ?? g.kind)}'.replaceAll('\n', ' ');
          }
          return InkWell(
            borderRadius: BorderRadius.circular(Radii.l),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ChatViewScreen(
                  chatId: widget.chatId,
                  threadId: t.info.isGeneral ? null : t.info.messageThreadId,
                  generalTopic: t.info.isGeneral,
                  threadTitle: t.info.name,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Space.s, vertical: 10),
              child: Row(
                children: [
                  TopicIcon(info: t.info),
                  const SizedBox(width: Space.m),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                t.info.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.text.titleSmall?.copyWith(fontSize: 15),
                              ),
                            ),
                            if (t.info.isClosed) const Icon(Icons.lock_outline_rounded, size: 14, color: AppColors.text3),
                            if (t.isPinned) const Icon(Icons.push_pin_outlined, size: 14, color: AppColors.text3),
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
                            if (t.unreadCount > 0)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(999)),
                                child: Text(
                                  NumberFormat.compact().format(t.unreadCount),
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
        },
      ),
    );
  }
}

/// Custom-emoji stickers by id, fetched once for the session.
final _emojiStickers = <int, td.Sticker>{};
final _emojiLoads = <int, Future<void>>{};

/// A topic's icon: its custom emoji as a picture when TDLib has a still
/// image of it, the plain emoji it stands for otherwise, and Telegram's
/// coloured initial for topics without one.
class TopicIcon extends ConsumerStatefulWidget {
  const TopicIcon({super.key, required this.info, this.size = 44});
  final td.ForumTopicInfo info;
  final double size;

  @override
  ConsumerState<TopicIcon> createState() => _TopicIconState();
}

class _TopicIconState extends ConsumerState<TopicIcon> {
  String? _path;

  int get _id => widget.info.icon.customEmojiId;

  @override
  void initState() {
    super.initState();
    if (_id != 0) _load();
  }

  Future<void> _load() async {
    final client = ref.read(telegramClientProvider);
    if (!_emojiStickers.containsKey(_id)) {
      await (_emojiLoads[_id] ??= () async {
        try {
          final r = await client.send<td.Stickers>(td.GetCustomEmojiStickers(customEmojiIds: [_id]), limited: true);
          for (final s in r.stickers) {
            if (s.fullType case td.StickerFullTypeCustomEmoji(:final customEmojiId)) _emojiStickers[customEmojiId] = s;
          }
          if (r.stickers.length == 1) _emojiStickers[_id] = r.stickers.single;
        } catch (_) {}
      }());
    }
    final s = _emojiStickers[_id];
    if (s == null || !mounted) {
      if (mounted) setState(() {});
      return;
    }
    // A still picture: the sticker itself when it is WebP, or its thumbnail.
    final thumb = s.thumbnail;
    final file = s.format is td.StickerFormatWebp
        ? s.sticker
        : (thumb != null && (thumb.format is td.ThumbnailFormatWebp || thumb.format is td.ThumbnailFormatPng || thumb.format is td.ThumbnailFormatJpeg)
              ? thumb.file
              : null);
    if (file != null) {
      final p = await ref.read(fileLoaderProvider).download(file, priority: 4);
      if (mounted && p != null) setState(() => _path = p);
    } else if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.info;
    final size = widget.size;
    final color = Color(0xFF000000 | info.icon.color);
    if (_path != null) {
      return SizedBox.square(dimension: size, child: Padding(padding: EdgeInsets.all(size * 0.08), child: Image.file(File(_path!))));
    }
    final emoji = _id == 0 ? null : _emojiStickers[_id]?.emoji;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: (info.isGeneral ? AppColors.text3 : color).withValues(alpha: emoji == null ? 0.18 : 0.08),
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      child: info.isGeneral
          ? Icon(Icons.tag_rounded, color: AppColors.text2, size: size * 0.5)
          : emoji != null && emoji.isNotEmpty
          ? Text(emoji, style: TextStyle(fontSize: size * 0.5))
          : Text(
              info.name.characters.first.toUpperCase(),
              style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: size * 0.4),
            ),
    );
  }
}
