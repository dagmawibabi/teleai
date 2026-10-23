import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../app/theme.dart';
import '../../infrastructure/telegram/telegram_client.dart';
import '../telegram/data/file_loader.dart';
import '../telegram/data/telegram_store.dart';
import '../telegram/data/telegram_tools.dart';
import '../telegram/presentation/tg_avatar.dart';
import 'widgets.dart';

/// Telegram's footprint on this phone: what its cached files take, by kind
/// and by chat, with ways to free space; and the data it used, on mobile
/// and Wi-Fi.
class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Storage & data'),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.sd_storage_outlined, size: 20), text: 'Storage'),
            Tab(icon: Icon(Icons.swap_vert_rounded, size: 20), text: 'Data use'),
          ],
        ),
      ),
      body: const TabBarView(children: [_Storage(), _Data()]),
    ),
  );
}

/// How each kind of file is shown: name, icon, colour.
const _kinds = <String, (String, IconData, Color)>{
  'photos': ('Photos', Icons.photo_outlined, Color(0xFF8AB4FF)),
  'videos': ('Videos', Icons.videocam_outlined, Color(0xFFB69CFF)),
  'files': ('Files', Icons.insert_drive_file_outlined, Color(0xFF6FCF97)),
  'music': ('Music', Icons.music_note_outlined, Color(0xFFF2C46D)),
  'voice': ('Voice messages', Icons.mic_none_rounded, Color(0xFFFF9B85)),
  'video_messages': ('Video messages', Icons.radio_button_checked_rounded, Color(0xFF7FD6E8)),
  'gifs': ('GIFs', Icons.gif_box_outlined, Color(0xFFE88FCF)),
  'stickers': ('Stickers', Icons.emoji_emotions_outlined, Color(0xFFFFC48A)),
  'profile_photos': ('Profile photos', Icons.account_circle_outlined, Color(0xFF9FD8A4)),
  'thumbnails': ('Thumbnails', Icons.image_aspect_ratio_outlined, Color(0xFFB0B6C3)),
  'wallpapers': ('Wallpapers', Icons.wallpaper_outlined, Color(0xFFC9A7FF)),
  'other': ('Other', Icons.category_outlined, Color(0xFF8E939E)),
  'messages': ('Messages', Icons.chat_bubble_outline_rounded, Color(0xFF8AB4FF)),
  'calls': ('Calls', Icons.call_outlined, Color(0xFF6FCF97)),
};

(String, IconData, Color) _kind(String k) => _kinds[k] ?? (k, Icons.category_outlined, const Color(0xFF8E939E));

class _Storage extends ConsumerStatefulWidget {
  const _Storage();

  @override
  ConsumerState<_Storage> createState() => _StorageState();
}

class _StorageState extends ConsumerState<_Storage> with AutomaticKeepAliveClientMixin {
  late Future<(td.StorageStatisticsFast, td.StorageStatistics)> _stats = ref.read(toolRunnerProvider).storage(chats: 25);
  bool _cleaning = false;

  @override
  bool get wantKeepAlive => true;

  void _reload() => setState(() => _stats = ref.read(toolRunnerProvider).storage(chats: 25));

  Future<void> _clean({int? olderThanDays, List<String> kinds = const [], List<int> chats = const [], required String what}) async {
    final ok = await confirm(
      context,
      title: 'Clear cached files?',
      body: '$what will be removed from this phone. Nothing is deleted from Telegram: it downloads again when you open it.',
      action: 'Clear',
    );
    if (!ok) return;
    setState(() => _cleaning = true);
    try {
      final freed = await ref.read(toolRunnerProvider).cleanCache(olderThanDays: olderThanDays, kinds: kinds, chatIds: chats);
      if (mounted) showSnack(context, 'Freed ${formatBytes(freed.size)}');
    } catch (e) {
      if (mounted) showSnack(context, 'Couldn\'t clear: $e', icon: Icons.error_outline_rounded);
    }
    if (mounted) setState(() => _cleaning = false);
    _reload();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final store = ref.watch(telegramStoreProvider);
    return FutureBuilder<(td.StorageStatisticsFast, td.StorageStatistics)>(
      future: _stats,
      builder: (context, snap) {
        if (snap.hasError) {
          return _Retry(message: 'Couldn\'t read storage.\n${snap.error}', onRetry: _reload);
        }
        final data = snap.data;
        if (data == null || _cleaning) return _Busy(_cleaning ? 'Clearing…' : 'Counting files…');
        final (fast, full) = data;
        final byKind = <String, int>{};
        for (final c in full.byChat) {
          for (final t in c.byFileType) {
            byKind.update(MoreTdTools.fileTypeName(t.fileType), (v) => v + t.size, ifAbsent: () => t.size);
          }
        }
        final kinds = byKind.entries.where((e) => e.value > 0).toList()..sort((a, b) => b.value.compareTo(a.value));
        final total = kinds.fold<int>(0, (a, e) => a + e.value);
        final chats = full.byChat.where((c) => c.chatId != 0 && c.size > 0).toList();
        final biggest = chats.isEmpty ? 0 : chats.first.size;
        return RefreshIndicator(
          onRefresh: () async => _reload(),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
            children: [
              Group(
                padded: true,
                children: [
                  Row(
                    children: [
                      Ring(
                        size: 132,
                        stroke: 13,
                        parts: [for (final e in kinds) (e.value.toDouble(), _kind(e.key).$3)],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(formatBytes(fast.filesSize), style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                            Text('cache', style: context.text.labelSmall),
                          ],
                        ),
                      ),
                      const SizedBox(width: Space.l),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Stat(label: 'Cached files', value: NumberFormat.decimalPattern().format(fast.fileCount)),
                            const SizedBox(height: Space.s),
                            _Stat(label: 'Database', value: formatBytes(fast.databaseSize)),
                            const SizedBox(height: Space.s),
                            _Stat(label: 'Logs', value: formatBytes(fast.logSize)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Group(
                label: 'By kind',
                children: [
                  if (kinds.isEmpty)
                    const ListTile(title: Text('Nothing cached yet')),
                  for (final e in kinds)
                    ListTile(
                      leading: IconBadge(_kind(e.key).$2, color: _kind(e.key).$3),
                      title: Row(
                        children: [
                          Expanded(child: Text(_kind(e.key).$1)),
                          Text(formatBytes(e.value), style: context.text.bodySmall),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Meter(value: e.value.toDouble(), max: total.toDouble(), color: _kind(e.key).$3),
                      ),
                      trailing: MoreTdTools.fileTypesFor(e.key).isEmpty
                          ? const SizedBox(width: 40)
                          : IconButton(
                              tooltip: 'Clear ${_kind(e.key).$1.toLowerCase()}',
                              icon: const Icon(Icons.cleaning_services_outlined, size: 20),
                              onPressed: () => _clean(kinds: [e.key], what: 'All cached ${_kind(e.key).$1.toLowerCase()}'),
                            ),
                    ),
                ],
              ),
              Group(
                label: 'Free up space',
                children: [
                  _Action(
                    icon: Icons.history_toggle_off_rounded,
                    title: 'Older than a week',
                    subtitle: 'Keeps what you opened recently',
                    onTap: () => _clean(olderThanDays: 7, what: 'Files you haven\'t opened for a week'),
                  ),
                  _Action(
                    icon: Icons.calendar_month_outlined,
                    title: 'Older than a month',
                    subtitle: 'The gentle option',
                    onTap: () => _clean(olderThanDays: 30, what: 'Files you haven\'t opened for a month'),
                  ),
                  _Action(
                    icon: Icons.delete_sweep_outlined,
                    title: 'Clear the whole cache',
                    subtitle: '${formatBytes(fast.filesSize)} back; everything downloads again when opened',
                    color: AppColors.danger,
                    onTap: () => _clean(what: 'Every cached file'),
                  ),
                ],
              ),
              if (chats.isNotEmpty)
                Group(
                  label: 'Biggest chats',
                  children: [
                    for (final c in chats)
                      ListTile(
                        leading: TgAvatar(chatId: c.chatId, title: store.chat(c.chatId)?.title ?? '?', size: 36),
                        title: Row(
                          children: [
                            Expanded(child: Text(store.chat(c.chatId)?.title ?? 'Chat ${c.chatId}', maxLines: 1, overflow: TextOverflow.ellipsis)),
                            Text(formatBytes(c.size), style: context.text.bodySmall),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Meter(value: c.size.toDouble(), max: biggest.toDouble(), color: AppColors.accent),
                        ),
                        trailing: IconButton(
                          tooltip: 'Clear this chat\'s files',
                          icon: const Icon(Icons.cleaning_services_outlined, size: 20),
                          onPressed: () => _clean(chats: [c.chatId], what: 'Cached files from ${store.chat(c.chatId)?.title ?? 'this chat'}'),
                        ),
                      ),
                  ],
                ),
              const SizedBox(height: Space.m),
              Text(
                'Tip: ask the assistant "free up space from channels I don\'t read" and it will pick what to clear.',
                textAlign: TextAlign.center,
                style: context.text.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});
  final String label, value;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(value, style: context.text.titleMedium),
      Text(label, style: context.text.bodySmall),
    ],
  );
}

class _Action extends StatelessWidget {
  const _Action({required this.icon, required this.title, required this.subtitle, required this.onTap, this.color});
  final IconData icon;
  final String title, subtitle;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: IconBadge(icon, color: color),
    title: Text(title, style: color == null ? null : TextStyle(color: color)),
    subtitle: Text(subtitle, style: context.text.bodySmall),
    trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.text3),
    onTap: onTap,
  );
}

class _Busy extends StatelessWidget {
  const _Busy(this.label);
  final String label;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox.square(dimension: 22, child: CircularProgressIndicator(strokeWidth: 2)),
        const SizedBox(height: Space.m),
        Text(label, style: context.text.bodySmall),
      ],
    ),
  );
}

class _Retry extends StatelessWidget {
  const _Retry({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Space.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off_rounded, size: 36, color: AppColors.text3),
          const SizedBox(height: Space.m),
          Text(message, textAlign: TextAlign.center, style: context.text.bodySmall),
          const SizedBox(height: Space.m),
          OutlinedButton(onPressed: onRetry, child: const Text('Try again')),
        ],
      ),
    ),
  );
}

// ---- data use -----------------------------------------------------------------

class _Data extends ConsumerStatefulWidget {
  const _Data();

  @override
  ConsumerState<_Data> createState() => _DataState();
}

class _DataState extends ConsumerState<_Data> with AutomaticKeepAliveClientMixin {
  late Future<td.NetworkStatistics> _stats = ref.read(toolRunnerProvider).networkStats();

  @override
  bool get wantKeepAlive => true;

  static const _nets = <String, (String, IconData, Color)>{
    'mobile': ('Mobile data', Icons.signal_cellular_alt_rounded, Color(0xFFF2C46D)),
    'wifi': ('Wi-Fi', Icons.wifi_rounded, Color(0xFF8AB4FF)),
    'roaming': ('Roaming', Icons.public_rounded, Color(0xFFFF9B85)),
    'other': ('Other', Icons.device_hub_rounded, Color(0xFFB0B6C3)),
  };

  Future<void> _reset() async {
    final ok = await confirm(context, title: 'Reset the counters?', body: 'Data use starts counting again from now.', action: 'Reset');
    if (!ok) return;
    await ref.read(telegramClientProvider).send<td.Ok>(const td.ResetNetworkStatistics());
    setState(() => _stats = ref.read(toolRunnerProvider).networkStats());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<td.NetworkStatistics>(
      future: _stats,
      builder: (context, snap) {
        if (snap.hasError) {
          return _Retry(message: 'Couldn\'t read data use.\n${snap.error}', onRetry: () => setState(() => _stats = ref.read(toolRunnerProvider).networkStats()));
        }
        final s = snap.data;
        if (s == null) return const _Busy('Reading data use…');
        final table = MoreTdTools.usageTable(s);
        int sum(Map<String, (int, int)> rows) => rows.values.fold<int>(0, (a, b) => a + b.$1 + b.$2);
        final totals = {for (final e in table.entries) e.key: sum(e.value)};
        final all = totals.values.fold<int>(0, (a, b) => a + b);
        final since = DateFormat('d MMM y').format(DateTime.fromMillisecondsSinceEpoch(s.sinceDate * 1000));
        return ListView(
          padding: const EdgeInsets.fromLTRB(Space.l, Space.s, Space.l, Space.x4),
          children: [
            Group(
              padded: true,
              children: [
                Row(
                  children: [
                    Ring(
                      size: 118,
                      stroke: 12,
                      parts: [
                        for (final n in _nets.keys)
                          if ((totals[n] ?? 0) > 0) ((totals[n] ?? 0).toDouble(), _nets[n]!.$3),
                      ],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(formatBytes(all), style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                          Text('since $since', style: context.text.labelSmall, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    const SizedBox(width: Space.l),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final n in _nets.keys)
                            if ((totals[n] ?? 0) > 0)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  children: [
                                    Icon(_nets[n]!.$2, size: 16, color: _nets[n]!.$3),
                                    const SizedBox(width: Space.s),
                                    Expanded(child: Text(_nets[n]!.$1)),
                                    Text(formatBytes(totals[n]!), style: context.text.bodySmall),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            for (final n in _nets.keys)
              if (table[n] case final rows? when sum(rows) > 0)
                Group(
                  label: _nets[n]!.$1,
                  trailing: Text(formatBytes(sum(rows)), style: context.text.labelSmall),
                  children: [
                    for (final r in (rows.entries.where((r) => r.value.$1 + r.value.$2 > 0).toList()
                      ..sort((a, b) => (b.value.$1 + b.value.$2).compareTo(a.value.$1 + a.value.$2))))
                      ListTile(
                        dense: true,
                        leading: IconBadge(_kind(r.key).$2, color: _kind(r.key).$3, size: 32),
                        title: Text(_kind(r.key).$1),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.arrow_upward_rounded, size: 13, color: AppColors.text3),
                            Text(formatBytes(r.value.$1), style: context.text.bodySmall),
                            const SizedBox(width: Space.s),
                            const Icon(Icons.arrow_downward_rounded, size: 13, color: AppColors.text3),
                            Text(formatBytes(r.value.$2), style: context.text.bodySmall),
                          ],
                        ),
                      ),
                  ],
                ),
            const SizedBox(height: Space.l),
            Center(
              child: TextButton.icon(onPressed: _reset, icon: const Icon(Icons.restart_alt_rounded), label: const Text('Reset counters')),
            ),
          ],
        );
      },
    );
  }
}
