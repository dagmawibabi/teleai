part of 'telegram_tools.dart';

// What TDLib 1.8.69 added: rich messages (tables, headings, math…), channel
// direct messages, profile music, welcome messages, private notes about
// people, ephemeral bot commands, bots' streamed drafts, and bots driven
// through the Bot API with their own token.

final _newTools = <TelegramTool>[
  // ---- rich messages ----
  TelegramTool(
    name: 'send_rich_message',
    label: 'Sending a rich message',
    category: ToolCategory.messages,
    requiresApproval: true,
    description:
        'Sends a rich message laid out in blocks: # headings, paragraphs, - bullet / 1. numbered / - [ ] checkbox '
        'lists (nest by indenting), | tables | with :--: alignment, > quotes (a last "— Name" line is the credit), '
        '``` code ```, \$\$ math \$\$ and inline \$math\$, --- dividers, <details><summary>Title</summary> … '
        '</details> collapsibles, and ![caption](file) for an attached photo, video, GIF, audio or file. Inline: '
        '**bold**, _italic_, __underline__, ~~strike~~, ||spoiler||, ==highlight==, `code`, [text](url), ^sup^, '
        '~sub~. Use it for tables, reports and structured answers; plain chat goes through send_message. Some '
        'features may need Telegram Premium. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'markdown': {'type': 'string'},
      'files': {
        'type': 'array',
        'items': {'type': 'string'},
        'description': 'Attached files the markdown shows with ![caption](name).',
      },
      'reply_to_message_id': {'type': 'integer'},
      'topic_id': {'type': 'integer', 'description': 'Forum topic, or channel direct-messages topic.'},
      'rtl': {'type': 'boolean', 'description': 'Right-to-left layout.'},
    }, ['chat_id', 'markdown']),
  ),
  TelegramTool(
    name: 'edit_rich_message',
    label: 'Editing a rich message',
    category: ToolCategory.messages,
    requiresApproval: true,
    description:
        'Replaces the text of one of the user\'s messages with a rich message written in the same Markdown as '
        'send_rich_message (no new media). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
      'markdown': {'type': 'string'},
    }, ['chat_id', 'message_id', 'markdown']),
  ),
  TelegramTool(
    name: 'read_rich_message',
    label: 'Reading a rich message',
    category: ToolCategory.messages,
    description:
        'The whole of a rich message as Markdown (tables, headings, lists…). Messages lists show long ones cut '
        'short; this loads the rest.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),

  // ---- channel direct messages ----
  TelegramTool(
    name: 'list_channel_dms',
    label: 'Reading channel DMs',
    category: ToolCategory.chats,
    description:
        'For a channel the user administers (or its direct-messages group): the people who messaged the '
        'channel, one conversation (topic) each, with unread counts and the last message. Read one with '
        'read_channel_dm; answer with reply_channel_dm.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'limit': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'read_channel_dm',
    label: 'Reading a channel DM',
    category: ToolCategory.messages,
    description: 'Messages of one channel direct-messages conversation (topic_id from list_channel_dms), newest first.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'topic_id': {'type': 'integer'},
      'limit': {'type': 'integer'},
    }, ['chat_id', 'topic_id']),
  ),
  TelegramTool(
    name: 'reply_channel_dm',
    label: 'Answering a channel DM',
    category: ToolCategory.messages,
    requiresApproval: true,
    description:
        'Answers someone in a channel\'s direct messages as the channel. Text, or attached files. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'topic_id': {'type': 'integer'},
      'text': {'type': 'string'},
      'files': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'reply_to_message_id': {'type': 'integer'},
    }, ['chat_id', 'topic_id']),
  ),
  TelegramTool(
    name: 'set_channel_dms',
    label: 'Changing channel DMs',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Turns a channel\'s direct messages on or off (as its owner or an admin), optionally charging '
        'star_price Stars per message (0 = free). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'enabled': {'type': 'boolean'},
      'star_price': {'type': 'integer'},
    }, ['chat_id', 'enabled']),
  ),

  // ---- profile music ----
  TelegramTool(
    name: 'get_profile_music',
    label: 'Reading profile music',
    category: ToolCategory.account,
    description:
        'The songs on someone\'s profile (or the user\'s own with no user_id): title, performer, length and '
        'file_id. send_message can\'t forward them; mention them instead.',
    parameters: _obj({
      'user_id': {'type': 'integer'},
      'limit': {'type': 'integer'},
    }),
  ),
  TelegramTool(
    name: 'add_profile_music',
    label: 'Adding profile music',
    category: ToolCategory.account,
    requiresApproval: true,
    description: 'Adds an attached audio file (mp3, m4a…) to the user\'s own profile music. Needs approval.',
    parameters: _obj({
      'files': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'title': {'type': 'string'},
      'performer': {'type': 'string'},
    }, ['files']),
  ),
  TelegramTool(
    name: 'remove_profile_music',
    label: 'Removing profile music',
    category: ToolCategory.account,
    requiresApproval: true,
    description: 'Removes a song (file_id from get_profile_music) from the user\'s profile. Needs approval.',
    parameters: _obj({
      'file_id': {'type': 'integer'},
    }, ['file_id']),
  ),

  // ---- welcome messages ----
  TelegramTool(
    name: 'list_welcome_messages',
    label: 'Reading welcome messages',
    category: ToolCategory.chats,
    description:
        'The welcome messages a group or channel sends people who join (needs the admin right to send welcome '
        'messages), with their ids.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'set_welcome_message',
    label: 'Setting a welcome message',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Adds a welcome message to a group or channel, or replaces one with welcome_message_id. text may be '
        'Markdown like send_rich_message (sent as a rich message when it has headings, tables or lists); one '
        'attached photo, video or file goes with it. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'text': {'type': 'string'},
      'files': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'welcome_message_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'delete_welcome_message',
    label: 'Deleting a welcome message',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description: 'Deletes one welcome message (or all with all: true) from a group or channel. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'welcome_message_id': {'type': 'integer'},
      'all': {'type': 'boolean'},
    }, ['chat_id']),
  ),

  // ---- read receipts ----
  TelegramTool(
    name: 'message_read_status',
    label: 'Checking if it was read',
    category: ToolCategory.messages,
    description:
        'Whether messages the user sent were read. In a private chat: read or not, and when (if neither side hides '
        'read times and it was sent in the last week). In a group: who viewed it (small groups, recent messages). In '
        'a channel: the view count. Without message_id it checks the user\'s last few messages in the chat. Telegram '
        'never says whether someone merely opened the chat.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer', 'description': 'One of the user\'s own messages; default: their latest ones.'},
      'count': {'type': 'integer', 'description': 'Without message_id: how many recent sent messages, 1-10, default 3.'},
    }, ['chat_id']),
  ),

  // ---- replies and quotes ----
  TelegramTool(
    name: 'get_replied_message',
    label: 'Following a reply',
    category: ToolCategory.messages,
    description:
        'The message another one replies to or quotes (in the same chat or another one), with the quoted part. '
        'Use it to understand a reply in context; its ref opens the original. follow: n walks up a reply chain '
        'up to n steps (default 1, max 10).',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer', 'description': 'The reply.'},
      'follow': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),

  // ---- profile photos ----
  TelegramTool(
    name: 'view_profile_photo',
    label: 'Looking at a profile photo',
    category: ToolCategory.media,
    description:
        'Lets you see someone\'s profile picture (user_id), or a group\'s or channel\'s photo (chat_id), with your '
        'own eyes; count > 1 also shows their earlier profile pictures (users only, up to 6). The pictures come '
        'right after the result, and the user sees them too.',
    parameters: _obj({
      'user_id': {'type': 'integer'},
      'chat_id': {'type': 'integer'},
      'count': {'type': 'integer', 'description': '1-6, default 1.'},
    }),
  ),

  // ---- private notes ----
  TelegramTool(
    name: 'set_private_note',
    label: 'Saving a private note',
    category: ToolCategory.memory,
    description:
        'Saves a private note on a contact\'s profile that only the user sees in Telegram (e.g. "met at the '
        'conference, likes chess"). Empty note clears it. Supports **bold**, _italic_, __underline__, '
        '~~strike~~ and ||spoiler||. Read notes with get_private_note or get_chat_info.',
    parameters: _obj({
      'user_id': {'type': 'integer'},
      'note': {'type': 'string'},
    }, ['user_id', 'note']),
  ),
  TelegramTool(
    name: 'get_private_note',
    label: 'Reading a private note',
    category: ToolCategory.memory,
    description: 'The user\'s private Telegram note on a contact, if any.',
    parameters: _obj({
      'user_id': {'type': 'integer'},
    }, ['user_id']),
  ),

  // ---- ephemeral messages and bot drafts ----
  TelegramTool(
    name: 'send_ephemeral_command',
    label: 'Sending a private bot command',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Sends a bot one of its ephemeral commands in a chat: only that bot receives it, and its answer is '
        'visible only to the user (others in a group see nothing). Only commands the bot marks as ephemeral '
        'work (get_bot_commands shows them). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'bot_user_id': {'type': 'integer'},
      'command': {'type': 'string', 'description': 'e.g. "/balance" or "/stats week".'},
      'reply_to_ephemeral_id': {'type': 'integer', 'description': 'Answer the bot\'s ephemeral message.'},
    }, ['chat_id', 'bot_user_id', 'command']),
  ),
  TelegramTool(
    name: 'get_bot_commands',
    label: 'Reading bot commands',
    category: ToolCategory.chats,
    description: 'A bot\'s commands with descriptions, and which are ephemeral (answered privately).',
    parameters: _obj({
      'bot_user_id': {'type': 'integer'},
    }, ['bot_user_id']),
  ),
  TelegramTool(
    name: 'stop_bot_reply',
    label: 'Stopping a bot reply',
    category: ToolCategory.actions,
    description:
        'Stops a bot (an AI bot, usually) that is still writing its answer in a chat, keeping or dropping what it '
        'wrote as the bot decides.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),

  // ---- bots through the Bot API ----
  TelegramTool(
    name: 'connect_bot',
    label: 'Connecting a bot',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Lets the assistant act as one of the user\'s own bots: fetches its token from @BotFather and keeps it in '
        'the phone\'s secure storage (never shown). Then bot_api and stream_bot_message work with it. '
        'disconnect: true forgets it. Needs approval.',
    parameters: _obj({
      'bot_user_id': {'type': 'integer'},
      'disconnect': {'type': 'boolean'},
    }, ['bot_user_id']),
  ),
  TelegramTool(
    name: 'bot_api',
    label: 'Using the Bot API',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Calls a Telegram Bot API method as a connected bot (connect_bot first), e.g. getMe, getUpdates, '
        'sendMessage {chat_id, text}, setMyCommands {commands: [{command, description}]}, '
        'setMyDescription, setChatMenuButton, getChat, sendPhoto with a URL, answerCallbackQuery, '
        'sendMessageDraft. params is the method\'s JSON body. Reading methods (get…) run without asking; '
        'everything else needs approval.',
    parameters: _obj({
      'bot_user_id': {'type': 'integer'},
      'method': {'type': 'string'},
      'params': {'type': 'object', 'additionalProperties': true},
    }, ['bot_user_id', 'method']),
  ),
  TelegramTool(
    name: 'stream_bot_message',
    label: 'Streaming a bot message',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Has a connected bot write a message to someone live, the way AI bots do: the text appears word by word '
        'as a draft (sendMessageDraft), then lands as a real message. chat_id is the private chat with the '
        'person (their user id); defaults to the user themself. Needs approval.',
    parameters: _obj({
      'bot_user_id': {'type': 'integer'},
      'chat_id': {'type': 'integer'},
      'text': {'type': 'string'},
      'words_per_step': {'type': 'integer', 'description': '1-20, default 4.'},
    }, ['bot_user_id', 'text']),
  ),
];

/// Whether this call waits for approval: Bot API reads (get…) are
/// harmless and run without asking.
bool callNeedsApproval(TelegramTool tool, Map<String, dynamic> args) => switch (tool.name) {
  'bot_api' => !'${args['method'] ?? ''}'.trim().startsWith('get'),
  'device_volume' => deviceCallNeedsApproval(tool.name, args),
  _ => tool.requiresApproval,
};

/// Bot tokens live in the platform keystore, keyed by the bot's user id;
/// the model never sees them.
class _BotTokens {
  static const _storage = FlutterSecureStorage();
  static String _key(int botId) => 'bot_token_$botId';

  static Future<String?> read(int botId) async {
    try {
      return await _storage.read(key: _key(botId));
    } catch (_) {
      return null;
    }
  }

  static Future<void> write(int botId, String token) => _storage.write(key: _key(botId), value: token);
  static Future<void> delete(int botId) => _storage.delete(key: _key(botId));
}

extension _NewTools on TelegramToolRunner {
  Future<ToolOutput>? _runNew(String name, Map<String, dynamic> args) => switch (name) {
    'send_rich_message' => _sendRich(args),
    'edit_rich_message' => () async {
      final c = _requireChat(args);
      final id = TelegramToolRunner._intOrNull(args, 'message_id') ?? (throw ArgumentError('message_id is required'));
      final m = await _client.send<td.Message>(
        td.EditMessageText(
          chatId: c.id,
          messageId: id,
          replyMarkup: null,
          inputMessageContent: td.InputMessageRichMessage(message: markdownToRichMessage('${args['markdown']}'), clearDraft: false),
        ),
        limited: true,
      );
      return ToolOutput({'edited': true, 'chat': c.title, 'ref': 'post:${m.chatId}:${m.id}'});
    }(),
    'read_rich_message' => () async {
      final c = _requireChat(args);
      final id = TelegramToolRunner._intOrNull(args, 'message_id') ?? (throw ArgumentError('message_id is required'));
      final r = await _client.send<td.RichMessage>(td.GetFullRichMessage(chatId: c.id, messageId: id), limited: true);
      return ToolOutput({'chat': c.title, 'message_id': id, 'markdown': richMessageMarkdown(r)});
    }(),
    'list_channel_dms' => _listChannelDms(args),
    'read_channel_dm' => () async {
      final chatId = await _dmGroupOf(_requireChat(args));
      final topic = TelegramToolRunner._intOrNull(args, 'topic_id') ?? (throw ArgumentError('topic_id is required'));
      final limit = TelegramToolRunner._int(args, 'limit', fallback: 30, min: 1, max: 100);
      final msgs = await topicPage(chatId, topic, limit: limit);
      final chat = _store.chat(chatId);
      final out = [for (final m in msgs) _message(m, chat)];
      return ToolOutput({
        'chat': chat?.title,
        'with': ?_dmPeer(chatId, topic),
        'messages': [for (final o in out) o.$1],
      }, posts: [for (final o in out) o.$2]);
    }(),
    'reply_channel_dm' => () async {
      final chatId = await _dmGroupOf(_requireChat(args));
      final topic = TelegramToolRunner._intOrNull(args, 'topic_id') ?? (throw ArgumentError('topic_id is required'));
      final files = [
        for (final f in (args['files'] as List? ?? const []))
          if (File('$f').existsSync()) '$f',
      ];
      final sent = await sendToChat(
        chatId: chatId,
        text: '${args['text'] ?? ''}',
        files: files,
        threadId: topic,
        replyToMessageId: TelegramToolRunner._intOrNull(args, 'reply_to_message_id'),
      );
      return ToolOutput({
        'sent': true,
        'to': _dmPeer(chatId, topic) ?? 'topic $topic',
        'messages': sent.length,
      });
    }(),
    'set_channel_dms' => () async {
      final c = _requireChat(args);
      final price = TelegramToolRunner._int(args, 'star_price', fallback: 0, min: 0, max: 10000);
      await _client.send<td.Ok>(
        td.SetChatDirectMessagesGroup(chatId: c.id, isEnabled: args['enabled'] == true, paidMessageStarCount: price),
        limited: true,
      );
      return ToolOutput({'chat': c.title, 'direct_messages': args['enabled'] == true, if (price > 0) 'stars_per_message': price});
    }(),
    'get_profile_music' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'user_id') ?? _store.me?.id ?? 0;
      final r = await _client.send<td.Audios>(
        td.GetUserProfileAudios(userId: id, offset: 0, limit: TelegramToolRunner._int(args, 'limit', fallback: 20, min: 1, max: 100)),
        limited: true,
      );
      return ToolOutput({
        'user': _store.userName(id),
        'total': r.totalCount,
        'songs': [
          for (final a in r.audios)
            {
              'file_id': a.audio.id,
              'title': a.title.isEmpty ? a.fileName : a.title,
              if (a.performer.isNotEmpty) 'performer': a.performer,
              'length': formatDuration(a.duration),
            },
        ],
      });
    }(),
    'add_profile_music' => () async {
      final files = [
        for (final f in (args['files'] as List? ?? const []))
          if (File('$f').existsSync()) '$f',
      ];
      if (files.isEmpty) throw ArgumentError('Attach an audio file first.');
      for (final f in files) {
        await _client.send<td.Ok>(
          td.AddProfileAudio(
            audio: inputAudio(f, title: '${args['title'] ?? ''}', performer: '${args['performer'] ?? ''}'),
          ),
          limited: true,
        );
      }
      return ToolOutput({'added': files.length});
    }(),
    'remove_profile_music' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'file_id') ?? (throw ArgumentError('file_id is required'));
      await _client.send<td.Ok>(td.RemoveProfileAudio(fileId: id), limited: true);
      return ToolOutput({'removed': true});
    }(),
    'list_welcome_messages' => () async {
      final c = _requireChat(args);
      await _client.send<td.Ok>(td.LoadChatWelcomeMessages(chatId: c.id), limited: true);
      // They arrive as updateChatWelcomeMessages just after.
      for (var i = 0; i < 10 && !_store.welcomeMessages.containsKey(c.id); i++) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
      final list = _store.welcomeMessages[c.id] ?? const <td.WelcomeMessage>[];
      return ToolOutput({
        'chat': c.title,
        'count': list.length,
        'welcome_messages': [
          for (final w in list)
            {
              'welcome_message_id': w.id,
              'kind': gistOf(w.content).kind,
              'text': TelegramToolRunner._clip(gistOf(w.content).text, 600),
            },
        ],
      });
    }(),
    'set_welcome_message' => () async {
      final c = _requireChat(args);
      final content = await _welcomeContent(args);
      final id = TelegramToolRunner._intOrNull(args, 'welcome_message_id');
      if (id == null) {
        await _client.send<td.Ok>(td.AddChatWelcomeMessage(chatId: c.id, inputMessageContent: content), limited: true);
      } else {
        await _client.send<td.Ok>(
          td.EditChatWelcomeMessage(chatId: c.id, welcomeMessageId: id, inputMessageContent: content),
          limited: true,
        );
      }
      return ToolOutput({'chat': c.title, id == null ? 'added' : 'updated': true});
    }(),
    'delete_welcome_message' => () async {
      final c = _requireChat(args);
      if (args['all'] == true) {
        await _client.send<td.Ok>(td.DeleteAllChatWelcomeMessages(chatId: c.id), limited: true);
        return ToolOutput({'chat': c.title, 'deleted': 'all'});
      }
      final id = TelegramToolRunner._intOrNull(args, 'welcome_message_id') ??
          (throw ArgumentError('welcome_message_id is required (or all: true)'));
      await _client.send<td.Ok>(td.DeleteChatWelcomeMessage(chatId: c.id, welcomeMessageId: id), limited: true);
      return ToolOutput({'chat': c.title, 'deleted': id});
    }(),
    'view_profile_photo' => _viewProfilePhoto(args),
    'get_replied_message' => _repliedMessage(args),
    'message_read_status' => _readStatus(args),
    'set_private_note' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'user_id') ?? (throw ArgumentError('user_id is required'));
      final note = '${args['note'] ?? ''}'.trim();
      await _client.send<td.Ok>(td.SetUserNote(userId: id, note: _noteText(note)), limited: true);
      return ToolOutput({'user': _store.userName(id), note.isEmpty ? 'cleared' : 'saved': true});
    }(),
    'get_private_note' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'user_id') ?? (throw ArgumentError('user_id is required'));
      final full = await _client.send<td.UserFullInfo>(td.GetUserFullInfo(userId: id), limited: true);
      final note = full.note?.text ?? '';
      return ToolOutput({'user': _store.userName(id), 'note': note.isEmpty ? null : note});
    }(),
    'send_ephemeral_command' => () async {
      final c = _requireChat(args);
      final bot = TelegramToolRunner._intOrNull(args, 'bot_user_id') ?? (throw ArgumentError('bot_user_id is required'));
      var command = '${args['command'] ?? ''}'.trim();
      if (command.isEmpty) throw ArgumentError('command is required');
      if (!command.startsWith('/')) command = '/$command';
      final replyTo = TelegramToolRunner._intOrNull(args, 'reply_to_ephemeral_id');
      final m = await _client.send<td.Message>(
        td.SendEphemeralMessage(
          chatId: c.id,
          topicId: null,
          receiverUserId: bot,
          callbackQueryId: 0,
          replaceCallbackQueryMessage: false,
          replyTo: replyTo == null ? null : td.InputMessageReplyToEphemeralMessage(ephemeralMessageId: replyTo),
          protectContent: false,
          sendingId: 0,
          onlyPreview: false,
          replyMarkup: null,
          inputMessageContent: td.InputMessageText(
            text: td.FormattedText(text: command, entities: const []),
            linkPreviewOptions: null,
            clearDraft: false,
          ),
        ),
        limited: true,
      );
      return ToolOutput({
        'sent': true,
        'chat': c.title,
        'to_bot': _store.userName(bot),
        'note': 'Only the bot got it; its answer shows only to the user. Read it with get_messages shortly.',
        'message_id': m.id,
      });
    }(),
    'get_bot_commands' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'bot_user_id') ?? (throw ArgumentError('bot_user_id is required'));
      final full = await _client.send<td.UserFullInfo>(td.GetUserFullInfo(userId: id), limited: true);
      final cmds = full.botInfo?.commands ?? const <td.BotCommand>[];
      return ToolOutput({
        'bot': _store.userName(id),
        'commands': [
          for (final cmd in cmds)
            {'command': '/${cmd.command}', 'description': cmd.description, if (cmd.isEphemeral) 'ephemeral': true},
        ],
      });
    }(),
    'stop_bot_reply' => () async {
      final c = _requireChat(args);
      final p = _store.pendingMessages[c.id];
      if (p == null) return ToolOutput({'chat': c.title, 'stopped': false, 'note': 'No bot is writing there right now.'});
      await _client.send<td.Ok>(
        td.StopPendingMessage(chatId: c.id, topicId: forumTopic(p.forumTopicId), draftId: p.draftId),
        limited: true,
      );
      return ToolOutput({'chat': c.title, 'stopped': true});
    }(),
    'connect_bot' => _connectBot(args),
    'bot_api' => () async {
      final bot = TelegramToolRunner._intOrNull(args, 'bot_user_id') ?? (throw ArgumentError('bot_user_id is required'));
      final method = '${args['method'] ?? ''}'.trim();
      if (!RegExp(r'^[A-Za-z]+$').hasMatch(method)) throw ArgumentError('method must be a Bot API method name like sendMessage');
      final params = args['params'] is Map ? Map<String, dynamic>.from(args['params'] as Map) : <String, dynamic>{};
      return ToolOutput({'bot': _store.userName(bot), 'method': method, 'result': await _botApi(bot, method, params)});
    }(),
    'stream_bot_message' => _streamBotMessage(args),
    _ => null,
  };

  String? _describeNew(String name, Map<String, dynamic> args, String title) {
    String user(String key) => _store.userName(TelegramToolRunner._intOrNull(args, key) ?? 0);
    String clip(Object? s, [int n = 400]) => TelegramToolRunner._clip('${s ?? ''}', n);
    return switch (name) {
      'send_rich_message' => 'Send to $title a rich message:\n${clip(args['markdown'], 900)}',
      'edit_rich_message' => 'Replace message ${args['message_id']} in $title with:\n${clip(args['markdown'], 900)}',
      'reply_channel_dm' =>
        'Answer ${_store.directMessagesTopics.values.expand((m) => m.values).where((t) => t.id == TelegramToolRunner._intOrNull(args, 'topic_id')).map((t) => _store.senderName(t.senderId)).firstOrNull ?? 'someone'} '
            'in $title\'s direct messages: “${clip(args['text'])}”'
            '${(args['files'] as List?)?.isNotEmpty == true ? ' with ${(args['files'] as List).length} file(s)' : ''}',
      'set_channel_dms' =>
        args['enabled'] == true
            ? 'Turn on direct messages for $title${(args['star_price'] ?? 0) == 0 ? '' : ' at ${args['star_price']} ⭐ per message'}'
            : 'Turn off direct messages for $title',
      'add_profile_music' => 'Add ${(args['files'] as List? ?? const []).length} song(s) to your profile music',
      'remove_profile_music' => 'Remove song ${args['file_id']} from your profile music',
      'set_welcome_message' =>
        '${args['welcome_message_id'] == null ? 'Add a welcome message to' : 'Replace welcome message ${args['welcome_message_id']} in'} '
            '$title: “${clip(args['text'])}”',
      'delete_welcome_message' =>
        args['all'] == true ? 'Delete every welcome message in $title' : 'Delete welcome message ${args['welcome_message_id']} in $title',
      'send_ephemeral_command' => 'Privately send ${user('bot_user_id')} “${args['command']}” in $title',
      'connect_bot' =>
        args['disconnect'] == true
            ? 'Forget the token of ${user('bot_user_id')}'
            : 'Get ${user('bot_user_id')}\'s token from BotFather and keep it on this phone so the assistant can act as the bot',
      'bot_api' => 'As ${user('bot_user_id')}, call ${args['method']}${args['params'] is Map ? ' ${clip(jsonEncode(args['params']), 500)}' : ''}',
      'stream_bot_message' =>
        'Have ${user('bot_user_id')} write to ${args['chat_id'] == null ? 'you' : _store.chat(TelegramToolRunner._intOrNull(args, 'chat_id') ?? 0)?.title ?? 'chat ${args['chat_id']}'}, live: “${clip(args['text'])}”',
      _ => null,
    };
  }

  Future<ToolOutput> _sendRich(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    var md = '${args['markdown'] ?? ''}';
    if (md.trim().isEmpty) throw ArgumentError('markdown is empty');
    // ![caption](name): names the model knows map to the attached files.
    final files = [for (final f in (args['files'] as List? ?? const [])) '$f'];
    md = md.replaceAllMapped(RegExp(r'!\[([^\]]*)\]\(([^)]+)\)'), (m) {
      final want = m[2]!.trim();
      if (File(want).existsSync()) return m[0]!;
      final hit = files.where((f) => f.toLowerCase().endsWith(want.toLowerCase())).firstOrNull ??
          files.where((f) => f.toLowerCase().contains(want.toLowerCase())).firstOrNull;
      return hit == null ? m[0]! : '![${m[1]}]($hit)';
    });
    final topic = TelegramToolRunner._int(args, 'topic_id', fallback: 0, min: 0);
    final reply = TelegramToolRunner._intOrNull(args, 'reply_to_message_id');
    final busy = await announceSending(c.id, threadId: topic, text: md, files: files);
    busy?.cancel();
    final m = await sendAndSettle(
      td.SendMessage(
        chatId: c.id,
        topicId: topicOf(c.id, topic),
        replyTo: reply == null ? null : replyToMessage(reply),
        options: null,
        replyMarkup: null,
        inputMessageContent: td.InputMessageRichMessage(
          message: markdownToRichMessage(md, rtl: args['rtl'] == true),
          clearDraft: true,
        ),
      ),
      wait: Duration(seconds: files.isEmpty ? 20 : 120),
    );
    return ToolOutput({
      'sent': m.sendingState == null,
      if (m.sendingState != null) 'note': 'Still sending; Telegram hasn\'t confirmed it yet.',
      'chat': c.title,
      'ref': 'post:${m.chatId}:${m.id}',
    }, posts: [_message(m, c).$2]);
  }

  Future<td.InputMessageContent> _welcomeContent(Map<String, dynamic> args) async {
    final text = '${args['text'] ?? ''}'.trim();
    final files = [
      for (final f in (args['files'] as List? ?? const []))
        if (File('$f').existsSync()) '$f',
    ];
    if (files.isNotEmpty) return _mediaContent(files.first, await formatText(text));
    if (text.isEmpty) throw ArgumentError('Give the welcome message some text or a file.');
    if (looksRich(text) || RegExp(r'^\s*([-*]|\d+\.)\s', multiLine: true).hasMatch(text)) {
      return td.InputMessageRichMessage(message: markdownToRichMessage(text), clearDraft: false);
    }
    return td.InputMessageText(text: await formatText(text), linkPreviewOptions: null, clearDraft: false);
  }

  /// Notes allow bold, italic, underline, strikethrough and spoilers.
  td.FormattedText _noteText(String note) {
    final out = StringBuffer();
    final entities = <td.TextEntity>[];
    final marks = <String, td.TextEntityType>{
      '**': const td.TextEntityTypeBold(),
      '__': const td.TextEntityTypeUnderline(),
      '~~': const td.TextEntityTypeStrikethrough(),
      '||': const td.TextEntityTypeSpoiler(),
      '_': const td.TextEntityTypeItalic(),
    };
    var i = 0;
    outer:
    while (i < note.length) {
      for (final e in marks.entries) {
        if (!note.startsWith(e.key, i)) continue;
        final end = note.indexOf(e.key, i + e.key.length);
        if (end <= i + e.key.length) continue;
        final inner = note.substring(i + e.key.length, end);
        // Offsets are in UTF-16 code units, which is what Dart strings count.
        entities.add(td.TextEntity(offset: out.length, length: inner.length, type: e.value));
        out.write(inner);
        i = end + e.key.length;
        continue outer;
      }
      out.write(note[i]);
      i++;
    }
    return td.FormattedText(text: out.toString(), entities: entities);
  }

  /// Who a channel direct-messages topic is with.
  String? _dmPeer(int chatId, int topic) => switch (_store.directMessagesTopics[chatId]?[topic]) {
    final t? => _store.senderName(t.senderId),
    null => null,
  };

  Future<ToolOutput> _readStatus(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    // Fresh read position: the store's can lag behind.
    final chat = await _client.send<td.Chat>(td.GetChat(chatId: c.id), limited: true);
    final kind = _store.kindOf(c);
    final List<td.Message> mine;
    if (TelegramToolRunner._intOrNull(args, 'message_id') case final id?) {
      final m = await _client.send<td.Message>(td.GetMessage(chatId: c.id, messageId: id), limited: true);
      if (!m.isOutgoing) throw ArgumentError('That message isn\'t one the user sent; read status is only for their own.');
      mine = [m];
    } else {
      final count = TelegramToolRunner._int(args, 'count', fallback: 3, min: 1, max: 10);
      final recent = await _history(c, limit: 60);
      mine = recent.where((m) => m.isOutgoing && m.sendingState == null).take(count).toList();
      if (mine.isEmpty) return ToolOutput({'chat': c.title, 'note': 'The user hasn\'t sent anything here recently.'});
    }

    String when(int unix) => TelegramToolRunner._iso(unix);
    final results = <Map<String, dynamic>>[];
    final posts = <PostSnapshot>[];
    for (final m in mine) {
      final (_, post) = _message(m, c);
      posts.add(post);
      final read = m.id <= chat.lastReadOutboxMessageId;
      final r = <String, dynamic>{
        'message_id': m.id,
        'ref': 'post:${m.chatId}:${m.id}',
        'sent': when(m.date),
        'text': TelegramToolRunner._clip(_previewLine(m), 120),
      };
      switch (kind) {
        case ChatKind.channel:
          r['views'] = m.interactionInfo?.viewCount ?? 0;
        case ChatKind.private || ChatKind.bot:
          r['read'] = read;
          if (read) {
            try {
              final d = await _client.send<td.MessageReadDate>(td.GetMessageReadDate(chatId: c.id, messageId: m.id), limited: true);
              switch (d) {
                case td.MessageReadDateRead(:final readDate):
                  r['read_at'] = when(readDate);
                case td.MessageReadDateTooOld():
                  r['read_at'] = 'unknown (sent more than a week ago)';
                case td.MessageReadDateUserPrivacyRestricted():
                  r['read_at'] = 'hidden by their privacy settings';
                case td.MessageReadDateMyPrivacyRestricted():
                  r['read_at'] = 'hidden because the user hides their own read times (Privacy → read times)';
                case td.MessageReadDateUnread():
                  r['read'] = false;
              }
            } on TelegramException {
              // Not offered for this message (too old, a bot…): the ticks still say read.
            }
          }
        case ChatKind.group:
          r['read_by_someone'] = read;
          try {
            final v = await _client.send<td.MessageViewers>(td.GetMessageViewers(chatId: c.id, messageId: m.id), limited: true);
            r['viewed_by'] = [
              for (final x in v.viewers) {'name': _store.userName(x.userId), 'user_id': x.userId, 'at': when(x.viewDate)},
            ];
          } on TelegramException {
            r['viewers'] = 'not available (only in groups up to 100 members, for recent messages)';
          }
        default:
          r['read'] = read;
      }
      results.add(r);
    }
    return ToolOutput({
      'chat': c.title,
      if (kind == ChatKind.private || kind == ChatKind.bot) 'they_read_up_to_message_id': chat.lastReadOutboxMessageId,
      'messages': results,
    }, posts: posts);
  }

  Future<ToolOutput> _repliedMessage(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    var id = TelegramToolRunner._intOrNull(args, 'message_id') ?? (throw ArgumentError('message_id is required'));
    final steps = TelegramToolRunner._int(args, 'follow', fallback: 1, min: 1, max: 10);
    var chatId = c.id;
    final chain = <Map<String, dynamic>>[];
    final posts = <PostSnapshot>[];
    for (var i = 0; i < steps; i++) {
      final reply = await _client.send<td.Message>(td.GetMessage(chatId: chatId, messageId: id), limited: true);
      final to = reply.replyTo;
      if (to is! td.MessageReplyToMessage) {
        if (i == 0) return ToolOutput({'chat': c.title, 'note': 'That message isn\'t a reply.'});
        break;
      }
      final td.Message original;
      try {
        original = await _client.send<td.Message>(td.GetRepliedMessage(chatId: chatId, messageId: id), limited: true);
      } on TelegramException {
        chain.add({
          'step': i + 1,
          'note': 'The original was deleted or is in a chat you can\'t read.',
          if (to.quote case final q?) 'quoted': q.text.text,
        });
        break;
      }
      final (json, post) = _message(original, _store.chat(original.chatId));
      chain.add({
        'step': i + 1,
        ...json,
        if (to.quote case final q?) 'quoted_part': q.text.text,
      });
      posts.add(post);
      chatId = original.chatId;
      id = original.id;
    }
    return ToolOutput({'chat': c.title, 'replied_to': chain}, posts: posts);
  }

  Future<ToolOutput> _viewProfilePhoto(Map<String, dynamic> args) async {
    final count = TelegramToolRunner._int(args, 'count', fallback: 1, min: 1, max: 6);
    var userId = TelegramToolRunner._intOrNull(args, 'user_id');
    final chatId = TelegramToolRunner._intOrNull(args, 'chat_id');
    if (userId == null && chatId == null) throw ArgumentError('Give user_id or chat_id.');
    // A private chat stands for its user.
    if (userId == null) {
      if (_store.chat(chatId!)?.type case td.ChatTypePrivate(userId: final id)) userId = id;
    }
    Future<String?> fetch(td.File f) async {
      if (f.local.isDownloadingCompleted && File(f.local.path).existsSync()) return f.local.path;
      final d = await _client.send<td.File>(
        td.DownloadFile(fileId: f.id, priority: 16, offset: 0, limit: 0, synchronous: true),
        timeout: const Duration(seconds: 60),
      );
      return d.local.isDownloadingCompleted ? d.local.path : null;
    }

    td.File? biggest(List<td.PhotoSize> sizes) {
      if (sizes.isEmpty) return null;
      final s = [...sizes]..sort((a, b) => a.width.compareTo(b.width));
      return s.lastWhere((x) => x.width <= 1280, orElse: () => s.first).photo;
    }

    final paths = <String>[];
    final dates = <String>[];
    String who;
    if (userId != null) {
      who = _store.userName(userId);
      final r = await _client.send<td.ChatPhotos>(td.GetUserProfilePhotos(userId: userId, offset: 0, limit: count), limited: true);
      for (final p in r.photos.take(count)) {
        final f = biggest(p.sizes);
        if (f == null) continue;
        final path = await fetch(f);
        if (path == null) continue;
        paths.add(path);
        dates.add(TelegramToolRunner._iso(p.addedDate).substring(0, 10));
      }
      if (paths.isEmpty) return ToolOutput({'who': who, 'photos': 0, 'note': 'No profile photo, or it is hidden by their privacy settings.'});
      return ToolOutput({
        'who': who,
        'total_photos': r.totalCount,
        'shown': paths.length,
        'added': dates,
        'note': 'The pictures follow in the next message, newest first.',
        '_images': paths,
      });
    }
    final chat = await _client.send<td.Chat>(td.GetChat(chatId: chatId!), limited: true);
    who = chat.title;
    final photo = chat.photo;
    if (photo == null) return ToolOutput({'who': who, 'photos': 0, 'note': 'This chat has no photo.'});
    final path = await fetch(photo.big);
    if (path == null) return ToolOutput({'who': who, 'error': 'Couldn\'t download the photo.'});
    return ToolOutput({'who': who, 'shown': 1, 'note': 'The picture follows in the next message.', '_images': [path]});
  }

  /// A channel's direct-messages group, or the chat itself if it is one.
  Future<int> _dmGroupOf(ChatInfo c) async {
    if (_store.isDirectMessagesGroup(c)) return c.id;
    if (c.type case td.ChatTypeSupergroup(:final supergroupId)) {
      final full = await _client.send<td.SupergroupFullInfo>(td.GetSupergroupFullInfo(supergroupId: supergroupId), limited: true);
      if (full.directMessagesChatId != 0) {
        if (_store.chat(full.directMessagesChatId) == null) {
          await _client.send<td.Chat>(td.GetChat(chatId: full.directMessagesChatId), limited: true);
        }
        return full.directMessagesChatId;
      }
    }
    throw ArgumentError('${c.title} has no direct messages (turn them on with set_channel_dms).');
  }

  Future<ToolOutput> _listChannelDms(Map<String, dynamic> args) async {
    final chatId = await _dmGroupOf(_requireChat(args));
    final limit = TelegramToolRunner._int(args, 'limit', fallback: 30, min: 1, max: 100);
    if ((_store.directMessagesTopics[chatId]?.length ?? 0) < limit) {
      try {
        await _client.send<td.Ok>(td.LoadDirectMessagesChatTopics(chatId: chatId, limit: limit), limited: true);
      } on TelegramException catch (e) {
        if (e.code != 404) rethrow; // 404: all loaded already.
      }
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
    final topics = [...?_store.directMessagesTopics[chatId]?.values]..sort((a, b) => b.order.compareTo(a.order));
    return ToolOutput({
      'chat': _store.chat(chatId)?.title,
      'chat_id': chatId,
      'conversations': [
        for (final t in topics.take(limit))
          {
            'topic_id': t.id,
            'from': _store.senderName(t.senderId),
            if (t.senderId case td.MessageSenderUser(:final userId)) 'user_id': userId,
            if (t.unreadCount > 0) 'unread': t.unreadCount,
            if (t.isMarkedAsUnread) 'marked_unread': true,
            if (!t.canSendUnpaidMessages) 'pays_stars': true,
            if (t.lastMessage case final m?) ...{
              'last': TelegramToolRunner._clip(_previewLine(m), 160),
              'last_from': m.isOutgoing ? 'channel' : 'them',
              'when': TelegramToolRunner._iso(m.date),
            },
          },
      ],
      if (topics.isEmpty) 'note': 'No one has written to the channel yet.',
    });
  }

  Future<ToolOutput> _connectBot(Map<String, dynamic> args) async {
    final bot = TelegramToolRunner._intOrNull(args, 'bot_user_id') ?? (throw ArgumentError('bot_user_id is required'));
    if (args['disconnect'] == true) {
      await _BotTokens.delete(bot);
      return ToolOutput({'bot': _store.userName(bot), 'connected': false});
    }
    final u = _store.users[bot] ?? await _client.send<td.User>(td.GetUser(userId: bot), limited: true);
    final username = _store.username(u.usernames);
    if (username == null) throw ArgumentError('That bot has no username.');
    final chat = await _botFatherChat();
    await _askBotFather(chat, '/token');
    // BotFather answers with the token; read it before it's hidden.
    final reply = await _askBotFatherRaw(chat, '@$username');
    final token = _token.firstMatch(reply)?[0];
    if (token == null) {
      return ToolOutput({
        'connected': false,
        'botfather_said': reply.replaceAll(_token, '[token hidden]'),
        'note': 'BotFather didn\'t give a token; the bot may not be the user\'s.',
      });
    }
    await _BotTokens.write(bot, token);
    final me = await _botApi(bot, 'getMe', const {});
    return ToolOutput({'bot': _store.userName(bot), 'connected': true, 'bot_api_says': me});
  }

  /// One Bot API call; the token never leaves this function.
  Future<Object?> _botApi(int bot, String method, Map<String, dynamic> params) async {
    final token = await _BotTokens.read(bot);
    if (token == null) throw ArgumentError('${_store.userName(bot)} isn\'t connected; use connect_bot first.');
    final r = await http
        .post(
          Uri.parse('https://api.telegram.org/bot$token/$method'),
          headers: {'content-type': 'application/json'},
          body: jsonEncode(params),
        )
        .timeout(const Duration(seconds: 30));
    final body = r.body.replaceAll(token, '[token]');
    final Object? json;
    try {
      json = jsonDecode(body);
    } catch (_) {
      throw ArgumentError('Bot API answered ${r.statusCode}: ${TelegramToolRunner._clip(body, 300)}');
    }
    if (json is Map && json['ok'] != true) {
      throw ArgumentError('Bot API: ${json['description'] ?? 'error ${r.statusCode}'}');
    }
    return json is Map ? json['result'] : json;
  }

  Future<ToolOutput> _streamBotMessage(Map<String, dynamic> args) async {
    final bot = TelegramToolRunner._intOrNull(args, 'bot_user_id') ?? (throw ArgumentError('bot_user_id is required'));
    final to = TelegramToolRunner._intOrNull(args, 'chat_id') ?? _store.me?.id ?? (throw ArgumentError('chat_id is required'));
    final text = '${args['text'] ?? ''}'.trim();
    if (text.isEmpty) throw ArgumentError('text is empty');
    final step = TelegramToolRunner._int(args, 'words_per_step', fallback: 4, min: 1, max: 20);
    final words = text.split(RegExp(r'(?<=\s)'));
    final draftId = DateTime.now().millisecondsSinceEpoch % 2000000000 + 1;
    // An empty draft first shows "Thinking…".
    await _botApi(bot, 'sendMessageDraft', {'chat_id': to, 'draft_id': draftId, 'text': ''});
    var drafts = 1;
    for (var i = step; i < words.length; i += step) {
      await Future<void>.delayed(const Duration(milliseconds: 350));
      await _botApi(bot, 'sendMessageDraft', {'chat_id': to, 'draft_id': draftId, 'text': words.take(i).join()});
      drafts++;
    }
    final sent = await _botApi(bot, 'sendMessage', {'chat_id': to, 'text': text});
    return ToolOutput({
      'bot': _store.userName(bot),
      'to': to == _store.me?.id ? 'you' : _store.chat(to)?.title ?? '$to',
      'draft_updates': drafts,
      'sent': sent is Map ? {'message_id': sent['message_id']} : true,
    });
  }
}
