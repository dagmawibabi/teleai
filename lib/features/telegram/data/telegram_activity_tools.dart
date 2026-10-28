part of 'telegram_tools.dart';

// Account activity: call history, channels and groups joined recently, and
// contacts who joined Telegram.

final _activityTools = <TelegramTool>[
  TelegramTool(
    name: 'list_calls',
    label: 'Opening call history',
    category: ToolCategory.calls,
    description:
        'The user\'s call history, newest first: who, incoming or outgoing, voice or video, how long, and whether it '
        'was missed, declined or ended. only_missed: true for missed calls.',
    parameters: _obj({
      'only_missed': {'type': 'boolean'},
      'limit': {'type': 'integer', 'description': '1-100, default 30.'},
    }),
  ),
  TelegramTool(
    name: 'recently_joined_chats',
    label: 'Finding new channels and groups',
    category: ToolCategory.chats,
    cost: ToolCost.local,
    description:
        'Channels and groups the user joined most recently, with when they joined. days limits how far back '
        '(default 30).',
    parameters: _obj({
      'type': {
        'type': 'string',
        'enum': ['all', 'channel', 'group'],
      },
      'days': {'type': 'integer'},
      'limit': {'type': 'integer'},
    }),
  ),
  TelegramTool(
    name: 'contact_joins',
    label: 'Finding contacts who joined',
    category: ToolCategory.contacts,
    cost: ToolCost.local,
    description: 'Contacts who recently joined Telegram ("X joined Telegram"), from the user\'s private chats.',
    parameters: _obj({
      'limit': {'type': 'integer'},
    }),
  ),
];

/// One call from the history.
class CallRecord {
  const CallRecord(this.message, this.call);
  final td.Message message;
  final td.MessageCall call;

  bool get outgoing => message.isOutgoing;
  bool get missed => call.discardReason is td.CallDiscardReasonMissed;
  bool get declined => call.discardReason is td.CallDiscardReasonDeclined;
  DateTime get at => DateTime.fromMillisecondsSinceEpoch(message.date * 1000);

  String get outcome => switch (call.discardReason) {
    td.CallDiscardReasonMissed() => outgoing ? 'Not answered' : 'Missed',
    td.CallDiscardReasonDeclined() => outgoing ? 'Declined by them' : 'Declined',
    td.CallDiscardReasonDisconnected() => 'Disconnected',
    td.CallDiscardReasonHungUp() => 'Ended',
    _ => call.duration > 0 ? 'Ended' : 'Cancelled',
  };
}

extension TelegramActivity on TelegramToolRunner {
  /// A page of call history; pass the returned offset for the next one.
  Future<({List<CallRecord> calls, String next, int total})> callHistory({
    String offset = '',
    bool onlyMissed = false,
    int limit = 50,
  }) async {
    final r = await _client.send<td.FoundMessages>(
      td.SearchCallMessages(offset: offset, limit: limit.clamp(1, 100), onlyMissed: onlyMissed),
      limited: true,
    );
    return (
      calls: [
        for (final m in r.messages)
          if (m.content case final td.MessageCall c) CallRecord(m, c),
      ],
      next: r.nextOffset,
      total: r.totalCount,
    );
  }

  /// When the user joined a channel or group, from the supergroup's date
  /// (for basic groups, the creation date is all there is).
  int joinedAt(ChatInfo c) => switch (c.type) {
    td.ChatTypeSupergroup(:final supergroupId) => _store.supergroups[supergroupId]?.date ?? 0,
    _ => 0,
  };

  List<ChatInfo> recentlyJoined({String type = 'all', int days = 30}) {
    final since = DateTime.now().subtract(Duration(days: days)).millisecondsSinceEpoch ~/ 1000;
    final list = _store.chats.values.where((c) {
      final kind = _store.kindOf(c);
      if (kind != ChatKind.channel && kind != ChatKind.group) return false;
      if (type == 'channel' && kind != ChatKind.channel) return false;
      if (type == 'group' && kind != ChatKind.group) return false;
      if (!_store.isMember(c)) return false;
      return joinedAt(c) >= since;
    }).toList()..sort((a, b) => joinedAt(b).compareTo(joinedAt(a)));
    return list;
  }

  List<ChatInfo> contactJoins() =>
      _store.chats.values.where((c) => c.lastMessage?.content is td.MessageContactRegistered).toList()
        ..sort((a, b) => (b.lastMessage?.date ?? 0).compareTo(a.lastMessage?.date ?? 0));
}

extension _ActivityToolRuns on TelegramToolRunner {
  Future<ToolOutput>? _runActivity(String name, Map<String, dynamic> args) => switch (name) {
    'list_calls' => () async {
      final limit = TelegramToolRunner._int(args, 'limit', fallback: 30, max: 100);
      final r = await callHistory(onlyMissed: args['only_missed'] == true, limit: limit);
      return ToolOutput({
        'total': r.total,
        'calls': [
          for (final c in r.calls)
            {
              'with': _store.chat(c.message.chatId)?.title ?? '${c.message.chatId}',
              'chat_id': c.message.chatId,
              'direction': c.outgoing ? 'outgoing' : 'incoming',
              'kind': c.call.isVideo ? 'video' : 'voice',
              'outcome': c.outcome,
              'seconds': c.call.duration,
              'at': c.at.toIso8601String(),
              'ref': 'post:${c.message.chatId}:${c.message.id}',
            },
        ],
      });
    }(),
    'recently_joined_chats' => () async {
      final days = TelegramToolRunner._int(args, 'days', fallback: 30, max: 3650);
      final limit = TelegramToolRunner._int(args, 'limit', fallback: 30, max: 200);
      final list = recentlyJoined(type: '${args['type'] ?? 'all'}', days: days);
      return ToolOutput({
        'days': days,
        'count': list.length,
        'chats': [
          for (final c in list.take(limit))
            {
              'chat_id': c.id,
              'title': c.title,
              'type': _store.kindOf(c).name,
              'joined': DateTime.fromMillisecondsSinceEpoch(joinedAt(c) * 1000).toIso8601String(),
              if (_store.memberCount(c) case final n?) 'members': n,
            },
        ],
      });
    }(),
    'contact_joins' => () async {
      final limit = TelegramToolRunner._int(args, 'limit', fallback: 30, max: 200);
      final list = contactJoins();
      return ToolOutput({
        'count': list.length,
        'contacts': [
          for (final c in list.take(limit))
            {
              'chat_id': c.id,
              'name': c.title,
              'joined': DateTime.fromMillisecondsSinceEpoch((c.lastMessage?.date ?? 0) * 1000).toIso8601String(),
            },
        ],
      });
    }(),
    _ => null,
  };
}
