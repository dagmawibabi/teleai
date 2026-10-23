import 'dart:io';

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme.dart';
import '../../../telegram/presentation/chat_view_screen.dart';
import '../../../telegram/presentation/tg_avatar.dart';
import '../../domain/chat_models.dart';
import 'post_viewer.dart';
import '../../../telegram/presentation/link_opener.dart';

final _ref = RegExp(r'post:(-?\d+):(\d+)');

/// A tool's result laid out for reading: messages as message rows, chats as
/// chat rows, counts as tiles. Anything it doesn't recognise falls back to
/// a key/value table.
class ToolResultView extends StatelessWidget {
  const ToolResultView({super.key, required this.name, required this.json});
  final String name;
  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    final j = json;
    if (j['error'] != null)
      return _Callout(
        icon: Icons.error_outline_rounded,
        color: AppColors.danger,
        text: '${j['error']}',
      );

    // Search results deserve a real reading surface, rather than the opaque
    // data dump used for an unknown tool response.
    if (name == 'web_search' && j['results'] is List) {
      return _WebSearchResults(
        query: '${j['query'] ?? ''}',
        results: (j['results'] as List).whereType<Map>().toList(),
      );
    }

    final children = <Widget>[];
    if (j['image_path'] is String) {
      children.add(GeneratedImage(path: j['image_path'] as String));
      if (j['prompt'] != null) {
        children.add(const SizedBox(height: Space.m));
        children.add(Text('${j['prompt']}', style: context.text.bodySmall));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }
    if (j['audio_path'] is String)
      return GeneratedAudio(
        path: j['audio_path'] as String,
        text: '${j['text'] ?? ''}',
      );
    if (j['activity_sent'] == true) {
      return _Callout(
        icon: Icons.more_time_rounded,
        color: AppColors.success,
        text:
            'Showing ${'${j['action']}'.replaceAll('_', ' ')} in ${j['chat']}',
      );
    }
    if (j['sent'] == true) {
      final what = j['forwarded'] != null
          ? 'Forwarded ${j['forwarded']} message(s) to ${j['chat']}'
          : 'Sent to ${j['chat']}';
      return _Callout(
        icon: Icons.check_circle_outline_rounded,
        color: AppColors.success,
        text: what,
      );
    }
    if (j['total_chats'] != null) return _Overview(j: j);
    if (j['memories'] is List) {
      final list = (j['memories'] as List).whereType<Map>().toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Section(title: 'Memories', count: list.length),
          if (list.isEmpty) const _Empty('Nothing remembered yet'),
          for (final m in list)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.bookmark_outline_rounded,
                color: AppColors.accent,
              ),
              title: Text('${m['content']}'),
              subtitle: Text(
                '${m['memory_id']}',
                style: context.text.labelSmall,
              ),
            ),
        ],
      );
    }
    if (j['watches'] is List) {
      final list = (j['watches'] as List).whereType<Map>().toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (j['proactivity_on'] == false)
            const _Callout(
              icon: Icons.pause_circle_outline_rounded,
              color: AppColors.warning,
              text: 'Proactivity is off: watches are paused.',
            ),
          _Section(title: 'Watches', count: list.length),
          if (list.isEmpty) const _Empty('No watches'),
          for (final w in list)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                w['enabled'] == false
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.accent,
              ),
              title: Text('${w['name']}'),
              subtitle: Text(
                '${w['mode']} · ${w['trigger']}${w['instructions'] == null ? '' : ' · ${w['instructions']}'}',
                maxLines: 2,
              ),
            ),
        ],
      );
    }
    if (j['saved'] == true || j['updated'] == true && j['memory_id'] != null) {
      return _Callout(
        icon: Icons.bookmark_added_outlined,
        color: AppColors.success,
        text: 'Remembered: ${j['content']}',
      );
    }
    if (j['forgotten'] == true) {
      return const _Callout(
        icon: Icons.bookmark_remove_outlined,
        color: AppColors.success,
        text: 'Forgotten',
      );
    }
    if (j['watch_id'] != null &&
        (j['created'] == true || j['updated'] == true)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            icon: Icons.visibility_outlined,
            color: AppColors.success,
            text:
                '${j['created'] == true ? 'Watching' : 'Updated'}: ${j['name']} (${j['mode']}, ${j['trigger']})',
          ),
          for (final k in const ['note', 'approvals'])
            if (j[k] is String)
              _Callout(
                icon: Icons.info_outline_rounded,
                color: AppColors.warning,
                text: j[k] as String,
              ),
        ],
      );
    }
    if (j['notified'] == true) {
      return const _Callout(
        icon: Icons.notifications_active_outlined,
        color: AppColors.success,
        text: 'Notification sent',
      );
    }
    if (j['scheduled'] == true) {
      return _Callout(
        icon: Icons.schedule_send_outlined,
        color: AppColors.success,
        text:
            'Scheduled in ${j['chat']} for ${'${j['send_at']}'.replaceFirst('T', ' ')}',
      );
    }
    if (j['scheduled'] is List) {
      final list = (j['scheduled'] as List).whereType<Map>().toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Section(title: 'Scheduled', count: list.length),
          if (list.isEmpty) const _Empty('Nothing scheduled'),
          for (final m in list)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: TgAvatar(
                chatId: (m['chat_id'] as num?)?.toInt(),
                title: '${m['chat']}',
                size: 32,
              ),
              title: Text(
                '${m['text']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${m['chat']} · ${'${m['send_at']}'.replaceFirst('T', ' ')}',
                style: context.text.bodySmall,
              ),
            ),
        ],
      );
    }
    if (j['done'] == true && (j['pinned'] != null || j['unpinned'] != null)) {
      return _Callout(
        icon: Icons.push_pin_outlined,
        color: AppColors.success,
        text:
            '${j['pinned'] != null ? 'Pinned' : 'Unpinned'} a message in ${j['chat']}',
      );
    }
    if (j['done'] == true && j['edited'] == true) {
      return _Callout(
        icon: Icons.check_circle_outline_rounded,
        color: AppColors.success,
        text: 'Edited a message in ${j['chat']}',
      );
    }
    if (j['done'] == true &&
        j['reaction'] == null &&
        j['muted'] == null &&
        j['was_unread'] == null) {
      return _Callout(
        icon: Icons.check_circle_outline_rounded,
        color: AppColors.success,
        text: j['sent_now'] == true
            ? 'Sent the scheduled message in ${j['chat']}'
            : j['send_at'] != null
            ? 'Rescheduled in ${j['chat']} for ${'${j['send_at']}'.replaceFirst('T', ' ')}'
            : '${j['message'] ?? 'Done'}',
      );
    }
    if (j['done'] == true) {
      final what = j['reaction'] != null
          ? '${j['removed'] == true ? 'Removed' : 'Reacted'} ${j['reaction']} in ${j['chat']}'
          : j['muted'] != null
          ? '${j['muted'] == true ? 'Muted' : 'Unmuted'} ${j['chat']}'
          : 'Marked ${j['chat']} as read';
      return _Callout(
        icon: Icons.check_circle_outline_rounded,
        color: AppColors.success,
        text: what,
      );
    }
    if (j['topics'] is List) {
      final list = (j['topics'] as List).whereType<Map>().toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Section(title: 'Topics', count: list.length),
          for (final t in list)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                t['general'] == true ? Icons.tag_rounded : Icons.topic_outlined,
                color: AppColors.text2,
              ),
              title: Text('${t['name']}'),
              subtitle: t['last_message'] == null
                  ? null
                  : Text(
                      '${t['last_message']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
              trailing: t['unread'] == null
                  ? null
                  : Text(
                      '${t['unread']} unread',
                      style: context.text.bodySmall,
                    ),
            ),
        ],
      );
    }
    if (j['groups_in_common'] != null) {
      return _KeyValues(
        rows: [
          for (final k in const [
            'name',
            'username',
            'bio',
            'status',
            'phone',
            'groups_in_common',
          ])
            if (j[k] != null) (_humanize(k), '${j[k]}'),
          if (j['personal_channel'] is Map)
            ('Channel', '${(j['personal_channel'] as Map)['title']}'),
          if (j['common_groups'] is List)
            (
              'Common groups',
              (j['common_groups'] as List)
                  .map((g) => (g as Map)['title'])
                  .join(', '),
            ),
        ],
      );
    }

    final chat = j['chat'];
    if (chat is Map) children.add(_ChatRow(c: Map<String, dynamic>.from(chat)));

    final stats = <(String, Object)>[
      for (final k in const [
        'count',
        'total',
        'matching',
        'total_matching',
        'active_chats_in_window',
        'chats_read',
        'chats_with_mentions',
        'total_mentions',
      ])
        if (j[k] is num) (_humanize(k), j[k] as Object),
    ];
    if (stats.isNotEmpty) children.add(_StatRow(stats: stats));

    if (j['message'] is Map)
      children.add(_MessageRow(m: Map<String, dynamic>.from(j['message'])));
    if (j['messages'] is List) {
      final list = (j['messages'] as List).whereType<Map>().toList();
      children.add(
        _Section(
          title: name == 'get_comments' ? 'Comments' : 'Messages',
          count: list.length,
        ),
      );
      if (list.isEmpty) children.add(const _Empty('No messages'));
      for (final m in list) {
        children.add(_MessageRow(m: Map<String, dynamic>.from(m)));
      }
    }
    if (j['chats'] is List) {
      final list = (j['chats'] as List)
          .whereType<Map>()
          .map(Map<String, dynamic>.from)
          .toList();
      final grouped = list.any((c) => c['messages'] is List);
      children.add(_Section(title: j['folder'] is String ? 'Folder · ${j['folder']}' : 'Chats', count: list.length));
      if (list.isEmpty) children.add(const _Empty('No chats'));
      for (final c in list) {
        children.add(_ChatRow(c: c));
        if (grouped) {
          for (final m
              in (c['messages'] as List? ?? const []).whereType<Map>()) {
            children.add(
              Padding(
                padding: const EdgeInsets.only(left: Space.xl),
                child: _MessageRow(
                  m: Map<String, dynamic>.from(m),
                  compact: true,
                ),
              ),
            );
          }
        }
      }
    }
    if (j['contacts'] is List || j['members'] is List) {
      final list = ((j['contacts'] ?? j['members']) as List)
          .whereType<Map>()
          .toList();
      children.add(
        _Section(
          title: j['contacts'] != null ? 'Contacts' : 'Members',
          count: list.length,
        ),
      );
      for (final p in list) {
        children.add(_PersonRow(p: Map<String, dynamic>.from(p)));
      }
    }
    if (j['folders'] is List) {
      final list = (j['folders'] as List).whereType<Map>().toList();
      children.add(_Section(title: 'Folders', count: list.length));
      for (final f in list) {
        children.add(
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.folder_outlined, color: AppColors.text2),
            title: Text('${f['title']}'),
            trailing: Text(
              '${f['chats']} chats · ${f['unread_chats']} unread',
              style: context.text.bodySmall,
            ),
          ),
        );
      }
    }
    for (final k in const ['note', 'more']) {
      if (j[k] is String)
        children.add(
          _Callout(
            icon: Icons.info_outline_rounded,
            color: AppColors.text2,
            text: j[k] as String,
          ),
        );
    }
    if (j['not_read'] is List && (j['not_read'] as List).isNotEmpty) {
      children.add(
        _Callout(
          icon: Icons.more_horiz_rounded,
          color: AppColors.text2,
          text:
              'Also active but not read: ${(j['not_read'] as List).join(', ')}',
        ),
      );
    }

    // Tools evolve independently of this widget. Preserve every nested piece
    // of a successful response in a legible form, even before it gets a
    // purpose-built renderer above.
    const renderedCollections = {
      'chat',
      'message',
      'messages',
      'chats',
      'contacts',
      'members',
      'folders',
      'not_read',
      'personal_channel',
      'common_groups',
    };
    final extra = <String, dynamic>{
      for (final entry in j.entries)
        if ((entry.value is Map || entry.value is List) &&
            !renderedCollections.contains(entry.key))
          entry.key: entry.value,
    };
    if (extra.isNotEmpty) {
      children.add(const SizedBox(height: Space.s));
      children.add(_StructuredResult(data: extra));
    }

    if (children.isEmpty) {
      return _StructuredResult(data: j);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  static String _humanize(String k) {
    final s = k.replaceAll('_', ' ');
    return s[0].toUpperCase() + s.substring(1);
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.count});
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: Space.l, bottom: Space.s),
    child: Text(
      '${title.toUpperCase()} · $count',
      style: context.text.labelSmall,
    ),
  );
}

class _Empty extends StatelessWidget {
  const _Empty(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: Space.s),
    child: Text(text, style: context.text.bodySmall),
  );
}

class _WebSearchResults extends StatelessWidget {
  const _WebSearchResults({required this.query, required this.results});
  final String query;
  final List<Map> results;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        padding: const EdgeInsets.all(Space.m),
        decoration: BoxDecoration(
          color: AppColors.activeAccent.withValues(alpha: .10),
          borderRadius: BorderRadius.circular(Radii.m),
        ),
        child: Row(
          children: [
            Icon(Icons.travel_explore_rounded, color: AppColors.activeAccent),
            const SizedBox(width: Space.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Web search', style: context.text.labelSmall),
                  Text(
                    query.isEmpty ? 'Search results' : query,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleSmall,
                  ),
                ],
              ),
            ),
            Text('${results.length}', style: context.text.titleMedium),
          ],
        ),
      ),
      if (results.isEmpty) const _Empty('No web results found'),
      for (final result in results) _WebResultCard(result: result),
    ],
  );
}

class _WebResultCard extends StatelessWidget {
  const _WebResultCard({required this.result});
  final Map result;

  @override
  Widget build(BuildContext context) {
    final url = '${result['url'] ?? ''}';
    final uri = Uri.tryParse(url);
    final host = uri?.host.replaceFirst('www.', '') ?? '';
    final highlights = (result['highlights'] as List? ?? const [])
        .whereType<Object>()
        .map((value) => '$value')
        .where((value) => value.trim().isNotEmpty)
        .take(2)
        .toList();
    final metadata = [
      if (host.isNotEmpty) host,
      if (result['published_at'] != null) '${result['published_at']}',
    ].join(' · ');
    return Padding(
      padding: const EdgeInsets.only(top: Space.s),
      child: Material(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(Radii.m),
        child: InkWell(
          borderRadius: BorderRadius.circular(Radii.m),
          onTap: uri == null || !uri.hasScheme
              ? null
              : () => openUrl('$uri', context: context),
          child: Padding(
            padding: const EdgeInsets.all(Space.m),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.activeAccent.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.language_rounded,
                    size: 18,
                    color: AppColors.activeAccent,
                  ),
                ),
                const SizedBox(width: Space.m),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${result['title'] ?? (host.isEmpty ? 'Untitled result' : host)}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.titleSmall,
                      ),
                      if (metadata.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(metadata, style: context.text.labelSmall),
                      ],
                      for (final highlight in highlights) ...[
                        const SizedBox(height: Space.s),
                        Text(
                          highlight,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
                if (uri != null && uri.hasScheme)
                  const Padding(
                    padding: EdgeInsets.only(left: Space.s),
                    child: Icon(
                      Icons.open_in_new_rounded,
                      size: 17,
                      color: AppColors.text3,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StructuredResult extends StatelessWidget {
  const _StructuredResult({required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const _Empty('This tool completed without data.');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final entry in data.entries)
          _StructuredEntry(
            label: ToolResultView._humanize(entry.key),
            value: entry.value,
          ),
      ],
    );
  }
}

class _StructuredEntry extends StatelessWidget {
  const _StructuredEntry({required this.label, required this.value});
  final String label;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    if (value is! Map && value is! List) {
      return _KeyValues(rows: [(label, '$value')]);
    }
    final items = value is List ? value as List : [value];
    return Padding(
      padding: const EdgeInsets.only(top: Space.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            value is List
                ? '${label.toUpperCase()} · ${items.length}'
                : label.toUpperCase(),
            style: context.text.labelSmall,
          ),
          if (items.isEmpty) const _Empty('None'),
          for (final item in items) _StructuredCard(value: item),
        ],
      ),
    );
  }
}

class _StructuredCard extends StatelessWidget {
  const _StructuredCard({required this.value});
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    if (value is! Map) {
      return Padding(
        padding: const EdgeInsets.only(top: Space.s),
        child: Text('$value', style: context.text.bodyMedium),
      );
    }
    final map = Map<String, dynamic>.from(value as Map);
    final title = [
      map['title'],
      map['name'],
      map['label'],
      map['emoji'],
      map['text'],
      map['url'],
    ].whereType<Object>().map((item) => '$item').firstOrNull;
    final scalars = map.entries
        .where((entry) => entry.value is! Map && entry.value is! List)
        .where((entry) => '${entry.value}' != title)
        .toList();
    final nested = map.entries
        .where((entry) => entry.value is Map || entry.value is List)
        .toList();
    return Container(
      margin: const EdgeInsets.only(top: Space.s),
      padding: const EdgeInsets.all(Space.m),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(Radii.m),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            SelectableText(title, style: context.text.titleSmall),
          if (scalars.isNotEmpty) ...[
            if (title != null) const SizedBox(height: Space.s),
            _KeyValues(
              rows: [
                for (final entry in scalars)
                  (ToolResultView._humanize(entry.key), '${entry.value}'),
              ],
            ),
          ],
          for (final entry in nested)
            _StructuredEntry(
              label: ToolResultView._humanize(entry.key),
              value: entry.value,
            ),
        ],
      ),
    );
  }
}

class _Callout extends StatelessWidget {
  const _Callout({required this.icon, required this.color, required this.text});
  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: Space.m),
    padding: const EdgeInsets.all(Space.m),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(Radii.m),
      border: Border.all(color: color.withValues(alpha: 0.25)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: Space.s),
        Expanded(
          child: Text(
            text,
            style: context.text.bodySmall?.copyWith(color: AppColors.text),
          ),
        ),
      ],
    ),
  );
}

class _StatRow extends StatelessWidget {
  const _StatRow({required this.stats});
  final List<(String, Object)> stats;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: Space.m),
    child: Wrap(
      spacing: Space.s,
      runSpacing: Space.s,
      children: [for (final (k, v) in stats) _Stat(label: k, value: '$v')],
    ),
  );
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value, this.wide = false});
  final String label;
  final String value;
  final bool wide;

  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(minWidth: wide ? 140 : 96),
    padding: const EdgeInsets.symmetric(
      horizontal: Space.m,
      vertical: Space.s + 2,
    ),
    decoration: BoxDecoration(
      color: AppColors.surface2,
      borderRadius: BorderRadius.circular(Radii.m),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: context.text.titleLarge?.copyWith(
            fontFeatures: tabularFigures,
          ),
        ),
        Text(label, style: context.text.bodySmall),
      ],
    ),
  );
}

class _Overview extends StatelessWidget {
  const _Overview({required this.j});
  final Map<String, dynamic> j;

  @override
  Widget build(BuildContext context) {
    final me = j['me'] is Map
        ? Map<String, dynamic>.from(j['me'])
        : const <String, dynamic>{};
    final byType = j['by_type'] is Map
        ? Map<String, dynamic>.from(j['by_type'])
        : const <String, dynamic>{};
    final dms = j['unread_dms'] is Map
        ? Map<String, dynamic>.from(j['unread_dms'])
        : const <String, dynamic>{};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (me.isNotEmpty)
          Text(
            [me['name'], me['username']].whereType<String>().join(' · '),
            style: context.text.titleMedium,
          ),
        const SizedBox(height: Space.m),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: [
            _Stat(label: 'Chats', value: '${j['total_chats']}'),
            for (final e in byType.entries)
              _Stat(label: '${e.key}s', value: '${e.value}'),
            _Stat(label: 'Archived', value: '${j['archived'] ?? 0}'),
            _Stat(label: 'Muted', value: '${j['muted'] ?? 0}'),
          ],
        ),
        const SizedBox(height: Space.l),
        Text('UNREAD', style: context.text.labelSmall),
        const SizedBox(height: Space.s),
        Wrap(
          spacing: Space.s,
          runSpacing: Space.s,
          children: [
            _Stat(
              label: 'Chats with unread',
              value: '${j['chats_with_unread'] ?? 0}',
              wide: true,
            ),
            _Stat(
              label: 'Messages',
              value: NumberFormat.compact().format(j['unread_messages'] ?? 0),
            ),
            _Stat(label: 'Mentions', value: '${j['unread_mentions'] ?? 0}'),
            _Stat(label: 'DMs', value: '${dms['chats'] ?? 0}'),
          ],
        ),
        if (dms['from'] is List && (dms['from'] as List).isNotEmpty) ...[
          const SizedBox(height: Space.m),
          Text(
            'Unread DMs from ${(dms['from'] as List).join(', ')}',
            style: context.text.bodySmall,
          ),
        ],
      ],
    );
  }
}

class _KeyValues extends StatelessWidget {
  const _KeyValues({required this.rows});
  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final (k, v) in rows)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.s),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(k, style: context.text.bodySmall),
              ),
              Expanded(
                child: SelectableText(v, style: context.text.bodyMedium),
              ),
            ],
          ),
        ),
    ],
  );
}

class _ChatRow extends StatelessWidget {
  const _ChatRow({required this.c});
  final Map<String, dynamic> c;

  @override
  Widget build(BuildContext context) {
    final id = (c['chat_id'] as num?)?.toInt();
    final title = '${c['title'] ?? 'Chat'}';
    final unread = (c['unread'] as num?)?.toInt() ?? 0;
    final sub = [
      c['type'],
      if (c['username'] != null) c['username'],
      if (c['members'] != null)
        '${NumberFormat.compact().format(c['members'])} members',
      if (c['joined'] == false) 'not joined',
    ].whereType<Object>().join(' · ');
    return InkWell(
      borderRadius: BorderRadius.circular(Radii.m),
      onTap: id == null
          ? null
          : () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ChatViewScreen(chatId: id),
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.s),
        child: Row(
          children: [
            TgAvatar(chatId: id, title: title, size: 36),
            const SizedBox(width: Space.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleSmall,
                  ),
                  if (c['last_message'] != null)
                    Text(
                      '${c['last_message']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.bodySmall,
                    )
                  else if (sub.isNotEmpty)
                    Text(sub, style: context.text.bodySmall),
                ],
              ),
            ),
            if (unread > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: c['muted'] == true
                      ? AppColors.surface3
                      : AppColors.accent,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '$unread',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: c['muted'] == true ? AppColors.text2 : AppColors.bg,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MessageRow extends StatelessWidget {
  const _MessageRow({required this.m, this.compact = false});
  final Map<String, dynamic> m;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final match = _ref.firstMatch('${m['ref'] ?? ''}');
    final chatId = match == null ? null : int.parse(match[1]!);
    final chat = '${m['chat'] ?? ''}';
    final text = '${m['text'] ?? m['detail'] ?? ''}';
    final date = DateTime.tryParse('${m['date'] ?? ''}');
    final kind = '${m['media'] ?? 'text'}';
    final meta = [
      if (!compact) chat,
      if (m['sender'] != null) m['sender'],
      if (date != null) DateFormat('d MMM HH:mm').format(date),
      if (m['views'] != null)
        '${NumberFormat.compact().format(m['views'])} views',
    ].join(' · ');
    return InkWell(
      borderRadius: BorderRadius.circular(Radii.m),
      onTap: match == null
          ? null
          : () => showPost(
              context,
              PostSnapshot(
                chatId: chatId!,
                messageId: int.parse(match[2]!),
                chatTitle: chat,
                date: date ?? DateTime.now(),
                text: text,
                sender: m['sender'] as String?,
                kind: kind,
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Space.s),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!compact) ...[
              TgAvatar(chatId: chatId, title: chat, size: 30),
              const SizedBox(width: Space.m),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (m['unread'] == true)
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          meta,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (kind != 'text') ...[
                        Icon(kindIcon(kind), size: 14, color: AppColors.text3),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          text.isEmpty ? kind : text,
                          maxLines: compact ? 2 : 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodyMedium?.copyWith(
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonRow extends StatelessWidget {
  const _PersonRow({required this.p});
  final Map<String, dynamic> p;

  @override
  Widget build(BuildContext context) {
    final name = '${p['name'] ?? 'User'}';
    final sub = [
      p['username'],
      p['role'],
      p['status'],
    ].whereType<Object>().join(' · ');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.s),
      child: Row(
        children: [
          TgAvatar(
            userId: (p['user_id'] as num?)?.toInt(),
            title: name,
            size: 32,
          ),
          const SizedBox(width: Space.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: context.text.titleSmall),
                if (sub.isNotEmpty) Text(sub, style: context.text.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A picture the image tool made; tap for full screen.
class GeneratedImage extends StatelessWidget {
  const GeneratedImage({super.key, required this.path, this.maxHeight = 360});
  final String path;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    final file = File(path);
    if (!file.existsSync())
      return const _Empty('The image is no longer on this device.');
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            backgroundColor: Colors.black,
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: LayoutBuilder(
                      builder: (context, constraints) => ClipRect(
                        child: InteractiveViewer(
                          constrained: false,
                          boundaryMargin: const EdgeInsets.all(Space.xl),
                          minScale: 0.75,
                          maxScale: 5,
                          child: SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            child: Center(
                              child: Image.file(
                                file,
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Space.s,
                    left: Space.s,
                    child: IconButton.filledTonal(
                      tooltip: 'Close image',
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Radii.l),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Image.file(file, fit: BoxFit.cover, width: double.infinity),
        ),
      ),
    );
  }
}

class GeneratedAudio extends StatefulWidget {
  const GeneratedAudio({
    super.key,
    required this.path,
    required this.text,
    this.details,
  });
  final String path;
  final String text;
  final String? details;
  @override
  State<GeneratedAudio> createState() => _GeneratedAudioState();
}

class _GeneratedAudioState extends State<GeneratedAudio> {
  final _player = AudioPlayer();
  bool _playing = false;
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(Space.m),
    decoration: BoxDecoration(
      color: AppColors.surface2,
      borderRadius: BorderRadius.circular(Radii.m),
    ),
    child: Row(
      children: [
        IconButton(
          onPressed: () async {
            if (_playing) {
              await _player.stop();
            } else {
              await _player.play(DeviceFileSource(widget.path));
            }
            if (mounted) setState(() => _playing = !_playing);
          },
          icon: Icon(
            _playing ? Icons.stop_rounded : Icons.play_arrow_rounded,
            color: AppColors.activeAccent,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text.isEmpty ? 'Generated audio' : widget.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodySmall,
              ),
              if (widget.details?.isNotEmpty == true) ...[
                const SizedBox(height: 2),
                Text(
                  widget.details!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.labelSmall,
                ),
              ],
            ],
          ),
        ),
        const Icon(Icons.graphic_eq_rounded, color: AppColors.text3),
      ],
    ),
  );
}
