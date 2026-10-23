import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../assistant/notifications.dart';
import '../chat/data/chat_controller.dart';
import '../chat/domain/chat_models.dart';
import '../settings/data/settings.dart';
import '../voice/speaker.dart';

enum BriefKind {
  morning('Morning brief', '☀️'),
  night('Night brief', '🌙'),
  manual('Brief', '⚡');

  const BriefKind(this.label, this.emoji);
  final String label;
  final String emoji;
}

/// One generated brief: the assistant's turn that wrote it (with its tool
/// calls and the posts it cites) and when, for which window.
class Brief {
  Brief({
    required this.id,
    required this.kind,
    required this.at,
    required this.since,
    required this.conversation,
    this.error,
  });
  final String id;
  final BriefKind kind;
  final DateTime at;

  /// The start of the window it covers.
  final DateTime since;
  final Conversation conversation;
  final String? error;

  AssistantEntry? get answer => conversation.entries.whereType<AssistantEntry>().lastOrNull;

  String get text => (answer?.steps ?? const <ModelStep>[])
      .map((s) => s.text)
      .where((t) => t.trim().isNotEmpty)
      .join('\n\n')
      .trim();

  Map<String, dynamic> toJson() => {
    'id': id,
    'kind': kind.name,
    'at': at.toIso8601String(),
    'since': since.toIso8601String(),
    'conversation': conversation.toJson(),
    'error': ?error,
  };

  factory Brief.fromJson(Map<String, dynamic> j) => Brief(
    id: j['id'],
    kind: BriefKind.values.asNameMap()[j['kind']] ?? BriefKind.manual,
    at: DateTime.tryParse(j['at'] ?? '') ?? DateTime.now(),
    since: DateTime.tryParse(j['since'] ?? '') ?? DateTime.now(),
    conversation: Conversation.fromJson(Map<String, dynamic>.from(j['conversation'])),
    error: j['error'],
  );
}

class BriefState {
  const BriefState({this.briefs = const [], this.running});
  final List<Brief> briefs;

  /// The kind being written right now.
  final BriefKind? running;

  BriefState copyWith({List<Brief>? briefs, BriefKind? running, bool idle = false}) =>
      BriefState(briefs: briefs ?? this.briefs, running: idle ? null : (running ?? this.running));
}

String _briefPrompt(BriefKind kind, DateTime since, DateTime now) {
  final hours = now.difference(since).inMinutes / 60;
  return '''
Write my ${kind == BriefKind.morning ? 'morning' : kind == BriefKind.night ? 'end-of-day' : ''} brief: an extensive, detailed briefing on everything that happened across my Telegram since ${since.toIso8601String().substring(0, 16)} (the last ${hours.toStringAsFixed(1)} hours).

How to research it (stay within Telegram's rate limits; this is read-only, change nothing and mark nothing read):
1. get_account_overview, then get_recent_activity with since_hours ${hours.ceil()} for DMs, groups and channels.
2. get_unread_mentions for anything addressed to me.
3. read_messages on the DMs and groups that matter (people waiting on me first), and on the busiest channels.
4. list_calls with only_missed for missed calls in the window.
5. Skip muted chats unless something there is clearly important.

How to write it (markdown):
- Start with a 2-3 line **TL;DR**.
- **🔴 Needs you now**: questions or requests waiting on my reply, mentions, missed calls, deadlines. Say who, what they want, and since when.
- **🟠 Important**: significant news, decisions and updates in groups and from people.
- **🟡 Worth knowing**: notable channel posts, grouped by topic, a sentence or two each.
- **⚪ Low priority**: one line per chat for the rest, or "nothing else notable".
- ${kind == BriefKind.morning ? 'End with **Today**: what I should do first today.' : kind == BriefKind.night ? 'End with **Tomorrow**: open loops to pick up tomorrow.' : 'End with **Next steps**: what I should do next.'}
Cite every message you mention with its post ref link so I can open it. Be specific (names, numbers, times); no filler.
''';
}

/// Briefs: written on request and, when Settings say so, each morning and
/// night. Kept on the phone, newest first.
class BriefStore extends Notifier<BriefState> {
  @override
  BriefState build() {
    _load();
    return const BriefState();
  }

  Future<Directory> _dir() async {
    final d = Directory('${(await getApplicationSupportDirectory()).path}/briefs');
    if (!await d.exists()) await d.create(recursive: true);
    return d;
  }

  Future<void> _load() async {
    try {
      final d = await _dir();
      final list = <Brief>[];
      await for (final f in d.list()) {
        if (f is! File || !f.path.endsWith('.json')) continue;
        try {
          list.add(Brief.fromJson(jsonDecode(await f.readAsString()) as Map<String, dynamic>));
        } catch (_) {}
      }
      list.sort((a, b) => b.at.compareTo(a.at));
      state = state.copyWith(briefs: list);
    } catch (e) {
      debugPrint('[Brief] load: $e');
    }
  }

  Future<void> deleteAll() async {
    for (final b in [...state.briefs]) {
      await delete(b.id);
    }
  }

  Future<void> delete(String id) async {
    state = state.copyWith(briefs: state.briefs.where((b) => b.id != id).toList());
    try {
      final f = File('${(await _dir()).path}/$id.json');
      if (await f.exists()) await f.delete();
    } catch (_) {}
  }

  /// Writes a brief now. Returns null when one is already being written or
  /// there is no AI key.
  Future<Brief?> generate(BriefKind kind) async {
    if (state.running != null) return null;
    final settings = ref.read(settingsProvider);
    if (!settings.hasAnyKey) return null;
    state = state.copyWith(running: kind);
    final now = DateTime.now();
    final last = state.briefs.where((b) => b.error == null).firstOrNull?.at;
    var since = last ?? now.subtract(const Duration(hours: 12));
    if (now.difference(since).inHours > 36) since = now.subtract(const Duration(hours: 36));
    if (now.difference(since).inMinutes < 60) since = now.subtract(const Duration(hours: 6));
    try {
      final c = await ref
          .read(chatControllerProvider.notifier)
          .runHidden('${kind.label} · ${now.toIso8601String().substring(0, 10)}', _briefPrompt(kind, since, now));
      final answer = c.entries.whereType<AssistantEntry>().lastOrNull;
      final b = Brief(
        id: '${now.millisecondsSinceEpoch}',
        kind: kind,
        at: now,
        since: since,
        conversation: c,
        error: answer?.error,
      );
      await File('${(await _dir()).path}/${b.id}.json').writeAsString(jsonEncode(b.toJson()));
      state = state.copyWith(briefs: [b, ...state.briefs], idle: true);
      if (settings.notifications && kind != BriefKind.manual) {
        final text = Speaker.clean(b.text);
        await ref
            .read(appNotifierProvider)
            .show(
              '${kind.emoji} ${kind.label}',
              text.isEmpty ? 'Your brief is ready.' : (text.length > 400 ? '${text.substring(0, 400)}…' : text),
            );
      }
      return b;
    } catch (e) {
      debugPrint('[Brief] $e');
      state = state.copyWith(idle: true);
      return null;
    }
  }

  DateTime? _lastCheck;

  /// Called every half minute by the watch engine's clock: writes the
  /// morning or night brief once its time has come (within two hours, so a
  /// phone that was off doesn't brief at noon).
  Future<void> tick() async {
    final s = ref.read(settingsProvider);
    if (!s.briefsScheduled || state.running != null) return;
    final now = DateTime.now();
    if (_lastCheck != null && now.difference(_lastCheck!).inSeconds < 50) return;
    _lastCheck = now;
    for (final (kind, at) in [(BriefKind.morning, s.briefMorning), (BriefKind.night, s.briefNight)]) {
      final parts = at.split(':');
      final due = DateTime(now.year, now.month, now.day, int.tryParse(parts.first) ?? 8, int.tryParse(parts.last) ?? 0);
      if (now.isBefore(due) || now.difference(due).inHours >= 2) continue;
      final done = state.briefs.any((b) => b.kind == kind && !b.at.isBefore(due));
      if (!done) {
        await generate(kind);
        return;
      }
    }
  }
}

final briefStoreProvider = NotifierProvider<BriefStore, BriefState>(BriefStore.new);
