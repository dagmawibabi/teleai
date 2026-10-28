part of 'telegram_tools.dart';

// Chat backgrounds (wallpapers): what the chat view draws and the tools
// that read and change them.

final _backgroundTools = <TelegramTool>[
  TelegramTool(
    name: 'list_backgrounds',
    label: 'Opening backgrounds',
    category: ToolCategory.media,
    description:
        'Telegram backgrounds installed on the account (wallpapers, patterns, gradients), with background_id values '
        'for set_chat_background.',
    parameters: _obj({}),
  ),
  TelegramTool(
    name: 'get_chat_background',
    label: 'Checking the background',
    category: ToolCategory.chats,
    cost: ToolCost.local,
    description: 'The background a chat currently uses, if it has its own.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
    }, ['chat_id']),
  ),
  TelegramTool(
    name: 'set_chat_background',
    label: 'Changing the background',
    category: ToolCategory.media,
    requiresApproval: true,
    description:
        'Sets a chat\'s background. Give exactly one of: background_id (from list_backgrounds), file (an image the '
        'user attached, by name or path), or color / colors (hex like "#1E2A3A"; two colours make a gradient). '
        'remove: true restores the default. only_for_me (default true) keeps it on this account; false also sets it '
        'for the other person in a private chat. Needs approval.',
    parameters: _obj({
      'chat_id': {'type': 'integer'},
      'background_id': {'type': 'string'},
      'file': {'type': 'string'},
      'color': {'type': 'string'},
      'colors': {
        'type': 'array',
        'items': {'type': 'string'},
      },
      'rotation': {'type': 'integer', 'description': 'Gradient angle 0-315 in steps of 45.'},
      'blur': {'type': 'boolean'},
      'dimming': {'type': 'integer', 'description': '0-100, how much to darken it in the dark theme.'},
      'only_for_me': {'type': 'boolean'},
      'remove': {'type': 'boolean'},
    }, ['chat_id']),
  ),
];

int _hexColor(String s) {
  final h = s.trim().replaceFirst('#', '');
  final v = int.tryParse(h.length == 3 ? h.split('').map((c) => '$c$c').join() : h, radix: 16);
  if (v == null) throw ArgumentError('Not a colour: $s');
  return v & 0xFFFFFF;
}

String _colorHex(int c) => '#${(c & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

extension TelegramBackgrounds on TelegramToolRunner {
  Future<List<td.Background>> installedBackgrounds() async =>
      (await _client.send<td.Backgrounds>(const td.GetInstalledBackgrounds(forDarkTheme: true), limited: true))
          .backgrounds;

  /// One of [backgroundId] (with its [type]), [localPath] or [fill].
  Future<void> setChatBackground(
    int chatId, {
    int? backgroundId,
    td.BackgroundType? type,
    String? localPath,
    td.BackgroundFill? fill,
    bool blur = false,
    int dimming = 0,
    bool onlyForMe = true,
  }) async {
    final td.InputBackground? input = backgroundId != null
        ? td.InputBackgroundRemote(backgroundId: backgroundId)
        : localPath != null
        ? td.InputBackgroundLocal(background: td.InputFileLocal(path: localPath))
        : null;
    final td.BackgroundType? t = fill != null
        ? td.BackgroundTypeFill(fill: fill)
        : localPath != null
        ? td.BackgroundTypeWallpaper(isBlurred: blur, isMoving: false)
        : type;
    if (input == null && t == null) throw ArgumentError('Nothing to set');
    await _client.send<td.Ok>(
      td.SetChatBackground(
        chatId: chatId,
        background: input,
        type: t,
        darkThemeDimming: dimming.clamp(0, 100),
        onlyForSelf: onlyForMe,
      ),
      limited: true,
    );
  }

  Future<void> removeChatBackground(int chatId) =>
      _client.send<td.Ok>(td.DeleteChatBackground(chatId: chatId, restorePrevious: false), limited: true);
}

extension _BackgroundToolRuns on TelegramToolRunner {
  Map<String, dynamic> _backgroundJson(td.Background b) => {
    'background_id': '${b.id}',
    if (b.name.isNotEmpty) 'name': b.name,
    'dark': b.isDark,
    'kind': switch (b.type) {
      td.BackgroundTypeWallpaper() => 'wallpaper',
      td.BackgroundTypePattern() => 'pattern',
      td.BackgroundTypeFill() => 'fill',
      td.BackgroundTypeChatTheme() => 'theme',
    },
    if (b.type case td.BackgroundTypeFill(:final fill) || td.BackgroundTypePattern(:final fill))
      'colors': switch (fill) {
        td.BackgroundFillSolid(:final color) => [_colorHex(color)],
        td.BackgroundFillGradient(:final topColor, :final bottomColor) => [_colorHex(topColor), _colorHex(bottomColor)],
        td.BackgroundFillFreeformGradient(:final colors) => [for (final c in colors) _colorHex(c)],
      },
  };

  Future<ToolOutput>? _runBackgrounds(String name, Map<String, dynamic> args) => switch (name) {
    'list_backgrounds' => () async {
      final list = await installedBackgrounds();
      return ToolOutput({'backgrounds': [for (final b in list) _backgroundJson(b)]});
    }(),
    'get_chat_background' => () async {
      final c = _requireChat(args);
      final b = c.background;
      if (b == null) return ToolOutput({'chat': c.title, 'background': 'default'});
      return ToolOutput({'chat': c.title, 'background': _backgroundJson(b.background), 'dimming': b.darkThemeDimming});
    }(),
    'set_chat_background' => () async {
      final c = _requireChat(args);
      if (args['remove'] == true) {
        await removeChatBackground(c.id);
        return ToolOutput({'chat': c.title, 'background': 'default'});
      }
      final only = args['only_for_me'] != false;
      final dim = TelegramToolRunner._int(args, 'dimming', fallback: 0, max: 100);
      final colors = [
        if (args['color'] != null) '${args['color']}',
        for (final x in (args['colors'] as List? ?? const [])) '$x',
      ].map(_hexColor).toList();
      if (args['background_id'] != null) {
        final id = int.tryParse('${args['background_id']}');
        final b = (await installedBackgrounds()).where((b) => b.id == id).firstOrNull;
        if (b == null) throw ArgumentError('No installed background ${args['background_id']}');
        await setChatBackground(c.id, backgroundId: b.id, type: b.type, dimming: dim, onlyForMe: only);
      } else if (args['file'] != null) {
        final path = '${args['file']}';
        if (!File(path).existsSync()) throw ArgumentError('File not found: $path');
        await setChatBackground(c.id, localPath: path, blur: args['blur'] == true, dimming: dim, onlyForMe: only);
      } else if (colors.isNotEmpty) {
        final fill = switch (colors.length) {
          1 => td.BackgroundFillSolid(color: colors.first) as td.BackgroundFill,
          2 => td.BackgroundFillGradient(
            topColor: colors[0],
            bottomColor: colors[1],
            rotationAngle: (TelegramToolRunner._int(args, 'rotation', fallback: 0, max: 315) ~/ 45) * 45,
          ),
          _ => td.BackgroundFillFreeformGradient(colors: colors.take(4).toList()),
        };
        await setChatBackground(c.id, fill: fill, dimming: dim, onlyForMe: only);
      } else {
        throw ArgumentError('Give background_id, file or color(s), or remove: true');
      }
      return ToolOutput({'chat': c.title, 'updated': true, 'only_for_me': only});
    }(),
    _ => null,
  };

  String? _describeBackgrounds(String name, Map<String, dynamic> args, String title) => switch (name) {
    'set_chat_background' =>
      args['remove'] == true
          ? 'Remove the background of $title'
          : 'Change the background of $title to '
                '${args['background_id'] != null ? 'Telegram background ${args['background_id']}' : args['file'] != null ? 'the image ${args['file']}' : 'colour ${[?args['color'], ...?(args['colors'] as List?)].join(' → ')}'}'
                '${args['only_for_me'] == false ? ' (for both of you)' : ' (only for you)'}',
    _ => null,
  };
}
