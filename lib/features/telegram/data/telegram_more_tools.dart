part of 'telegram_tools.dart';

// t.me links, searching every chat by kind of content, inline bots,
// message effects, reactions to the user's messages, video chats, and the
// phone's Telegram storage and data use.

/// Kinds of content search_all_chats (and the Search screen) can find.
final searchFilters = <String, (String, td.SearchMessagesFilter?)>{
  'any': ('Everything', null),
  'photos': ('Photos', const td.SearchMessagesFilterPhoto()),
  'videos': ('Videos', const td.SearchMessagesFilterVideo()),
  'photos_and_videos': ('Photos & videos', const td.SearchMessagesFilterPhotoAndVideo()),
  'files': ('Files', const td.SearchMessagesFilterDocument()),
  'links': ('Links', const td.SearchMessagesFilterUrl()),
  'music': ('Music', const td.SearchMessagesFilterAudio()),
  'voice': ('Voice messages', const td.SearchMessagesFilterVoiceNote()),
  'round_videos': ('Video messages', const td.SearchMessagesFilterVideoNote()),
  'gifs': ('GIFs', const td.SearchMessagesFilterAnimation()),
};

final _moreTdTools = <TelegramTool>[
  TelegramTool(
    name: 'open_telegram_link',
    label: 'Opening a Telegram link',
    category: ToolCategory.chats,
    description:
        'Works out what a Telegram link is and opens it for you: t.me/username (a chat, channel, bot or person: its '
        'chat_id and details), t.me/channel/123 and t.me/c/… (that message, readable straight away), invite links '
        't.me/+… (the chat, its size and description, without joining), stories, sticker sets, folder links, bot '
        'start links and others. Use the returned chat_id with the other tools (read_messages, join_chat…).',
    parameters: _obj({
      'link': {'type': 'string', 'description': 'Any t.me or tg:// link, or @username.'},
    }, ['link']),
  ),
  TelegramTool(
    name: 'search_all_chats',
    label: 'Searching every chat',
    category: ToolCategory.messages,
    description:
        'Searches all the user\'s chats at once (or one chat, a folder, or the archive) for a kind of content: photos, '
        'videos, files, links, music, voice messages, video messages, GIFs, or any message, optionally matching query '
        'and between dates. E.g. "every PDF people sent me last month" (type files, query "pdf", since_days 31). '
        'Results are newest first; pass next_offset for more.',
    parameters: _obj({
      'type': {'type': 'string', 'enum': ['any', ...searchFilters.keys.where((k) => k != 'any')]},
      'query': {'type': 'string'},
      'chat_id': {'type': 'integer', 'description': 'Only this chat.'},
      'folder_id': {'type': 'integer'},
      'archived': {'type': 'boolean', 'description': 'Search the archived chats.'},
      'channels_only': {'type': 'boolean'},
      'since_days': {'type': 'number'},
      'until': {'type': 'string', 'description': 'ISO date: only before this.'},
      'limit': {'type': 'integer', 'description': 'Default 30, at most 100.'},
      'next_offset': {'type': 'string'},
    }),
  ),
  TelegramTool(
    name: 'inline_bot_query',
    label: 'Asking an inline bot',
    category: ToolCategory.actions,
    description:
        'Asks an inline bot (@gif, @vid, @wiki, @bing, @pic, @sticker, @youtube, @music, any bot with inline mode) for '
        'results for a query, as typing "@bot query" in Telegram does. Returns numbered results; send one with '
        'send_inline_result.',
    parameters: _obj({
      'bot': {'type': 'string', 'description': '@username of the bot.'},
      'query': {'type': 'string'},
      'chat_id': {'type': 'integer', 'description': 'The chat it is for (some bots tailor results).'},
    }, ['bot', 'query']),
  ),
  TelegramTool(
    name: 'send_inline_result',
    label: 'Sending an inline result',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Sends one result from inline_bot_query to a chat, as if picked from the inline list. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'query_id': {'type': 'string', 'description': 'From inline_bot_query.'},
      'result_id': {'type': 'string'},
      'reply_to_message_id': {'type': 'integer'},
      'hide_via_bot': {'type': 'boolean'},
    }, ['chat_id', 'query_id', 'result_id']),
  ),
  TelegramTool(
    name: 'list_message_effects',
    label: 'Listing message effects',
    category: ToolCategory.messages,
    cost: ToolCost.local,
    description:
        'The animated effects a message can be sent with in private chats (🔥 👍 ❤️ 🎉 💩 and more): effect_id and '
        'emoji, and which need Premium. Pass effect_id to send_message to use one.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'reactions_to_me',
    label: 'Checking reactions to your messages',
    category: ToolCategory.messages,
    description:
        'Reactions people put on the user\'s messages: by default the new (unseen) ones across all chats, with who '
        'reacted with what on which message; with chat_id and all, every reaction on the user\'s recent messages in '
        'that chat.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'all': {'type': 'boolean', 'description': 'Seen ones too (needs chat_id).'},
      'limit': {'type': 'integer'},
    }),
  ),
  TelegramTool(
    name: 'mark_reactions_seen',
    label: 'Marking reactions seen',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Marks the new reactions to the user\'s messages as seen, in one chat or (no chat_id) in every chat. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }),
  ),
  TelegramTool(
    name: 'video_chat',
    label: 'Checking a video chat',
    category: ToolCategory.chats,
    description:
        'Whether a group or channel has a video chat (group call or live stream) going or scheduled: its title, how many '
        'are in it, who is speaking, whether the user can manage it. One-to-one calls can\'t be placed from this app; '
        'list_calls shows their history.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'manage_video_chat',
    label: 'Managing a video chat',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'As admin of a group or channel: start a video chat (now, or scheduled with start_at; live_stream for an RTMP '
        'stream), end it, rename it (title), invite user_ids, get an invite link, or mute/unmute new participants. '
        'Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'action': {'type': 'string', 'enum': ['start', 'end', 'rename', 'invite', 'link', 'mute_new', 'unmute_new']},
      'title': {'type': 'string'},
      'start_at': {'type': 'string', 'description': 'ISO local time to schedule it.'},
      'live_stream': {'type': 'boolean', 'description': 'An RTMP live stream instead of a video chat.'},
      'user_ids': {'type': 'array', 'items': {'type': 'integer'}},
    }, ['chat_id', 'action']),
  ),
  TelegramTool(
    name: 'storage_report',
    label: 'Checking storage',
    category: ToolCategory.account,
    cost: ToolCost.device,
    description: 'How much space Telegram\'s files take on this phone, in total, by kind (photos, videos, music…) and by chat (the biggest first), plus its database.',
    parameters: _obj({
      'chats': {'type': 'integer', 'description': 'How many of the biggest chats to list. Default 15.'},
    }),
  ),
  TelegramTool(
    name: 'clean_storage',
    label: 'Clearing cached files',
    category: ToolCategory.account,
    cost: ToolCost.device,
    requiresApproval: true,
    description:
        'Frees space by deleting cached Telegram files on this phone (they stay in Telegram and download again when '
        'opened): only older_than_days, only some kinds (photos, videos, files, music, voice, video_messages, gifs, '
        'stickers), only some chats, or until the cache is under keep_mb. Needs approval.',
    parameters: _obj({
      'older_than_days': {'type': 'integer'},
      'kinds': {'type': 'array', 'items': {'type': 'string'}},
      'chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'except_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'keep_mb': {'type': 'integer'},
    }),
  ),
  TelegramTool(
    name: 'data_usage',
    label: 'Checking data use',
    category: ToolCategory.account,
    cost: ToolCost.device,
    description: 'How much mobile data, Wi-Fi and roaming Telegram used on this phone since the counters were last reset, by kind (photos, videos, files, calls…). reset: true starts the counters again (needs approval through the app).',
    parameters: _obj({
      'reset': {'type': 'boolean'},
    }),
  ),
];

extension MoreTdTools on TelegramToolRunner {
  Future<ToolOutput>? _runMoreTd(String name, Map<String, dynamic> args) => switch (name) {
    'open_telegram_link' => _openLink(args),
    'search_all_chats' => _searchAll(args),
    'inline_bot_query' => _inlineQuery(args),
    'send_inline_result' => _sendInline(args),
    'list_message_effects' => _effects(),
    'reactions_to_me' => _reactionsToMe(args),
    'mark_reactions_seen' => _markReactionsSeen(args),
    'video_chat' => _videoChat({...args, 'action': 'info'}),
    'manage_video_chat' => _videoChat(args),
    'storage_report' => _storageReport(args),
    'clean_storage' => _cleanStorage(args),
    'data_usage' => _dataUsage(args),
    _ => null,
  };

  String? _describeMoreTd(String name, Map<String, dynamic> args, String title) => switch (name) {
    'send_inline_result' => 'Send inline result ${args['result_id']} to $title',
    'mark_reactions_seen' => args['chat_id'] == null ? 'Mark new reactions as seen in every chat' : 'Mark new reactions as seen in $title',
    'clean_storage' => 'Delete cached Telegram files on this phone${[
      if (args['older_than_days'] != null) ' older than ${args['older_than_days']} days',
      if ((args['kinds'] as List?)?.isNotEmpty == true) ' (${(args['kinds'] as List).join(', ')})',
      if ((args['chat_ids'] as List?)?.isNotEmpty == true) ' in ${[for (final c in args['chat_ids'] as List) _store.chat((c as num).toInt())?.title ?? '$c'].join(', ')}',
      if (args['keep_mb'] != null) ' down to ${args['keep_mb']} MB',
    ].join()}. They download again when opened.',
    'manage_video_chat' => switch ('${args['action']}') {
      'start' => '${args['start_at'] != null ? 'Schedule' : 'Start'} a ${args['live_stream'] == true ? 'live stream' : 'video chat'} in $title'
          '${args['title'] != null ? ': “${args['title']}”' : ''}${args['start_at'] != null ? ' at ${args['start_at']}' : ''}',
      'end' => 'End the video chat in $title for everyone',
      'rename' => 'Rename the video chat in $title to “${args['title']}”',
      'invite' => 'Invite ${[for (final u in (args['user_ids'] as List? ?? const [])) _store.userName((u as num).toInt())].join(', ')} to the video chat in $title',
      'mute_new' => 'Mute new participants of the video chat in $title',
      'unmute_new' => 'Let new participants of the video chat in $title speak',
      _ => 'Video chat in $title: ${args['action']}',
    },
    _ => null,
  };

  // ---- links -------------------------------------------------------------------

  /// What a t.me or tg:// link is, resolved as far as reading goes: the
  /// chat, the message, the invite's chat. Used by the tool and by taps on
  /// links inside the app.
  Future<Map<String, dynamic>> resolveLink(String raw) async {
    var link = raw.trim();
    if (link.startsWith('@')) link = 'https://t.me/${link.substring(1)}';
    if (!link.contains('://')) link = 'https://$link';
    final type = await _client.send<td.InternalLinkType>(td.GetInternalLinkType(link: link), limited: true);
    Future<Map<String, dynamic>> chatByName(String username) async {
      final c = await _client.send<td.Chat>(td.SearchPublicChat(username: username), limited: true);
      final info = _store.chat(c.id);
      return {'chat_id': c.id, if (info != null) ..._chatJson(info, preview: false) else 'title': c.title};
    }

    switch (type) {
      case td.InternalLinkTypeMessage(:final url):
        final i = await _client.send<td.MessageLinkInfo>(td.GetMessageLinkInfo(url: url), limited: true);
        final m = i.message;
        return {
          'kind': 'message',
          'chat_id': i.chatId,
          'chat': _store.chat(i.chatId)?.title ?? 'chat ${i.chatId}',
          if (m != null) 'message_id': m.id,
          if (m != null) 'message': _message(m, _store.chat(i.chatId)).$1,
          if (i.messageThreadId != 0) 'topic_id': i.messageThreadId,
          if (m == null) 'note': 'The message isn\'t available (a private chat the user isn\'t in, or deleted).',
        };
      case td.InternalLinkTypePublicChat(:final chatUsername, :final draftText):
        return {'kind': 'chat', ...await chatByName(chatUsername), if (draftText.isNotEmpty) 'draft_text': draftText};
      case td.InternalLinkTypeChatInvite(:final inviteLink):
        final i = await _client.send<td.ChatInviteLinkInfo>(td.CheckChatInviteLink(inviteLink: inviteLink), limited: true);
        return {
          'kind': 'invite',
          'invite_link': inviteLink,
          'title': i.title,
          'type': switch (i.type) {
            td.InviteLinkChatTypeChannel() => 'channel',
            td.InviteLinkChatTypeSupergroup() || td.InviteLinkChatTypeBasicGroup() => 'group',
          },
          'members': i.memberCount,
          if (i.description.isNotEmpty) 'description': i.description,
          if (i.chatId != 0) 'chat_id': i.chatId,
          'already_member': i.chatId != 0 && _store.chat(i.chatId)?.isListed == true,
          if (i.createsJoinRequest) 'needs_approval_to_join': true,
          if (i.verificationStatus?.isScam == true || i.verificationStatus?.isFake == true) 'warning': 'Telegram marks this chat as scam or fake.',
          'note': 'Join with join_chat (invite_link) only if the user asks.',
        };
      case td.InternalLinkTypeStory(:final storyPosterUsername, :final storyId):
        final chat = await chatByName(storyPosterUsername);
        return {'kind': 'story', 'story_id': storyId, ...chat, 'note': 'Open it with view_story.'};
      case td.InternalLinkTypeBotStart(:final botUsername, :final startParameter):
        return {'kind': 'bot_start', ...await chatByName(botUsername), 'start_parameter': startParameter, 'note': 'start_bot runs it.'};
      case td.InternalLinkTypeBotStartInGroup(:final botUsername):
        return {'kind': 'bot_add_to_group', ...await chatByName(botUsername)};
      case td.InternalLinkTypeStickerSet(:final stickerSetName):
        return {'kind': 'sticker_set', 'name': stickerSetName, 'note': 'get_sticker_set shows it.'};
      case td.InternalLinkTypeChatFolderInvite(:final inviteLink):
        return {'kind': 'folder_invite', 'invite_link': inviteLink};
      case td.InternalLinkTypeVideoChat(:final chatUsername):
        return {'kind': 'video_chat', ...await chatByName(chatUsername)};
      case td.InternalLinkTypeWebApp(:final botUsername) || td.InternalLinkTypeMainWebApp(:final botUsername):
        return {'kind': 'web_app', ...await chatByName(botUsername)};
      case td.InternalLinkTypeUserPhoneNumber(:final phoneNumber):
        return {'kind': 'phone_number', 'phone': phoneNumber};
      case td.InternalLinkTypeInstantView(:final url):
        return {'kind': 'instant_view', 'url': url, 'note': 'Read it with fetch_url.'};
      default:
        return {'kind': type.runtimeType.toString().replaceFirst('InternalLinkType', '')};
    }
  }

  Future<ToolOutput> _openLink(Map<String, dynamic> args) async {
    final link = '${args['link'] ?? ''}'.trim();
    if (link.isEmpty) throw ArgumentError('link is required');
    try {
      final r = await resolveLink(link);
      final posts = <PostSnapshot>[];
      if (r['kind'] == 'message' && r['message_id'] != null) {
        final m = await _client.send<td.Message>(td.GetMessage(chatId: r['chat_id'] as int, messageId: r['message_id'] as int), limited: true);
        posts.add(_message(m, _store.chat(m.chatId)).$2);
      }
      return ToolOutput({'link': link, ...r}, posts: posts);
    } on TelegramException catch (e) {
      if (e.code == 400 || e.code == 404) {
        return ToolOutput({'error': 'Telegram doesn\'t recognise that link (${e.message}). For other websites use fetch_url.'});
      }
      rethrow;
    }
  }

  // ---- search ------------------------------------------------------------------

  /// One page of messages of a kind across chats (or in one chat).
  Future<({List<td.Message> messages, String next, int total})> searchByType({
    String type = 'any',
    String query = '',
    int? chatId,
    int? folderId,
    bool archived = false,
    bool channelsOnly = false,
    DateTime? since,
    DateTime? until,
    int limit = 30,
    String offset = '',
  }) async {
    final filter = searchFilters[type]?.$2;
    if (chatId != null) {
      final r = await _client.send<td.FoundChatMessages>(
        td.SearchChatMessages(
          chatId: chatId,
          query: query,
          senderId: null,
          fromMessageId: int.tryParse(offset) ?? 0,
          offset: 0,
          limit: limit,
          filter: filter,
          topicId: null,
        ),
        limited: true,
      );
      final list = r.messages
          .where((m) => (since == null || m.date >= since.millisecondsSinceEpoch ~/ 1000) && (until == null || m.date < until.millisecondsSinceEpoch ~/ 1000))
          .toList();
      return (messages: list, next: r.nextFromMessageId == 0 ? '' : '${r.nextFromMessageId}', total: r.totalCount);
    }
    if (query.isEmpty && filter == null) throw ArgumentError('Searching every chat needs a query or a type.');
    final r = await _client.send<td.FoundMessages>(
      td.SearchMessages(
        chatList: folderId != null ? td.ChatListFolder(chatFolderId: folderId) : (archived ? const td.ChatListArchive() : null),
        chatTypeFilter: channelsOnly ? const td.SearchMessagesChatTypeFilterChannel() : null,
        query: query,
        offset: offset,
        limit: limit,
        filter: filter,
        minDate: since == null ? 0 : since.millisecondsSinceEpoch ~/ 1000,
        maxDate: until == null ? 0 : until.millisecondsSinceEpoch ~/ 1000,
      ),
      limited: true,
    );
    return (messages: r.messages, next: r.nextOffset, total: r.totalCount);
  }

  Future<ToolOutput> _searchAll(Map<String, dynamic> args) async {
    final days = TelegramToolRunner._hours(args, 'since_days');
    final r = await searchByType(
      type: '${args['type'] ?? 'any'}',
      query: '${args['query'] ?? ''}'.trim(),
      chatId: TelegramToolRunner._intOrNull(args, 'chat_id'),
      folderId: TelegramToolRunner._intOrNull(args, 'folder_id'),
      archived: args['archived'] == true,
      channelsOnly: args['channels_only'] == true,
      since: days == null ? null : DateTime.now().subtract(Duration(minutes: (days * 1440).round())),
      until: DateTime.tryParse('${args['until'] ?? ''}'),
      limit: TelegramToolRunner._int(args, 'limit', fallback: 30, max: 100),
      offset: '${args['next_offset'] ?? ''}',
    );
    final posts = <PostSnapshot>[];
    final json = <Map<String, dynamic>>[];
    for (final m in r.messages) {
      final (j, p) = _message(m, _store.chat(m.chatId));
      json.add(j);
      posts.add(p);
    }
    return ToolOutput({
      'count': json.length,
      if (r.total > 0) 'total': r.total,
      'messages': json,
      if (r.next.isNotEmpty) 'next_offset': r.next,
    }, posts: posts);
  }

  // ---- inline bots -------------------------------------------------------------

  Future<ToolOutput> _inlineQuery(Map<String, dynamic> args) async {
    final name = '${args['bot'] ?? ''}'.replaceFirst('@', '').trim();
    if (name.isEmpty) throw ArgumentError('bot is required');
    final bot = await _client.send<td.Chat>(td.SearchPublicChat(username: name), limited: true);
    final userId = bot.type is td.ChatTypePrivate ? (bot.type as td.ChatTypePrivate).userId : 0;
    final chatId = TelegramToolRunner._intOrNull(args, 'chat_id') ?? bot.id;
    final r = await _client.send<td.InlineQueryResults>(
      td.GetInlineQueryResults(botUserId: userId, chatId: chatId, userLocation: null, query: '${args['query'] ?? ''}', offset: ''),
      limited: true,
      timeout: const Duration(seconds: 20),
    );
    return ToolOutput({
      'bot': '@$name',
      'query_id': '${r.inlineQueryId}',
      'count': r.results.length,
      'results': [
        for (final x in r.results.take(25))
          switch (x) {
            td.InlineQueryResultArticle(:final id, :final title, :final description, :final url) => {'result_id': id, 'kind': 'article', 'title': title, 'description': description, if (url.isNotEmpty) 'url': url},
            td.InlineQueryResultPhoto(:final id, :final title, :final description) => {'result_id': id, 'kind': 'photo', 'title': title, 'description': description},
            td.InlineQueryResultVideo(:final id, :final title, :final description, :final video) => {'result_id': id, 'kind': 'video', 'title': title, 'description': description, 'seconds': video.duration},
            td.InlineQueryResultAnimation(:final id, :final title) => {'result_id': id, 'kind': 'gif', 'title': title},
            td.InlineQueryResultAudio(:final id, :final audio) => {'result_id': id, 'kind': 'music', 'title': '${audio.performer} – ${audio.title}'},
            td.InlineQueryResultDocument(:final id, :final title, :final description) => {'result_id': id, 'kind': 'file', 'title': title, 'description': description},
            td.InlineQueryResultSticker(:final id, :final sticker) => {'result_id': id, 'kind': 'sticker', 'emoji': sticker.emoji},
            td.InlineQueryResultVoiceNote(:final id, :final title) => {'result_id': id, 'kind': 'voice', 'title': title},
            td.InlineQueryResultLocation(:final id, :final title) => {'result_id': id, 'kind': 'location', 'title': title},
            td.InlineQueryResultVenue(:final id, :final venue) => {'result_id': id, 'kind': 'venue', 'title': venue.title},
            td.InlineQueryResultContact(:final id, :final contact) => {'result_id': id, 'kind': 'contact', 'title': '${contact.firstName} ${contact.lastName}'.trim()},
            td.InlineQueryResultGame(:final id, :final game) => {'result_id': id, 'kind': 'game', 'title': game.title},
          },
      ],
      if (r.results.isEmpty) 'note': 'The bot returned nothing for that query.',
    });
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _sendInline(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final queryId = int.tryParse('${args['query_id'] ?? ''}');
    if (queryId == null) throw ArgumentError('query_id from inline_bot_query is required.');
    final reply = TelegramToolRunner._intOrNull(args, 'reply_to_message_id');
    final m = await _client.send<td.Message>(
      td.SendInlineQueryResultMessage(
        chatId: c.id,
        topicId: null,
        replyTo: reply == null ? null : replyToMessage(reply),
        options: null,
        queryId: queryId,
        resultId: '${args['result_id']}',
        hideViaBot: args['hide_via_bot'] == true,
      ),
      limited: true,
    );
    return ToolOutput({'sent': true, 'chat': c.title, 'ref': 'post:${m.chatId}:${m.id}'});
  }

  // ---- effects and reactions -------------------------------------------------------

  Future<ToolOutput> _effects() async {
    final ids = _store.messageEffectIds;
    if (ids.isEmpty) return const ToolOutput({'effects': [], 'note': 'Telegram hasn\'t sent the list of effects yet; try again shortly.'});
    final out = <Map<String, dynamic>>[];
    for (final id in ids.take(40)) {
      try {
        final e = await _client.send<td.MessageEffect>(td.GetMessageEffect(effectId: id));
        out.add({'effect_id': '${e.id}', 'emoji': e.emoji, if (e.isPremium) 'premium': true});
      } catch (_) {}
    }
    return ToolOutput({
      'effects': out,
      'note': 'Effects work in private chats. Pass effect_id to send_message. ${_store.me?.isPremium == true ? '' : 'Premium ones need Telegram Premium.'}',
    });
  }

  Future<ToolOutput> _reactionsToMe(Map<String, dynamic> args) async {
    await _store.ensureChatsLoaded();
    final limit = TelegramToolRunner._int(args, 'limit', fallback: 30, max: 100);
    final chatId = TelegramToolRunner._intOrNull(args, 'chat_id');
    String who(td.MessageSender s) => _store.senderName(s);
    String emojiOf(td.ReactionType t) => switch (t) {
      td.ReactionTypeEmoji(:final emoji) => emoji,
      td.ReactionTypePaid() => '⭐',
      _ => 'custom emoji',
    };
    final rows = <Map<String, dynamic>>[];
    final posts = <PostSnapshot>[];
    void add(td.Message m, {required bool unread}) {
      final c = _store.chat(m.chatId);
      final (j, p) = _message(m, c);
      posts.add(p);
      rows.add({
        'chat': c?.title ?? 'chat ${m.chatId}',
        'ref': j['ref'],
        'your_message': j['text'] ?? j['media'] ?? '',
        if (unread && m.unreadReactions.isNotEmpty)
          'new': [for (final r in m.unreadReactions) '${who(r.senderId)} ${emojiOf(r.type)}'],
        if (j['reactions'] != null) 'all_reactions': j['reactions'],
      });
    }

    if (chatId != null && args['all'] == true) {
      final me = _store.me;
      if (me == null) throw ArgumentError('The account isn\'t loaded yet.');
      final r = await _client.send<td.FoundChatMessages>(
        td.SearchChatMessages(
          chatId: chatId,
          query: '',
          senderId: td.MessageSenderUser(userId: me.id),
          fromMessageId: 0,
          offset: 0,
          limit: 100,
          filter: null,
          topicId: null,
        ),
        limited: true,
      );
      for (final m in r.messages.where((m) => m.interactionInfo?.reactions?.reactions.isNotEmpty ?? false).take(limit)) {
        add(m, unread: false);
      }
    } else {
      final chats = chatId != null
          ? [?_store.chat(chatId)]
          : (_store.chats.values.where((c) => c.unreadReactionCount > 0).toList()..sort((a, b) => b.unreadReactionCount.compareTo(a.unreadReactionCount)));
      for (final c in chats.take(15)) {
        if (rows.length >= limit) break;
        final r = await _client.send<td.FoundChatMessages>(
          td.SearchChatMessages(
            chatId: c.id,
            query: '',
            senderId: null,
            fromMessageId: 0,
            offset: 0,
            limit: 20,
            filter: const td.SearchMessagesFilterUnreadReaction(),
            topicId: null,
          ),
          limited: true,
        );
        for (final m in r.messages) {
          add(m, unread: true);
        }
      }
    }
    return ToolOutput({
      'count': rows.length,
      'messages': rows,
      if (rows.isEmpty) 'note': chatId == null ? 'No new reactions to the user\'s messages.' : 'Nothing found in that chat.',
    }, posts: posts);
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _markReactionsSeen(Map<String, dynamic> args) async {
    final chatId = TelegramToolRunner._intOrNull(args, 'chat_id');
    final chats = chatId != null ? [chatId] : [for (final c in _store.chats.values) if (c.unreadReactionCount > 0) c.id];
    for (final id in chats) {
      await _client.send<td.Ok>(td.ReadAllChatReactions(chatId: id), limited: true);
    }
    return ToolOutput({'done': true, 'chats': chats.length});
  }

  // ---- video chats -------------------------------------------------------------

  Future<ToolOutput> _videoChat(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final action = '${args['action'] ?? 'info'}';
    final chat = await _client.send<td.Chat>(td.GetChat(chatId: c.id), limited: true);
    final callId = chat.videoChat.groupCallId;
    Future<td.GroupCall> call() => _client.send<td.GroupCall>(td.GetGroupCall(groupCallId: callId), limited: true);
    if (action != 'start' && callId == 0) {
      return ToolOutput({'chat': c.title, 'video_chat': false, if (action != 'info') 'error': 'There is no video chat in ${c.title} now.'});
    }
    switch (action) {
      case 'info':
        final g = await call();
        return ToolOutput({
          'chat': c.title,
          'video_chat': true,
          'title': g.title,
          'live': g.isActive,
          if (g.scheduledStartDate > 0) 'scheduled_for': TelegramToolRunner._iso(g.scheduledStartDate),
          'participants': g.participantCount,
          if (g.isRtmpStream) 'live_stream': true,
          if (g.recordDuration > 0) 'recording_for_seconds': g.recordDuration,
          'you_can_manage': g.canBeManaged,
          'speaking': [for (final s in g.recentSpeakers) _store.senderName(s.participantId)],
        });
      case 'start':
        final at = DateTime.tryParse('${args['start_at'] ?? ''}');
        final id = await _client.send<td.GroupCallId>(
          td.CreateVideoChat(
            chatId: c.id,
            title: '${args['title'] ?? ''}',
            startDate: at == null ? 0 : at.millisecondsSinceEpoch ~/ 1000,
            isRtmpStream: args['live_stream'] == true,
          ),
          limited: true,
        );
        return ToolOutput({'done': true, 'chat': c.title, 'started': at == null, if (at != null) 'scheduled_for': at.toIso8601String().substring(0, 16), 'group_call_id': id.id});
      case 'end':
        await _client.send<td.Ok>(td.EndGroupCall(groupCallId: callId), limited: true);
      case 'rename':
        await _client.send<td.Ok>(td.SetVideoChatTitle(groupCallId: callId, title: '${args['title'] ?? ''}'), limited: true);
      case 'invite':
        await _client.send<td.Ok>(td.InviteVideoChatParticipants(groupCallId: callId, userIds: _argIds(args, 'user_ids')), limited: true);
      case 'mute_new' || 'unmute_new':
        await _client.send<td.Ok>(td.ToggleVideoChatMuteNewParticipants(groupCallId: callId, muteNewParticipants: action == 'mute_new'), limited: true);
      case 'link':
        final l = await _client.send<td.HttpUrl>(td.GetVideoChatInviteLink(groupCallId: callId, canSelfUnmute: true), limited: true);
        return ToolOutput({'chat': c.title, 'link': l.url});
    }
    return ToolOutput({'done': true, 'chat': c.title, 'action': action});
  }

  // ---- storage and data -----------------------------------------------------------

  static String _mb(int bytes) => bytes >= 1 << 30 ? '${(bytes / (1 << 30)).toStringAsFixed(2)} GB' : '${(bytes / (1 << 20)).toStringAsFixed(1)} MB';

  static String fileTypeName(td.FileType t) => switch (t) {
    td.FileTypePhoto() || td.FileTypePhotoStory() => 'photos',
    td.FileTypeVideo() || td.FileTypeVideoStory() => 'videos',
    td.FileTypeDocument() => 'files',
    td.FileTypeAudio() => 'music',
    td.FileTypeVoiceNote() => 'voice',
    td.FileTypeVideoNote() => 'video_messages',
    td.FileTypeAnimation() => 'gifs',
    td.FileTypeSticker() => 'stickers',
    td.FileTypeProfilePhoto() => 'profile_photos',
    td.FileTypeThumbnail() => 'thumbnails',
    td.FileTypeWallpaper() => 'wallpapers',
    _ => 'other',
  };

  static List<td.FileType> fileTypesFor(String kind) => switch (kind) {
    'photos' => const [td.FileTypePhoto(), td.FileTypePhotoStory()],
    'videos' => const [td.FileTypeVideo(), td.FileTypeVideoStory()],
    'files' => const [td.FileTypeDocument()],
    'music' => const [td.FileTypeAudio()],
    'voice' => const [td.FileTypeVoiceNote()],
    'video_messages' => const [td.FileTypeVideoNote()],
    'gifs' => const [td.FileTypeAnimation()],
    'stickers' => const [td.FileTypeSticker()],
    _ => const [],
  };

  Future<(td.StorageStatisticsFast, td.StorageStatistics)> storage({int chats = 15}) async => (
    await _client.send<td.StorageStatisticsFast>(const td.GetStorageStatisticsFast()),
    await _client.send<td.StorageStatistics>(td.GetStorageStatistics(chatLimit: chats), timeout: const Duration(minutes: 2)),
  );

  Future<ToolOutput> _storageReport(Map<String, dynamic> args) async {
    final (fast, full) = await storage(chats: TelegramToolRunner._int(args, 'chats', fallback: 15, max: 50));
    final byKind = <String, int>{};
    for (final c in full.byChat) {
      for (final t in c.byFileType) {
        byKind.update(fileTypeName(t.fileType), (v) => v + t.size, ifAbsent: () => t.size);
      }
    }
    final kinds = byKind.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return ToolOutput({
      'files': _mb(fast.filesSize),
      'file_count': fast.fileCount,
      'database': _mb(fast.databaseSize),
      'by_kind': {for (final e in kinds) e.key: _mb(e.value)},
      'biggest_chats': [
        for (final c in full.byChat.where((c) => c.chatId != 0))
          {'chat': _store.chat(c.chatId)?.title ?? 'chat ${c.chatId}', 'chat_id': c.chatId, 'size': _mb(c.size), 'files': c.count},
      ],
    });
  }

  /// Runs only after the person approved it in the chat.
  Future<td.StorageStatistics> cleanCache({int? olderThanDays, List<String> kinds = const [], List<int> chatIds = const [], List<int> exceptChatIds = const [], int? keepMb}) =>
      _client.send<td.StorageStatistics>(
        td.OptimizeStorage(
          size: keepMb == null ? 0 : keepMb * 1024 * 1024,
          ttl: olderThanDays == null ? 0 : olderThanDays * 86400,
          count: -1,
          immunityDelay: 0,
          fileTypes: [for (final k in kinds) ...fileTypesFor(k)],
          chatIds: chatIds,
          excludeChatIds: exceptChatIds,
          returnDeletedFileStatistics: true,
          chatLimit: 10,
        ),
        timeout: const Duration(minutes: 3),
      );

  Future<ToolOutput> _cleanStorage(Map<String, dynamic> args) async {
    final freed = await cleanCache(
      olderThanDays: TelegramToolRunner._intOrNull(args, 'older_than_days'),
      kinds: [for (final k in (args['kinds'] as List? ?? const [])) '$k'],
      chatIds: _argIds(args, 'chat_ids'),
      exceptChatIds: _argIds(args, 'except_chat_ids'),
      keepMb: TelegramToolRunner._intOrNull(args, 'keep_mb'),
    );
    return ToolOutput({'done': true, 'freed': _mb(freed.size), 'files_deleted': freed.count});
  }

  Future<td.NetworkStatistics> networkStats() =>
      _client.send<td.NetworkStatistics>(const td.GetNetworkStatistics(onlyCurrent: false));

  /// Sent and received bytes by network ("mobile", "wifi"…) and kind.
  static Map<String, Map<String, (int, int)>> usageTable(td.NetworkStatistics s) {
    final out = <String, Map<String, (int, int)>>{};
    void add(td.NetworkType n, String kind, int sent, int received) {
      final net = switch (n) {
        td.NetworkTypeMobile() => 'mobile',
        td.NetworkTypeMobileRoaming() => 'roaming',
        td.NetworkTypeWiFi() => 'wifi',
        _ => 'other',
      };
      final row = out.putIfAbsent(net, () => {});
      final old = row[kind] ?? (0, 0);
      row[kind] = (old.$1 + sent, old.$2 + received);
    }

    for (final e in s.entries) {
      switch (e) {
        case td.NetworkStatisticsEntryFile(:final fileType, :final networkType, :final sentBytes, :final receivedBytes):
          add(networkType, fileType == null ? 'messages' : fileTypeName(fileType), sentBytes, receivedBytes);
        case td.NetworkStatisticsEntryCall(:final networkType, :final sentBytes, :final receivedBytes):
          add(networkType, 'calls', sentBytes, receivedBytes);
      }
    }
    return out;
  }

  Future<ToolOutput> _dataUsage(Map<String, dynamic> args) async {
    if (args['reset'] == true) {
      return const ToolOutput({'error': 'Resetting the counters is done from Settings → Storage & data in the app.'});
    }
    final s = await networkStats();
    final table = usageTable(s);
    return ToolOutput({
      'since': TelegramToolRunner._iso(s.sinceDate),
      for (final e in table.entries)
        e.key: {
          'total': _mb(e.value.values.fold<int>(0, (a, b) => a + b.$1 + b.$2)),
          for (final k in e.value.entries) k.key: 'up ${_mb(k.value.$1)}, down ${_mb(k.value.$2)}',
        },
    });
  }
}
