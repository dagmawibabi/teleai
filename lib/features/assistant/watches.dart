import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// What a watch listens to.
enum WatchScope {
  chats('Specific chats'),
  allDms('All DMs'),
  allGroups('All groups'),
  allChannels('All channels'),
  mentions('Mentions of me'),
  folder('A folder'),
  schedule('On a schedule');

  const WatchScope(this.label);
  final String label;
}

/// What a watch does when it fires.
enum WatchMode {
  notify('Notify me', 'A notification with the new messages. No AI.'),
  summarize('Summarize', 'The assistant writes a short note in the watch\'s chat and notifies you.'),
  act('Act', 'The assistant follows your instructions: it may reply, react or use any tool.');

  const WatchMode(this.label, this.explanation);
  final String label;
  final String explanation;
}

/// A standing order: "tell me when X posts", "answer my DMs", "every morning
/// at 8, summarise my channels".
@immutable
class Watch {
  const Watch({
    required this.id,
    required this.name,
    required this.scope,
    required this.mode,
    this.enabled = true,
    this.chatIds = const [],
    this.folderId,
    this.instructions = '',
    this.includeMuted = true,
    this.dailyAt,
    this.everyMinutes,
    this.conversationId,
    this.lastRunAt,
    this.runs = 0,
    required this.createdAt,
  });

  final String id;
  final String name;
  final WatchScope scope;
  final WatchMode mode;
  final bool enabled;
  final List<int> chatIds;
  final int? folderId;

  /// What the assistant should do, for summarize and act.
  final String instructions;
  final bool includeMuted;

  /// For [WatchScope.schedule]: "HH:MM" local time each day, or a period.
  final String? dailyAt;
  final int? everyMinutes;

  /// The assistant conversation this watch writes in.
  final String? conversationId;
  final DateTime? lastRunAt;
  final int runs;
  final DateTime createdAt;

  Watch copyWith({
    String? name,
    WatchScope? scope,
    WatchMode? mode,
    bool? enabled,
    List<int>? chatIds,
    int? folderId,
    String? instructions,
    bool? includeMuted,
    String? dailyAt,
    int? everyMinutes,
    String? conversationId,
    DateTime? lastRunAt,
    int? runs,
  }) => Watch(
    id: id,
    name: name ?? this.name,
    scope: scope ?? this.scope,
    mode: mode ?? this.mode,
    enabled: enabled ?? this.enabled,
    chatIds: chatIds ?? this.chatIds,
    folderId: folderId ?? this.folderId,
    instructions: instructions ?? this.instructions,
    includeMuted: includeMuted ?? this.includeMuted,
    dailyAt: dailyAt ?? this.dailyAt,
    everyMinutes: everyMinutes ?? this.everyMinutes,
    conversationId: conversationId ?? this.conversationId,
    lastRunAt: lastRunAt ?? this.lastRunAt,
    runs: runs ?? this.runs,
    createdAt: createdAt,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'scope': scope.name,
    'mode': mode.name,
    'enabled': enabled,
    'chat_ids': chatIds,
    'folder_id': folderId,
    'instructions': instructions,
    'include_muted': includeMuted,
    'daily_at': dailyAt,
    'every_minutes': everyMinutes,
    'conversation_id': conversationId,
    'last_run': lastRunAt?.toIso8601String(),
    'runs': runs,
    'created': createdAt.toIso8601String(),
  };

  factory Watch.fromJson(Map<String, dynamic> j) => Watch(
    id: j['id'],
    name: j['name'] ?? 'Watch',
    scope: WatchScope.values.asNameMap()[j['scope']] ?? WatchScope.chats,
    mode: WatchMode.values.asNameMap()[j['mode']] ?? WatchMode.notify,
    enabled: j['enabled'] ?? true,
    chatIds: [for (final c in (j['chat_ids'] as List? ?? const [])) (c as num).toInt()],
    folderId: (j['folder_id'] as num?)?.toInt(),
    instructions: j['instructions'] ?? '',
    includeMuted: j['include_muted'] ?? true,
    dailyAt: j['daily_at'],
    everyMinutes: (j['every_minutes'] as num?)?.toInt(),
    conversationId: j['conversation_id'],
    lastRunAt: DateTime.tryParse(j['last_run'] ?? ''),
    runs: (j['runs'] as num?)?.toInt() ?? 0,
    createdAt: DateTime.tryParse(j['created'] ?? '') ?? DateTime.now(),
  );

  /// For the assistant and the Watches screen.
  Map<String, dynamic> describe() => {
    'watch_id': id,
    'name': name,
    'enabled': enabled,
    'trigger': scope.name,
    if (chatIds.isNotEmpty) 'chat_ids': chatIds,
    'folder_id': ?folderId,
    'daily_at': ?dailyAt,
    'every_minutes': ?everyMinutes,
    'mode': mode.name,
    if (instructions.isNotEmpty) 'instructions': instructions,
    if (!includeMuted) 'include_muted': false,
    'runs': runs,
    if (lastRunAt != null) 'last_run': lastRunAt!.toIso8601String().substring(0, 16),
  };
}

class WatchStore extends Notifier<List<Watch>> {
  static const _key = 'watches.v1';
  static const _uuid = Uuid();

  @override
  List<Watch> build() {
    _load();
    return const [];
  }

  Future<void> _load() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(_key);
      if (raw == null) return;
      state = [for (final w in jsonDecode(raw) as List) Watch.fromJson(Map<String, dynamic>.from(w))];
    } catch (e) {
      debugPrint('[Watches] $e');
    }
  }

  Future<void> _save() async =>
      (await SharedPreferences.getInstance()).setString(_key, jsonEncode([for (final w in state) w.toJson()]));

  Watch? byId(String id) => state.where((w) => w.id == id).firstOrNull;

  Future<Watch> add(Watch Function(String id) make) async {
    final w = make(_uuid.v4().substring(0, 8));
    state = [...state, w];
    await _save();
    return w;
  }

  Future<Watch?> update(String id, Watch Function(Watch) change) async {
    Watch? updated;
    state = [
      for (final w in state)
        if (w.id == id) updated = change(w) else w,
    ];
    await _save();
    return updated;
  }

  Future<bool> remove(String id) async {
    final before = state.length;
    state = state.where((w) => w.id != id).toList();
    await _save();
    return before != state.length;
  }
}

final watchStoreProvider = NotifierProvider<WatchStore, List<Watch>>(WatchStore.new);
