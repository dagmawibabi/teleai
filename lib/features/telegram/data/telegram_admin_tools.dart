part of 'telegram_tools.dart';

// Running groups and channels: members with roles and rights, admins,
// permissions, invite links, join requests, the admin log, and making or
// joining chats. Plus the account's blocked list.

/// An admin's rights, as the names Telegram's apps show.
List<String> adminRightsOf(td.ChatAdministratorRights r) => [
  if (r.canManageChat) 'manage chat',
  if (r.canChangeInfo) 'change info',
  if (r.canPostMessages) 'post messages',
  if (r.canEditMessages) 'edit messages',
  if (r.canDeleteMessages) 'delete messages',
  if (r.canInviteUsers) 'invite users',
  if (r.canRestrictMembers) 'ban users',
  if (r.canPinMessages) 'pin messages',
  if (r.canManageTopics) 'manage topics',
  if (r.canPromoteMembers) 'add admins',
  if (r.canManageVideoChats) 'manage video chats',
  if (r.canPostStories) 'post stories',
  if (r.canEditStories) 'edit stories',
  if (r.canDeleteStories) 'delete stories',
  if (r.isAnonymous) 'anonymous',
];

/// What members may do, by permission name.
Map<String, bool> permissionsOf(td.ChatPermissions p) => {
  'send_messages': p.canSendBasicMessages,
  'send_photos': p.canSendPhotos,
  'send_videos': p.canSendVideos,
  'send_audios': p.canSendAudios,
  'send_documents': p.canSendDocuments,
  'send_voice_notes': p.canSendVoiceNotes,
  'send_video_notes': p.canSendVideoNotes,
  'send_polls': p.canSendPolls,
  'send_stickers_gifs': p.canSendOtherMessages,
  'add_link_previews': p.canAddLinkPreviews,
  'change_info': p.canChangeInfo,
  'invite_users': p.canInviteUsers,
  'pin_messages': p.canPinMessages,
  'create_topics': p.canCreateTopics,
};

td.ChatPermissions _permissionsFrom(td.ChatPermissions base, Map<String, dynamic> m) {
  bool v(String k, bool d) => m[k] is bool ? m[k] as bool : d;
  return td.ChatPermissions(
    canSendBasicMessages: v('send_messages', base.canSendBasicMessages),
    canSendAudios: v('send_audios', base.canSendAudios),
    canSendDocuments: v('send_documents', base.canSendDocuments),
    canSendPhotos: v('send_photos', base.canSendPhotos),
    canSendVideos: v('send_videos', base.canSendVideos),
    canSendVideoNotes: v('send_video_notes', base.canSendVideoNotes),
    canSendVoiceNotes: v('send_voice_notes', base.canSendVoiceNotes),
    canSendPolls: v('send_polls', base.canSendPolls),
    canSendOtherMessages: v('send_stickers_gifs', base.canSendOtherMessages),
    canAddLinkPreviews: v('add_link_previews', base.canAddLinkPreviews),
    canChangeInfo: v('change_info', base.canChangeInfo),
    canInviteUsers: v('invite_users', base.canInviteUsers),
    canPinMessages: v('pin_messages', base.canPinMessages),
    canCreateTopics: v('create_topics', base.canCreateTopics),
  );
}

/// A member's role and what it lets them do.
Map<String, dynamic> memberStatusJson(td.ChatMemberStatus s) => switch (s) {
  td.ChatMemberStatusCreator(:final customTitle, :final isAnonymous, :final isMember) => {
    'role': 'owner',
    if (customTitle.isNotEmpty) 'title': customTitle,
    if (isAnonymous) 'anonymous': true,
    if (!isMember) 'member': false,
  },
  td.ChatMemberStatusAdministrator(:final customTitle, :final rights, :final canBeEdited) => {
    'role': 'admin',
    if (customTitle.isNotEmpty) 'title': customTitle,
    'rights': adminRightsOf(rights),
    'you_can_edit': canBeEdited,
  },
  td.ChatMemberStatusMember(:final memberUntilDate) => {
    'role': 'member',
    if (memberUntilDate > 0) 'until': DateTime.fromMillisecondsSinceEpoch(memberUntilDate * 1000).toIso8601String(),
  },
  td.ChatMemberStatusRestricted(:final permissions, :final restrictedUntilDate, :final isMember) => {
    'role': 'restricted',
    'can': [
      for (final e in permissionsOf(permissions).entries)
        if (e.value) e.key,
    ],
    'cannot': [
      for (final e in permissionsOf(permissions).entries)
        if (!e.value) e.key,
    ],
    if (restrictedUntilDate > 0)
      'until': DateTime.fromMillisecondsSinceEpoch(restrictedUntilDate * 1000).toIso8601String(),
    if (!isMember) 'member': false,
  },
  td.ChatMemberStatusLeft() => {'role': 'left'},
  td.ChatMemberStatusBanned(:final bannedUntilDate) => {
    'role': 'banned',
    if (bannedUntilDate > 0) 'until': DateTime.fromMillisecondsSinceEpoch(bannedUntilDate * 1000).toIso8601String(),
  },
};

const _rightsSchema = {
  'type': 'array',
  'items': {
    'type': 'string',
    'enum': [
      'manage_chat',
      'change_info',
      'post_messages',
      'edit_messages',
      'delete_messages',
      'invite_users',
      'ban_users',
      'pin_messages',
      'manage_topics',
      'add_admins',
      'manage_video_chats',
      'post_stories',
      'edit_stories',
      'delete_stories',
      'anonymous',
    ],
  },
};

const _permissionsSchema = {
  'type': 'object',
  'description':
      'true/false per permission: send_messages, send_photos, send_videos, send_audios, send_documents, '
      'send_voice_notes, send_video_notes, send_polls, send_stickers_gifs, add_link_previews, change_info, '
      'invite_users, pin_messages, create_topics. Unnamed ones keep their current value.',
};

final _adminTools = <TelegramTool>[
  TelegramTool(
    name: 'list_members',
    label: 'Listing members',
    category: ToolCategory.chats,
    description:
        'Members of a group or subscribers of a channel (channels only for admins) with each one\'s role, custom '
        'title, admin rights or restrictions, join date and who added them. filter: recent, admins, bots, '
        'restricted, banned, or search with query.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'filter': {
        'type': 'string',
        'enum': ['recent', 'admins', 'bots', 'restricted', 'banned', 'search'],
      },
      'query': {'type': 'string'},
      'limit': {'type': 'integer', 'description': '1-200, default 50.'},
      'offset': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'get_member',
    label: 'Checking a member',
    category: ToolCategory.chats,
    description: 'One member\'s role, rights or restrictions in a group or channel (user_id), and the chat\'s default permissions.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer'},
    }, ['chat_id', 'user_id']),
  ),
  TelegramTool(
    name: 'get_chat_permissions',
    label: 'Reading permissions',
    category: ToolCategory.chats,
    cost: ToolCost.local,
    description: 'What ordinary members of a group may do (its default permissions), plus slow mode where known.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'set_chat_permissions',
    label: 'Changing permissions',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'As an admin: changes what all members of a group may do. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'permissions': _permissionsSchema,
      'slow_mode_seconds': {'type': 'integer', 'description': '0, 10, 30, 60, 300, 900 or 3600.'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'promote_member',
    label: 'Changing an admin',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'As an admin with that right: makes a member an admin with the given rights and custom title, or demotes '
        'them back to a member with demote: true. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer'},
      'rights': _rightsSchema,
      'title': {'type': 'string'},
      'demote': {'type': 'boolean'},
    }, ['chat_id', 'user_id']),
  ),
  TelegramTool(
    name: 'restrict_member',
    label: 'Restricting a member',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'As an admin: limits what one member may do (e.g. mute them with send_messages false) for days (0 = '
        'forever), or lifts restrictions with lift: true. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer'},
      'permissions': _permissionsSchema,
      'days': {'type': 'integer'},
      'lift': {'type': 'boolean'},
    }, ['chat_id', 'user_id']),
  ),
  TelegramTool(
    name: 'edit_chat_info',
    label: 'Editing chat info',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'As an admin: changes a group\'s or channel\'s title, description, or photo (photo: an attached image\'s name). '
        'Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'title': {'type': 'string'},
      'description': {'type': 'string'},
      'file': {'type': 'string', 'description': 'An image for the chat photo.'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'list_invite_links',
    label: 'Listing invite links',
    category: ToolCategory.chats,
    description: 'Invite links of a group or channel you admin, with their usage, limits and pending requests.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'revoked': {'type': 'boolean'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'create_invite_link',
    label: 'Making an invite link',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Creates an invite link: optional name, expiry in hours, member limit, and approval of joiners '
        '(requires_approval). revoke: an existing link to revoke instead. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'name': {'type': 'string'},
      'expires_hours': {'type': 'integer'},
      'member_limit': {'type': 'integer'},
      'requires_approval': {'type': 'boolean'},
      'revoke': {'type': 'string'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'list_join_requests',
    label: 'Checking join requests',
    category: ToolCategory.chats,
    description: 'People asking to join a group or channel you admin, with their bio and when they asked.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'query': {'type': 'string'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'answer_join_request',
    label: 'Answering a join request',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Approves or declines someone\'s request to join (user_id; approve true or false). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_id': {'type': 'integer'},
      'approve': {'type': 'boolean'},
    }, ['chat_id', 'user_id', 'approve']),
  ),
  TelegramTool(
    name: 'get_admin_log',
    label: 'Reading the admin log',
    category: ToolCategory.chats,
    description:
        'Recent admin actions in a group or channel you admin (last 48 hours): edits, deletions, bans, joins, '
        'leaves, settings changes. query filters by text.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'query': {'type': 'string'},
      'limit': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'add_members',
    label: 'Adding members',
    category: ToolCategory.actions,
    requiresApproval: true,
    description: 'Adds users (user_ids, e.g. contacts) to a group or channel. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'user_ids': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
    }, ['chat_id', 'user_ids']),
  ),
  TelegramTool(
    name: 'create_chat',
    label: 'Creating a chat',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Creates a new channel, group or forum group with a title and description, optionally adding user_ids. '
        'Needs approval.',
    parameters: _obj({
      'type': {
        'type': 'string',
        'enum': ['channel', 'group', 'forum'],
      },
      'title': {'type': 'string'},
      'description': {'type': 'string'},
      'user_ids': {
        'type': 'array',
        'items': {'type': 'integer'},
      },
    }, ['type', 'title']),
  ),
  TelegramTool(
    name: 'join_chat',
    label: 'Joining a chat',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Joins a public channel or group (chat_id or @username) or one by invite link (link). check_only: true '
        'just previews an invite link. Needs approval unless check_only.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'username': {'type': 'string'},
      'link': {'type': 'string'},
      'check_only': {'type': 'boolean'},
    }),
  ),
  TelegramTool(
    name: 'list_blocked',
    label: 'Listing blocked accounts',
    category: ToolCategory.account,
    description: 'Users, bots and chats the user has blocked, with ids for block_user (unblock).',
    parameters: _obj({
      'limit': {'type': 'integer'},
      'offset': {'type': 'integer'},
    }),
  ),
];

extension TelegramAdmin on TelegramToolRunner {
  Future<({List<td.MessageSender> senders, int total})> blocked({int offset = 0, int limit = 100}) async {
    final r = await _client.send<td.MessageSenders>(
      td.GetBlockedMessageSenders(blockList: const td.BlockListMain(), offset: offset, limit: limit),
      limited: true,
    );
    return (senders: r.senders, total: r.totalCount);
  }

  Future<td.ChatMember> member(int chatId, int userId) => _client.send<td.ChatMember>(
    td.GetChatMember(chatId: chatId, memberId: td.MessageSenderUser(userId: userId)),
    limited: true,
  );

  Future<({List<td.ChatMember> members, int total})> members(
    ChatInfo c, {
    String filter = 'recent',
    String query = '',
    int offset = 0,
    int limit = 50,
  }) async {
    switch (c.type) {
      case td.ChatTypeSupergroup(:final supergroupId):
        final f = switch (filter) {
          'admins' => const td.SupergroupMembersFilterAdministrators() as td.SupergroupMembersFilter,
          'bots' => const td.SupergroupMembersFilterBots(),
          'restricted' => td.SupergroupMembersFilterRestricted(query: query),
          'banned' => td.SupergroupMembersFilterBanned(query: query),
          _ when query.isNotEmpty => td.SupergroupMembersFilterSearch(query: query),
          _ => const td.SupergroupMembersFilterRecent(),
        };
        final r = await _client.send<td.ChatMembers>(
          td.GetSupergroupMembers(supergroupId: supergroupId, filter: f, offset: offset, limit: limit.clamp(1, 200)),
          limited: true,
        );
        return (members: r.members, total: r.totalCount);
      case td.ChatTypeBasicGroup(:final basicGroupId):
        final info = await _client.send<td.BasicGroupFullInfo>(
          td.GetBasicGroupFullInfo(basicGroupId: basicGroupId),
          limited: true,
        );
        return (members: info.members, total: info.members.length);
      default:
        throw ArgumentError('${c.title} isn\'t a group or channel.');
    }
  }

  Future<td.ChatPermissions?> chatPermissions(int chatId) async =>
      (await _client.send<td.Chat>(td.GetChat(chatId: chatId), limited: true)).permissions;
}

extension _AdminToolRuns on TelegramToolRunner {
  Map<String, dynamic> _memberJson(td.ChatMember m) => {
    switch (m.memberId) {
      td.MessageSenderUser() => 'user_id',
      td.MessageSenderChat() => 'chat_id',
    }: switch (m.memberId) {
      td.MessageSenderUser(:final userId) => userId,
      td.MessageSenderChat(:final chatId) => chatId,
    },
    'name': _store.senderName(m.memberId),
    if (m.memberId case td.MessageSenderUser(:final userId))
      if (_store.users[userId] case final u?) ...{
        if (_store.username(u.usernames) case final n?) 'username': '@$n',
        if (u.type is td.UserTypeBot) 'bot': true,
      },
    ...memberStatusJson(m.status),
    if (m.joinedChatDate > 0) 'joined': DateTime.fromMillisecondsSinceEpoch(m.joinedChatDate * 1000).toIso8601String().substring(0, 10),
    if (m.inviterUserId != 0) 'added_by': _store.userName(m.inviterUserId),
  };

  int _need(Map<String, dynamic> args, String key) {
    final v = TelegramToolRunner._intOrNull(args, key);
    if (v == null) throw ArgumentError('$key is required');
    return v;
  }

  td.ChatAdministratorRights _rights(List names) {
    final s = {for (final n in names) '$n'};
    return td.ChatAdministratorRights(
      canManageChat: s.contains('manage_chat') || s.isNotEmpty,
      canChangeInfo: s.contains('change_info'),
      canPostMessages: s.contains('post_messages'),
      canEditMessages: s.contains('edit_messages'),
      canDeleteMessages: s.contains('delete_messages'),
      canInviteUsers: s.contains('invite_users'),
      canRestrictMembers: s.contains('ban_users'),
      canPinMessages: s.contains('pin_messages'),
      canManageTopics: s.contains('manage_topics'),
      canPromoteMembers: s.contains('add_admins'),
      canManageVideoChats: s.contains('manage_video_chats'),
      canPostStories: s.contains('post_stories'),
      canEditStories: s.contains('edit_stories'),
      canDeleteStories: s.contains('delete_stories'),
      isAnonymous: s.contains('anonymous'),
    );
  }

  Future<ToolOutput>? _runAdmin(String name, Map<String, dynamic> args) => switch (name) {
    'list_members' => () async {
      final c = _requireChat(args);
      final r = await members(
        c,
        filter: '${args['filter'] ?? 'recent'}',
        query: '${args['query'] ?? ''}',
        offset: TelegramToolRunner._int(args, 'offset', fallback: 0, min: 0),
        limit: TelegramToolRunner._int(args, 'limit', fallback: 50, max: 200),
      );
      return ToolOutput({
        'chat': c.title,
        'total': r.total,
        'shown': r.members.length,
        'members': [for (final m in r.members) _memberJson(m)],
      });
    }(),
    'get_member' => () async {
      final c = _requireChat(args);
      final m = await member(c.id, _need(args, 'user_id'));
      final perms = await chatPermissions(c.id);
      return ToolOutput({
        'chat': c.title,
        ..._memberJson(m),
        if (perms != null) 'chat_default_permissions': permissionsOf(perms),
      });
    }(),
    'get_chat_permissions' => () async {
      final c = _requireChat(args);
      final perms = await chatPermissions(c.id);
      return ToolOutput({
        'chat': c.title,
        if (perms != null) 'permissions': permissionsOf(perms),
        'your_role': memberStatusJson(_store.myStatus(c) ?? const td.ChatMemberStatusMember(memberUntilDate: 0)),
      });
    }(),
    'set_chat_permissions' => () async {
      final c = _requireChat(args);
      if (args['permissions'] is Map) {
        final base = await chatPermissions(c.id);
        if (base == null) throw ArgumentError('Couldn\'t read the current permissions.');
        await _client.send<td.Ok>(
          td.SetChatPermissions(
            chatId: c.id,
            permissions: _permissionsFrom(base, Map<String, dynamic>.from(args['permissions'] as Map)),
          ),
          limited: true,
        );
      }
      if (TelegramToolRunner._intOrNull(args, 'slow_mode_seconds') case final s?) {
        await _client.send<td.Ok>(td.SetChatSlowModeDelay(chatId: c.id, slowModeDelay: s), limited: true);
      }
      return ToolOutput({'chat': c.title, 'updated': true});
    }(),
    'promote_member' => () async {
      final c = _requireChat(args);
      final id = _need(args, 'user_id');
      final status = args['demote'] == true
          ? const td.ChatMemberStatusMember(memberUntilDate: 0) as td.ChatMemberStatus
          : td.ChatMemberStatusAdministrator(
              customTitle: '${args['title'] ?? ''}',
              canBeEdited: true,
              rights: _rights(args['rights'] as List? ?? const ['manage_chat', 'delete_messages', 'pin_messages']),
            );
      await _client.send<td.Ok>(
        td.SetChatMemberStatus(chatId: c.id, memberId: td.MessageSenderUser(userId: id), status: status),
        limited: true,
      );
      return ToolOutput({'chat': c.title, 'user': _store.userName(id), ...memberStatusJson(status)});
    }(),
    'restrict_member' => () async {
      final c = _requireChat(args);
      final id = _need(args, 'user_id');
      final td.ChatMemberStatus status;
      if (args['lift'] == true) {
        status = const td.ChatMemberStatusMember(memberUntilDate: 0);
      } else {
        final base = await chatPermissions(c.id);
        if (base == null) throw ArgumentError('Couldn\'t read the chat\'s permissions.');
        final days = TelegramToolRunner._int(args, 'days', fallback: 0, min: 0, max: 366);
        status = td.ChatMemberStatusRestricted(
          isMember: true,
          restrictedUntilDate: days == 0 ? 0 : DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch ~/ 1000,
          permissions: _permissionsFrom(base, Map<String, dynamic>.from(args['permissions'] as Map? ?? const {})),
        );
      }
      await _client.send<td.Ok>(
        td.SetChatMemberStatus(chatId: c.id, memberId: td.MessageSenderUser(userId: id), status: status),
        limited: true,
      );
      return ToolOutput({'chat': c.title, 'user': _store.userName(id), ...memberStatusJson(status)});
    }(),
    'edit_chat_info' => () async {
      final c = _requireChat(args);
      final done = <String>[];
      if ('${args['title'] ?? ''}'.trim().isNotEmpty) {
        await _client.send<td.Ok>(td.SetChatTitle(chatId: c.id, title: '${args['title']}'.trim()), limited: true);
        done.add('title');
      }
      if (args['description'] != null) {
        await _client.send<td.Ok>(
          td.SetChatDescription(chatId: c.id, description: '${args['description']}'),
          limited: true,
        );
        done.add('description');
      }
      if (args['file'] != null) {
        final path = '${args['file']}';
        if (!File(path).existsSync()) throw ArgumentError('File not found: $path');
        await _client.send<td.Ok>(
          td.SetChatPhoto(
            chatId: c.id,
            photo: td.InputChatPhotoStatic(photo: td.InputFileLocal(path: path)),
          ),
          limited: true,
        );
        done.add('photo');
      }
      return ToolOutput({'chat': c.title, 'changed': done});
    }(),
    'list_invite_links' => () async {
      final c = _requireChat(args);
      final me = _store.me?.id ?? 0;
      final r = await _client.send<td.ChatInviteLinks>(
        td.GetChatInviteLinks(
          chatId: c.id,
          creatorUserId: me,
          isRevoked: args['revoked'] == true,
          offsetDate: 0,
          offsetInviteLink: '',
          limit: 50,
        ),
        limited: true,
      );
      return ToolOutput({
        'chat': c.title,
        'total': r.totalCount,
        'links': [
          for (final l in r.inviteLinks)
            {
              'link': l.inviteLink,
              if (l.name.isNotEmpty) 'name': l.name,
              if (l.isPrimary) 'primary': true,
              'joined': l.memberCount,
              if (l.memberLimit > 0) 'limit': l.memberLimit,
              if (l.pendingJoinRequestCount > 0) 'pending_requests': l.pendingJoinRequestCount,
              if (l.createsJoinRequest) 'needs_approval': true,
              if (l.expirationDate > 0)
                'expires': DateTime.fromMillisecondsSinceEpoch(l.expirationDate * 1000).toIso8601String().substring(0, 16),
              if (l.isRevoked) 'revoked': true,
            },
        ],
      });
    }(),
    'create_invite_link' => () async {
      final c = _requireChat(args);
      if ('${args['revoke'] ?? ''}'.isNotEmpty) {
        await _client.send<td.ChatInviteLinks>(
          td.RevokeChatInviteLink(chatId: c.id, inviteLink: '${args['revoke']}'),
          limited: true,
        );
        return ToolOutput({'revoked': args['revoke']});
      }
      final hours = TelegramToolRunner._int(args, 'expires_hours', fallback: 0, min: 0, max: 24 * 366);
      final l = await _client.send<td.ChatInviteLink>(
        td.CreateChatInviteLink(
          chatId: c.id,
          name: '${args['name'] ?? ''}',
          expirationDate: hours == 0 ? 0 : DateTime.now().add(Duration(hours: hours)).millisecondsSinceEpoch ~/ 1000,
          memberLimit: TelegramToolRunner._int(args, 'member_limit', fallback: 0, min: 0, max: 99999),
          createsJoinRequest: args['requires_approval'] == true,
        ),
        limited: true,
      );
      return ToolOutput({'chat': c.title, 'link': l.inviteLink});
    }(),
    'list_join_requests' => () async {
      final c = _requireChat(args);
      final r = await _client.send<td.ChatJoinRequests>(
        td.GetChatJoinRequests(chatId: c.id, inviteLink: '', query: '${args['query'] ?? ''}', offsetRequest: null, limit: 100),
        limited: true,
      );
      return ToolOutput({
        'chat': c.title,
        'total': r.totalCount,
        'requests': [
          for (final q in r.requests)
            {
              'user_id': q.userId,
              'name': _store.userName(q.userId),
              'asked': DateTime.fromMillisecondsSinceEpoch(q.date * 1000).toIso8601String().substring(0, 16),
              if (q.bio.isNotEmpty) 'bio': q.bio,
            },
        ],
      });
    }(),
    'answer_join_request' => () async {
      final c = _requireChat(args);
      final id = _need(args, 'user_id');
      await _client.send<td.Ok>(
        td.ProcessChatJoinRequest(chatId: c.id, userId: id, approve: args['approve'] == true),
        limited: true,
      );
      return ToolOutput({'chat': c.title, 'user': _store.userName(id), 'approved': args['approve'] == true});
    }(),
    'get_admin_log' => () async {
      final c = _requireChat(args);
      final r = await _client.send<td.ChatEvents>(
        td.GetChatEventLog(
          chatId: c.id,
          query: '${args['query'] ?? ''}',
          fromEventId: 0,
          limit: TelegramToolRunner._int(args, 'limit', fallback: 40, max: 100),
          filters: null,
          userIds: const [],
        ),
        limited: true,
      );
      return ToolOutput({
        'chat': c.title,
        'events': [
          for (final e in r.events)
            {
              'at': DateTime.fromMillisecondsSinceEpoch(e.date * 1000).toIso8601String().substring(0, 16),
              'by': _store.senderName(e.memberId),
              'action': '${e.action.runtimeType}'.replaceFirst('ChatEvent', '').replaceAllMapped(
                RegExp(r'(?<=[a-z])[A-Z]'),
                (m) => ' ${m[0]!.toLowerCase()}',
              ),
            },
        ],
      });
    }(),
    'add_members' => () async {
      final c = _requireChat(args);
      final ids = [
        for (final v in (args['user_ids'] as List? ?? const []))
          if (v is num) v.toInt(),
      ];
      if (ids.isEmpty) throw ArgumentError('user_ids is empty');
      await _client.send<td.FailedToAddMembers>(td.AddChatMembers(chatId: c.id, userIds: ids), limited: true);
      return ToolOutput({
        'chat': c.title,
        'added': [for (final id in ids) _store.userName(id)],
      });
    }(),
    'create_chat' => () async {
      final type = '${args['type'] ?? 'group'}';
      final title = '${args['title'] ?? ''}'.trim();
      if (title.isEmpty) throw ArgumentError('title is required');
      final users = [
        for (final v in (args['user_ids'] as List? ?? const []))
          if (v is num) v.toInt(),
      ];
      final chat = await _client.send<td.Chat>(
        td.CreateNewSupergroupChat(
          title: title,
          isForum: type == 'forum',
          isChannel: type == 'channel',
          description: '${args['description'] ?? ''}',
          location: null,
          messageAutoDeleteTime: 0,
          forImport: false,
        ),
        limited: true,
      );
      if (users.isNotEmpty) {
        await _client.send<td.FailedToAddMembers>(td.AddChatMembers(chatId: chat.id, userIds: users), limited: true);
      }
      return ToolOutput({'created': true, 'chat_id': chat.id, 'title': chat.title, 'type': type});
    }(),
    'join_chat' => () async {
      final link = '${args['link'] ?? ''}'.trim();
      if (link.isNotEmpty) {
        final info = await _client.send<td.ChatInviteLinkInfo>(td.CheckChatInviteLink(inviteLink: link), limited: true);
        if (args['check_only'] == true) {
          return ToolOutput({
            'title': info.title,
            'members': info.memberCount,
            if (info.description.isNotEmpty) 'description': info.description,
            'already_member': info.chatId != 0 && _store.chat(info.chatId) != null,
          });
        }
        final chat = await _client.send<td.Chat>(td.JoinChatByInviteLink(inviteLink: link), limited: true);
        return ToolOutput({'joined': chat.title, 'chat_id': chat.id});
      }
      var id = TelegramToolRunner._intOrNull(args, 'chat_id');
      final username = '${args['username'] ?? ''}'.replaceFirst('@', '').trim();
      if (id == null && username.isNotEmpty) {
        id = (await _client.send<td.Chat>(td.SearchPublicChat(username: username), limited: true)).id;
      }
      if (id == null) throw ArgumentError('Give chat_id, username or link.');
      if (args['check_only'] == true) return ToolOutput({'chat_id': id, 'title': _store.chat(id)?.title});
      await _client.send<td.Ok>(td.JoinChat(chatId: id), limited: true);
      return ToolOutput({'joined': _store.chat(id)?.title ?? id, 'chat_id': id});
    }(),
    'list_blocked' => () async {
      final r = await blocked(
        offset: TelegramToolRunner._int(args, 'offset', fallback: 0, min: 0),
        limit: TelegramToolRunner._int(args, 'limit', fallback: 100, max: 100),
      );
      return ToolOutput({
        'total': r.total,
        'blocked': [
          for (final s in r.senders)
            {
              switch (s) {
                td.MessageSenderUser() => 'user_id',
                td.MessageSenderChat() => 'chat_id',
              }: switch (s) {
                td.MessageSenderUser(:final userId) => userId,
                td.MessageSenderChat(:final chatId) => chatId,
              },
              'name': _store.senderName(s),
              if (s case td.MessageSenderUser(:final userId) when _store.users[userId]?.type is td.UserTypeBot)
                'bot': true,
            },
        ],
      });
    }(),
    _ => null,
  };

  String? _describeAdmin(String name, Map<String, dynamic> args, String title) {
    String user() => _store.userName(TelegramToolRunner._intOrNull(args, 'user_id') ?? 0);
    return switch (name) {
      'set_chat_permissions' =>
        'Change member permissions in $title: ${(args['permissions'] as Map?)?.entries.map((e) => '${e.key} ${e.value == true ? 'on' : 'off'}').join(', ') ?? ''}'
            '${args['slow_mode_seconds'] != null ? ' · slow mode ${args['slow_mode_seconds']}s' : ''}',
      'promote_member' =>
        args['demote'] == true
            ? 'Remove ${user()} as admin of $title'
            : 'Make ${user()} an admin of $title${'${args['title'] ?? ''}'.isEmpty ? '' : ' titled “${args['title']}”'}'
                  ' with: ${(args['rights'] as List? ?? const ['manage_chat', 'delete_messages', 'pin_messages']).join(', ')}',
      'restrict_member' =>
        args['lift'] == true
            ? 'Lift restrictions on ${user()} in $title'
            : 'Restrict ${user()} in $title${(args['days'] ?? 0) == 0 ? '' : ' for ${args['days']} days'}',
      'edit_chat_info' => [
        'Edit $title:',
        if (args['title'] != null) 'title → “${args['title']}”',
        if (args['description'] != null) 'description → “${args['description']}”',
        if (args['file'] != null) 'new photo',
      ].join(' '),
      'create_invite_link' =>
        '${args['revoke'] != null ? 'Revoke invite link ${args['revoke']}' : 'Create an invite link'} for $title',
      'answer_join_request' => '${args['approve'] == true ? 'Approve' : 'Decline'} ${user()}\'s request to join $title',
      'add_members' => 'Add ${(args['user_ids'] as List? ?? const []).length} people to $title',
      'create_chat' => 'Create a new ${args['type']} “${args['title']}”',
      'join_chat' => 'Join ${args['link'] ?? (args['username'] != null ? '@${args['username']}' : title)}',
      _ => null,
    };
  }
}
