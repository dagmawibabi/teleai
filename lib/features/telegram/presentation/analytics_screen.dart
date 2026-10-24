import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/theme.dart';
import '../../../infrastructure/telegram/telegram_client.dart';
import '../../../infrastructure/telegram/telegram_exception.dart';
import '../data/telegram_store.dart';
import 'tg_avatar.dart';

/// A channel's or group's analytics for its admins: Telegram's statistics
/// (growth, views, shares, reactions, notifications, sources, languages,
/// the best hours) as charts, and the people: subscribers or members,
/// admins, the removed, and the restricted.
class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key, required this.chatId});
  final int chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(telegramStoreProvider);
    final chat = store.chat(chatId);
    final channel = chat != null && store.kindOf(chat) == ChatKind.channel;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(chat?.title ?? 'Statistics'),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              const Tab(text: 'Overview'),
              Tab(text: channel ? 'Subscribers' : 'Members'),
              const Tab(text: 'Admins'),
              const Tab(text: 'Removed'),
              const Tab(text: 'Restricted'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _Overview(chatId: chatId),
            _People(
              chatId: chatId,
              filter: const td.SupergroupMembersFilterRecent(),
            ),
            _People(
              chatId: chatId,
              filter: const td.ChatMembersFilterAdministrators(),
            ),
            _People(
              chatId: chatId,
              filter: const td.SupergroupMembersFilterBanned(query: ''),
            ),
            _People(
              chatId: chatId,
              filter: const td.SupergroupMembersFilterRestricted(query: ''),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- overview -----------------------------------------------------------------

class _Overview extends ConsumerStatefulWidget {
  const _Overview({required this.chatId});
  final int chatId;

  @override
  ConsumerState<_Overview> createState() => _OverviewState();
}

class _OverviewState extends ConsumerState<_Overview>
    with AutomaticKeepAliveClientMixin {
  final _summaryCaptureKey = GlobalKey();
  late final Future<td.ChatStatistics> _stats = ref
      .read(telegramClientProvider)
      .send<td.ChatStatistics>(
        td.GetChatStatistics(chatId: widget.chatId, isDark: true),
        limited: true,
        timeout: const Duration(seconds: 60),
      );

  @override
  bool get wantKeepAlive => true;

  Future<void> _exportChannelSummary() async {
    try {
      final boundary =
          _summaryCaptureKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null)
        throw StateError('The channel summary is not ready yet.');
      final image = await boundary.toImage(pixelRatio: 3);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      if (bytes == null)
        throw StateError('Couldn\'t render the channel summary.');
      final root = await getApplicationSupportDirectory();
      final dir = Directory('${root.path}/exports')
        ..createSync(recursive: true);
      final file = File(
        '${dir.path}/teleai_channel_summary_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
      if (mounted) showSnack(context, 'Saved channel summary to Files');
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t export summary: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<td.ChatStatistics>(
      future: _stats,
      builder: (context, snap) {
        if (snap.hasError) {
          final e = snap.error;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(Space.xl),
              child: Text(
                e is TelegramException && e.message.contains('STATS')
                    ? 'Telegram only has statistics for channels and groups with enough members (about 500+), for their admins.'
                    : 'No statistics: $e',
                textAlign: TextAlign.center,
                style: context.text.bodySmall,
              ),
            ),
          );
        }
        final s = snap.data;
        if (s == null)
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        final fmt = DateFormat('d MMM');
        return switch (s) {
          td.ChatStatisticsChannel() => ListView(
            padding: const EdgeInsets.all(Space.l),
            children: [
              _ChannelSummaryExport(
                captureKey: _summaryCaptureKey,
                onExport: _exportChannelSummary,
                chat: ref.read(telegramStoreProvider).chat(widget.chatId),
                link: () {
                  final c = ref.read(telegramStoreProvider).chat(widget.chatId);
                  final username = c == null
                      ? null
                      : ref.read(telegramStoreProvider).chatUsername(c);
                  return username == null ? null : 't.me/$username';
                }(),
                period:
                    '${fmt.format(_d(s.period.startDate))} – ${fmt.format(_d(s.period.endDate))}',
                values: [
                  ('Subscribers', s.memberCount),
                  ('Views per post', s.meanMessageViewCount),
                  ('Shares per post', s.meanMessageShareCount),
                  ('Reactions per post', s.meanMessageReactionCount),
                ],
              ),
              const SizedBox(height: Space.s),
              _Values([
                ('Views per story', s.meanStoryViewCount),
                ('Reactions per story', s.meanStoryReactionCount),
              ]),
              const SizedBox(height: Space.s),
              Text(
                '${s.enabledNotificationsPercentage.toStringAsFixed(1)}% of subscribers have notifications on',
                style: context.text.bodySmall,
              ),
              for (final (title, g) in [
                ('Growth', s.memberCountGraph),
                ('Joined and left', s.joinGraph),
                ('Muted and unmuted', s.muteGraph),
                ('Views by hour', s.viewCountByHourGraph),
                ('Where views come from', s.viewCountBySourceGraph),
                ('Where new subscribers come from', s.joinBySourceGraph),
                ('Languages', s.languageGraph),
                ('Interactions', s.messageInteractionGraph),
                ('Reactions', s.messageReactionGraph),
                ('Story interactions', s.storyInteractionGraph),
              ])
                _Graph(chatId: widget.chatId, title: title, graph: g),
              if (s.recentInteractions.isNotEmpty) ...[
                const SizedBox(height: Space.l),
                Text('RECENT POSTS', style: context.text.labelSmall),
                for (final i in s.recentInteractions.take(20))
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(switch (i.objectType) {
                      td.ChatStatisticsObjectTypeMessage(:final messageId) =>
                        'Post ${messageId >> 20}',
                      td.ChatStatisticsObjectTypeStory(:final storyId) =>
                        'Story $storyId',
                    }),
                    trailing: Text(
                      '👁 ${_n(i.viewCount)}  ↗ ${_n(i.forwardCount)}  ❤ ${_n(i.reactionCount)}',
                      style: context.text.bodySmall,
                    ),
                  ),
              ],
            ],
          ),
          td.ChatStatisticsSupergroup() => ListView(
            padding: const EdgeInsets.all(Space.l),
            children: [
              Text(
                '${fmt.format(_d(s.period.startDate))} – ${fmt.format(_d(s.period.endDate))}',
                style: context.text.bodySmall,
              ),
              const SizedBox(height: Space.m),
              _Values([
                ('Members', s.memberCount),
                ('Messages', s.messageCount),
                ('Viewing members', s.viewerCount),
                ('Posting members', s.senderCount),
              ]),
              for (final (title, g) in [
                ('Growth', s.memberCountGraph),
                ('Joined and left', s.joinGraph),
                ('Where new members come from', s.joinBySourceGraph),
                ('Languages', s.languageGraph),
                ('Messages by type', s.messageContentGraph),
                ('Actions', s.actionGraph),
                ('Activity by hour', s.dayGraph),
                ('Activity by weekday', s.weekGraph),
              ])
                _Graph(chatId: widget.chatId, title: title, graph: g),
              if (s.topSenders.isNotEmpty) ...[
                const SizedBox(height: Space.l),
                Text('TOP MEMBERS', style: context.text.labelSmall),
                for (final t in s.topSenders.take(10))
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: TgAvatar(
                      userId: t.userId,
                      title: ref.read(telegramStoreProvider).userName(t.userId),
                      size: 32,
                    ),
                    title: Text(
                      ref.read(telegramStoreProvider).userName(t.userId),
                    ),
                    trailing: Text(
                      '${t.sentMessageCount} messages',
                      style: context.text.bodySmall,
                    ),
                  ),
              ],
            ],
          ),
        };
      },
    );
  }

  static DateTime _d(int unix) =>
      DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  static String _n(int v) => NumberFormat.compact().format(v);
}

class _Values extends StatelessWidget {
  const _Values(this.values);
  final List<(String, td.StatisticalValue)> values;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: Space.s,
    runSpacing: Space.s,
    children: [
      for (final (label, v) in values)
        if (v.value > 0 || v.previousValue > 0)
          Container(
            width:
                (MediaQuery.sizeOf(context).width - Space.l * 2 - Space.s) / 2,
            padding: const EdgeInsets.all(Space.m),
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(Radii.m),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NumberFormat.compact().format(v.value),
                  style: context.text.titleLarge,
                ),
                Text(label, style: context.text.bodySmall),
                if (v.growthRatePercentage != 0)
                  Text(
                    '${v.growthRatePercentage > 0 ? '+' : ''}${v.growthRatePercentage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 12,
                      color: v.growthRatePercentage > 0
                          ? AppColors.success
                          : AppColors.danger,
                    ),
                  ),
              ],
            ),
          ),
    ],
  );
}

/// The top-level channel figures exported as one concise shareable card.
/// The export affordance deliberately sits outside [RepaintBoundary], so the
/// resulting PNG looks like a report rather than a screenshot of a control.
class _ChannelSummaryExport extends StatelessWidget {
  const _ChannelSummaryExport({
    required this.captureKey,
    required this.onExport,
    required this.chat,
    required this.link,
    required this.period,
    required this.values,
  });

  final GlobalKey captureKey;
  final VoidCallback onExport;
  final ChatInfo? chat;
  final String? link;
  final String period;
  final List<(String, td.StatisticalValue)> values;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: RepaintBoundary(
          key: captureKey,
          child: Container(
            padding: const EdgeInsets.all(Space.m),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(Radii.l),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TgAvatar(
                      chatId: chat?.id,
                      title: chat?.title ?? 'Channel',
                      size: 42,
                    ),
                    const SizedBox(width: Space.m),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat?.title ?? 'Channel',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.titleSmall,
                          ),
                          Text(
                            link ?? 'Private channel',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Space.m),
                Text(period, style: context.text.labelSmall),
                const SizedBox(height: Space.s),
                LayoutBuilder(
                  builder: (_, constraints) => Wrap(
                    spacing: Space.s,
                    runSpacing: Space.s,
                    children: [
                      for (final (label, value) in values)
                        SizedBox(
                          width: (constraints.maxWidth - Space.s) / 2,
                          child: Container(
                            padding: const EdgeInsets.all(Space.s),
                            decoration: BoxDecoration(
                              color: AppColors.surface2,
                              borderRadius: BorderRadius.circular(Radii.s),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.compact().format(value.value),
                                  style: context.text.titleSmall,
                                ),
                                Text(
                                  label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.text.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(width: Space.xs),
      IconButton(
        tooltip: 'Export channel summary as PNG',
        visualDensity: VisualDensity.compact,
        iconSize: 17,
        padding: const EdgeInsets.all(4),
        constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
        onPressed: onExport,
        icon: const Icon(Icons.ios_share_rounded),
      ),
    ],
  );
}

/// One of Telegram's statistics charts. Its data is Telegram's chart JSON:
/// columns of x (timestamps) and y values, with names, colours and types.
class _Graph extends ConsumerStatefulWidget {
  const _Graph({
    required this.chatId,
    required this.title,
    required this.graph,
  });
  final int chatId;
  final String title;
  final td.StatisticalGraph graph;

  @override
  ConsumerState<_Graph> createState() => _GraphState();
}

class _GraphState extends ConsumerState<_Graph> {
  final _captureKey = GlobalKey();
  Map<String, dynamic>? _data;
  String? _error;

  @override
  void initState() {
    super.initState();
    _resolve(widget.graph);
  }

  /// Saves exactly the graph people see, including its legend and dates, to
  /// the exports folder so it also appears in TeleAI's Files page.
  Future<void> _exportPng() async {
    try {
      final boundary =
          _captureKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary == null) throw StateError('The graph is not ready yet.');
      final image = await boundary.toImage(pixelRatio: 3);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      if (bytes == null) throw StateError('Couldn\'t render this graph.');
      final root = await getApplicationSupportDirectory();
      final dir = Directory('${root.path}/exports')
        ..createSync(recursive: true);
      final safe = widget.title
          .toLowerCase()
          .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
          .replaceAll(RegExp(r'^_|_$'), '');
      final file = File(
        '${dir.path}/teleai_stats_${safe.isEmpty ? 'graph' : safe}_${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
      if (mounted) showSnack(context, 'Saved ${widget.title} graph to Files');
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t export graph: $e');
    }
  }

  Future<void> _resolve(td.StatisticalGraph g) async {
    switch (g) {
      case td.StatisticalGraphData(:final jsonData):
        try {
          setState(() => _data = jsonDecode(jsonData) as Map<String, dynamic>);
        } catch (_) {
          setState(() => _error = 'Unreadable chart');
        }
      case td.StatisticalGraphAsync(:final token):
        try {
          final loaded = await ref
              .read(telegramClientProvider)
              .send<td.StatisticalGraph>(
                td.GetStatisticalGraph(
                  chatId: widget.chatId,
                  token: token,
                  x: 0,
                ),
                limited: true,
              );
          if (mounted && loaded is! td.StatisticalGraphAsync)
            await _resolve(loaded);
        } catch (e) {
          if (mounted) setState(() => _error = '$e');
        }
      case td.StatisticalGraphError(:final errorMessage):
        setState(() => _error = errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final d = _data;
    if (_error != null) return const SizedBox.shrink();
    final columns = (d?['columns'] as List?)?.cast<List>() ?? const [];
    final x = columns.where((c) => c.first == 'x').firstOrNull;
    final ys = columns.where((c) => c.first != 'x').toList();
    if (d != null && (x == null || ys.isEmpty)) return const SizedBox.shrink();
    final names = (d?['names'] as Map?) ?? const {};
    final colors = (d?['colors'] as Map?) ?? const {};
    Color colorOf(String key, int i) {
      final hex = '${colors[key] ?? ''}'.split('#').last;
      final v = int.tryParse(hex.length == 6 ? 'FF$hex' : hex, radix: 16);
      return v != null
          ? Color(v)
          : const [
              Color(0xFF8AB4FF),
              Color(0xFFFF9B85),
              Color(0xFF6FCF97),
              Color(0xFFF2C46D),
              Color(0xFFB69CFF),
            ][i % 5];
    }

    return RepaintBoundary(
      key: _captureKey,
      child: Padding(
        padding: const EdgeInsets.only(top: Space.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(widget.title, style: context.text.titleSmall),
                ),
                IconButton(
                  tooltip: 'Export graph as PNG',
                  visualDensity: VisualDensity.compact,
                  iconSize: 16,
                  padding: const EdgeInsets.all(4),
                  constraints: const BoxConstraints(
                    minWidth: 28,
                    minHeight: 28,
                  ),
                  onPressed: d == null ? null : _exportPng,
                  icon: const Icon(Icons.ios_share_rounded),
                ),
              ],
            ),
            const SizedBox(height: Space.s),
            SizedBox(
              height: 150,
              child: d == null
                  ? const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : CustomPaint(
                      size: Size.infinite,
                      painter: _LinePainter(
                        series: [
                          for (final (i, y) in ys.indexed)
                            (
                              [
                                for (final v in y.skip(1))
                                  (v as num).toDouble(),
                              ],
                              colorOf('${y.first}', i),
                            ),
                        ],
                        stacked:
                            d['stacked'] == true ||
                            (d['types'] as Map?)?.values.contains('bar') ==
                                true,
                      ),
                    ),
            ),
            if (x != null && x.length > 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (final t in [x[1], x.last])
                    Text(
                      (t as num) > 1e11
                          ? DateFormat('d MMM').format(
                              DateTime.fromMillisecondsSinceEpoch(t.toInt()),
                            )
                          : '$t',
                      style: context.text.labelSmall,
                    ),
                ],
              ),
            Wrap(
              spacing: Space.m,
              children: [
                for (final (i, y) in ys.indexed)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: colorOf('${y.first}', i),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${names[y.first] ?? y.first}',
                        style: context.text.labelSmall,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  _LinePainter({required this.series, this.stacked = false});
  final List<(List<double>, Color)> series;
  final bool stacked;

  @override
  void paint(Canvas canvas, Size size) {
    if (series.isEmpty) return;
    final n = series.map((s) => s.$1.length).reduce(math.max);
    if (n < 2) return;
    final maxV = series.expand((s) => s.$1).fold<double>(0, math.max);
    if (maxV <= 0) return;
    final grid = Paint()
      ..color = AppColors.line
      ..strokeWidth = 1;
    for (var i = 0; i <= 3; i++) {
      final y = size.height * i / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    for (final (values, color) in series) {
      final path = Path();
      for (var i = 0; i < values.length; i++) {
        final p = Offset(
          size.width * i / (n - 1),
          size.height - size.height * values[i] / maxV,
        );
        i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
      }
      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round,
      );
    }
  }

  @override
  bool shouldRepaint(_LinePainter old) => old.series != series;
}

// ---- people -------------------------------------------------------------------

class _People extends ConsumerStatefulWidget {
  const _People({required this.chatId, required this.filter});
  final int chatId;

  /// A supergroup filter, or [td.ChatMembersFilterAdministrators] for a
  /// basic group's admins too.
  final td.TdObject filter;

  @override
  ConsumerState<_People> createState() => _PeopleState();
}

class _PeopleState extends ConsumerState<_People>
    with AutomaticKeepAliveClientMixin {
  final List<td.ChatMember> _members = [];
  int _total = 0;
  bool _loading = false;
  bool _end = false;
  String? _error;
  final _scroll = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 400)
        _more();
    });
    _more();
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _more() async {
    if (_loading || _end) return;
    setState(() => _loading = true);
    final client = ref.read(telegramClientProvider);
    final chat = ref.read(telegramStoreProvider).chat(widget.chatId);
    try {
      final td.ChatMembers r;
      if (chat?.type case td.ChatTypeSupergroup(:final supergroupId)) {
        final f = widget.filter is td.ChatMembersFilterAdministrators
            ? null
            : widget.filter as td.SupergroupMembersFilter;
        r = f == null
            ? await client.send<td.ChatMembers>(
                td.SearchChatMembers(
                  chatId: widget.chatId,
                  query: '',
                  limit: 200,
                  filter: const td.ChatMembersFilterAdministrators(),
                ),
                limited: true,
              )
            : await client.send<td.ChatMembers>(
                td.GetSupergroupMembers(
                  supergroupId: supergroupId,
                  filter: f,
                  offset: _members.length,
                  limit: 100,
                ),
                limited: true,
              );
        if (f == null) _end = true;
      } else {
        r = await client.send<td.ChatMembers>(
          td.SearchChatMembers(
            chatId: widget.chatId,
            query: '',
            limit: 200,
            filter: widget.filter is td.ChatMembersFilterAdministrators
                ? const td.ChatMembersFilterAdministrators()
                : null,
          ),
          limited: true,
        );
        _end = true;
      }
      if (!mounted) return;
      setState(() {
        _members.addAll(r.members);
        _total = r.totalCount;
        if (r.members.isEmpty || _members.length >= r.totalCount) _end = true;
      });
    } catch (e) {
      if (mounted)
        setState(() => _error = e is TelegramException ? e.message : '$e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _status(td.ChatMemberStatus s) => switch (s) {
    td.ChatMemberStatusCreator() => 'Owner',
    td.ChatMemberStatusAdministrator() => 'Admin',
    td.ChatMemberStatusRestricted(:final restrictedUntilDate) =>
      restrictedUntilDate == 0
          ? 'Restricted'
          : 'Restricted until ${DateFormat('d MMM').format(DateTime.fromMillisecondsSinceEpoch(restrictedUntilDate * 1000))}',
    td.ChatMemberStatusBanned(:final bannedUntilDate) =>
      bannedUntilDate == 0
          ? 'Removed'
          : 'Removed until ${DateFormat('d MMM').format(DateTime.fromMillisecondsSinceEpoch(bannedUntilDate * 1000))}',
    td.ChatMemberStatusLeft() => 'Left',
    td.ChatMemberStatusMember() => 'Member',
  };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final store = ref.watch(telegramStoreProvider);
    if (_error != null && _members.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(Space.xl),
          child: Text(
            'Telegram didn\'t show this list: $_error\nOnly admins can see subscribers and removed users.',
            textAlign: TextAlign.center,
            style: context.text.bodySmall,
          ),
        ),
      );
    }
    return ListView.builder(
      controller: _scroll,
      itemCount: _members.length + 1,
      itemBuilder: (_, i) {
        if (i == 0) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              Space.l,
              Space.m,
              Space.l,
              Space.s,
            ),
            child: Text(
              _loading && _members.isEmpty
                  ? 'Loading…'
                  : '$_total in total${_members.length < _total ? ' · Telegram shows up to about 10,000' : ''}',
              style: context.text.labelSmall,
            ),
          );
        }
        final m = _members[i - 1];
        final name = store.senderName(m.memberId);
        return ListTile(
          leading: TgAvatar(
            userId: m.memberId is td.MessageSenderUser
                ? (m.memberId as td.MessageSenderUser).userId
                : null,
            chatId: m.memberId is td.MessageSenderChat
                ? (m.memberId as td.MessageSenderChat).chatId
                : null,
            title: name,
            size: 38,
          ),
          title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Text(
            [
              [_status(m.status), if (m.tag.isNotEmpty) m.tag].join(' · '),
              if (m.joinedChatDate > 0)
                'joined ${DateFormat('d MMM y').format(DateTime.fromMillisecondsSinceEpoch(m.joinedChatDate * 1000))}',
              if (m.inviterUserId != 0)
                'added by ${store.userName(m.inviterUserId)}',
            ].join(' · '),
            style: context.text.bodySmall,
          ),
        );
      },
    );
  }
}
