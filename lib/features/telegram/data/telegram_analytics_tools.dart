part of 'telegram_tools.dart';

/// A portable, data-only counterpart to the Statistics screen's summary
/// export. It works for any channel the account can read, rather than only
/// channels where Telegram grants full admin statistics.
final _analyticsTools = <TelegramTool>[
  TelegramTool(
    name: 'export_channel_summary',
    label: 'Exporting channel statistics',
    category: ToolCategory.creative,
    description:
        'Creates a shareable PNG summary for a channel the user can read: profile photo, name, public link, '
        'subscriber count when Telegram exposes it, and average views, shares and reactions from recent posts. '
        'Works with public channels too; it does not require admin statistics. The PNG appears in Files and can be '
        'sent with send_message by passing its name in files.',
    parameters: _obj(
      {
        'chat_id': {
          'type': 'integer',
          'description': 'The channel from list_chats or get_chat_info.',
        },
        'posts': {
          'type': 'integer',
          'description': 'Recent posts to average, 5-50; default 20.',
        },
      },
      ['chat_id'],
    ),
  ),
];

extension AnalyticsTools on TelegramToolRunner {
  Future<ToolOutput>? _runAnalytics(String name, Map<String, dynamic> args) =>
      switch (name) {
        'export_channel_summary' => _exportChannelSummary(args),
        _ => null,
      };

  Future<ToolOutput> _exportChannelSummary(Map<String, dynamic> args) async {
    final c = _requireChat(args);
    if (_store.kindOf(c) != ChatKind.channel)
      throw ArgumentError('Choose a channel for this export.');
    final limit = TelegramToolRunner._int(
      args,
      'posts',
      fallback: 20,
      min: 5,
      max: 50,
    );
    // One history call returns what TDLib has cached (often a single post),
    // so page until there are enough. A channel's own posts count too: in a
    // channel the user runs, they're "outgoing".
    final history = await _history(c, limit: limit);
    final posts = history
        .where((m) => m.interactionInfo != null && gistOf(m.content).kind != 'service')
        .toList();
    int average(int Function(td.MessageInteractionInfo) pick) => posts.isEmpty
        ? 0
        : posts.map((m) => pick(m.interactionInfo!)).fold(0, (a, b) => a + b) ~/
              posts.length;
    var subscribers = _store.memberCount(c) ?? 0;
    if (c.type case td.ChatTypeSupergroup(:final supergroupId)) {
      try {
        subscribers = (await _client.send<td.SupergroupFullInfo>(
          td.GetSupergroupFullInfo(supergroupId: supergroupId),
          limited: true,
        )).memberCount;
      } catch (_) {
        // Public channels can hide the full count. The visible cached value is
        // still useful, and the export labels it as unavailable when zero.
      }
    }
    final username = _store.chatUsername(c);
    final link = username == null ? null : 't.me/$username';
    final portrait = await _summaryPortrait(c.photo?.big);
    final file = await _writeChannelSummary(
      title: c.title,
      link: link,
      portrait: portrait,
      subscribers: subscribers,
      views: average((i) => i.viewCount),
      shares: average((i) => i.forwardCount),
      reactions: average(
        (i) =>
            i.reactions?.reactions.fold<int>(0, (n, r) => n + r.totalCount) ??
            0,
      ),
      sampled: posts.length,
    );
    return ToolOutput({
      // image_path makes it sendable with send_message, like generated images.
      'image_path': file.path,
      'file': file.path.split(RegExp(r'[\\/]')).last,
      'channel': c.title,
      if (link != null) 'link': link,
      'posts_sampled': posts.length,
      'subscribers': subscribers == 0 ? 'not available publicly' : subscribers,
      'views_per_post': average((i) => i.viewCount),
      'shares_per_post': average((i) => i.forwardCount),
      'reactions_per_post': average(
        (i) =>
            i.reactions?.reactions.fold<int>(0, (n, r) => n + r.totalCount) ??
            0,
      ),
      '_images': [file.path],
      if (posts.isEmpty) 'warning': 'No posts with view counts could be read, so the averages are zero.',
      'note': 'The PNG is saved in Files → Exports. Send it with send_message using its file name.',
    });
  }

  Future<ui.Image?> _summaryPortrait(td.File? photo) async {
    if (photo == null) return null;
    try {
      final path =
          photo.local.isDownloadingCompleted &&
              File(photo.local.path).existsSync()
          ? photo.local.path
          : (await _client.send<td.File>(
              td.DownloadFile(
                fileId: photo.id,
                priority: 8,
                offset: 0,
                limit: 0,
                synchronous: true,
              ),
              timeout: const Duration(seconds: 45),
            )).local.path;
      if (!File(path).existsSync()) return null;
      final codec = await ui.instantiateImageCodec(
        await File(path).readAsBytes(),
        targetWidth: 160,
        targetHeight: 160,
      );
      final frame = await codec.getNextFrame();
      codec.dispose();
      return frame.image;
    } catch (_) {
      return null;
    }
  }

  Future<File> _writeChannelSummary({
    required String title,
    required String? link,
    required ui.Image? portrait,
    required int subscribers,
    required int views,
    required int shares,
    required int reactions,
    required int sampled,
  }) async {
    const width = 1200.0, height = 720.0;
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(
      recorder,
      const ui.Rect.fromLTWH(0, 0, width, height),
    );
    canvas.drawRect(
      const ui.Rect.fromLTWH(0, 0, width, height),
      ui.Paint()..color = const ui.Color(0xFF101114),
    );
    canvas.drawRRect(
      ui.RRect.fromRectAndRadius(
        const ui.Rect.fromLTWH(42, 42, width - 84, height - 84),
        const ui.Radius.circular(30),
      ),
      ui.Paint()..color = const ui.Color(0xFF1B1D22),
    );
    final avatar = const ui.Rect.fromLTWH(82, 86, 130, 130);
    canvas.save();
    canvas.clipPath(ui.Path()..addOval(avatar));
    if (portrait != null) {
      canvas.drawImageRect(
        portrait,
        ui.Rect.fromLTWH(
          0,
          0,
          portrait.width.toDouble(),
          portrait.height.toDouble(),
        ),
        avatar,
        ui.Paint(),
      );
    } else {
      canvas.drawRect(avatar, ui.Paint()..color = const ui.Color(0xFF5D75B9));
      _summaryText(
        canvas,
        title.isEmpty ? '?' : title.substring(0, 1).toUpperCase(),
        const ui.Offset(125, 112),
        62,
        const ui.Color(0xFFFFFFFF),
        center: true,
      );
    }
    canvas.restore();
    _summaryText(
      canvas,
      title,
      const ui.Offset(240, 100),
      42,
      const ui.Color(0xFFF5F5F6),
      maxWidth: 850,
    );
    _summaryText(
      canvas,
      link ?? 'Private channel',
      const ui.Offset(240, 158),
      24,
      const ui.Color(0xFF9AA0AB),
      maxWidth: 850,
    );
    _summaryText(
      canvas,
      'TELEAI · CHANNEL OVERVIEW',
      const ui.Offset(82, 265),
      20,
      const ui.Color(0xFF8AB4FF),
    );
    final values = [
      (
        'Subscribers',
        subscribers == 0 ? '—' : NumberFormat.compact().format(subscribers),
      ),
      ('Views / post', NumberFormat.compact().format(views)),
      ('Shares / post', NumberFormat.compact().format(shares)),
      ('Reactions / post', NumberFormat.compact().format(reactions)),
    ];
    for (final (i, item) in values.indexed) {
      final x = 82.0 + (i % 2) * 520, y = 315.0 + (i ~/ 2) * 145;
      canvas.drawRRect(
        ui.RRect.fromRectAndRadius(
          ui.Rect.fromLTWH(x, y, 480, 112),
          const ui.Radius.circular(18),
        ),
        ui.Paint()..color = const ui.Color(0xFF272A31),
      );
      _summaryText(
        canvas,
        item.$2,
        ui.Offset(x + 24, y + 19),
        38,
        const ui.Color(0xFFFFFFFF),
      );
      _summaryText(
        canvas,
        item.$1,
        ui.Offset(x + 24, y + 70),
        20,
        const ui.Color(0xFFB7BCC7),
      );
    }
    _summaryText(
      canvas,
      'Based on the latest $sampled posts available to this account · ${DateTime.now().toLocal().toIso8601String().substring(0, 10)}',
      const ui.Offset(82, 622),
      17,
      const ui.Color(0xFF777D89),
      maxWidth: 1000,
    );
    final image = await recorder.endRecording().toImage(
      width.toInt(),
      height.toInt(),
    );
    final png = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    if (portrait != null) portrait.dispose();
    if (png == null)
      throw StateError('Could not make the channel summary image.');
    final root = await getApplicationSupportDirectory();
    final dir = Directory('${root.path}/exports')
      ..createSync(recursive: true);
    final safe = title
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
    final out = File(
      '${dir.path}/teleai_channel_${safe.isEmpty ? 'summary' : safe}_${DateTime.now().millisecondsSinceEpoch}.png',
    );
    return out.writeAsBytes(png.buffer.asUint8List(), flush: true);
  }
}

void _summaryText(
  ui.Canvas canvas,
  String text,
  ui.Offset at,
  double size,
  ui.Color color, {
  double maxWidth = 1000,
  bool center = false,
}) {
  final p =
      ui.ParagraphBuilder(
          ui.ParagraphStyle(fontSize: size, maxLines: 1, ellipsis: '…'),
        )
        ..pushStyle(ui.TextStyle(color: color, fontWeight: ui.FontWeight.w600))
        ..addText(text);
  final paragraph = p.build()..layout(ui.ParagraphConstraints(width: maxWidth));
  canvas.drawParagraph(
    paragraph,
    ui.Offset(center ? at.dx - paragraph.width / 2 : at.dx, at.dy),
  );
}
