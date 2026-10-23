import '../brief/brief_store.dart';
import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_tdlib/api.dart' as td;
import 'package:intl/intl.dart';

import '../../infrastructure/telegram/telegram_client.dart';
import '../../infrastructure/telegram/open_chats.dart';
import '../chat/data/chat_controller.dart';
import '../chat/domain/chat_models.dart';
import '../settings/data/settings.dart';
import '../telegram/data/message_content.dart';
import '../telegram/data/telegram_store.dart';
import '../voice/speaker.dart';
import 'notifications.dart';
import 'reminders.dart';
import 'watches.dart';

/// What the engine has been doing, for the Watches screen.
@immutable
class WatchStatus {
  const WatchStatus({
    this.listening = false,
    this.heard = 0,
    this.matched = 0,
    this.opened = 0,
    this.last,
    this.error,
  });
  final bool listening;

  /// New messages from others seen since the app started.
  final int heard;
  final int matched;

  /// Groups and channels opened so their messages arrive live.
  final int opened;
  final String? last;
  final String? error;

  WatchStatus copyWith({
    bool? listening,
    int? heard,
    int? matched,
    int? opened,
    String? last,
    String? error,
  }) => WatchStatus(
    listening: listening ?? this.listening,
    heard: heard ?? this.heard,
    matched: matched ?? this.matched,
    opened: opened ?? this.opened,
    last: last ?? this.last,
    error: error ?? this.error,
  );
}

/// Runs the watches: hears new messages, matches them, and on a match posts
/// an update in a chat, notifies the person or has the assistant act; and
/// fires scheduled routines on time.
///
/// Telegram only streams a group's or channel's new messages to a client
/// that has the chat open, so watched groups and channels are opened with
/// TDLib (which marks nothing as read); DMs always arrive. New messages are
/// heard from both `updateNewMessage` and `updateChatLastMessage`, once
/// each, and only those newer than the engine's start.
///
/// It works while the app's process is alive. With "Keep running in the
/// background" on, a quiet ongoing notification keeps it alive after the
/// app leaves the screen.
class WatchEngine {
  WatchEngine(this._ref);
  final Ref _ref;

  final status = ValueNotifier(const WatchStatus());

  StreamSubscription<td.TdObject>? _sub;
  Timer? _clock;
  bool _started = false;
  late int _since;

  final Map<String, List<td.Message>> _pending = {};
  final Map<String, Timer> _debounce = {};
  final Map<String, DateTime> _firstPending = {};
  final Map<String, List<DateTime>> _aiRuns = {};
  final Set<String> _running = {};
  final LinkedHashSet<String> _seen = LinkedHashSet();
  final Set<int> _opened = {};
  final Object _openChatOwner = Object();

  /// A burst of messages is handled together once it goes quiet for this
  /// long, but never later than [_maxWait] after the first.
  static const _quiet = Duration(seconds: 12);
  static const _maxWait = Duration(seconds: 45);

  /// AI runs per watch per hour, so a busy group can't run up the bill.
  static const _maxRunsPerHour = 30;

  /// Groups and channels opened per "all groups / all channels / folder"
  /// watch: the most recently active ones.
  static const _openPerScope = 25;

  void start() {
    if (_started) return;
    _started = true;
    _since = DateTime.now().millisecondsSinceEpoch ~/ 1000 - 30;
    final client = _ref.read(telegramClientProvider);
    _sub = client.updates.listen(_onUpdate);
    _clock = Timer.periodic(const Duration(seconds: 30), (_) => _tick());
    _ref.listen(watchStoreProvider, (_, _) => _sync(), fireImmediately: true);
    _ref.listen(reminderStoreProvider, (_, _) => _sync());
    _ref.listen(settingsProvider, (_, _) => _sync());
    unawaited(_ref.read(appNotifierProvider).init());
    _ref.read(reminderStoreProvider.notifier).runJob = _runJob;
    status.value = status.value.copyWith(listening: true);
  }

  /// A scheduled job is due: the assistant does what it says, in the
  /// conversation it was set up in, and the answer becomes the notification.
  Future<void> _runJob(Reminder r) async {
    final job = Watch(
      id: 'job-${r.id}',
      name: r.text,
      scope: WatchScope.schedule,
      mode: WatchMode.act,
      instructions: r.prompt,
      conversationId: r.conversationId,
      createdAt: r.createdAt,
    );
    final result = await _ref.read(chatControllerProvider.notifier).runAutomatic(
      job,
      'Scheduled job "${r.text}" is due now${r.cron == null ? '' : ' (${Cron.describe(r.cron!)})'}. Do this: ${r.prompt}',
    );
    if (result == null) {
      await _ref.read(appNotifierProvider).show(r.text, 'Couldn\'t run: add an AI key in Settings.');
      return;
    }
    if (r.conversationId == null) {
      await _ref
          .read(reminderStoreProvider.notifier)
          .update(r.id, (x) => x.copyWith(conversationId: result.conversationId));
    }
    if (result.seen) return;
    final text = Speaker.clean(result.text);
    await _ref.read(appNotifierProvider).show(
      r.text,
      text.isEmpty ? 'Done.' : (text.length > 400 ? '${text.substring(0, 400)}…' : text),
      conversationId: result.conversationId,
    );
  }

  void dispose() {
    _sub?.cancel();
    _clock?.cancel();
    for (final t in _debounce.values) {
      t.cancel();
    }
    _ref.read(openChatsProvider).releaseAll(_openChatOwner);
  }

  List<Watch> get _active {
    final s = _ref.read(settingsProvider);
    if (!s.proactive) return const [];
    return _ref.read(watchStoreProvider).where((w) => w.enabled).toList();
  }

  Future<void> _sync() async {
    final s = _ref.read(settingsProvider);
    if (!s.loaded) return;
    final active = _active;
    // Assistant jobs need the app alive at their time, like watches do.
    final jobs = _ref.read(reminderStoreProvider).where((r) => r.enabled && r.isJob).length;
    final notifier = _ref.read(appNotifierProvider);
    if ((active.isNotEmpty && s.notifications) || s.mentionAlerts)
      await notifier.requestPermission();
    // Mention alerts need the app alive too, to hear the mention.
    await notifier.keepAlive(
      s.keepAlive && (active.isNotEmpty || (s.proactive && jobs > 0) || s.mentionAlerts),
      watches: active.length + (s.proactive ? jobs : 0),
    );
    final store = _ref.read(telegramStoreProvider);
    for (final w in active.where(
      (w) => w.scope == WatchScope.folder && w.folderId != null,
    )) {
      await store.loadFolder(w.folderId!).then((_) {}, onError: (_) {});
    }
    await _syncOpenChats();
  }

  /// Opens the groups and channels the watches cover, and closes ones no
  /// longer watched.
  Future<void> _syncOpenChats() async {
    final store = _ref.read(telegramStoreProvider);
    bool needsOpen(ChatInfo c) =>
        c.type is td.ChatTypeSupergroup || c.type is td.ChatTypeBasicGroup;
    final want = <int>{};
    List<ChatInfo> recent(bool Function(ChatInfo) test) {
      final list =
          store.chats.values.where((c) => c.isListed && test(c)).toList()..sort(
            (a, b) =>
                (b.lastMessage?.date ?? 0).compareTo(a.lastMessage?.date ?? 0),
          );
      return list.take(_openPerScope).toList();
    }

    for (final w in _active) {
      switch (w.scope) {
        case WatchScope.chats:
          want.addAll(
            w.chatIds.where(
              (id) => store.chat(id) != null && needsOpen(store.chat(id)!),
            ),
          );
        case WatchScope.allGroups:
          want.addAll(
            recent((c) => store.kindOf(c) == ChatKind.group && needsOpen(c))
                .map((c) => c.id),
          );
        case WatchScope.allChannels:
          want.addAll(
            recent((c) => store.kindOf(c) == ChatKind.channel).map((c) => c.id),
          );
        case WatchScope.folder:
          final ids = store.folderChats[w.folderId] ?? const [];
          want.addAll(
            recent((c) => ids.contains(c.id) && needsOpen(c)).map((c) => c.id),
          );
        default:
          break;
      }
    }
    final openChats = _ref.read(openChatsProvider);
    for (final id in want.difference(_opened)) {
      try {
        await openChats.acquire(id, _openChatOwner);
        _opened.add(id);
      } catch (e) {
        debugPrint('[Watches] open $id: $e');
      }
    }
    for (final id in _opened.difference(want).toList()) {
      try {
        await openChats.release(id, _openChatOwner);
      } catch (_) {}
      _opened.remove(id);
    }
    status.value = status.value.copyWith(opened: _opened.length);
  }

  bool _matches(Watch w, td.Message m, TelegramStore store) {
    final chat = store.chat(m.chatId);
    if (chat == null) return false;
    if (!w.includeMuted && chat.isMuted) return false;
    final kind = store.kindOf(chat);
    return switch (w.scope) {
      WatchScope.chats => w.chatIds.contains(m.chatId),
      WatchScope.allDms => kind == ChatKind.private,
      WatchScope.allGroups => kind == ChatKind.group,
      WatchScope.allChannels => kind == ChatKind.channel,
      WatchScope.mentions => m.containsUnreadMention,
      WatchScope.folder =>
        w.folderId != null &&
            (store.folderChats[w.folderId!]?.contains(m.chatId) ?? false),
      WatchScope.schedule => false,
    };
  }

  void _onUpdate(td.TdObject u) {
    switch (u) {
      case td.UpdateNewMessage(:final message):
        _consider(message);
        if (message.containsUnreadMention && !message.isOutgoing) unawaited(_mentioned(message));
      case td.UpdateChatLastMessage(:final lastMessage?):
        _consider(lastMessage);
      case td.UpdateChatUnreadMentionCount(:final chatId, :final unreadMentionCount):
        // Groups the app hasn't opened don't send their messages, but the
        // mention count always arrives: a rise means a new mention.
        final before = _mentionCounts[chatId] ?? _ref.read(telegramStoreProvider).chat(chatId)?.unreadMentionCount ?? 0;
        _mentionCounts[chatId] = unreadMentionCount;
        if (unreadMentionCount > before) unawaited(_latestMention(chatId));
      default:
        break;
    }
  }

  final Map<int, int> _mentionCounts = {};
  final LinkedHashSet<String> _mentionSeen = LinkedHashSet();

  Future<void> _latestMention(int chatId) async {
    try {
      final r = await _ref.read(telegramClientProvider).send<td.FoundChatMessages>(
        td.SearchChatMessages(
          chatId: chatId,
          query: '',
          senderId: null,
          fromMessageId: 0,
          offset: 0,
          limit: 1,
          filter: const td.SearchMessagesFilterUnreadMention(),
          messageThreadId: 0,
          savedMessagesTopicId: 0,
        ),
        limited: true,
      );
      if (r.messages.isNotEmpty) await _mentioned(r.messages.first);
    } catch (e) {
      debugPrint('[Mentions] $chatId: $e');
    }
  }

  /// Someone mentioned the account (or replied to it): a notification that
  /// opens the chat, unless the person turned these off.
  Future<void> _mentioned(td.Message m) async {
    if (!_ref.read(settingsProvider).mentionAlerts) return;
    if (m.date < _since) return;
    if (!_mentionSeen.add('${m.chatId}:${m.id}')) return;
    if (_mentionSeen.length > 500) _mentionSeen.remove(_mentionSeen.first);
    final store = _ref.read(telegramStoreProvider);
    final chat = store.chat(m.chatId)?.title ?? 'a chat';
    final who = store.senderName(m.senderId);
    final g = gistOf(m.content);
    final text = g.text.isNotEmpty ? g.text : (g.detail ?? g.kind);
    await _ref.read(appNotifierProvider).show(
      '$who mentioned you in $chat',
      text.length > 300 ? '${text.substring(0, 300)}…' : text,
      conversationId: 'chat:${m.chatId}',
    );
  }

  void _consider(td.Message m) {
    // Only what others write, and only new: the account's own messages,
    // the assistant's replies included, never trigger a watch.
    if (m.isOutgoing || m.sendingState != null || m.schedulingState != null)
      return;
    if (m.date < _since) return;
    if (gistOf(m.content).kind == 'service') return;
    final key = '${m.chatId}:${m.id}';
    if (!_seen.add(key)) return;
    if (_seen.length > 2000) _seen.remove(_seen.first);
    status.value = status.value.copyWith(heard: status.value.heard + 1);

    final store = _ref.read(telegramStoreProvider);
    for (final w in _active) {
      if (!_matches(w, m, store)) continue;
      status.value = status.value.copyWith(
        matched: status.value.matched + 1,
        last:
            '${w.name}: ${store.chat(m.chatId)?.title ?? 'a chat'} at ${DateFormat.Hm().format(DateTime.now())}',
      );
      // One batch per watch and chat: a burst in one chat is one run about
      // that chat, never mixed with whatever else matched meanwhile.
      final key = '${w.id}|${m.chatId}';
      (_pending[key] ??= []).add(m);
      _firstPending[key] ??= DateTime.now();
      _debounce[key]?.cancel();
      final waited = DateTime.now().difference(_firstPending[key]!);
      final wait = waited + _quiet > _maxWait ? _maxWait - waited : _quiet;
      _debounce[key] = Timer(
        wait.isNegative ? Duration.zero : wait,
        () => _flush(key),
      );
    }
  }

  void _tick() {
    unawaited(_syncOpenChats());
    unawaited(_ref.read(briefStoreProvider.notifier).tick());
    unawaited(_ref.read(reminderStoreProvider.notifier).tick());
    final now = DateTime.now();
    for (final w in _active.where((w) => w.scope == WatchScope.schedule)) {
      final last = w.lastRunAt;
      var due = false;
      if (w.everyMinutes != null) {
        due = last == null || now.difference(last).inMinutes >= w.everyMinutes!;
      } else if (w.dailyAt != null) {
        final parts = w.dailyAt!.split(':');
        final h = int.tryParse(parts.first) ?? 0,
            min = parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0;
        final today = DateTime(now.year, now.month, now.day, h, min);
        due =
            !now.isBefore(today) &&
            (last == null || last.isBefore(today)) &&
            now.difference(today).inHours < 2;
      }
      if (due && !_running.contains(w.id))
        unawaited(_fire(w, const [], scheduled: true));
    }
  }

  Future<void> _flush(String key) async {
    final watchId = key.split('|').first;
    final messages = _pending.remove(key) ?? const [];
    _firstPending.remove(key);
    _debounce.remove(key);
    final w = _ref
        .read(watchStoreProvider)
        .where((x) => x.id == watchId)
        .firstOrNull;
    if (w == null || messages.isEmpty) return;
    if (_running.contains(w.id)) {
      // Still busy with the last batch: these join the next one.
      _pending[key] = [...messages, ...?_pending[key]];
      _firstPending[key] ??= DateTime.now();
      _debounce[key]?.cancel();
      _debounce[key] = Timer(_quiet, () => _flush(key));
      return;
    }
    await _fire(w, messages);
  }

  /// Fires [w] now, with the newest matching message there is (or as a
  /// scheduled run), so the person can see it work.
  Future<String?> runNow(Watch w) async {
    if (w.scope == WatchScope.schedule) {
      await _fire(w, const [], scheduled: true, test: true);
      return null;
    }
    final store = _ref.read(telegramStoreProvider);
    final candidates =
        store.chats.values
            .where(
              (c) =>
                  c.lastMessage != null &&
                  !c.lastMessage!.isOutgoing &&
                  _matches(w, c.lastMessage!, store),
            )
            .map((c) => c.lastMessage!)
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
    if (candidates.isEmpty)
      return 'No message from someone else matches this watch yet.';
    await _fire(w, [candidates.first], test: true);
    return null;
  }

  String _line(td.Message m, TelegramStore store) {
    final g = gistOf(m.content);
    final chat = store.chat(m.chatId);
    final kind = chat == null ? null : store.kindOf(chat);
    final who = kind == ChatKind.channel ? null : store.senderName(m.senderId);
    final text = g.text.isNotEmpty ? g.text : (g.detail ?? g.kind);
    return '${who == null ? '' : '$who: '}${g.kind == 'text' ? '' : '[${g.kind}] '}$text';
  }

  PostSnapshot _snapshot(td.Message m, TelegramStore store) {
    final g = gistOf(m.content);
    final chat = store.chat(m.chatId);
    return PostSnapshot(
      chatId: m.chatId,
      messageId: m.id,
      chatTitle: chat?.title ?? 'Chat',
      date: DateTime.fromMillisecondsSinceEpoch(m.date * 1000),
      text: g.text.isNotEmpty ? g.text : (g.detail ?? ''),
      sender: chat != null && store.kindOf(chat) == ChatKind.channel
          ? null
          : store.senderName(m.senderId),
      kind: g.kind,
    );
  }

  Future<void> _fire(
    Watch w,
    List<td.Message> messages, {
    bool scheduled = false,
    bool test = false,
  }) async {
    final settings = _ref.read(settingsProvider);
    final notifier = _ref.read(appNotifierProvider);
    final store = _ref.read(telegramStoreProvider);
    final controller = _ref.read(chatControllerProvider.notifier);
    _running.add(w.id);
    try {
      await _ref
          .read(watchStoreProvider.notifier)
          .update(
            w.id,
            (x) => x.copyWith(lastRunAt: DateTime.now(), runs: x.runs + 1),
          );
      final chats = {for (final m in messages) m.chatId};
      final where = chats.length == 1
          ? (store.chat(chats.first)?.title ?? 'a chat')
          : '${chats.length} chats';

      if (w.mode == WatchMode.notify && !scheduled) {
        // Straight to the chat and the notification shade; no AI.
        final markdown = [
          '**${chats.length == 1 ? where : w.name}** · ${messages.length} new message${messages.length == 1 ? '' : 's'}',
          '',
          for (final m in messages.take(12))
            '- ${chats.length > 1 ? '${store.chat(m.chatId)?.title ?? ''} · ' : ''}'
                '[${_clip(_line(m, store), 160)}](post:${m.chatId}:${m.id})',
          if (messages.length > 12) '- …and ${messages.length - 12} more',
        ].join('\n');
        final event =
            '${test ? 'Test run · ' : ''}${messages.length} new message${messages.length == 1 ? '' : 's'} in $where';
        final placed = await controller.postNotice(w, event, markdown, [
          for (final m in messages) _snapshot(m, store),
        ]);
        if (settings.notifications && !placed.seen) {
          final body = [
            for (final m in messages.take(6))
              '${chats.length > 1 ? '${store.chat(m.chatId)?.title ?? ''} · ' : ''}${_line(m, store)}',
            if (messages.length > 6) '+${messages.length - 6} more',
          ].join('\n');
          await notifier.show(
            chats.length == 1 ? where : w.name,
            body,
            conversationId: placed.conversationId,
          );
        }
        return;
      }

      final runs = (_aiRuns[w.id] ?? [])
        ..removeWhere((t) => DateTime.now().difference(t).inMinutes >= 60);
      if (runs.length >= _maxRunsPerHour) {
        status.value = status.value.copyWith(
          error: '${w.name} paused for this hour after $_maxRunsPerHour runs',
        );
        if (settings.notifications)
          await notifier.show(
            w.name,
            'Paused for this hour: it already ran $_maxRunsPerHour times.',
          );
        return;
      }
      _aiRuns[w.id] = [...runs, DateTime.now()];

      final event = scheduled
          ? '${test ? 'Test run · ' : ''}Scheduled run (${w.dailyAt != null ? 'daily at ${w.dailyAt}' : 'every ${w.everyMinutes} minutes'}).'
          : '${test ? 'Test run with the latest matching message · ' : ''}New messages arrived in $where:\n${[for (final m in messages) '- ${store.chat(m.chatId)?.title ?? 'Chat'} (chat_id ${m.chatId}, message_id ${m.id}, ref post:${m.chatId}:${m.id}'
                  '${m.isTopicMessage ? ', topic_id ${m.messageThreadId}' : ''}'
                  '${switch (m.senderId) {
                    td.MessageSenderUser(:final userId) => ', from user_id $userId',
                    _ => '',
                  }}): ${_line(m, store)}'].join('\n')}';
      final result = await controller.runAutomatic(w, event);
      if (result == null) {
        status.value = status.value.copyWith(
          error: 'No AI key: add one in Settings so watches can run.',
        );
        return;
      }
      if (!settings.notifications || result.seen) return;
      final text = Speaker.clean(result.text);
      await notifier.show(
        w.name,
        text.isEmpty
            ? 'New update in $where'
            : (text.length > 400 ? '${text.substring(0, 400)}…' : text),
        conversationId: result.conversationId,
      );
    } catch (e) {
      debugPrint('[Watch ${w.name}] $e');
      status.value = status.value.copyWith(error: '${w.name}: $e');
    } finally {
      _running.remove(w.id);
    }
  }

  static String _clip(String s, int max) {
    final one = s
        .replaceAll('\n', ' ')
        .replaceAll('[', '(')
        .replaceAll(']', ')');
    return one.length <= max ? one : '${one.substring(0, max)}…';
  }
}

final watchEngineProvider = Provider<WatchEngine>((ref) {
  final engine = WatchEngine(ref);
  ref.onDispose(engine.dispose);
  return engine;
});
