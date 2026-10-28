part of 'telegram_tools.dart';

// Managing the chat list: unread marks, pins, folders, and the chats the
// user owns or administers.

final _chatTools = <TelegramTool>[
  TelegramTool(
    name: 'translate_message',
    label: 'Translating',
    category: ToolCategory.messages,
    description:
        'Telegram\'s own translation of a message (chat_id, message_id) into to_language (a code like "en", "es"). '
        'Works on Premium accounts or chats with translation on; otherwise translate it yourself.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
      'to_language': {'type': 'string'},
    }, ['chat_id', 'message_id', 'to_language']),
  ),
  TelegramTool(
    name: 'mark_as_unread',
    label: 'Marking as unread',
    category: ToolCategory.chats,
    description: 'Marks a chat as unread (or clears the mark with unread: false), like Telegram\'s "Mark as unread".',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'unread': {'type': 'boolean'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'pin_chat',
    label: 'Pinning a chat',
    category: ToolCategory.chats,
    requiresApproval: true,
    description: 'Pins a chat to the top of the chat list (or unpins with pinned: false). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'pinned': {'type': 'boolean'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'add_chat_to_folder',
    label: 'Changing a folder',
    category: ToolCategory.folders,
    requiresApproval: true,
    description:
        'Adds a chat to one of the user\'s Telegram folders (folder_id from list_chat_folders), or takes it out with '
        'remove: true. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'folder_id': {'type': 'integer'},
      'remove': {'type': 'boolean'},
    }, ['chat_id', 'folder_id']),
  ),
  TelegramTool(
    name: 'list_my_chats',
    label: 'Listing your channels and groups',
    category: ToolCategory.chats,
    cost: ToolCost.local,
    description:
        'Channels, groups and bots by the user\'s role: role "owner" (created by the user), "admin" (owner or admin) '
        'or "member". type: channel, group or bot (bots the user owns, from BotFather).',
    parameters: _obj({
      'type': {
        'type': 'string',
        'enum': ['channel', 'group', 'bot', 'all'],
      },
      'role': {
        'type': 'string',
        'enum': ['owner', 'admin', 'member'],
      },
    }),
  ),
];

/// How the user relates to a chat, for the list filters.
enum ChatRole {
  any('All'),
  owner('Created'),
  admin('Admin'),
  member('Member');

  const ChatRole(this.label);
  final String label;
}

extension TelegramChatList on TelegramToolRunner {
  /// Telegram's translation of [m]; throws when the account can't use it.
  Future<String> translateMessage(td.Message m, String toLanguage) async {
    final r = await _client.send<td.FormattedText>(
      td.TranslateMessageText(chatId: m.chatId, messageId: m.id, toLanguageCode: toLanguage, tone: ''),
      limited: true,
    );
    return r.text;
  }

  /// Marks a chat read up to its newest incoming message, the way opening
  /// it in Telegram does, and clears its unread mark and mentions.
  ///
  /// The view is reported as chat history explicitly: with no source TDLib
  /// guesses from whether the chat is open, and the assistant (or the chat
  /// list's menu) marks chats that aren't, which then stayed unread. The
  /// newest *incoming* message is the one read up to: after the assistant
  /// replies, the chat's last message is its own. [seen] are messages just
  /// read, a quicker way to find it.
  Future<void> markRead(ChatInfo c, {Iterable<td.Message> seen = const []}) async {
    int? newest;
    for (final m in seen) {
      if (m.chatId == c.id && !m.isOutgoing && (newest == null || m.id > newest)) newest = m.id;
    }
    final last = c.lastMessage;
    if (last != null && !last.isOutgoing && (newest == null || last.id > newest)) newest = last.id;
    if (newest == null) {
      try {
        final r = await _client.send<td.Messages>(
          td.GetChatHistory(chatId: c.id, fromMessageId: 0, offset: 0, limit: 20, onlyLocal: false),
          limited: true,
        );
        newest = r.messages.whereType<td.Message>().where((m) => !m.isOutgoing).firstOrNull?.id;
      } catch (_) {}
    }
    final ids = {?newest, ?last?.id}.toList();
    if (ids.isNotEmpty) {
      await _client.send<td.Ok>(
        td.ViewMessages(chatId: c.id, messageIds: ids, source: const td.MessageSourceChatHistory(), forceRead: true),
        limited: true,
      );
    }
    if (c.markedUnread) await markUnread(c.id, false);
    if (c.unreadMentionCount > 0) {
      await _client.send<td.Ok>(td.ReadAllChatMentions(chatId: c.id), limited: true);
    }
  }

  Future<void> markUnread(int chatId, bool unread) => _client.send<td.Ok>(
    td.ToggleChatIsMarkedAsUnread(chatId: chatId, isMarkedAsUnread: unread),
    limited: true,
  );

  Future<void> setPinned(ChatInfo c, bool pinned) => _client.send<td.Ok>(
    td.ToggleChatIsPinned(
      chatList: c.inArchive && !c.inMain ? const td.ChatListArchive() : const td.ChatListMain(),
      chatId: c.id,
      isPinned: pinned,
    ),
    limited: true,
  );

  /// Adds [chatId] to, or takes it out of, a folder's own chat list.
  Future<void> setInFolder(int chatId, int folderId, bool inFolder) async {
    final f = await _client.send<td.ChatFolder>(td.GetChatFolder(chatFolderId: folderId), limited: true);
    final included = [...f.includedChatIds]..remove(chatId);
    final pinned = [...f.pinnedChatIds]..remove(chatId);
    final excluded = [...f.excludedChatIds]..remove(chatId);
    if (inFolder) {
      included.add(chatId);
    } else {
      excluded.add(chatId);
    }
    await _client.send<td.ChatFolderInfo>(
      td.EditChatFolder(
        chatFolderId: folderId,
        folder: f.copyWith(includedChatIds: included, pinnedChatIds: pinned, excludedChatIds: excluded),
      ),
      limited: true,
    );
  }

  bool hasRole(ChatInfo c, ChatRole role) => switch (role) {
    ChatRole.any => true,
    ChatRole.owner => _store.isCreator(c),
    ChatRole.admin => _store.isAdmin(c),
    ChatRole.member => _store.isMember(c) && !_store.isAdmin(c),
  };

  /// Bots the user made with BotFather.
  bool ownsBot(ChatInfo c) => switch (c.type) {
    td.ChatTypePrivate(:final userId) => switch (_store.users[userId]?.type) {
      td.UserTypeBot(:final canBeEdited) => canBeEdited,
      _ => false,
    },
    _ => false,
  };
}

extension _ChatToolRuns on TelegramToolRunner {
  Future<ToolOutput>? _runChats(String name, Map<String, dynamic> args) => switch (name) {
    'translate_message' => () async {
      final c = _requireChat(args);
      final id = TelegramToolRunner._intOrNull(args, 'message_id');
      if (id == null) throw ArgumentError('message_id is required');
      final m = await _client.send<td.Message>(td.GetMessage(chatId: c.id, messageId: id), limited: true);
      try {
        final text = await translateMessage(m, '${args['to_language'] ?? 'en'}');
        return ToolOutput({'translation': text, 'to': args['to_language'], 'ref': 'post:${c.id}:$id'});
      } catch (e) {
        return ToolOutput({
          'error': 'Telegram translation isn\'t available here ($e). Translate the text yourself.',
          'text': gistOf(m.content).text,
        });
      }
    }(),
    'mark_as_unread' => () async {
      final c = _requireChat(args);
      final unread = args['unread'] != false;
      await markUnread(c.id, unread);
      return ToolOutput({'chat': c.title, 'marked_unread': unread});
    }(),
    'pin_chat' => () async {
      final c = _requireChat(args);
      final pinned = args['pinned'] != false;
      await setPinned(c, pinned);
      return ToolOutput({'chat': c.title, 'pinned': pinned});
    }(),
    'add_chat_to_folder' => () async {
      final c = _requireChat(args);
      final folder = TelegramToolRunner._intOrNull(args, 'folder_id');
      if (folder == null) throw ArgumentError('folder_id is required');
      await setInFolder(c.id, folder, args['remove'] != true);
      return ToolOutput({'chat': c.title, 'folder_id': folder, 'in_folder': args['remove'] != true});
    }(),
    'list_my_chats' => () async {
      final type = '${args['type'] ?? 'all'}';
      final role = ChatRole.values.asNameMap()['${args['role'] ?? 'admin'}'] ?? ChatRole.admin;
      final list = _store.chats.values.where((c) {
        if (c.title.isEmpty || !c.isListed) return false;
        final kind = _store.kindOf(c);
        if (type == 'bot' || (type == 'all' && kind == ChatKind.bot)) return kind == ChatKind.bot && ownsBot(c);
        if (kind != ChatKind.channel && kind != ChatKind.group) return false;
        if (type == 'channel' && kind != ChatKind.channel) return false;
        if (type == 'group' && kind != ChatKind.group) return false;
        return hasRole(c, role);
      }).toList();
      return ToolOutput({
        'type': type,
        'role': role.name,
        'count': list.length,
        'chats': [
          for (final c in list)
            {
              'chat_id': c.id,
              'title': c.title,
              'type': _store.kindOf(c).name,
              'role': _store.isCreator(c)
                  ? 'owner'
                  : _store.isAdmin(c)
                  ? 'admin'
                  : 'member',
              if (_store.memberCount(c) case final n?) 'members': n,
              if (_store.chatUsername(c) case final u?) 'username': '@$u',
            },
        ],
      });
    }(),
    _ => null,
  };

  String? _describeChats(String name, Map<String, dynamic> args, String title) => switch (name) {
    'pin_chat' => args['pinned'] == false ? 'Unpin $title from the chat list' : 'Pin $title to the top of the chat list',
    'add_chat_to_folder' =>
      '${args['remove'] == true ? 'Take $title out of' : 'Add $title to'} folder '
          '${_store.folders.where((f) => f.id == args['folder_id']).firstOrNull?.title ?? args['folder_id']}',
    _ => null,
  };
}
