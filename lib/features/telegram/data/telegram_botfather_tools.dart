part of 'telegram_tools.dart';

// Making and running bots. Telegram makes bots only through @BotFather, so
// creating one is a short conversation with it; a bot the user owns can
// also have its name, descriptions and photo changed directly.

final _botFatherTools = <TelegramTool>[
  TelegramTool(
    name: 'list_my_bots',
    label: 'Listing your bots',
    category: ToolCategory.account,
    cost: ToolCost.local,
    description: 'Bots the user owns (made with BotFather), with user_id and username.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'get_bot_profile',
    label: 'Reading a bot profile',
    category: ToolCategory.account,
    description: 'An owned bot\'s name, description (shown before Start) and short description (its bio).',
    parameters: _obj({
      'user_id': {'type': 'integer'},
    }, ['user_id']),
  ),
  TelegramTool(
    name: 'edit_bot',
    label: 'Editing a bot',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Changes an owned bot\'s name, description, short description (bio), or photo (an attached image\'s name '
        'in file). Needs approval.',
    parameters: _obj({
      'user_id': {'type': 'integer'},
      'name': {'type': 'string'},
      'description': {'type': 'string'},
      'short_description': {'type': 'string'},
      'file': {'type': 'string'},
    }, ['user_id']),
  ),
  TelegramTool(
    name: 'create_bot',
    label: 'Creating a bot',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Creates a new bot through @BotFather with a display name and a username ending in "bot". The token stays '
        'in the BotFather chat (it is not shown here). Needs approval.',
    parameters: _obj({
      'name': {'type': 'string'},
      'username': {'type': 'string', 'description': 'Must end in "bot", e.g. "weather_helper_bot".'},
    }, ['name', 'username']),
  ),
  TelegramTool(
    name: 'botfather',
    label: 'Talking to BotFather',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Sends @BotFather a command and its follow-up answers in order, e.g. ["/setcommands", "@my_bot", '
        '"start - Begin\\nhelp - Help"], ["/setinline", "@my_bot", "Search…"], ["/setjoingroups", "@my_bot", '
        '"Disable"], ["/mybots"]. Returns BotFather\'s replies. Deleting bots and revoking tokens are refused here. '
        'Needs approval.',
    parameters: _obj({
      'messages': {
        'type': 'array',
        'items': {'type': 'string'},
      },
    }, ['messages']),
  ),
];

final _token = RegExp(r'\d{6,}:[A-Za-z0-9_-]{30,}');

extension _BotFatherRuns on TelegramToolRunner {
  Future<int> _botFatherChat() async =>
      (await _client.send<td.Chat>(const td.SearchPublicChat(username: 'BotFather'), limited: true)).id;

  /// Sends [text] to BotFather and waits (up to [wait]) for its answer.
  Future<String> _askBotFather(int chatId, String text, {Duration wait = const Duration(seconds: 15)}) async {
    final sent = await _client.send<td.Message>(
      td.SendMessage(
        chatId: chatId,
        messageThreadId: 0,
        replyTo: null,
        options: null,
        replyMarkup: null,
        inputMessageContent: td.InputMessageText(
          text: td.FormattedText(text: text, entities: const []),
          linkPreviewOptions: null,
          clearDraft: false,
        ),
      ),
      limited: true,
    );
    final deadline = DateTime.now().add(wait);
    while (DateTime.now().isBefore(deadline)) {
      await Future<void>.delayed(const Duration(milliseconds: 1500));
      final r = await _client.send<td.Messages>(
        td.GetChatHistory(chatId: chatId, fromMessageId: 0, offset: 0, limit: 5, onlyLocal: false),
        limited: true,
      );
      final reply = r.messages.whereType<td.Message>().where((m) => !m.isOutgoing && m.date >= sent.date).toList();
      if (reply.isNotEmpty) {
        return [for (final m in reply.reversed) gistOf(m.content).text].join('\n').replaceAll(_token, '[token hidden]');
      }
    }
    return '(no answer from BotFather yet)';
  }

  List<int> _ownedBotIds() => [
    for (final u in _store.users.values)
      if (u.type case td.UserTypeBot(:final canBeEdited) when canBeEdited) u.id,
  ];

  Future<ToolOutput>? _runBotFather(String name, Map<String, dynamic> args) => switch (name) {
    'list_my_bots' => () async {
      final ids = _ownedBotIds();
      return ToolOutput({
        'count': ids.length,
        'bots': [
          for (final id in ids)
            {
              'user_id': id,
              'name': _store.userName(id),
              if (_store.users[id] case final u? when _store.username(u.usernames) != null)
                'username': '@${_store.username(u.usernames)}',
            },
        ],
        if (ids.isEmpty) 'note': 'No owned bots seen yet. Bots appear here once their chat has been opened.',
      });
    }(),
    'get_bot_profile' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'user_id');
      if (id == null) throw ArgumentError('user_id is required');
      final n = await _client.send<td.Text>(td.GetBotName(botUserId: id, languageCode: ''), limited: true);
      final d = await _client.send<td.Text>(td.GetBotInfoDescription(botUserId: id, languageCode: ''), limited: true);
      final sd = await _client.send<td.Text>(
        td.GetBotInfoShortDescription(botUserId: id, languageCode: ''),
        limited: true,
      );
      return ToolOutput({'user_id': id, 'name': n.text, 'description': d.text, 'short_description': sd.text});
    }(),
    'edit_bot' => () async {
      final id = TelegramToolRunner._intOrNull(args, 'user_id');
      if (id == null) throw ArgumentError('user_id is required');
      final done = <String>[];
      if ('${args['name'] ?? ''}'.trim().isNotEmpty) {
        await _client.send<td.Ok>(
          td.SetBotName(botUserId: id, languageCode: '', name: '${args['name']}'.trim()),
          limited: true,
        );
        done.add('name');
      }
      if (args['description'] != null) {
        await _client.send<td.Ok>(
          td.SetBotInfoDescription(botUserId: id, languageCode: '', description: '${args['description']}'),
          limited: true,
        );
        done.add('description');
      }
      if (args['short_description'] != null) {
        await _client.send<td.Ok>(
          td.SetBotInfoShortDescription(botUserId: id, languageCode: '', shortDescription: '${args['short_description']}'),
          limited: true,
        );
        done.add('short description');
      }
      if (args['file'] != null) {
        final path = '${args['file']}';
        if (!File(path).existsSync()) throw ArgumentError('File not found: $path');
        await _client.send<td.Ok>(
          td.SetBotProfilePhoto(botUserId: id, photo: td.InputChatPhotoStatic(photo: td.InputFileLocal(path: path))),
          limited: true,
        );
        done.add('photo');
      }
      return ToolOutput({'bot': _store.userName(id), 'changed': done});
    }(),
    'create_bot' => () async {
      final display = '${args['name'] ?? ''}'.trim();
      final username = '${args['username'] ?? ''}'.trim().replaceFirst('@', '');
      if (display.isEmpty || username.isEmpty) throw ArgumentError('name and username are required');
      if (!username.toLowerCase().endsWith('bot')) throw ArgumentError('The username must end in "bot".');
      final chat = await _botFatherChat();
      final steps = <String, String>{};
      steps['/newbot'] = await _askBotFather(chat, '/newbot');
      steps[display] = await _askBotFather(chat, display);
      final last = await _askBotFather(chat, username);
      steps[username] = last;
      final ok = last.toLowerCase().contains('done') || last.contains('[token hidden]');
      return ToolOutput({
        'created': ok,
        'username': '@$username',
        'botfather_said': last,
        if (ok) 'note': 'The token is in the user\'s BotFather chat. Find the bot with list_my_bots after opening it.',
        if (!ok) 'conversation': steps,
      });
    }(),
    'botfather' => () async {
      final msgs = [for (final m in (args['messages'] as List? ?? const [])) '$m'];
      if (msgs.isEmpty) throw ArgumentError('messages is empty');
      final bad = msgs.where((m) => RegExp(r'^/(deletebot|revoke|token)\b', caseSensitive: false).hasMatch(m.trim()));
      if (bad.isNotEmpty) {
        throw ArgumentError('${bad.first} isn\'t allowed from here; the user can do it in the BotFather chat.');
      }
      final chat = await _botFatherChat();
      final replies = <Map<String, String>>[];
      for (final m in msgs.take(8)) {
        replies.add({'sent': m, 'reply': await _askBotFather(chat, m)});
      }
      return ToolOutput({'conversation': replies});
    }(),
    _ => null,
  };

  String? _describeBotFather(String name, Map<String, dynamic> args) => switch (name) {
    'edit_bot' => [
      'Edit the bot ${_store.userName(TelegramToolRunner._intOrNull(args, 'user_id') ?? 0)}:',
      if (args['name'] != null) 'name → “${args['name']}”',
      if (args['description'] != null) 'description → “${args['description']}”',
      if (args['short_description'] != null) 'bio → “${args['short_description']}”',
      if (args['file'] != null) 'new photo',
    ].join(' '),
    'create_bot' => 'Create a bot “${args['name']}” (@${'${args['username']}'.replaceFirst('@', '')}) through BotFather',
    'botfather' => 'Send BotFather, in order:\n${[for (final m in (args['messages'] as List? ?? const [])) '• $m'].join('\n')}',
    _ => null,
  };
}
