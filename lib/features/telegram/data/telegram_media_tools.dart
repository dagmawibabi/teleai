part of 'telegram_tools.dart';

// Stickers and GIFs: what the expression panel shows and the assistant's
// tools use.

/// A GIF that can be sent: one of the user's saved GIFs, or a result from
/// Telegram's @gif search bot.
class GifItem {
  const GifItem({required this.animation, required this.id});
  final td.Animation animation;

  /// `file:<id>` for a saved GIF, `inline:<queryId>:<resultId>` for a
  /// search result.
  final String id;
}

final _mediaTools = <TelegramTool>[
  TelegramTool(
    name: 'view_image',
    label: 'Looking at images',
    category: ToolCategory.creative,
    cost: ToolCost.ai,
    description:
        'Lets you inspect images from any available source: attachments (by name, including earlier messages), '
        'generated images, screenshots, downloaded images, local file paths or file URLs, direct HTTP/HTTPS image '
        'URLs and image data URLs. For Telegram photos, video thumbnails, GIF frames, stickers and link previews, '
        'pass refs "post:<chat_id>:<message_id>". Telegram is only needed for refs. Up to 6 images at once. '
        'The selected chat model must support image input. The images come right after the result.',
    parameters: _obj({
      'files': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'Attachment names, generated/downloaded image paths, screenshot paths, file URLs, direct image URLs or image data URLs.',
      },
      'urls': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'Direct HTTP/HTTPS image URLs or image data URLs. Use an image URL rather than a webpage URL.',
      },
      'refs': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'Telegram message refs: post:<chat_id>:<message_id>. Requires Telegram to be connected.',
      },
    }),
  ),
  TelegramTool(
    name: 'search_gifs',
    label: 'Searching GIFs',
    category: ToolCategory.media,
    description:
        'Finds GIFs on Telegram (through its @gif search) for a word or mood, e.g. "thank you", "facepalm". Returns '
        'gif_id values for send_gif.',
    parameters: _obj({
      'query': {'type': 'string'},
      'limit': {'type': 'integer', 'description': '1-30, default 12.'},
    }, ['query']),
  ),
  TelegramTool(
    name: 'list_saved_gifs',
    label: 'Opening saved GIFs',
    category: ToolCategory.media,
    description: 'The user\'s saved GIFs, with gif_id values for send_gif.',
    parameters: _obj({
      'limit': {'type': 'integer', 'description': '1-100, default 30.'},
    }),
  ),
  TelegramTool(
    name: 'send_gif',
    label: 'Sending a GIF',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Sends a GIF (a gif_id from search_gifs or list_saved_gifs) to a chat. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'gif_id': {'type': 'string'},
      'caption': {'type': 'string'},
    }, ['chat_id', 'gif_id']),
  ),
  TelegramTool(
    name: 'save_gif',
    label: 'Saving a GIF',
    category: ToolCategory.media,
    description: 'Adds a GIF from a message (chat_id and message_id) to the user\'s saved GIFs.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),
  TelegramTool(
    name: 'list_sticker_sets',
    label: 'Opening sticker packs',
    category: ToolCategory.media,
    cost: ToolCost.local,
    description: 'The sticker packs the user has installed, with set_id values for get_sticker_set.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'get_sticker_set',
    label: 'Opening a sticker pack',
    category: ToolCategory.media,
    description: 'The stickers in one pack (set_id from list_sticker_sets), with file_id values for send_sticker.',
    parameters: _obj({
      'set_id': {'type': 'string'},
    }, ['set_id']),
  ),
  TelegramTool(
    name: 'list_favorite_stickers',
    label: 'Opening favourite stickers',
    category: ToolCategory.media,
    description: 'The user\'s favourite and recently used stickers, with file_id values for send_sticker.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'favorite_sticker',
    label: 'Favouriting a sticker',
    category: ToolCategory.media,
    description: 'Adds a sticker (file_id) to favourites, or removes it with remove: true.',
    parameters: _obj({
      'file_id': {'type': 'integer'},
      'remove': {'type': 'boolean'},
    }, ['file_id']),
  ),
];

/// Sticker and GIF helpers for the expression panel and the tools.
extension TelegramMedia on TelegramToolRunner {
  /// The picture a message shows, downloaded: a photo (at most 1280 px
  /// wide), a video's or GIF's thumbnail, a still sticker, an image file, or
  /// its link preview's image. Null when it has none.
  Future<String?> messageImage(int chatId, int messageId) async {
    final m = await _client.send<td.Message>(td.GetMessage(chatId: chatId, messageId: messageId), limited: true);
    td.File? best(td.Photo? p) {
      if (p == null || p.sizes.isEmpty) return null;
      final sizes = [...p.sizes]..sort((a, b) => a.width.compareTo(b.width));
      return sizes.lastWhere((s) => s.width <= 1280, orElse: () => sizes.first).photo;
    }

    final file = switch (m.content) {
      td.MessagePhoto(:final photo) => best(photo),
      td.MessageVideo(:final video) => video.thumbnail?.file,
      td.MessageAnimation(:final animation) => animation.thumbnail?.file,
      td.MessageVideoNote(:final videoNote) => videoNote.thumbnail?.file,
      td.MessageSticker(:final sticker) => sticker.format is td.StickerFormatWebp ? sticker.sticker : sticker.thumbnail?.file,
      td.MessageDocument(:final document) =>
        document.mimeType.startsWith('image/') ? document.document : document.thumbnail?.file,
      td.MessageText(:final linkPreview?) => switch (linkPreview.type) {
        td.LinkPreviewTypePhoto(:final photo) => best(photo),
        td.LinkPreviewTypeArticle(:final photo) => best(photo),
        td.LinkPreviewTypeVideo(:final video) => video.thumbnail?.file,
        _ => null,
      },
      _ => null,
    };
    if (file == null) return null;
    if (file.local.isDownloadingCompleted && File(file.local.path).existsSync()) return file.local.path;
    final f = await _client.send<td.File>(
      td.DownloadFile(fileId: file.id, priority: 16, offset: 0, limit: 0, synchronous: true),
      timeout: const Duration(seconds: 60),
    );
    return f.local.isDownloadingCompleted ? f.local.path : null;
  }

  Future<List<GifItem>> savedGifs() async {
    final r = await _client.send<td.Animations>(const td.GetSavedAnimations(), limited: true);
    return [for (final a in r.animations) GifItem(animation: a, id: 'file:${a.animation.id}')];
  }

  /// GIFs from Telegram's @gif inline bot, as Telegram's apps search them.
  Future<List<GifItem>> searchGifs(String query, {int chatId = 0}) async {
    final bot = await _client.send<td.Chat>(const td.SearchPublicChat(username: 'gif'), limited: true);
    final botId = bot.type is td.ChatTypePrivate ? (bot.type as td.ChatTypePrivate).userId : 0;
    if (botId == 0) return const [];
    final r = await _client.send<td.InlineQueryResults>(
      td.GetInlineQueryResults(
        botUserId: botId,
        chatId: chatId == 0 ? (_store.me?.id ?? 0) : chatId,
        userLocation: null,
        query: query,
        offset: '',
      ),
      limited: true,
      timeout: const Duration(seconds: 20),
    );
    return [
      for (final res in r.results)
        if (res is td.InlineQueryResultAnimation) GifItem(animation: res.animation, id: 'inline:${r.inlineQueryId}:${res.id}'),
    ];
  }

  Future<td.Message> sendGif(int chatId, String id, {int threadId = 0, String caption = ''}) async {
    if (id.startsWith('inline:')) {
      final parts = id.split(':');
      return _client.send<td.Message>(
        td.SendInlineQueryResultMessage(
          chatId: chatId,
          topicId: topicOf(chatId, threadId),
          replyTo: null,
          options: null,
          queryId: int.parse(parts[1]),
          resultId: parts.sublist(2).join(':'),
          hideViaBot: true,
        ),
        limited: true,
      );
    }
    final fileId = int.tryParse(id.replaceFirst('file:', ''));
    if (fileId == null) throw ArgumentError('Unknown gif_id $id');
    return _client.send<td.Message>(
      td.SendMessage(
        chatId: chatId,
        topicId: topicOf(chatId, threadId),
        replyTo: null,
        options: null,
        replyMarkup: null,
        inputMessageContent: td.InputMessageAnimation(
          animation: td.InputAnimation(
            animation: td.InputFileId(id: fileId),
            thumbnail: null,
            addedStickerFileIds: const [],
            duration: 0,
            width: 0,
            height: 0,
          ),
          caption: caption.isEmpty ? null : td.FormattedText(text: caption, entities: const []),
          showCaptionAboveMedia: false,
          hasSpoiler: false,
        ),
      ),
      limited: true,
    );
  }

  Future<void> saveGif(td.Animation a) =>
      _client.send<td.Ok>(td.AddSavedAnimation(animation: td.InputFileId(id: a.animation.id)), limited: true);

  Future<List<td.StickerSetInfo>> stickerSets() async {
    final r = await _client.send<td.StickerSets>(
      const td.GetInstalledStickerSets(stickerType: td.StickerTypeRegular()),
      limited: true,
    );
    return r.sets;
  }

  Future<List<td.Sticker>> stickerSetStickers(int setId) async =>
      (await _client.send<td.StickerSet>(td.GetStickerSet(setId: setId), limited: true)).stickers;

  Future<List<td.Sticker>> favoriteStickers() async =>
      (await _client.send<td.Stickers>(const td.GetFavoriteStickers(), limited: true)).stickers;

  Future<List<td.Sticker>> recentStickers() async =>
      (await _client.send<td.Stickers>(const td.GetRecentStickers(isAttached: false), limited: true)).stickers;

  /// Stickers for an emoji, or for words (matched to stickers' keywords).
  Future<List<td.Sticker>> findStickers(String query) async {
    final q = query.trim();
    if (q.isEmpty) return const [];
    final emojiOnly = !RegExp(r'[A-Za-z0-9]').hasMatch(q);
    final r = await _client.send<td.Stickers>(
      emojiOnly
          ? td.SearchStickers(stickerType: const td.StickerTypeRegular(), emojis: q, query: '', inputLanguageCodes: const [], offset: 0, limit: 60)
          : td.GetStickers(stickerType: const td.StickerTypeRegular(), query: q, limit: 60, chatId: 0),
      limited: true,
    );
    return r.stickers;
  }

  Future<td.Message> sendStickerTo(int chatId, td.Sticker s, {int threadId = 0}) => _client.send<td.Message>(
    td.SendMessage(
      chatId: chatId,
      topicId: topicOf(chatId, threadId),
      replyTo: null,
      options: null,
      replyMarkup: null,
      inputMessageContent: td.InputMessageSticker(
        sticker: td.InputSticker(sticker: td.InputFileId(id: s.sticker.id), thumbnail: null, width: s.width, height: s.height),
        emoji: s.emoji,
      ),
    ),
    limited: true,
  );

  Future<void> setFavoriteSticker(int fileId, bool favorite) => _client.send<td.Ok>(
    favorite
        ? td.AddFavoriteSticker(sticker: td.InputFileId(id: fileId))
        : td.RemoveFavoriteSticker(sticker: td.InputFileId(id: fileId)),
    limited: true,
  );
}

extension _MediaToolRuns on TelegramToolRunner {
  Map<String, dynamic> _gifJson(GifItem g) => {
    'gif_id': g.id,
    if (g.animation.fileName.isNotEmpty) 'name': g.animation.fileName,
    'seconds': g.animation.duration,
    'size': '${g.animation.width}x${g.animation.height}',
  };

  Future<ToolOutput>? _runMedia(String name, Map<String, dynamic> args) => switch (name) {
    'search_gifs' => () async {
      final q = '${args['query'] ?? ''}'.trim();
      if (q.isEmpty) throw ArgumentError('query is required');
      final list = await searchGifs(q);
      final n = TelegramToolRunner._int(args, 'limit', fallback: 12, max: 30);
      return ToolOutput({'query': q, 'gifs': [for (final g in list.take(n)) _gifJson(g)]});
    }(),
    'list_saved_gifs' => () async {
      final list = await savedGifs();
      final n = TelegramToolRunner._int(args, 'limit', fallback: 30, max: 100);
      return ToolOutput({'count': list.length, 'gifs': [for (final g in list.take(n)) _gifJson(g)]});
    }(),
    'send_gif' => () async {
      final c = _requireChat(args);
      final m = await sendGif(c.id, '${args['gif_id'] ?? ''}', caption: '${args['caption'] ?? ''}');
      return ToolOutput({'sent': true, 'chat': c.title, 'ref': 'post:${m.chatId}:${m.id}'});
    }(),
    'save_gif' => () async {
      final c = _requireChat(args);
      final id = TelegramToolRunner._intOrNull(args, 'message_id');
      if (id == null) throw ArgumentError('message_id is required');
      final m = await _client.send<td.Message>(td.GetMessage(chatId: c.id, messageId: id), limited: true);
      final content = m.content;
      if (content is! td.MessageAnimation) throw ArgumentError('That message isn\'t a GIF.');
      await saveGif(content.animation);
      return const ToolOutput({'saved': true, 'gif': true});
    }(),
    'list_sticker_sets' => () async {
      final sets = await stickerSets();
      return ToolOutput({
        'sets': [
          for (final s in sets) {'set_id': '${s.id}', 'title': s.title, 'name': s.name, 'stickers': s.size},
        ],
      });
    }(),
    'get_sticker_set' => () async {
      final id = int.tryParse('${args['set_id'] ?? ''}');
      if (id == null) throw ArgumentError('set_id is required');
      final stickers = await stickerSetStickers(id);
      return ToolOutput({'count': stickers.length, 'stickers': [for (final s in stickers) _stickerJson(s)]});
    }(),
    'list_favorite_stickers' => () async {
      final fav = await favoriteStickers();
      final recent = await recentStickers();
      return ToolOutput({
        'favorites': [for (final s in fav) _stickerJson(s)],
        'recent': [for (final s in recent.take(20)) _stickerJson(s)],
      });
    }(),
    'favorite_sticker' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'file_id');
      if (id == null) throw ArgumentError('file_id is required');
      await setFavoriteSticker(id, args['remove'] != true);
      return ToolOutput({'done': true, 'favorite': args['remove'] != true});
    }(),
    _ => null,
  };
}
