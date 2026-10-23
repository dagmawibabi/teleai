part of 'telegram_tools.dart';

// Destructive tools: deleting, leaving, blocking, banning. Each one is off
// until the user turns it on in Settings → Tools → Destructive, and every
// call waits for approval whatever the approval setting says.

final _destructiveTools = <TelegramTool>[
  TelegramTool(
    name: 'delete_messages',
    label: 'Deleting messages',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description:
        'Deletes messages (message_ids) in a chat. for_everyone: true also removes them for the other people where '
        'Telegram allows it (your own messages, or any message as an admin). Can\'t be undone. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_ids': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
      'for_everyone': {'type': 'boolean'},
    }, ['chat_id', 'message_ids']),
  ),
  TelegramTool(
    name: 'clear_chat_history',
    label: 'Clearing a chat',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description:
        'Deletes the whole message history of a chat for the user (for_everyone: true also for the other person in a '
        'private chat). The chat stays in the list. Can\'t be undone. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'for_everyone': {'type': 'boolean'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'leave_chat',
    label: 'Leaving a chat',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description: 'Leaves a group or unsubscribes from a channel. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'delete_chat',
    label: 'Deleting a chat',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description:
        'Removes a chat entirely: for a private chat, deletes its history and removes it from the list; for a group or '
        'channel the user owns, deletes it for all members. Can\'t be undone. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'block_user',
    label: 'Blocking',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description: 'Blocks a user or bot (user_id), or unblocks them with unblock: true. Needs approval.',
    parameters: _obj({
      'user_id': {'type': 'integer'},
      'unblock': {'type': 'boolean'},
    }, ['user_id']),
  ),
  TelegramTool(
    name: 'remove_contact',
    label: 'Removing a contact',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description: 'Removes users (user_ids) from the user\'s contacts. Needs approval.',
    parameters: _obj({
      'user_ids': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
    }, ['user_ids']),
  ),
  TelegramTool(
    name: 'ban_member',
    label: 'Banning a member',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description:
        'As an admin: removes a member (user_id) from a group or channel. kick_only: true lets them rejoin later; '
        'otherwise they are banned (days: for how long, 0 = forever). delete_messages: true also deletes their '
        'messages. unban: true lifts a ban. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer'},
      'kick_only': {'type': 'boolean'},
      'days': {'type': 'integer'},
      'delete_messages': {'type': 'boolean'},
      'unban': {'type': 'boolean'},
    }, ['chat_id', 'user_id']),
  ),
  TelegramTool(
    name: 'delete_all_from_member',
    label: 'Deleting a member\'s messages',
    category: ToolCategory.actions,
    requiresApproval: true,
    destructive: true,
    description: 'As an admin of a group: deletes every message a member (user_id) sent there. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer'},
    }, ['chat_id', 'user_id']),
  ),
];

extension TelegramDestructive on TelegramToolRunner {
  Future<void> deleteMessages(int chatId, List<int> ids, {bool forEveryone = false}) => _client.send<td.Ok>(
    td.DeleteMessages(chatId: chatId, messageIds: ids, revoke: forEveryone),
    limited: true,
  );

  Future<void> clearHistory(int chatId, {bool forEveryone = false}) => _client.send<td.Ok>(
    td.DeleteChatHistory(chatId: chatId, removeFromChatList: false, revoke: forEveryone),
    limited: true,
  );

  Future<void> leaveChat(int chatId) => _client.send<td.Ok>(td.LeaveChat(chatId: chatId), limited: true);

  /// Deletes a group or channel the user owns; for others, removes the
  /// chat and its history from the list.
  Future<void> deleteChat(ChatInfo c) async {
    if (_store.isCreator(c)) {
      await _client.send<td.Ok>(td.DeleteChat(chatId: c.id), limited: true);
    } else if (c.type is td.ChatTypePrivate || c.type is td.ChatTypeSecret) {
      await _client.send<td.Ok>(
        td.DeleteChatHistory(chatId: c.id, removeFromChatList: true, revoke: false),
        limited: true,
      );
    } else {
      await leaveChat(c.id);
      await _client.send<td.Ok>(
        td.DeleteChatHistory(chatId: c.id, removeFromChatList: true, revoke: false),
        limited: true,
      );
    }
  }

  Future<void> setBlocked(int userId, bool blocked) => _client.send<td.Ok>(
    td.SetMessageSenderBlockList(
      senderId: td.MessageSenderUser(userId: userId),
      blockList: blocked ? const td.BlockListMain() : null,
    ),
    limited: true,
  );

  Future<void> removeContacts(List<int> userIds) =>
      _client.send<td.Ok>(td.RemoveContacts(userIds: userIds), limited: true);

  Future<void> banMember(int chatId, int userId, {int days = 0, bool deleteMessages = false}) => _client.send<td.Ok>(
    td.BanChatMember(
      chatId: chatId,
      memberId: td.MessageSenderUser(userId: userId),
      bannedUntilDate: days <= 0 ? 0 : DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch ~/ 1000,
      revokeMessages: deleteMessages,
    ),
    limited: true,
  );

  /// Lifts a ban (or, right after a ban, turns it into a kick).
  Future<void> unbanMember(int chatId, int userId) => _client.send<td.Ok>(
    td.SetChatMemberStatus(
      chatId: chatId,
      memberId: td.MessageSenderUser(userId: userId),
      status: const td.ChatMemberStatusLeft(),
    ),
    limited: true,
  );
}

extension _DestructiveToolRuns on TelegramToolRunner {
  List<int> _ids(Map<String, dynamic> args, String key) => [
    for (final v in (args[key] as List? ?? const []))
      if (v is num) v.toInt() else if (int.tryParse('$v') case final n?) n,
  ];

  int _user(Map<String, dynamic> args) {
    final id = TelegramToolRunner._intOrNull(args, 'user_id');
    if (id == null) throw ArgumentError('user_id is required');
    return id;
  }

  Future<ToolOutput>? _runDestructive(String name, Map<String, dynamic> args) => switch (name) {
    'delete_messages' => () async {
      final c = _requireChat(args);
      final ids = _ids(args, 'message_ids');
      if (ids.isEmpty) throw ArgumentError('message_ids is empty');
      await deleteMessages(c.id, ids, forEveryone: args['for_everyone'] == true);
      return ToolOutput({'deleted': ids.length, 'chat': c.title, 'for_everyone': args['for_everyone'] == true});
    }(),
    'clear_chat_history' => () async {
      final c = _requireChat(args);
      await clearHistory(c.id, forEveryone: args['for_everyone'] == true);
      return ToolOutput({'cleared': true, 'chat': c.title});
    }(),
    'leave_chat' => () async {
      final c = _requireChat(args);
      await leaveChat(c.id);
      return ToolOutput({'left': true, 'chat': c.title});
    }(),
    'delete_chat' => () async {
      final c = _requireChat(args);
      final owned = _store.isCreator(c);
      await deleteChat(c);
      return ToolOutput({'deleted': true, 'chat': c.title, 'for_all_members': owned});
    }(),
    'block_user' => () async {
      final id = _user(args);
      final block = args['unblock'] != true;
      await setBlocked(id, block);
      return ToolOutput({'user': _store.userName(id), 'blocked': block});
    }(),
    'remove_contact' => () async {
      final ids = _ids(args, 'user_ids');
      if (ids.isEmpty) throw ArgumentError('user_ids is empty');
      await removeContacts(ids);
      return ToolOutput({
        'removed': [for (final id in ids) _store.userName(id)],
      });
    }(),
    'ban_member' => () async {
      final c = _requireChat(args);
      final id = _user(args);
      if (args['unban'] == true) {
        await unbanMember(c.id, id);
        return ToolOutput({'unbanned': _store.userName(id), 'chat': c.title});
      }
      await banMember(
        c.id,
        id,
        days: TelegramToolRunner._int(args, 'days', fallback: 0, max: 366),
        deleteMessages: args['delete_messages'] == true,
      );
      if (args['kick_only'] == true) await unbanMember(c.id, id);
      return ToolOutput({
        args['kick_only'] == true ? 'removed' : 'banned': _store.userName(id),
        'chat': c.title,
      });
    }(),
    'delete_all_from_member' => () async {
      final c = _requireChat(args);
      final id = _user(args);
      await _client.send<td.Ok>(
        td.DeleteChatMessagesBySender(chatId: c.id, senderId: td.MessageSenderUser(userId: id)),
        limited: true,
      );
      return ToolOutput({'deleted_all_from': _store.userName(id), 'chat': c.title});
    }(),
    _ => null,
  };

  String? _describeDestructive(String name, Map<String, dynamic> args, String title) {
    String user() => _store.userName(TelegramToolRunner._intOrNull(args, 'user_id') ?? 0);
    return switch (name) {
      'delete_messages' =>
        '⚠ Delete ${(args['message_ids'] as List?)?.length ?? 0} message(s) in $title'
            '${args['for_everyone'] == true ? ' for everyone' : ' for you'}. This can\'t be undone.',
      'clear_chat_history' =>
        '⚠ Clear the whole history of $title${args['for_everyone'] == true ? ' for both sides' : ''}. This can\'t be undone.',
      'leave_chat' => '⚠ Leave $title',
      'delete_chat' => '⚠ Delete $title. This can\'t be undone.',
      'block_user' => args['unblock'] == true ? 'Unblock ${user()}' : '⚠ Block ${user()}',
      'remove_contact' =>
        '⚠ Remove ${[for (final id in _ids(args, 'user_ids')) _store.userName(id)].join(', ')} from contacts',
      'ban_member' =>
        args['unban'] == true
            ? 'Unban ${user()} in $title'
            : '⚠ ${args['kick_only'] == true ? 'Remove' : 'Ban'} ${user()} from $title'
                  '${args['delete_messages'] == true ? ' and delete their messages' : ''}',
      'delete_all_from_member' => '⚠ Delete every message ${user()} sent in $title',
      _ => null,
    };
  }
}
