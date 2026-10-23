part of 'telegram_tools.dart';

// Bot keyboards: the buttons under a bot's message (inline keyboards) and
// the reply keyboard a bot shows in place of the phone's keyboard.

final _botTools = <TelegramTool>[
  TelegramTool(
    name: 'get_bot_buttons',
    label: 'Reading bot buttons',
    category: ToolCategory.messages,
    description:
        'The buttons on a bot message (chat_id, message_id), row by row, with their kind (callback, url, '
        'switch_inline, web_app, reply…). Use before press_bot_button.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),
  TelegramTool(
    name: 'press_bot_button',
    label: 'Pressing a bot button',
    category: ToolCategory.actions,
    requiresApproval: true,
    description:
        'Presses a button on a bot message, by its text or by row/column (0-based) from get_bot_buttons. Callback '
        'buttons return the bot\'s answer; url buttons return the link (not opened); reply-keyboard buttons send '
        'their text to the bot. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'message_id': {'type': 'integer'},
      'text': {'type': 'string', 'description': 'The button\'s label (exact or a unique part of it).'},
      'row': {'type': 'integer'},
      'column': {'type': 'integer'},
    }, ['chat_id', 'message_id']),
  ),
];

/// One button with where it sits.
typedef BotButton = ({int row, int column, String text, String kind, Object raw});

String _inlineKind(td.InlineKeyboardButtonType t) => switch (t) {
  td.InlineKeyboardButtonTypeUrl() => 'url',
  td.InlineKeyboardButtonTypeLoginUrl() => 'login_url',
  td.InlineKeyboardButtonTypeWebApp() => 'web_app',
  td.InlineKeyboardButtonTypeCallback() => 'callback',
  td.InlineKeyboardButtonTypeCallbackWithPassword() => 'callback_with_password',
  td.InlineKeyboardButtonTypeCallbackGame() => 'game',
  td.InlineKeyboardButtonTypeSwitchInline() => 'switch_inline',
  td.InlineKeyboardButtonTypeBuy() => 'buy',
  td.InlineKeyboardButtonTypeUser() => 'user',
};

/// The buttons a message carries, flattened.
List<BotButton> botButtonsOf(td.Message m) => switch (m.replyMarkup) {
  td.ReplyMarkupInlineKeyboard(:final rows) => [
    for (final (r, row) in rows.indexed)
      for (final (c, b) in row.indexed) (row: r, column: c, text: b.text, kind: _inlineKind(b.type), raw: b),
  ],
  td.ReplyMarkupShowKeyboard(:final rows) => [
    for (final (r, row) in rows.indexed)
      for (final (c, b) in row.indexed) (row: r, column: c, text: b.text, kind: 'reply', raw: b),
  ],
  _ => const [],
};

/// What pressing a button did.
class BotPress {
  const BotPress({this.text = '', this.url = '', this.alert = false, this.sent});
  final String text;
  final String url;
  final bool alert;
  final td.Message? sent;
}

extension TelegramBots on TelegramToolRunner {
  /// Presses [b] on [m] the way Telegram's apps do, except that links and
  /// web apps are returned rather than opened.
  Future<BotPress> pressButton(td.Message m, BotButton b) async {
    final raw = b.raw;
    if (raw is td.KeyboardButton) {
      final sent = await _client.send<td.Message>(
        td.SendMessage(
          chatId: m.chatId,
          messageThreadId: m.messageThreadId,
          replyTo: null,
          options: null,
          replyMarkup: null,
          inputMessageContent: td.InputMessageText(
            text: td.FormattedText(text: raw.text, entities: const []),
            linkPreviewOptions: null,
            clearDraft: false,
          ),
        ),
        limited: true,
      );
      return BotPress(sent: sent, text: 'Sent "${raw.text}"');
    }
    final t = (raw as td.InlineKeyboardButton).type;
    switch (t) {
      case td.InlineKeyboardButtonTypeCallback(:final data):
        final a = await _client.send<td.CallbackQueryAnswer>(
          td.GetCallbackQueryAnswer(
            chatId: m.chatId,
            messageId: m.id,
            payload: td.CallbackQueryPayloadData(data: data),
          ),
          limited: true,
          timeout: const Duration(seconds: 25),
        );
        return BotPress(text: a.text, url: a.url, alert: a.showAlert);
      case td.InlineKeyboardButtonTypeCallbackGame():
        final a = await _client.send<td.CallbackQueryAnswer>(
          td.GetCallbackQueryAnswer(
            chatId: m.chatId,
            messageId: m.id,
            payload: const td.CallbackQueryPayloadGame(gameShortName: ''),
          ),
          limited: true,
        );
        return BotPress(text: a.text, url: a.url);
      case td.InlineKeyboardButtonTypeUrl(:final url):
        return BotPress(url: url);
      case td.InlineKeyboardButtonTypeLoginUrl(:final url):
        return BotPress(url: url, text: 'Login link');
      case td.InlineKeyboardButtonTypeWebApp(:final url):
        return BotPress(url: url, text: 'Web app');
      case td.InlineKeyboardButtonTypeSwitchInline(:final query):
        final bot = await _client.send<td.User>(
          td.GetUser(userId: m.viaBotUserId != 0 ? m.viaBotUserId : _senderUserId(m)),
          limited: true,
        );
        final name = bot.usernames?.activeUsernames.firstOrNull ?? '';
        return BotPress(text: 'Type "@$name $query" in a chat to use it.');
      case td.InlineKeyboardButtonTypeUser(:final userId):
        return BotPress(text: 'Points to user $userId');
      default:
        throw ArgumentError('That kind of button can\'t be pressed from here.');
    }
  }

  int _senderUserId(td.Message m) => switch (m.senderId) {
    td.MessageSenderUser(:final userId) => userId,
    _ => 0,
  };
}

extension _BotToolRuns on TelegramToolRunner {
  Future<td.Message> _botMessage(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    final id = TelegramToolRunner._intOrNull(args, 'message_id');
    if (id == null) throw ArgumentError('message_id is required');
    return _client.send<td.Message>(td.GetMessage(chatId: c.id, messageId: id), limited: true);
  }

  Future<ToolOutput>? _runBots(String name, Map<String, dynamic> args) => switch (name) {
    'get_bot_buttons' => () async {
      final m = await _botMessage(args);
      final buttons = botButtonsOf(m);
      return ToolOutput({
        'message_id': m.id,
        'keyboard': m.replyMarkup is td.ReplyMarkupShowKeyboard ? 'reply' : 'inline',
        'buttons': [
          for (final b in buttons) {'row': b.row, 'column': b.column, 'text': b.text, 'kind': b.kind},
        ],
        if (buttons.isEmpty) 'note': 'This message has no buttons.',
      });
    }(),
    'press_bot_button' => () async {
      final m = await _botMessage(args);
      final buttons = botButtonsOf(m);
      final want = '${args['text'] ?? ''}'.trim().toLowerCase();
      final row = TelegramToolRunner._intOrNull(args, 'row');
      final col = TelegramToolRunner._intOrNull(args, 'column');
      final b =
          (row != null && col != null ? buttons.where((b) => b.row == row && b.column == col).firstOrNull : null) ??
          (want.isEmpty
              ? null
              : buttons.where((b) => b.text.toLowerCase() == want).firstOrNull ??
                    buttons.where((b) => b.text.toLowerCase().contains(want)).firstOrNull);
      if (b == null) throw ArgumentError('No such button. Buttons: ${buttons.map((b) => b.text).join(', ')}');
      final r = await pressButton(m, b);
      return ToolOutput({
        'pressed': b.text,
        if (r.text.isNotEmpty) 'answer': r.text,
        if (r.alert) 'shown_as_alert': true,
        if (r.url.isNotEmpty) 'url': r.url,
        if (r.sent != null) 'sent': 'post:${r.sent!.chatId}:${r.sent!.id}',
        'note': 'The bot may edit the message or send a new one; read the chat again to see it.',
      });
    }(),
    _ => null,
  };

  String? _describeBots(String name, Map<String, dynamic> args, String title) => switch (name) {
    'press_bot_button' =>
      'Press "${args['text'] ?? 'row ${args['row']}, button ${args['column']}'}" on message ${args['message_id']} in $title',
    _ => null,
  };
}
