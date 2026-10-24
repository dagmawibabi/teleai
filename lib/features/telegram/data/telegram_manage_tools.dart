part of 'telegram_tools.dart';

// Stories, chat folders, and running a group or channel beyond the admin
// basics: auto-delete, slow mode, protected content, the other switches,
// topics, boosts, allowed reactions and who joined through which link.

const _privacyChoice = ['everyone', 'contacts', 'close_friends', 'selected'];

final _manageTools = <TelegramTool>[
  // ---- stories ---------------------------------------------------------------
  TelegramTool(
    name: 'list_stories',
    label: 'Listing stories',
    category: ToolCategory.stories,
    description:
        'Stories of a person or channel (chat_id; the user\'s own when missing): the active ones (last 24-48 h), the '
        'ones kept on the profile, and for the user\'s own also the archive. Each with story_id, date, caption, '
        'views and reactions where Telegram shows them.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'include': {'type': 'string', 'enum': ['active', 'profile', 'archive', 'all'], 'description': 'Default all.'},
    }),
  ),
  TelegramTool(
    name: 'view_story',
    label: 'Viewing a story',
    category: ToolCategory.stories,
    description:
        'One story in full: caption, photo or video, privacy, views, reactions and forwards. The picture (or a '
        'video\'s first frame) is shown to the user and can be looked at with view_image. Viewing marks it seen, as '
        'in Telegram, unless peek is true.',
    parameters: _obj({
      'chat_id': {'type': 'integer', 'description': 'Whose story; the user\'s own when missing.'},
      'story_id': {'type': 'integer'},
      'peek': {'type': 'boolean', 'description': 'Don\'t mark it as viewed.'},
    }, ['story_id']),
  ),
  TelegramTool(
    name: 'story_viewers',
    label: 'Seeing who viewed a story',
    category: ToolCategory.stories,
    description: 'Who viewed one of the user\'s own stories (or a channel\'s they admin), who reacted with what, and who forwarded or reposted it.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'story_id': {'type': 'integer'},
      'query': {'type': 'string', 'description': 'Only viewers whose name matches.'},
      'limit': {'type': 'integer'},
    }, ['story_id']),
  ),
  TelegramTool(
    name: 'post_story',
    label: 'Posting a story',
    category: ToolCategory.stories,
    requiresApproval: true,
    description:
        'Posts a photo or video (up to 60 s) as a story, from a file of this conversation, with an optional caption. '
        'Privacy: everyone, contacts, close_friends or selected (user_ids). active_hours 6, 12, 24 or 48 (6/12/48 need '
        'Premium). keep_on_profile keeps it on the profile after it expires. chat_id posts for a channel the user '
        'can post stories in. The user approves it first.',
    parameters: _obj({
      'files': {'type': 'array', 'items': {'type': 'string'}, 'description': 'Exactly one photo or video.'},
      'caption': {'type': 'string'},
      'privacy': {'type': 'string', 'enum': _privacyChoice},
      'user_ids': {'type': 'array', 'items': {'type': 'integer'}, 'description': 'For selected: who sees it; for everyone/contacts: who doesn\'t.'},
      'active_hours': {'type': 'integer'},
      'keep_on_profile': {'type': 'boolean'},
      'protect': {'type': 'boolean', 'description': 'Viewers can\'t save or screenshot it.'},
      'chat_id': {'type': 'integer'},
    }, ['files']),
  ),
  TelegramTool(
    name: 'edit_story',
    label: 'Editing a story',
    category: ToolCategory.stories,
    requiresApproval: true,
    description: 'Changes one of the user\'s stories: its caption, its photo/video (files), its privacy, or whether it stays on the profile. Needs approval.',
    parameters: _obj({
      'story_id': {'type': 'integer'},
      'chat_id': {'type': 'integer', 'description': 'For a channel\'s story.'},
      'caption': {'type': 'string'},
      'files': {'type': 'array', 'items': {'type': 'string'}},
      'privacy': {'type': 'string', 'enum': _privacyChoice},
      'user_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'keep_on_profile': {'type': 'boolean'},
    }, ['story_id']),
  ),
  TelegramTool(
    name: 'delete_story',
    label: 'Deleting a story',
    category: ToolCategory.stories,
    requiresApproval: true,
    destructive: true,
    description: 'Deletes one of the user\'s stories (or a channel\'s they manage) for everyone. Can\'t be undone.',
    parameters: _obj({
      'story_id': {'type': 'integer'},
      'chat_id': {'type': 'integer'},
    }, ['story_id']),
  ),
  TelegramTool(
    name: 'react_to_story',
    label: 'Reacting to a story',
    category: ToolCategory.stories,
    requiresApproval: true,
    description: 'Puts an emoji reaction on someone\'s story, or removes the user\'s reaction (emoji empty). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'story_id': {'type': 'integer'},
      'emoji': {'type': 'string'},
    }, ['chat_id', 'story_id']),
  ),

  // ---- folders ---------------------------------------------------------------
  TelegramTool(
    name: 'get_folder',
    label: 'Reading a folder',
    category: ToolCategory.folders,
    description: 'A chat folder\'s full rules: its name, icon, the chats included, excluded and pinned, and the chat types it takes in.',
    parameters: _obj({
      'folder_id': {'type': 'integer'},
    }, ['folder_id']),
  ),
  TelegramTool(
    name: 'create_folder',
    label: 'Creating a folder',
    category: ToolCategory.folders,
    requiresApproval: true,
    description:
        'Creates a Telegram chat folder: a name, chats to include (chat_ids), and/or whole types (contacts, '
        'non_contacts, bots, groups, channels), chats to exclude, and filters (exclude_muted, exclude_read, '
        'exclude_archived). icon: All, Unread, Unmuted, Bots, Channels, Groups, Private, Custom, Setup, Cat, Crown, '
        'Favorite, Flower, Game, Home, Love, Mask, Party, Sport, Study, Trade, Travel, Work. Needs approval.',
    parameters: _obj({
      'title': {'type': 'string'},
      'icon': {'type': 'string'},
      'chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'pinned_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'exclude_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'include_types': {
        'type': 'array',
        'items': {'type': 'string', 'enum': ['contacts', 'non_contacts', 'bots', 'groups', 'channels']},
      },
      'exclude_muted': {'type': 'boolean'},
      'exclude_read': {'type': 'boolean'},
      'exclude_archived': {'type': 'boolean'},
    }, ['title']),
  ),
  TelegramTool(
    name: 'edit_folder',
    label: 'Editing a folder',
    category: ToolCategory.folders,
    requiresApproval: true,
    description:
        'Changes a chat folder: rename, change icon, add_chat_ids / remove_chat_ids, pin chats, change the included '
        'types or filters. Unmentioned settings stay. Needs approval.',
    parameters: _obj({
      'folder_id': {'type': 'integer'},
      'title': {'type': 'string'},
      'icon': {'type': 'string'},
      'add_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'remove_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'pinned_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'exclude_chat_ids': {'type': 'array', 'items': {'type': 'integer'}},
      'include_types': {
        'type': 'array',
        'items': {'type': 'string', 'enum': ['contacts', 'non_contacts', 'bots', 'groups', 'channels']},
      },
      'exclude_muted': {'type': 'boolean'},
      'exclude_read': {'type': 'boolean'},
      'exclude_archived': {'type': 'boolean'},
    }, ['folder_id']),
  ),
  TelegramTool(
    name: 'delete_folder',
    label: 'Deleting a folder',
    category: ToolCategory.folders,
    requiresApproval: true,
    description: 'Deletes a chat folder. The chats themselves stay. Needs approval.',
    parameters: _obj({
      'folder_id': {'type': 'integer'},
    }, ['folder_id']),
  ),
  TelegramTool(
    name: 'reorder_folders',
    label: 'Reordering folders',
    category: ToolCategory.folders,
    requiresApproval: true,
    description: 'Puts the chat folders in a new order (all folder_ids, first to last). Needs approval.',
    parameters: _obj({
      'folder_ids': {'type': 'array', 'items': {'type': 'integer'}},
    }, ['folder_ids']),
  ),
  TelegramTool(
    name: 'suggested_folders',
    label: 'Getting folder ideas',
    category: ToolCategory.folders,
    description: 'Folders Telegram suggests for this account (e.g. "Unread", "Personal"), ready to create with create_folder.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'share_folder',
    label: 'Sharing a folder',
    category: ToolCategory.folders,
    requiresApproval: true,
    description:
        'Makes an invite link to a folder so others can add it with its chats (groups and channels only), or lists '
        'its existing links (list: true). Needs approval to make one.',
    parameters: _obj({
      'folder_id': {'type': 'integer'},
      'chat_ids': {'type': 'array', 'items': {'type': 'integer'}, 'description': 'Which of its chats the link includes; all shareable ones when missing.'},
      'name': {'type': 'string'},
      'list': {'type': 'boolean'},
    }, ['folder_id']),
  ),

  // ---- running chats -------------------------------------------------------------
  TelegramTool(
    name: 'set_chat_settings',
    label: 'Changing chat settings',
    category: ToolCategory.chats,
    requiresApproval: true,
    description:
        'Changes how a chat works (as its admin, or for a private chat where it applies): auto_delete (seconds: 0 off, '
        '86400 a day, 604800 a week, 2678400 a month), slow_mode (seconds between messages: 0, 10, 30, 60, 300, 900, '
        '3600), protect_content (no forwarding or saving), history_for_new_members, join_by_request, '
        'join_to_send (must join to write in a discussion group), sign_messages and show_author (channels), '
        'hide_members, aggressive_antispam, translatable, username (public link; empty makes it private), '
        'discussion_chat_id (link a channel\'s comments group; 0 unlinks). Only the given ones change. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'auto_delete': {'type': 'integer'},
      'slow_mode': {'type': 'integer'},
      'protect_content': {'type': 'boolean'},
      'history_for_new_members': {'type': 'boolean'},
      'join_by_request': {'type': 'boolean'},
      'join_to_send': {'type': 'boolean'},
      'sign_messages': {'type': 'boolean'},
      'show_author': {'type': 'boolean'},
      'hide_members': {'type': 'boolean'},
      'aggressive_antispam': {'type': 'boolean'},
      'translatable': {'type': 'boolean'},
      'username': {'type': 'string'},
      'discussion_chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'set_chat_reactions',
    label: 'Changing allowed reactions',
    category: ToolCategory.chats,
    requiresApproval: true,
    description: 'Which reactions members may use in a group or channel the user admins: all, some (emojis), or none. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'mode': {'type': 'string', 'enum': ['all', 'some', 'none']},
      'emojis': {'type': 'array', 'items': {'type': 'string'}},
      'max_per_message': {'type': 'integer', 'description': 'Different reactions a message may get, 1-11.'},
    }, ['chat_id', 'mode']),
  ),
  TelegramTool(
    name: 'manage_topic',
    label: 'Managing a topic',
    category: ToolCategory.chats,
    requiresApproval: true,
    description:
        'In a group with topics: create one (name, no topic_id), or change one (topic_id): rename, close or reopen '
        '(closed), pin or unpin (pinned). Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'topic_id': {'type': 'integer'},
      'name': {'type': 'string'},
      'closed': {'type': 'boolean'},
      'pinned': {'type': 'boolean'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'delete_topic',
    label: 'Deleting a topic',
    category: ToolCategory.chats,
    requiresApproval: true,
    destructive: true,
    description: 'Deletes a topic of a group with all its messages. Can\'t be undone.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'topic_id': {'type': 'integer'},
    }, ['chat_id', 'topic_id']),
  ),
  TelegramTool(
    name: 'get_boosts',
    label: 'Checking boosts',
    category: ToolCategory.chats,
    description: 'A channel\'s or group\'s boost level, how many boosts it has and needs for the next level, Premium members, and (for admins) who boosted it.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'invite_link_joins',
    label: 'Seeing who joined by a link',
    category: ToolCategory.chats,
    description: 'Who joined a group or channel through one of its invite links (from list_invite_links), and when.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'invite_link': {'type': 'string'},
      'limit': {'type': 'integer'},
    }, ['chat_id', 'invite_link']),
  ),
];

extension _ManageTools on TelegramToolRunner {
  Future<ToolOutput>? _runManage(String name, Map<String, dynamic> args) => switch (name) {
    'list_stories' => _listStories(args),
    'view_story' => _viewStory(args),
    'story_viewers' => _storyViewers(args),
    'post_story' => _postStory(args),
    'edit_story' => _editStory(args),
    'delete_story' => _deleteStory(args),
    'react_to_story' => _reactStory(args),
    'get_folder' => _getFolder(args),
    'create_folder' => _createFolder(args),
    'edit_folder' => _editFolder(args),
    'delete_folder' => _deleteFolder(args),
    'reorder_folders' => _reorderFolders(args),
    'suggested_folders' => _suggestedFolders(),
    'share_folder' => _shareFolder(args),
    'set_chat_settings' => _chatSettings(args),
    'set_chat_reactions' => _chatReactions(args),
    'manage_topic' => _manageTopic(args),
    'delete_topic' => _deleteTopic(args),
    'get_boosts' => _boosts(args),
    'invite_link_joins' => _linkJoins(args),
    _ => null,
  };

  String? _describeManage(String name, Map<String, dynamic> args, String title) {
    String list(String k) => [for (final v in (args[k] as List? ?? const [])) _store.chat((v as num).toInt())?.title ?? '$v'].join(', ');
    String folder() {
      final id = TelegramToolRunner._intOrNull(args, 'folder_id');
      return _store.folders.where((f) => f.id == id).firstOrNull?.title ?? 'folder $id';
    }

    return switch (name) {
      'post_story' => [
        'Post a story${args['chat_id'] == null ? '' : ' for $title'}: ${'${(args['files'] as List?)?.firstOrNull ?? '?'}'.split(RegExp(r'[\\/]')).last}',
        if ('${args['caption'] ?? ''}'.isNotEmpty) 'Caption: “${args['caption']}”',
        'Visible to: ${args['privacy'] ?? 'everyone'}${(args['user_ids'] as List?)?.isNotEmpty == true ? ' (${list('user_ids')})' : ''}',
        if (args['keep_on_profile'] == true) 'Kept on the profile',
      ].join('\n'),
      'edit_story' => 'Edit story ${args['story_id']}${args['caption'] != null ? ': caption “${args['caption']}”' : ''}'
          '${(args['files'] as List?)?.isNotEmpty == true ? ', new media' : ''}${args['privacy'] != null ? ', visible to ${args['privacy']}' : ''}',
      'delete_story' => 'Delete story ${args['story_id']}',
      'react_to_story' => '${'${args['emoji'] ?? ''}'.isEmpty ? 'Remove your reaction from' : 'React ${args['emoji']} to'} $title\'s story ${args['story_id']}',
      'create_folder' => 'Create the folder “${args['title']}”${(args['chat_ids'] as List?)?.isNotEmpty == true ? ' with ${list('chat_ids')}' : ''}'
          '${(args['include_types'] as List?)?.isNotEmpty == true ? ' + all ${(args['include_types'] as List).join(', ')}' : ''}',
      'edit_folder' => [
        'Edit the folder “${folder()}”',
        if (args['title'] != null) 'Rename to “${args['title']}”',
        if ((args['add_chat_ids'] as List?)?.isNotEmpty == true) 'Add ${list('add_chat_ids')}',
        if ((args['remove_chat_ids'] as List?)?.isNotEmpty == true) 'Remove ${list('remove_chat_ids')}',
      ].join('\n'),
      'delete_folder' => 'Delete the folder “${folder()}” (its chats stay)',
      'reorder_folders' => 'Reorder folders: ${[for (final id in (args['folder_ids'] as List? ?? const [])) _store.folders.where((f) => f.id == id).firstOrNull?.title ?? '$id'].join(' → ')}',
      'share_folder' => 'Make an invite link to the folder “${folder()}”',
      'set_chat_settings' => 'Change $title: ${[
        for (final e in args.entries)
          if (e.key != 'chat_id') '${e.key.replaceAll('_', ' ')} → ${e.value}',
      ].join(', ')}',
      'set_chat_reactions' => 'Allow ${args['mode'] == 'some' ? (args['emojis'] as List? ?? const []).join(' ') : args['mode']} reactions in $title',
      'manage_topic' => args['topic_id'] == null
          ? 'Create the topic “${args['name']}” in $title'
          : 'Change topic ${args['topic_id']} in $title: ${[
              if (args['name'] != null) 'rename to “${args['name']}”',
              if (args['closed'] != null) args['closed'] == true ? 'close it' : 'reopen it',
              if (args['pinned'] != null) args['pinned'] == true ? 'pin it' : 'unpin it',
            ].join(', ')}',
      'delete_topic' => 'Delete topic ${args['topic_id']} in $title and all its messages',
      _ => null,
    };
  }

  // ---- stories ---------------------------------------------------------------

  int _storyChat(Map<String, dynamic> args) => TelegramToolRunner._intOrNull(args, 'chat_id') ?? _store.me?.id ?? 0;

  Map<String, dynamic> _storyJson(td.Story s) {
    final i = s.interactionInfo;
    return {
      'story_id': s.id,
      'date': TelegramToolRunner._iso(s.date),
      'kind': switch (s.content) {
        td.StoryContentPhoto() => 'photo',
        td.StoryContentVideo(:final video) => 'video ${video.duration.round()}s',
        _ => 'other',
      },
      if (s.caption.text.isNotEmpty) 'caption': TelegramToolRunner._clip(s.caption.text, 500),
      if (s.isPostedToChatPage) 'on_profile': true,
      'visible_to': switch (s.privacySettings) {
        td.StoryPrivacySettingsEveryone() => 'everyone',
        td.StoryPrivacySettingsContacts() => 'contacts',
        td.StoryPrivacySettingsCloseFriends() => 'close friends',
        td.StoryPrivacySettingsSelectedUsers(:final userIds) => '${userIds.length} selected people',
      },
      if (i != null) ...{
        'views': i.viewCount,
        if (i.reactionCount > 0) 'reactions': i.reactionCount,
        if (i.forwardCount > 0) 'forwards': i.forwardCount,
      },
      if (s.chosenReactionType case td.ReactionTypeEmoji(:final emoji)) 'your_reaction': emoji,
    };
  }

  Future<td.Story> _story(int chatId, int storyId) =>
      _client.send<td.Story>(td.GetStory(storyPosterChatId: chatId, storyId: storyId, onlyLocal: false), limited: true);

  Future<ToolOutput> _listStories(Map<String, dynamic> args) async {
    final chatId = _storyChat(args);
    final include = '${args['include'] ?? 'all'}';
    final own = chatId == _store.me?.id;
    final out = <String, dynamic>{'chat': own ? 'You' : (_store.chat(chatId)?.title ?? 'chat $chatId')};
    Future<List<Map<String, dynamic>>> load(List<int> ids) async => [
      for (final id in ids.take(30)) _storyJson(await _story(chatId, id)),
    ];
    if (include == 'active' || include == 'all') {
      final a = await _client.send<td.ChatActiveStories>(td.GetChatActiveStories(chatId: chatId), limited: true);
      out['active'] = await load([for (final s in a.stories) s.storyId]);
    }
    if (include == 'profile' || include == 'all') {
      final p = await _client.send<td.Stories>(td.GetChatPostedToChatPageStories(chatId: chatId, fromStoryId: 0, limit: 30), limited: true);
      out['on_profile'] = [for (final s in p.stories) _storyJson(s)];
    }
    if ((include == 'archive' || include == 'all') && own) {
      try {
        final a = await _client.send<td.Stories>(td.GetChatArchivedStories(chatId: chatId, fromStoryId: 0, limit: 30), limited: true);
        out['archive'] = [for (final s in a.stories) _storyJson(s)];
      } on TelegramException {
        // Only the owner sees the archive.
      }
    }
    return ToolOutput(out);
  }

  Future<ToolOutput> _viewStory(Map<String, dynamic> args) async {
    final chatId = _storyChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'story_id');
    if (id == null) throw ArgumentError('story_id is required');
    final s = await _story(chatId, id);
    if (args['peek'] != true && chatId != _store.me?.id) {
      try {
        await _client.send<td.Ok>(td.OpenStory(storyPosterChatId: chatId, storyId: id), limited: true);
        await _client.send<td.Ok>(td.CloseStory(storyPosterChatId: chatId, storyId: id));
      } catch (_) {}
    }
    final picture = switch (s.content) {
      td.StoryContentPhoto(:final photo) => TdFileImagePick.best(photo),
      td.StoryContentVideo(:final video) => video.thumbnail?.file,
      _ => null,
    };
    String? path;
    if (picture != null) {
      final f = await _client.send<td.File>(
        td.DownloadFile(fileId: picture.id, priority: 16, offset: 0, limit: 0, synchronous: true),
        timeout: const Duration(seconds: 60),
      );
      if (f.local.isDownloadingCompleted) path = f.local.path;
    }
    return ToolOutput({
      'chat': chatId == _store.me?.id ? 'You' : (_store.chat(chatId)?.title ?? 'chat $chatId'),
      ..._storyJson(s),
      'image_path': ?path,
      if (path != null) 'note': 'The picture is shown to the user; look at it with view_image.',
    });
  }

  Future<ToolOutput> _storyViewers(Map<String, dynamic> args) async {
    final id = TelegramToolRunner._intOrNull(args, 'story_id');
    if (id == null) throw ArgumentError('story_id is required');
    final chatId = _storyChat(args);
    final td.StoryInteractions r;
    if (chatId == _store.me?.id) {
      r = await _client.send<td.StoryInteractions>(
        td.GetStoryInteractions(
          storyId: id,
          query: '${args['query'] ?? ''}',
          onlyContacts: false,
          preferForwards: false,
          preferWithReaction: true,
          offset: '',
          limit: TelegramToolRunner._int(args, 'limit', fallback: 50, max: 100),
        ),
        limited: true,
      );
    } else {
      r = await _client.send<td.StoryInteractions>(
        td.GetChatStoryInteractions(
          storyPosterChatId: chatId,
          storyId: id,
          reactionType: null,
          preferForwards: false,
          offset: '',
          limit: TelegramToolRunner._int(args, 'limit', fallback: 50, max: 100),
        ),
        limited: true,
      );
    }
    return ToolOutput({
      'story_id': id,
      'viewers': r.totalCount,
      'reactions': r.totalReactionCount,
      'forwards': r.totalForwardCount,
      'people': [
        for (final i in r.interactions)
          {
            'name': _store.senderName(i.actorId),
            'when': TelegramToolRunner._iso(i.interactionDate),
            ...switch (i.type) {
              td.StoryInteractionTypeView(:final chosenReactionType) => {
                'did': 'viewed',
                if (chosenReactionType case td.ReactionTypeEmoji(:final emoji)) 'reaction': emoji,
              },
              td.StoryInteractionTypeForward() => {'did': 'forwarded it'},
              td.StoryInteractionTypeRepost() => {'did': 'reposted it'},
            },
          },
      ],
    });
  }

  td.StoryPrivacySettings _storyPrivacy(Map<String, dynamic> args) {
    final ids = [for (final v in (args['user_ids'] as List? ?? const [])) if (v is num) v.toInt()];
    return switch ('${args['privacy'] ?? 'everyone'}') {
      'contacts' => td.StoryPrivacySettingsContacts(exceptUserIds: ids),
      'close_friends' => const td.StoryPrivacySettingsCloseFriends(),
      'selected' => td.StoryPrivacySettingsSelectedUsers(userIds: ids),
      _ => td.StoryPrivacySettingsEveryone(exceptUserIds: ids),
    };
  }

  /// A photo or a video (measured, as Telegram wants its length) for a story.
  Future<td.InputStoryContent> _storyContent(Map<String, dynamic> args) async {
    final file = [for (final f in (args['files'] as List? ?? const [])) if (File('$f').existsSync()) '$f'].firstOrNull;
    if (file == null) throw ArgumentError('Give one photo or video from this conversation in files.');
    if (TelegramToolRunner._isVideo(file)) {
      final probe = VideoPlayerController.file(File(file));
      double seconds = 0;
      try {
        await probe.initialize();
        seconds = probe.value.duration.inMilliseconds / 1000;
      } catch (_) {
      } finally {
        await probe.dispose();
      }
      if (seconds > 60) throw ArgumentError('Story videos can be at most 60 seconds; this one is ${seconds.round()} s.');
      return td.InputStoryContentVideo(
        video: td.InputFileLocal(path: file),
        addedStickerFileIds: const [],
        duration: seconds,
        coverFrameTimestamp: 0,
        isAnimation: false,
      );
    }
    if (!TelegramToolRunner._isPhoto(file)) throw ArgumentError('A story is a photo (jpg, png, webp) or a video (mp4…).');
    return td.InputStoryContentPhoto(photo: td.InputFileLocal(path: file), addedStickerFileIds: const []);
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _postStory(Map<String, dynamic> args) async {
    final chatId = _storyChat(args);
    final caption = '${args['caption'] ?? ''}'.trim();
    final hours = TelegramToolRunner._int(args, 'active_hours', fallback: 24, min: 6, max: 48);
    final s = await _client.send<td.Story>(
      td.PostStory(
        chatId: chatId,
        content: await _storyContent(args),
        areas: null,
        albumIds: const [],
        caption: caption.isEmpty ? null : td.FormattedText(text: caption, entities: const []),
        privacySettings: _storyPrivacy(args),
        activePeriod: const [6, 12, 24, 48].reduce((a, b) => (a - hours).abs() <= (b - hours).abs() ? a : b) * 3600,
        fromStoryFullId: null,
        isPostedToChatPage: args['keep_on_profile'] == true,
        protectContent: args['protect'] == true,
      ),
      limited: true,
      timeout: const Duration(minutes: 3),
    );
    return ToolOutput({'done': true, 'posted': true, 'story_id': s.id, 'note': 'It uploads in the background; it shows once sent.'});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _editStory(Map<String, dynamic> args) async {
    final chatId = _storyChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'story_id');
    if (id == null) throw ArgumentError('story_id is required');
    final hasMedia = (args['files'] as List?)?.isNotEmpty == true;
    if (hasMedia || args['caption'] != null) {
      await _client.send<td.Ok>(
        td.EditStory(
          storyPosterChatId: chatId,
          storyId: id,
          content: hasMedia ? await _storyContent(args) : null,
          areas: null,
          caption: args['caption'] == null ? null : td.FormattedText(text: '${args['caption']}', entities: const []),
        ),
        limited: true,
        timeout: const Duration(minutes: 3),
      );
    }
    if (args['privacy'] != null) {
      await _client.send<td.Ok>(td.SetStoryPrivacySettings(storyId: id, privacySettings: _storyPrivacy(args)), limited: true);
    }
    if (args['keep_on_profile'] is bool) {
      await _client.send<td.Ok>(
        td.ToggleStoryIsPostedToChatPage(storyPosterChatId: chatId, storyId: id, isPostedToChatPage: args['keep_on_profile'] as bool),
        limited: true,
      );
    }
    return ToolOutput({'done': true, 'story_id': id});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _deleteStory(Map<String, dynamic> args) async {
    final id = TelegramToolRunner._intOrNull(args, 'story_id');
    if (id == null) throw ArgumentError('story_id is required');
    await _client.send<td.Ok>(td.DeleteStory(storyPosterChatId: _storyChat(args), storyId: id), limited: true);
    return ToolOutput({'done': true, 'deleted': id});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _reactStory(Map<String, dynamic> args) async {
    final id = TelegramToolRunner._intOrNull(args, 'story_id');
    if (id == null) throw ArgumentError('story_id is required');
    final emoji = '${args['emoji'] ?? ''}'.trim();
    await _client.send<td.Ok>(
      td.SetStoryReaction(
        storyPosterChatId: _storyChat(args),
        storyId: id,
        reactionType: emoji.isEmpty ? null : td.ReactionTypeEmoji(emoji: emoji),
        updateRecentReactions: true,
      ),
      limited: true,
    );
    return ToolOutput({'done': true, 'story_id': id, 'reaction': emoji.isEmpty ? 'removed' : emoji});
  }

  // ---- folders ---------------------------------------------------------------

  List<int> _argIds(Map<String, dynamic> args, String key) => [
    for (final v in (args[key] as List? ?? const []))
      if (v is num) v.toInt() else if (int.tryParse('$v') case final n?) n,
  ];

  Map<String, dynamic> _folderJson(int id, td.ChatFolder f) {
    String names(List<int> ids) => [for (final c in ids) _store.chat(c)?.title ?? 'chat $c'].join(', ');
    return {
      'folder_id': id,
      'title': f.title,
      'icon': ?f.icon?.name,
      if (f.includedChatIds.isNotEmpty) 'chats': names(f.includedChatIds),
      if (f.pinnedChatIds.isNotEmpty) 'pinned': names(f.pinnedChatIds),
      if (f.excludedChatIds.isNotEmpty) 'excluded': names(f.excludedChatIds),
      'include_types': [
        if (f.includeContacts) 'contacts',
        if (f.includeNonContacts) 'non_contacts',
        if (f.includeBots) 'bots',
        if (f.includeGroups) 'groups',
        if (f.includeChannels) 'channels',
      ],
      if (f.excludeMuted) 'exclude_muted': true,
      if (f.excludeRead) 'exclude_read': true,
      if (f.excludeArchived) 'exclude_archived': true,
      if (f.isShareable) 'shareable': true,
    };
  }

  td.ChatFolder _folderFrom(Map<String, dynamic> args, {td.ChatFolder? base}) {
    final types = (args['include_types'] as List?)?.map((e) => '$e').toSet();
    bool flag(String key, bool? old) => args[key] is bool ? args[key] as bool : (old ?? false);
    var included = [...?base?.includedChatIds, ..._argIds(args, 'chat_ids'), ..._argIds(args, 'add_chat_ids')];
    final removed = _argIds(args, 'remove_chat_ids').toSet();
    included = included.where((c) => !removed.contains(c)).toSet().toList();
    final pinned = args['pinned_chat_ids'] != null ? _argIds(args, 'pinned_chat_ids') : [...?base?.pinnedChatIds.where((c) => !removed.contains(c))];
    final title = '${args['title'] ?? base?.title ?? ''}'.trim();
    if (title.isEmpty) throw ArgumentError('A folder needs a title.');
    if (title.length > 12) throw ArgumentError('Folder names can be at most 12 characters: "$title" is ${title.length}.');
    final folder = td.ChatFolder(
      name: folderName(title),
      icon: args['icon'] != null ? td.ChatFolderIcon(name: '${args['icon']}') : base?.icon,
      colorId: base?.colorId ?? -1,
      isShareable: base?.isShareable ?? false,
      pinnedChatIds: pinned,
      includedChatIds: included.where((c) => !pinned.contains(c)).toList(),
      excludedChatIds: args['exclude_chat_ids'] != null ? _argIds(args, 'exclude_chat_ids') : [...?base?.excludedChatIds],
      excludeMuted: flag('exclude_muted', base?.excludeMuted),
      excludeRead: flag('exclude_read', base?.excludeRead),
      excludeArchived: flag('exclude_archived', base?.excludeArchived),
      includeContacts: types?.contains('contacts') ?? base?.includeContacts ?? false,
      includeNonContacts: types?.contains('non_contacts') ?? base?.includeNonContacts ?? false,
      includeBots: types?.contains('bots') ?? base?.includeBots ?? false,
      includeGroups: types?.contains('groups') ?? base?.includeGroups ?? false,
      includeChannels: types?.contains('channels') ?? base?.includeChannels ?? false,
    );
    final anyType = folder.includeContacts || folder.includeNonContacts || folder.includeBots || folder.includeGroups || folder.includeChannels;
    if (folder.includedChatIds.isEmpty && folder.pinnedChatIds.isEmpty && !anyType) {
      throw ArgumentError('A folder needs at least one chat or chat type in it.');
    }
    return folder;
  }

  int _folderId(Map<String, dynamic> args) {
    final id = TelegramToolRunner._intOrNull(args, 'folder_id');
    if (id == null) throw ArgumentError('folder_id is required (list_chat_folders shows them).');
    return id;
  }

  Future<ToolOutput> _getFolder(Map<String, dynamic> args) async {
    final id = _folderId(args);
    final f = await _client.send<td.ChatFolder>(td.GetChatFolder(chatFolderId: id), limited: true);
    return ToolOutput(_folderJson(id, f));
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _createFolder(Map<String, dynamic> args) async {
    final info = await _client.send<td.ChatFolderInfo>(td.CreateChatFolder(folder: _folderFrom(args)), limited: true);
    return ToolOutput({'done': true, 'created': true, 'folder_id': info.id, 'title': info.title});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _editFolder(Map<String, dynamic> args) async {
    final id = _folderId(args);
    final current = await _client.send<td.ChatFolder>(td.GetChatFolder(chatFolderId: id), limited: true);
    final next = _folderFrom(args, base: current);
    await _client.send<td.ChatFolderInfo>(td.EditChatFolder(chatFolderId: id, folder: next), limited: true);
    return ToolOutput({'done': true, ..._folderJson(id, next)});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _deleteFolder(Map<String, dynamic> args) async {
    final id = _folderId(args);
    await _client.send<td.Ok>(td.DeleteChatFolder(chatFolderId: id, leaveChatIds: const []), limited: true);
    return ToolOutput({'done': true, 'deleted_folder': id});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _reorderFolders(Map<String, dynamic> args) async {
    final ids = _argIds(args, 'folder_ids');
    final known = {for (final f in _store.folders) f.id};
    // Every folder must be named; any left out keep their place at the end.
    final all = [...ids.where(known.contains), ...known.where((k) => !ids.contains(k))];
    await _client.send<td.Ok>(td.ReorderChatFolders(chatFolderIds: all, mainChatListPosition: 0), limited: true);
    return ToolOutput({'done': true, 'order': all});
  }

  Future<ToolOutput> _suggestedFolders() async {
    final r = await _client.send<td.RecommendedChatFolders>(const td.GetRecommendedChatFolders(), limited: true);
    return ToolOutput({
      'suggestions': [
        for (final s in r.chatFolders) {'description': s.description, ..._folderJson(0, s.folder)..remove('folder_id')},
      ],
      if (r.chatFolders.isEmpty) 'note': 'Telegram has no suggestions right now.',
    });
  }

  Future<ToolOutput> _shareFolder(Map<String, dynamic> args) async {
    final id = _folderId(args);
    if (args['list'] == true) {
      final links = await _client.send<td.ChatFolderInviteLinks>(td.GetChatFolderInviteLinks(chatFolderId: id), limited: true);
      return ToolOutput({
        'links': [
          for (final l in links.inviteLinks) {'link': l.inviteLink, 'name': l.name, 'chats': [for (final c in l.chatIds) _store.chat(c)?.title ?? '$c']},
        ],
      });
    }
    var chats = _argIds(args, 'chat_ids');
    if (chats.isEmpty) {
      final f = await _client.send<td.ChatFolder>(td.GetChatFolder(chatFolderId: id), limited: true);
      // Only groups and channels can be shared in a folder link.
      chats = [
        for (final c in [...f.pinnedChatIds, ...f.includedChatIds])
          if (_store.chat(c)?.type is td.ChatTypeSupergroup || _store.chat(c)?.type is td.ChatTypeBasicGroup) c,
      ];
    }
    final link = await _client.send<td.ChatFolderInviteLink>(
      td.CreateChatFolderInviteLink(chatFolderId: id, name: '${args['name'] ?? ''}', chatIds: chats),
      limited: true,
    );
    return ToolOutput({'done': true, 'link': link.inviteLink, 'chats': link.chatIds.length});
  }

  // ---- running chats -------------------------------------------------------------

  int? _supergroupOf(ChatInfo c) => c.type is td.ChatTypeSupergroup ? (c.type as td.ChatTypeSupergroup).supergroupId : null;

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _chatSettings(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final sg = _supergroupOf(c);
    final done = <String>[];
    final failed = <String, String>{};
    Future<void> step(String key, Future<void> Function() run) async {
      if (!args.containsKey(key)) return;
      try {
        await run();
        done.add(key);
      } on TelegramException catch (e) {
        failed[key] = e.message;
      }
    }

    bool b(String k) => args[k] == true;
    int i(String k) => TelegramToolRunner._intOrNull(args, k) ?? 0;
    td.TdFunction needSg(td.TdFunction Function(int id) f) {
      if (sg == null) throw TelegramException(400, 'Only for supergroups and channels');
      return f(sg);
    }

    Future<void> ok(td.TdFunction f) => _client.send<td.Ok>(f, limited: true);
    await step('auto_delete', () => ok(td.SetChatMessageAutoDeleteTime(chatId: c.id, messageAutoDeleteTime: i('auto_delete'))));
    await step('slow_mode', () => ok(td.SetChatSlowModeDelay(chatId: c.id, slowModeDelay: i('slow_mode'))));
    await step('protect_content', () => ok(td.ToggleChatHasProtectedContent(chatId: c.id, hasProtectedContent: b('protect_content'))));
    await step('translatable', () => ok(td.ToggleChatIsTranslatable(chatId: c.id, isTranslatable: b('translatable'))));
    await step('history_for_new_members', () => ok(needSg((id) => td.ToggleSupergroupIsAllHistoryAvailable(supergroupId: id, isAllHistoryAvailable: b('history_for_new_members')))));
    await step('join_by_request', () => ok(needSg((id) => td.ToggleSupergroupJoinByRequest(supergroupId: id, joinByRequest: b('join_by_request'), guardBotUserId: 0, applyToInviteLinks: false))));
    await step('join_to_send', () => ok(needSg((id) => td.ToggleSupergroupJoinToSendMessages(supergroupId: id, joinToSendMessages: b('join_to_send')))));
    if (args.containsKey('sign_messages') || args.containsKey('show_author')) {
      await step(
        args.containsKey('sign_messages') ? 'sign_messages' : 'show_author',
        () => ok(needSg((id) => td.ToggleSupergroupSignMessages(supergroupId: id, signMessages: b('sign_messages') || b('show_author'), showMessageSender: b('show_author')))),
      );
    }
    await step('hide_members', () => ok(needSg((id) => td.ToggleSupergroupHasHiddenMembers(supergroupId: id, hasHiddenMembers: b('hide_members')))));
    await step('aggressive_antispam', () => ok(needSg((id) => td.ToggleSupergroupHasAggressiveAntiSpamEnabled(supergroupId: id, hasAggressiveAntiSpamEnabled: b('aggressive_antispam')))));
    await step('username', () => ok(needSg((id) => td.SetSupergroupUsername(supergroupId: id, username: '${args['username'] ?? ''}'.replaceFirst('@', '')))));
    await step('discussion_chat_id', () => ok(td.SetChatDiscussionGroup(chatId: c.id, discussionChatId: i('discussion_chat_id'))));
    return ToolOutput({
      'done': failed.isEmpty,
      'chat': c.title,
      'changed': done,
      if (failed.isNotEmpty) 'failed': failed,
      if (failed.isNotEmpty && done.isEmpty) 'error': 'Nothing could be changed: ${failed.values.first}',
    });
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _chatReactions(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final max = TelegramToolRunner._int(args, 'max_per_message', fallback: 11, max: 11);
    final mode = '${args['mode'] ?? 'all'}';
    final emojis = [for (final e in (args['emojis'] as List? ?? const [])) '$e'.trim()]..removeWhere((e) => e.isEmpty);
    if (mode == 'some' && emojis.isEmpty) throw ArgumentError('Give the emojis to allow.');
    await _client.send<td.Ok>(
      td.SetChatAvailableReactions(
        chatId: c.id,
        availableReactions: mode == 'all'
            ? td.ChatAvailableReactionsAll(maxReactionCount: max)
            : td.ChatAvailableReactionsSome(
                reactions: [for (final e in mode == 'none' ? const <String>[] : emojis) td.ReactionTypeEmoji(emoji: e)],
                maxReactionCount: max,
              ),
      ),
      limited: true,
    );
    return ToolOutput({'done': true, 'chat': c.title, 'reactions': mode == 'some' ? emojis : mode});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _manageTopic(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final topic = TelegramToolRunner._intOrNull(args, 'topic_id');
    if (topic == null) {
      final name = '${args['name'] ?? ''}'.trim();
      if (name.isEmpty) throw ArgumentError('Give the new topic a name.');
      final t = await _client.send<td.ForumTopicInfo>(
        td.CreateForumTopic(chatId: c.id, name: name, isNameImplicit: false, icon: const td.ForumTopicIcon(color: 0x6FB9F0, customEmojiId: 0)),
        limited: true,
      );
      return ToolOutput({'done': true, 'created': true, 'topic_id': t.messageThreadId, 'name': t.name});
    }
    if (args['name'] != null) {
      await _client.send<td.Ok>(
        td.EditForumTopic(chatId: c.id, forumTopicId: topic, name: '${args['name']}', editIconCustomEmoji: false, iconCustomEmojiId: 0),
        limited: true,
      );
    }
    if (args['closed'] is bool) {
      await _client.send<td.Ok>(td.ToggleForumTopicIsClosed(chatId: c.id, forumTopicId: topic, isClosed: args['closed'] as bool), limited: true);
    }
    if (args['pinned'] is bool) {
      await _client.send<td.Ok>(td.ToggleForumTopicIsPinned(chatId: c.id, forumTopicId: topic, isPinned: args['pinned'] as bool), limited: true);
    }
    return ToolOutput({'done': true, 'topic_id': topic});
  }

  /// Runs only after the person approved it in the chat.
  Future<ToolOutput> _deleteTopic(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final topic = TelegramToolRunner._intOrNull(args, 'topic_id');
    if (topic == null) throw ArgumentError('topic_id is required');
    await _client.send<td.Ok>(td.DeleteForumTopic(chatId: c.id, forumTopicId: topic), limited: true);
    return ToolOutput({'done': true, 'deleted_topic': topic});
  }

  Future<ToolOutput> _boosts(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final s = await _client.send<td.ChatBoostStatus>(td.GetChatBoostStatus(chatId: c.id), limited: true);
    final out = <String, dynamic>{
      'chat': c.title,
      'level': s.level,
      'boosts': s.boostCount,
      'next_level_at': s.nextLevelBoostCount,
      'premium_members': s.premiumMemberCount,
      'premium_percent': s.premiumMemberPercentage,
      'boost_link': s.boostUrl,
    };
    try {
      final b = await _client.send<td.FoundChatBoosts>(td.GetChatBoosts(chatId: c.id, onlyGiftCodes: false, offset: '', limit: 50), limited: true);
      out['boosters'] = [
        for (final x in b.boosts)
          {
            'from': switch (x.source) {
              td.ChatBoostSourcePremium(:final userId) => _store.userName(userId),
              td.ChatBoostSourceGiftCode(:final userId) => '${_store.userName(userId)} (gift code)',
              td.ChatBoostSourceGiveaway(:final userId) => userId == 0 ? 'giveaway' : '${_store.userName(userId)} (giveaway)',
            },
            'boosts': x.count,
            'until': TelegramToolRunner._iso(x.expirationDate).substring(0, 10),
          },
      ];
    } on TelegramException {
      // Only admins see who boosted.
    }
    return ToolOutput(out);
  }

  Future<ToolOutput> _linkJoins(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final r = await _client.send<td.ChatInviteLinkMembers>(
      td.GetChatInviteLinkMembers(
        chatId: c.id,
        inviteLink: '${args['invite_link'] ?? ''}',
        onlyWithExpiredSubscription: false,
        offsetMember: null,
        limit: TelegramToolRunner._int(args, 'limit', fallback: 50, max: 100),
      ),
      limited: true,
    );
    return ToolOutput({
      'chat': c.title,
      'total': r.totalCount,
      'joined': [
        for (final m in r.members)
          {
            'name': _store.userName(m.userId),
            'user_id': m.userId,
            'when': TelegramToolRunner._iso(m.joinedChatDate),
            if (m.approverUserId != 0) 'approved_by': _store.userName(m.approverUserId),
          },
      ],
    });
  }
}

/// The largest size of a photo, for showing a story's picture.
class TdFileImagePick {
  static td.File? best(td.Photo photo) {
    if (photo.sizes.isEmpty) return null;
    final sizes = [...photo.sizes]..sort((a, b) => a.width.compareTo(b.width));
    return sizes.last.photo;
  }
}
