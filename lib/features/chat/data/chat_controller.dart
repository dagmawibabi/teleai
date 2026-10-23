import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../ai/data/gateway_client.dart';
import '../../ai/data/media_client.dart';
import '../../ai/data/model_catalog.dart';
import '../../brief/brief_store.dart';
import '../../canvas/canvas_tools.dart';
import '../../usage/usage.dart';
import '../../assistant/memory.dart';
import '../../assistant/notifications.dart';
import '../../assistant/watches.dart';
import '../../settings/data/settings.dart';
import '../../telegram/data/telegram_store.dart';
import '../../telegram/data/telegram_tools.dart';
import '../domain/chat_models.dart';
import 'chat_repository.dart';

@immutable
class ChatState {
  const ChatState({
    required this.conversation,
    this.history = const [],
    this.busy = false,
    this.revision = 0,
  });

  final Conversation conversation;
  final List<ConversationSummary> history;
  final bool busy;

  /// Bumped on every change to the (mutable) conversation, so the UI rebuilds.
  final int revision;

  ChatState copyWith({
    Conversation? conversation,
    List<ConversationSummary>? history,
    bool? busy,
  }) => ChatState(
    conversation: conversation ?? this.conversation,
    history: history ?? this.history,
    busy: busy ?? this.busy,
    revision: revision + 1,
  );
}

/// Tools that act on this phone rather than on Telegram.
const _localTools = {
  'remember',
  'update_memory',
  'forget_memory',
  'list_memories',
  'create_watch',
  'list_watches',
  'update_watch',
  'delete_watch',
  'notify_me',
  'list_attachments',
  'list_briefs',
  'read_brief',
  'view_image',
};

/// Runs conversations: sends them to the model, carries out the tools it
/// asks for (pausing for approval where a tool needs it and the settings
/// say so), and keeps every exchange on disk.
///
/// The conversation on screen is [state]. Watches run their own
/// conversations alongside it; while one runs it is kept in [_live], so
/// opening it shows the turn as it happens, approval cards included.
class ChatController extends Notifier<ChatState> {
  static const _uuid = Uuid();

  final Map<String, GatewayClient> _gateways = {};
  final Map<String, Completer<bool>> _approvals = {};
  final Set<String> _stopping = {};
  final Map<String, Conversation> _live = {};

  ChatRepository get _repo => ref.read(chatRepositoryProvider);

  @override
  ChatState build() {
    _loadHistory();
    return ChatState(conversation: Conversation(id: _uuid.v4()));
  }

  Future<void> _loadHistory() async {
    final history = await _repo.list();
    if (ref.mounted) state = state.copyWith(history: history);
  }

  bool _onScreen(Conversation c) => identical(state.conversation, c);

  void _touch(Conversation c) {
    if (ref.mounted && _onScreen(c)) state = state.copyWith();
  }

  /// Conversations run out of sight (briefs): never saved to the history,
  /// and only allowed to read.
  final Set<String> _hidden = {};

  /// Runs one read-only turn in a conversation of its own that doesn't
  /// appear in the history, and returns it once the answer is written.
  Future<Conversation> runHidden(String title, String prompt) async {
    final settings = ref.read(settingsProvider);
    final c = Conversation(id: _uuid.v4(), title: title);
    _hidden.add(c.id);
    c.entries.add(UserEntry(id: _uuid.v4(), text: prompt, event: title));
    final reply = AssistantEntry(id: _uuid.v4(), model: settings.model);
    c.entries.add(reply);
    try {
      await _runTurn(c, reply);
    } finally {
      reply.done = true;
    }
    return c;
  }

  Future<void> _persist(Conversation c) async {
    if (c.entries.isEmpty || _hidden.contains(c.id)) return;
    c.updatedAt = DateTime.now();
    final history = await _repo.save(c);
    if (ref.mounted) state = state.copyWith(history: history);
  }

  // ---- conversations -------------------------------------------------------

  void newChat() {
    if (state.busy && !_live.containsKey(state.conversation.id)) stop();
    state = state.copyWith(
      conversation: Conversation(id: _uuid.v4()),
      busy: false,
    );
  }

  Future<void> open(String id) async {
    if (state.busy && !_live.containsKey(state.conversation.id)) stop();
    final c = _live[id] ?? await _repo.load(id);
    if (c == null) return;
    state = state.copyWith(conversation: c, busy: _live.containsKey(id));
    if (_screenVisible) await _markSeen(c);
  }

  // ---- where watch updates go ----------------------------------------------

  bool _screenVisible = false;

  /// The chat screen is in front, with the app on screen. Set by the chat
  /// screen as routes and the app's lifecycle change.
  void setScreenVisible(bool visible) {
    if (_screenVisible == visible) return;
    _screenVisible = visible;
    if (visible) unawaited(_markSeen(state.conversation));
  }

  Future<void> _markSeen(Conversation c) async {
    if (c.unread == 0) return;
    c.unread = 0;
    if (c.entries.isNotEmpty) await _persist(c);
  }

  /// Where a watch's update goes: always the watch's own conversation (the
  /// one it was set up in), made if it is gone, never whatever chat happens
  /// to be on screen.
  Future<Conversation> _targetFor(Watch watch) async {
    final current = state.conversation;
    final id = watch.conversationId;
    Conversation? c = id == null
        ? null
        : (id == current.id ? current : (_live[id] ?? await _repo.load(id)));
    if (c == null) {
      c = Conversation(id: _uuid.v4(), title: 'Watch · ${watch.name}');
      final made = c;
      await ref
          .read(watchStoreProvider.notifier)
          .update(watch.id, (w) => w.copyWith(conversationId: made.id));
    }
    return c;
  }

  bool _seen(Conversation c) => _screenVisible && _onScreen(c);

  /// Posts a watch's update without the AI: what happened, as the
  /// assistant's message, with post chips. Returns where it went and
  /// whether the person is looking at it.
  Future<({String conversationId, bool seen})> postNotice(
    Watch watch,
    String event,
    String markdown,
    List<PostSnapshot> posts,
  ) async {
    final c = await _targetFor(watch);
    c.entries.add(UserEntry(id: _uuid.v4(), text: event, event: watch.name));
    c.entries.add(
      AssistantEntry(
        id: _uuid.v4(),
        model: 'watch',
        done: true,
        steps: [ModelStep(text: markdown)],
      ),
    );
    for (final p in posts) {
      c.posts[p.key] = p;
    }
    final seen = _seen(c);
    if (!seen) c.unread++;
    _touch(c);
    await _persist(c);
    return (conversationId: c.id, seen: seen);
  }

  /// Removes every conversation from this phone.
  Future<void> deleteAll() async {
    if (state.busy) stop();
    await _repo.clearAll();
    state = state.copyWith(history: const [], conversation: Conversation(id: _uuid.v4()), busy: false);
  }

  Future<void> delete(String id) async {
    final history = await _repo.remove(id);
    state = state.copyWith(history: history);
    if (state.conversation.id == id) newChat();
  }

  Future<void> rename(String id, String title) async {
    final history = await _repo.rename(id, title);
    if (state.conversation.id == id) state.conversation.title = title;
    state = state.copyWith(history: history);
  }

  // ---- approvals -----------------------------------------------------------

  /// Approves a pending call. For a message, [text] and [files] are what
  /// the person settled on in the card, and replace the model's draft.
  void approve(String callId, {String? text, List<Attachment>? files}) {
    if (text != null || files != null)
      _approvalEdits[callId] = (text: text, files: files);
    _approvals.remove(callId)?.complete(true);
  }

  final Map<String, ({String? text, List<Attachment>? files})> _approvalEdits =
      {};

  /// Files the assistant may attach to a message: what the person attached
  /// in this conversation and the images the assistant made.
  List<Attachment> sendableFiles([Conversation? conversation]) {
    final out = <Attachment>[];
    for (final e in (conversation ?? state.conversation).entries) {
      switch (e) {
        case UserEntry(:final attachments):
          out.addAll(attachments);
        case AssistantEntry(:final steps):
          for (final s in steps) {
            for (final t in s.tools) {
              if ((t.name != generateImageTool.name &&
                      t.name != generateAudioTool.name) ||
                  t.result == null)
                continue;
              try {
                final result = jsonDecode(t.result!) as Map;
                final path = result['image_path'] ?? result['audio_path'];
                if (path is String) {
                  out.add(
                    Attachment(
                      path: path,
                      name: path.split(RegExp(r'[\\/]')).last,
                      mime: lookupMimeType(path) ?? 'application/octet-stream',
                      size: 0,
                    ),
                  );
                }
              } catch (_) {}
            }
          }
      }
    }
    return out;
  }

  void deny(String callId) => _approvals.remove(callId)?.complete(false);

  /// Stops the turn running in the conversation on screen.
  void stop() {
    final id = state.conversation.id;
    _stopping.add(id);
    _gateways[id]?.cancel();
    for (final part in _pendingParts(state.conversation)) {
      _approvals.remove(part.callId)?.complete(false);
    }
  }

  Iterable<ToolPart> _pendingParts(Conversation c) sync* {
    for (final e in c.entries) {
      if (e is AssistantEntry) {
        for (final s in e.steps) {
          yield* s.tools.where((t) => t.status == ToolStatus.awaitingApproval);
        }
      }
    }
  }

  // ---- sending ---------------------------------------------------------------

  /// Copies a picked file into the app's folder so the conversation keeps
  /// it after the picker's temporary copy is gone.
  static Future<Attachment> attach(String sourcePath, {String? name}) async {
    final dir = Directory(
      '${(await getApplicationSupportDirectory()).path}/attachments',
    );
    if (!await dir.exists()) await dir.create(recursive: true);
    final base = name ?? sourcePath.split(RegExp(r'[\\/]')).last;
    final dest = await File(sourcePath)
        .copy('${dir.path}/${_uuid.v4().substring(0, 8)}_$base');
    return Attachment(
      path: dest.path,
      name: base,
      mime: lookupMimeType(base) ?? 'application/octet-stream',
      size: await dest.length(),
    );
  }

  Future<void> send(
    String text, {
    List<Attachment> attachments = const [],
  }) async {
    text = text.trim();
    if ((text.isEmpty && attachments.isEmpty) || state.busy) return;
    final settings = ref.read(settingsProvider);
    final c = state.conversation;
    if (c.entries.isEmpty)
      c.title = _titleFrom(text.isEmpty ? attachments.first.name : text);
    c.entries.add(
      UserEntry(id: _uuid.v4(), text: text, attachments: attachments),
    );
    final reply = AssistantEntry(id: _uuid.v4(), model: settings.model);
    c.entries.add(reply);
    state = state.copyWith(busy: true);
    unawaited(_persist(c));
    try {
      await _runTurn(c, reply);
    } finally {
      if (ref.mounted && _onScreen(c)) state = state.copyWith(busy: false);
    }
  }

  /// A watch fired: [event] describes what happened. Runs a turn in the
  /// watch's own conversation and returns the assistant's final words, for
  /// the notification.
  Future<({String text, String conversationId, bool seen})?> runAutomatic(
    Watch watch,
    String event,
  ) async {
    final settings = ref.read(settingsProvider);
    if (!settings.hasAnyKey) return null;
    final c = await _targetFor(watch);
    // One turn at a time per conversation: wait for one under way.
    for (
      var i = 0;
      i < 120 && (_live.containsKey(c.id) || (_onScreen(c) && state.busy));
      i++
    ) {
      await Future<void>.delayed(const Duration(seconds: 1));
    }
    c.entries.add(UserEntry(id: _uuid.v4(), text: event, event: watch.name));
    final reply = AssistantEntry(id: _uuid.v4(), model: settings.model);
    c.entries.add(reply);
    _live[c.id] = c;
    if (_onScreen(c)) state = state.copyWith(busy: true);
    unawaited(_persist(c));
    try {
      await _runTurn(c, reply, watch: watch);
    } finally {
      _live.remove(c.id);
      if (ref.mounted && _onScreen(c)) state = state.copyWith(busy: false);
    }
    final seen = _seen(c);
    if (!seen) {
      c.unread++;
      _touch(c);
      await _persist(c);
    }
    final text = reply.steps
        .map((s) => s.text)
        .where((t) => t.trim().isNotEmpty)
        .join('\n')
        .trim();
    return (text: reply.error ?? text, conversationId: c.id, seen: seen);
  }

  Future<void> _runTurn(
    Conversation c,
    AssistantEntry reply, {
    Watch? watch,
  }) async {
    final settings = ref.read(settingsProvider);
    _stopping.remove(c.id);
    final gateway = _gateways[c.id] = GatewayClient(settings);
    final runner = ref.read(toolRunnerProvider);
    final tools = [
      for (final t in telegramTools)
        if (t.isOn(settings)) t.schema,
    ];
    bool stopped() => _stopping.contains(c.id);

    try {
      for (var step = 0; step < settings.maxSteps.clamp(2, 40) && !stopped(); step++) {
        final s = ModelStep();
        reply.steps.add(s);
        _touch(c);
        final messages = await _apiMessages(c, settings, watch: watch);
        TurnEnd? end;
        DateTime? thinkingStart;
        var lastPaint = DateTime.now();

        await for (final e in gateway.streamTurn(
          model: settings.model,
          messages: messages,
          tools: tools,
        )) {
          switch (e) {
            case ReasoningDelta(:final text):
              thinkingStart ??= DateTime.now();
              s.reasoning += text;
            case ContentDelta(:final text):
              if (thinkingStart != null && s.thinkingMs == null) {
                s.thinkingMs = DateTime.now()
                    .difference(thinkingStart)
                    .inMilliseconds;
              }
              s.text += text;
            case ToolCallStarted(:final id, :final name):
              if (thinkingStart != null && s.thinkingMs == null) {
                s.thinkingMs = DateTime.now()
                    .difference(thinkingStart)
                    .inMilliseconds;
              }
              s.tools.add(ToolPart(callId: id, name: name));
            case TurnEnd():
              end = e;
          }
          // Repaint at most every 40 ms while text streams in.
          final now = DateTime.now();
          if (e is! ContentDelta && e is! ReasoningDelta ||
              now.difference(lastPaint).inMilliseconds > 40) {
            lastPaint = now;
            _touch(c);
          }
        }
        if (thinkingStart != null && s.thinkingMs == null) {
          s.thinkingMs = DateTime.now()
              .difference(thinkingStart)
              .inMilliseconds;
        }
        s.reasoningDetails = end?.reasoningDetails;
        if (end?.usage case final usage?) {
          s.usage = ref
              .read(usageProvider.notifier)
              .recordChat(
                model: settings.model,
                usage: usage,
                info: ref.read(modelCatalogProvider).byId(settings.model),
                conversationId: c.id,
                conversationTitle: c.title,
              );
        }
        final calls = end?.toolCalls ?? const <ToolCallRequest>[];
        // Parts made on ToolCallStarted get their final arguments here.
        for (final call in calls) {
          final part = s.tools.where((t) => t.callId == call.id).firstOrNull;
          if (part == null) {
            s.tools.add(
              ToolPart(
                callId: call.id,
                name: call.name,
                arguments: call.arguments,
              ),
            );
          } else {
            part.arguments = call.arguments;
          }
        }
        _touch(c);
        if (s.tools.isEmpty) break;

        for (final part in s.tools) {
          if (stopped()) {
            part
              ..status = ToolStatus.error
              ..result = jsonEncode({'error': 'Stopped by the user.'});
            continue;
          }
          await _runTool(part, runner, c, watch: watch);
        }
        unawaited(_persist(c));
      }
      if (stopped() &&
          reply.steps.isNotEmpty &&
          reply.steps.last.text.isEmpty) {
        reply.error = 'Stopped.';
      }
    } on GatewayException catch (e) {
      reply.error = stopped() ? 'Stopped.' : e.message;
    } catch (e) {
      reply.error = stopped() ? 'Stopped.' : 'Something went wrong: $e';
    } finally {
      // Drop an empty trailing step left by a stop or an error.
      if (reply.steps.isNotEmpty) {
        final last = reply.steps.last;
        if (last.text.isEmpty && last.reasoning.isEmpty && last.tools.isEmpty)
          reply.steps.removeLast();
      }
      reply.done = true;
      _gateways.remove(c.id);
      _stopping.remove(c.id);
      _touch(c);
      if (ref.mounted) await _persist(c);
    }
  }

  /// Whether this call has to wait for a tap, given the approval setting
  /// and whether a watch is running it.
  bool _mustAsk(TelegramTool tool, Watch? watch) {
    if (!tool.requiresApproval) return false;
    // Destructive tools always ask, whatever the approval setting.
    if (tool.destructive) return true;
    return switch (ref.read(settingsProvider).approvalMode) {
      ApprovalMode.ask => true,
      ApprovalMode.watches => watch == null,
      ApprovalMode.never => false,
    };
  }

  Future<void> _runTool(
    ToolPart part,
    TelegramToolRunner runner,
    Conversation c, {
    Watch? watch,
  }) async {
    final tool = toolNamed(part.name);
    final timer = Stopwatch()..start();
    if (tool == null ||
        !tool.isOn(ref.read(settingsProvider))) {
      part
        ..status = ToolStatus.error
        ..result = jsonEncode({
          'error': tool == null
              ? 'There is no tool called ${part.name}.'
              : ref.read(settingsProvider).readOnlyMode && tool.requiresApproval
              ? 'Read-only mode is on in Settings: nothing can be sent or changed.'
              : 'The user turned this tool off in Settings.',
        });
      return;
    }
    if (_hidden.contains(c.id) && tool.requiresApproval) {
      part
        ..status = ToolStatus.denied
        ..result = jsonEncode({'error': 'This is a read-only run (a brief): nothing can be sent or changed.'});
      return;
    }
    if (tool.requiresApproval && !_mustAsk(tool, watch)) {
      part.autoApproved = true;
    } else if (tool.requiresApproval) {
      part.status = ToolStatus.awaitingApproval;
      final decision = _approvals[part.callId] = Completer<bool>();
      _touch(c);
      if (watch != null) {
        unawaited(
          ref
              .read(appNotifierProvider)
              .show(
                'Approval needed · ${watch.name}',
                '${tool.label}. Open to approve or decline.',
                conversationId: c.id,
              ),
        );
      }
      final approved = await decision.future;
      if (!approved) {
        part
          ..status = ToolStatus.denied
          ..result = jsonEncode({
            'error': 'The user declined. Nothing was done. Don\'t retry unless they ask.',
          });
        _touch(c);
        return;
      }
      final edit = _approvalEdits.remove(part.callId);
      if (edit != null) {
        part.arguments = jsonEncode({
          ...part.args,
          'text': ?edit.text,
          if (edit.files != null)
            'files': [for (final f in edit.files!) f.path],
        });
      }
      part.status = ToolStatus.running;
      timer.reset();
      _touch(c);
    }
    _resolveFiles(part, c);
    ToolOutput out;
    if (part.name == generateImageTool.name) {
      out = await _generateImage(part.args);
    } else if (part.name == generateAudioTool.name) {
      out = await _generateAudio(part.args);
    } else if (_localTools.contains(part.name)) {
      out = await _runLocalTool(part.name, part.args, c);
    } else if (canvasToolNames.contains(part.name)) {
      try {
        out = await runCanvasTool(ref, part.name, part.args);
      } on ArgumentError catch (e) {
        out = ToolOutput({'error': '${e.message}'});
      }
    } else {
      out = await runner.run(part.name, part.args);
    }
    for (final p in out.posts) {
      c.posts[p.key] = p;
    }
    part
      ..result = out.encode()
      ..status = out.json.containsKey('error')
          ? ToolStatus.error
          : ToolStatus.done
      ..durationMs = timer.elapsedMilliseconds;
    _touch(c);
  }

  // ---- memory, watches, notifications ---------------------------------------

  Future<ToolOutput> _runLocalTool(
    String name,
    Map<String, dynamic> a,
    Conversation c,
  ) async {
    final memories = ref.read(memoryProvider.notifier);
    final watches = ref.read(watchStoreProvider.notifier);
    String str(String k) => '${a[k] ?? ''}'.trim();
    List<int>? ids(String k) => a[k] is List
        ? [
            for (final v in a[k] as List)
              if (v is num) v.toInt(),
          ]
        : null;
    int? integer(String k) =>
        a[k] is num ? (a[k] as num).toInt() : int.tryParse('${a[k] ?? ''}');
    switch (name) {
      case 'remember':
        if (str('content').isEmpty)
          return const ToolOutput({'error': 'content is empty'});
        final m = await memories.add(
          str('content'),
          tags: [for (final t in (a['tags'] as List? ?? const [])) '$t'],
        );
        return ToolOutput({
          'saved': true,
          'memory_id': m.id,
          'content': m.content,
        });
      case 'update_memory':
        final m = await memories.update(
          str('memory_id'),
          content: str('content'),
        );
        return m == null
            ? const ToolOutput({'error': 'No memory with that id.'})
            : ToolOutput({
                'updated': true,
                'memory_id': m.id,
                'content': m.content,
              });
      case 'forget_memory':
        return await memories.remove(str('memory_id'))
            ? const ToolOutput({'forgotten': true})
            : const ToolOutput({'error': 'No memory with that id.'});
      case 'list_memories':
        final q = str('query').toLowerCase();
        final list = ref
            .read(memoryProvider)
            .where(
              (m) =>
                  q.isEmpty ||
                  m.content.toLowerCase().contains(q) ||
                  m.tags.any((t) => t.toLowerCase().contains(q)),
            );
        return ToolOutput({
          'memories': [
            for (final m in list)
              {
                'memory_id': m.id,
                'content': m.content,
                if (m.tags.isNotEmpty) 'tags': m.tags,
              },
          ],
        });
      case 'create_watch':
        final scope = switch (str('trigger')) {
          'all_dms' => WatchScope.allDms,
          'all_groups' => WatchScope.allGroups,
          'all_channels' => WatchScope.allChannels,
          'mentions' => WatchScope.mentions,
          'folder' => WatchScope.folder,
          'schedule' => WatchScope.schedule,
          _ => WatchScope.chats,
        };
        if (scope == WatchScope.chats &&
            (ids('chat_ids') ?? const []).isEmpty) {
          return const ToolOutput({
            'error': 'Give chat_ids for a chats watch.',
          });
        }
        if (scope == WatchScope.schedule &&
            a['daily_at'] == null &&
            a['every_minutes'] == null) {
          return const ToolOutput({
            'error': 'Give daily_at or every_minutes for a schedule.',
          });
        }
        final mode =
            WatchMode.values.asNameMap()[str('mode')] ?? WatchMode.notify;
        final w = await watches.add(
          (id) => Watch(
            id: id,
            name: str('name').isEmpty ? 'Watch' : str('name'),
            scope: scope,
            mode: mode,
            chatIds: ids('chat_ids') ?? const [],
            folderId: integer('folder_id'),
            instructions: str('instructions'),
            includeMuted: a['include_muted'] != false,
            dailyAt: a['daily_at'] == null ? null : str('daily_at'),
            everyMinutes: integer('every_minutes')?.clamp(15, 100000),
            // Updates come back to the conversation it was set up in.
            conversationId: c.entries.isEmpty ? null : c.id,
            createdAt: DateTime.now(),
          ),
        );
        final settings = ref.read(settingsProvider);
        return ToolOutput({
          'created': true,
          ...w.describe(),
          if (!settings.proactive) 'note': 'Watches are paused in Settings (Proactivity is off); tell the user.',
          if (mode == WatchMode.act &&
              settings.approvalMode == ApprovalMode.ask)
            'approvals': 'Actions this watch takes will still wait for the user\'s approval (Settings → Approvals).',
        });
      case 'list_watches':
        return ToolOutput({
          'proactivity_on': ref.read(settingsProvider).proactive,
          'watches': [
            for (final w in ref.read(watchStoreProvider)) w.describe(),
          ],
        });
      case 'update_watch':
        final w = await watches.update(
          str('watch_id'),
          (w) => w.copyWith(
            enabled: a['enabled'] is bool ? a['enabled'] as bool : null,
            name: a['name'] == null ? null : str('name'),
            chatIds: ids('chat_ids'),
            mode: WatchMode.values.asNameMap()[str('mode')],
            instructions: a['instructions'] == null
                ? null
                : str('instructions'),
            dailyAt: a['daily_at'] == null ? null : str('daily_at'),
            everyMinutes: integer('every_minutes'),
            includeMuted: a['include_muted'] is bool
                ? a['include_muted'] as bool
                : null,
          ),
        );
        return w == null
            ? const ToolOutput({'error': 'No watch with that id.'})
            : ToolOutput({'updated': true, ...w.describe()});
      case 'delete_watch':
        return await watches.remove(str('watch_id'))
            ? const ToolOutput({'deleted': true})
            : const ToolOutput({'error': 'No watch with that id.'});
      case 'list_attachments':
        final files = sendableFiles(c);
        return ToolOutput({
          'count': files.length,
          'files': [
            for (final f in files.reversed)
              {
                'name': f.name,
                'type': f.isImage
                    ? 'image'
                    : f.isAudio
                    ? 'voice/audio'
                    : f.isVideo
                    ? 'video'
                    : f.isPdf
                    ? 'pdf'
                    : 'file',
                'mime': f.mime,
                if (f.size > 0) 'size_kb': (f.size / 1024).ceil(),
              },
          ],
          'note': 'Send any of these with send_message (or send_voice_message for voice notes) by passing the name in files.',
        });
      case 'list_briefs':
        final briefs = ref.read(briefStoreProvider).briefs;
        final n = (a['limit'] as num?)?.toInt() ?? 10;
        return ToolOutput({
          'count': briefs.length,
          'briefs': [
            for (final b in briefs.take(n.clamp(1, 50)))
              {
                'brief_id': b.id,
                'kind': b.kind.name,
                'written': b.at.toIso8601String().substring(0, 16),
                'covers_since': b.since.toIso8601String().substring(0, 16),
                'preview': b.text.length > 200 ? '${b.text.substring(0, 200)}…' : b.text,
              },
          ],
        });
      case 'view_image':
        final hears = ref.read(modelCatalogProvider).byId(ref.read(settingsProvider).model)?.vision ?? true;
        if (!hears) {
          return const ToolOutput({
            'error': 'The model in use can\'t see images. The user can pick a model with image input in Settings.',
          });
        }
        final images = <Map<String, String>>[];
        final missing = <String>[];
        final known = sendableFiles(c).reversed.toList();
        for (final f in (a['files'] as List? ?? const []).map((e) => '$e')) {
          final want = f.toLowerCase();
          final hit = File(f).existsSync()
              ? known.where((x) => x.path == f).firstOrNull ?? Attachment(path: f, name: f.split('/').last, mime: lookupMimeType(f) ?? 'image/jpeg', size: 0)
              : known.where((x) => x.name.toLowerCase() == want).firstOrNull ??
                    known.where((x) => x.name.toLowerCase().contains(want)).firstOrNull;
          if (hit != null && hit.isImage) {
            images.add({'source': hit.name, 'path': hit.path});
          } else {
            missing.add(f);
          }
        }
        final runner = ref.read(toolRunnerProvider);
        for (final r in (a['refs'] as List? ?? const []).map((e) => '$e')) {
          final m = RegExp(r'post:(-?\d+):(\d+)').firstMatch(r);
          if (m == null) {
            missing.add(r);
            continue;
          }
          try {
            final path = await runner.messageImage(int.parse(m[1]!), int.parse(m[2]!));
            path == null ? missing.add('$r (no image)') : images.add({'source': r, 'path': path});
          } catch (e) {
            missing.add(r);
          }
        }
        return ToolOutput({
          'shown': [for (final i in images.take(6)) i['source']],
          if (missing.isNotEmpty) 'not_found': missing,
          if (images.isNotEmpty) 'note': 'The images follow in the next message, in this order.',
          '_images': [for (final i in images.take(6)) i['path']],
        });
      case 'read_brief':
        final briefs = ref.read(briefStoreProvider).briefs;
        final id = str('brief_id');
        final b = id == 'latest' ? briefs.firstOrNull : briefs.where((b) => b.id == id).firstOrNull;
        if (b == null) return const ToolOutput({'error': 'No such brief.'});
        return ToolOutput({
          'brief_id': b.id,
          'kind': b.kind.name,
          'written': b.at.toIso8601String().substring(0, 16),
          'text': b.text,
        }, posts: b.conversation.posts.values.toList());
      case 'notify_me':
        await ref
            .read(appNotifierProvider)
            .show(str('title'), str('body'), conversationId: c.id);
        return const ToolOutput({'notified': true});
    }
    return ToolOutput({'error': 'Unknown tool $name'});
  }

  /// The assistant names files the way it was told about them; the tools
  /// need the stored files. Names (or parts of them) are matched against
  /// what was attached or generated in this conversation, newest first.
  void _resolveFiles(ToolPart part, Conversation c) {
    final args = part.args;
    final raw = args['files'];
    final single = args['file'];
    if ((raw is! List || raw.isEmpty) && single is! String) return;
    final known = sendableFiles(c).reversed.toList();
    String resolve(String f) {
      if (File(f).existsSync()) return f;
      final want = f.toLowerCase().trim();
      final hit =
          known.where((a) => a.name.toLowerCase() == want).firstOrNull ??
          known.where((a) => a.name.toLowerCase().contains(want) || a.path.toLowerCase().endsWith(want)).firstOrNull;
      return hit?.path ?? f;
    }

    part.arguments = jsonEncode({
      ...args,
      if (raw is List && raw.isNotEmpty) 'files': [for (final f in raw) resolve('$f')],
      if (single is String) 'file': resolve(single),
    });
  }

  final Map<String, String?> _transcripts = {};

  /// What a voice note says, when a transcriber is set up (ElevenLabs
  /// Scribe takes Telegram's Opus files as they are). Kept per file.
  Future<String?> _transcript(Attachment a) async {
    if (_transcripts.containsKey(a.path)) return _transcripts[a.path];
    final s = ref.read(settingsProvider);
    String? text;
    if (s.hasElevenKey) {
      try {
        text = await ElevenLabsClient(s.elevenKey).transcribe(await File(a.path).readAsBytes(), filename: a.name);
      } catch (e) {
        debugPrint('[Chat] transcript of ${a.name}: $e');
      }
    }
    return _transcripts[a.path] = (text == null || text.isEmpty) ? null : text;
  }

  /// Creates an image with the model from Settings and keeps it on disk.
  Future<ToolOutput> _generateImage(Map<String, dynamic> args) async {
    final settings = ref.read(settingsProvider);
    final prompt = '${args['prompt'] ?? ''}'.trim();
    if (prompt.isEmpty) return const ToolOutput({'error': 'prompt is empty'});
    final media = MediaClient(settings);
    try {
      final bytes = await media.generateImage(
        model: settings.imageModel,
        prompt: prompt,
        aspect: '${args['aspect'] ?? 'square'}',
      );
      final dir = Directory(
        '${(await getApplicationSupportDirectory()).path}/generated',
      );
      if (!await dir.exists()) await dir.create(recursive: true);
      final ext = bytes.length > 3 && bytes[0] == 0xFF && bytes[1] == 0xD8
          ? 'jpg'
          : 'png';
      final file = await File('${dir.path}/${_uuid.v4()}.$ext')
          .writeAsBytes(bytes);
      await _writeGeneratedMeta(file, {
        'kind': 'image',
        'prompt': prompt,
        'model': settings.imageModel,
        'aspect': '${args['aspect'] ?? 'square'}',
        'created_at': DateTime.now().toIso8601String(),
      });
      final info = ref.read(modelCatalogProvider).byId(settings.imageModel);
      ref
          .read(usageProvider.notifier)
          .add(
            UsageEvent(
              at: DateTime.now(),
              model: settings.imageModel,
              modality: Modality.image,
              conversationId: state.conversation.id,
              conversationTitle: state.conversation.title,
              units: 1,
              cost: info?.imagePrice ?? 0.04,
              estimated: true,
            ),
          );
      return ToolOutput({
        'created': true,
        'image_path': file.path,
        'model': settings.imageModel,
        'prompt': prompt,
        'note': 'The image is already shown to the user. Don\'t describe the file path.',
      });
    } on GatewayException catch (e) {
      return ToolOutput({'error': 'Image generation failed: ${e.message}'});
    } finally {
      media.close();
    }
  }

  Future<ToolOutput> _generateAudio(Map<String, dynamic> args) async {
    final settings = ref.read(settingsProvider);
    final text = '${args['text'] ?? ''}'.trim();
    if (text.isEmpty) return const ToolOutput({'error': 'text is empty'});
    final media = MediaClient(settings);
    try {
      final bytes = await media.speak(
        model: settings.speechModel,
        text: text,
        voice: '${args['voice'] ?? settings.aiVoice}',
      );
      final dir = Directory(
        '${(await getApplicationSupportDirectory()).path}/generated',
      );
      if (!await dir.exists()) await dir.create(recursive: true);
      final file = await File('${dir.path}/${_uuid.v4()}.mp3')
          .writeAsBytes(bytes);
      await _writeGeneratedMeta(file, {
        'kind': 'audio',
        'text': text,
        'model': settings.speechModel,
        'voice': '${args['voice'] ?? settings.aiVoice}',
        'created_at': DateTime.now().toIso8601String(),
      });
      return ToolOutput({
        'created': true,
        'audio_path': file.path,
        'text': text,
        'note': 'The audio is shown to the user and can be attached with send_message.',
      });
    } on GatewayException catch (e) {
      return ToolOutput({'error': 'Audio generation failed: ${e.message}'});
    } finally {
      media.close();
    }
  }

  Future<void> _writeGeneratedMeta(
    File file,
    Map<String, dynamic> metadata,
  ) async {
    try {
      final dot = file.path.lastIndexOf('.');
      final sidecar = File('${file.path.substring(0, dot)}.meta.json');
      await sidecar.writeAsString(jsonEncode(metadata));
    } catch (_) {
      // The media itself is the important output. Metadata is supplemental.
    }
  }

  /// The content of a user message: text, plus pictures as images, PDFs as
  /// files and text files pasted in. Only the latest few messages carry
  /// their files again; older ones just name them, to save tokens.
  Future<Object> _userContent(
    UserEntry e, {
    required bool withFiles,
  }) async {
    var text0 = e.event == null
        ? e.text
        : '[Automatic event from your watch "${e.event}"]\n${e.text}';
    if (e.attachments.isEmpty) return text0;
    // Every file is named, so the assistant can keep track of it and send
    // it on later with its name in `files`.
    text0 =
        '$text0\n[Files attached to this message: ${e.attachments.map((a) => '"${a.name}" (${a.mime}${a.size > 0 ? ', ${(a.size / 1024).ceil()} KB' : ''})').join(', ')}. '
        'They stay available in this conversation: to send one to a chat, pass its name in files.]';
    final parts = <Map<String, dynamic>>[];
    final notes = <String>[];
    for (final a in e.attachments) {
      final file = File(a.path);
      if (!withFiles || !await file.exists()) {
        notes.add('[Attached earlier: ${a.name}]');
        continue;
      }
      if (a.isImage) {
        final b64 = base64Encode(await file.readAsBytes());
        parts.add({
          'type': 'image_url',
          'image_url': {'url': 'data:${a.mime};base64,$b64'},
        });
      } else if (a.isText) {
        var body = await file.readAsString().catchError((_) => '');
        if (body.length > 60000) body = '${body.substring(0, 60000)}\n… [cut]';
        parts.add({
          'type': 'text',
          'text': 'Attached file ${a.name}:\n```\n$body\n```',
        });
      } else if (a.isAudio) {
        // A raw voice message: transcribed with ElevenLabs when there is a
        // key, and also handed over as audio to a model that can hear, so
        // it picks up tone as well as words. It stays a file the assistant
        // can send on with send_voice_message / send_files.
        final said = await _transcript(a);
        final settings = ref.read(settingsProvider);
        final hears = ref.read(modelCatalogProvider).byId(settings.model)?.audioIn ?? false;
        if (hears) {
          final ext = a.name.split('.').last.toLowerCase();
          parts.add({
            'type': 'input_audio',
            'input_audio': {
              'data': base64Encode(await file.readAsBytes()),
              'format': switch (ext) {
                'mp3' => 'mp3',
                'wav' => 'wav',
                'm4a' || 'aac' => 'aac',
                'flac' => 'flac',
                _ => 'ogg',
              },
            },
          });
        }
        notes.add(
          said != null
              ? '[Voice message "${a.name}" (the user’s own recording) says: "$said"]'
              : hears
              ? '[Voice message "${a.name}" from the user is attached as audio: listen to it and act on what it says.]'
              : '[Voice message "${a.name}": this model can’t hear audio and there is no ElevenLabs key to transcribe it. Ask the user to pick a model with audio input or add an ElevenLabs key. It can still be sent with send_voice_message.]',
        );
      } else if (a.isPdf) {
        final b64 = base64Encode(await file.readAsBytes());
        parts.add({
          'type': 'file',
          'file': {
            'filename': a.name,
            'file_data': 'data:${a.mime};base64,$b64',
          },
        });
      }
      // Other files (archives, documents, video) are only named: most models
      // can't read them, but they can still be sent on.
    }
    final text = [text0, ...notes].where((t) => t.isNotEmpty).join('\n');
    return [
      if (text.isNotEmpty) {'type': 'text', 'text': text},
      ...parts,
    ];
  }

  static String _titleFrom(String text) {
    final line = text.split('\n').first.trim();
    return line.length <= 48 ? line : '${line.substring(0, 47)}…';
  }

  String _systemPrompt({Watch? watch}) {
    final store = ref.read(telegramStoreProvider);
    final settings = ref.read(settingsProvider);
    final memories = ref.read(memoryProvider);
    final me = store.me;
    final now = DateTime.now();
    final custom = settings.customInstructions.trim();
    final dangerOn = [
      for (final t in telegramTools)
        if (t.destructive && t.isOn(settings)) t.name,
    ];
    final approvals = switch (settings.approvalMode) {
      ApprovalMode.ask => 'The app asks the user to approve each one; if they decline, accept that.',
      ApprovalMode.watches =>
        watch == null
            ? 'The app asks the user to approve each one here; if they decline, accept that.'
            : 'In this automatic run they happen right away, without approval, so be careful and only do what the instructions ask.',
      ApprovalMode.never => 'They happen right away, without approval, so be careful and only do what was asked.',
    };
    return '''
You are TeleAI, an assistant that explores and helps manage the user's own Telegram account through tools.
User: ${me == null ? 'unknown' : '${me.firstName} ${me.lastName}'.trim()}${me == null ? '' : ' (user id ${me.id}; their Saved Messages chat_id is ${me.id})'}. Local time now: ${now.toIso8601String().substring(0, 16)} (${now.timeZoneName}).
${custom.isEmpty ? '' : '\nThe user\'s standing instructions (follow them):\n$custom\n'}${memories.isEmpty ? '' : '\nWhat you remember (memory_id: content):\n${memories.map((m) => '- ${m.id}: ${m.content}').join('\n')}\n'}
How to work:
- Use tools to answer; never invent chats, counts or messages. Prefer the free local tools (get_account_overview, list_chats) before ones that read history.
- "Today" means since local midnight, ${(now.hour + now.minute / 60).toStringAsFixed(1)} hours ago. Pick since_hours accordingly.
- Telegram rate-limits accounts. Keep requests modest: don't read more chats or messages than the question needs. If a tool reports a rate limit, stop calling tools and answer with what you have.
${dangerOn.isEmpty ? "- Deleting, leaving, blocking and banning are turned off. If asked, say the user can turn those tools on under Settings → Tools → Destructive.\n" : '- Destructive tools the user turned on: ${dangerOn.join(', ')}. Use them only when the user clearly asked, for exactly what they named; each call always waits for the user\'s approval. Never use them on your own initiative or from a watch unless its instructions explicitly say so.\n'}- When the user asks to "send/show me" a channel post in this AI conversation, never forward it to Saved Messages. Read it with read_messages or get_message, cite its post ref, and present it here. Only use forward_message when they name a real destination chat.
- Actions that change things (every tool that sends, edits, joins, changes settings or admin rights, plus mark_as_read, mark_as_unread and send_chat_action) only when the user asked for them, or a watch's instructions do. $approvals
- send_chat_action only shows a short-lived activity indicator (typing, recording, uploading, choosing media, etc.); it doesn't send content. Use it only when the user explicitly asks to show an activity state.
- Memory: when the user says "remember…" or shares a lasting preference or fact, save it with remember; update or forget memories when they change. Don't save trivia.
- Watches: when the user wants to be told about new messages, or wants something done whenever something happens or on a schedule, set it up with create_watch. Watches run in their own conversations and notify the user.
- Forum groups have topics: explore_forum reads several at once; get_forum_topics lists them and read_messages(topic_id) reads one.
- Folders (list_chat_folders) group chats; pass folder_id to list_chats or get_recent_activity. Archived chats: list_chats(archived_only).
- Channel posts can have comments: get_comments shows them with who wrote each; comment_on_post adds one. Each comment has its own ref for reactions.
- For send_message, reply_to_message, comment_on_post and schedule_message the user can edit your draft before approving.
- Bots: get_bot_buttons lists a bot message's buttons and press_bot_button presses one (callbacks return the bot's answer; read the chat again for its reply).
- Polls and quizzes: create_poll, get_poll_results, vote_poll, stop_poll. Calls: list_calls. New chats: recently_joined_chats; contacts who joined Telegram: contact_joins. The user's own channels, groups and bots: list_my_chats.
- Chat backgrounds: list_backgrounds, get_chat_background, set_chat_background (an attached image works too).
- Chat list: mark_as_unread, pin_chat, add_chat_to_folder, archive_chat, set_chat_notifications. translate_message for Telegram's translation (or translate yourself).
- Running groups and channels: list_members / get_member (roles, rights, restrictions), get_chat_permissions / set_chat_permissions, promote_member, restrict_member, edit_chat_info, invite links (list_invite_links, create_invite_link), join requests (list_join_requests, answer_join_request), get_admin_log, add_members, create_chat, join_chat, get_chat_stats, get_post_stats.
- Bots: list_my_bots, get_bot_profile, edit_bot (name, descriptions, photo), create_bot (through BotFather), botfather (any other BotFather command: commands, inline mode, privacy…). Groups and channels: create_chat, then manage them with the admin tools above.
- Account: list_blocked (unblock with block_user when on), add_contact, get_stories, set_draft (leaves text in a chat's box without sending), start_bot.
- Content Canvas (the user's own folders of saved posts, on the phone): canvas_overview first, then canvas_create_folder, canvas_add (refs from earlier results; one call per folder when classifying), canvas_add_note, canvas_move, canvas_remove, canvas_update_folder, canvas_delete_folder. To "organise posts into folders", read them, decide the categories, then file each group.
- Briefs: list_briefs and read_brief show the morning, night and on-demand briefs already written.
- forward_message can send to several chats at once with to_chat_ids.
- The user may send voice messages: you get a transcript or the audio itself. Act on what they say; the recording can also be sent on to a chat with send_voice_message.
- The user may attach pictures, voice notes and files; read them directly. To look (again) at an attached picture from earlier, or at a photo, video thumbnail, sticker or link-preview image in a Telegram post, use view_image. To send one of them (or an image you generated) to a chat, pass its name in files. Use send_voice_message for a recorded voice-note attachment; use generate_image when they ask you to create a picture.
- Some tools may be turned off by the user. Work with the ones you have.
${watch == null ? '' : '''
This turn was started automatically by the watch "${watch.name}" (watch_id ${watch.id}, mode ${watch.mode.name}). The user isn't looking right now.
${watch.instructions.isEmpty ? '' : 'The watch\'s instructions: ${watch.instructions}\n'}${switch (watch.mode) {
            WatchMode.act => 'Do what the instructions ask for the new messages, using tools. When replying to people, write naturally as the user would, in the language of the conversation, and never mention being an AI unless the instructions say to.',
            WatchMode.summarize => 'Don\'t act on anything; just write a short note about what happened.',
            WatchMode.notify => '',
          }}
End with a one- or two-sentence summary of what happened and what you did: it becomes the user's notification.
'''}
How to answer:
- ${switch (settings.answerStyle) {
      AnswerStyle.concise => 'Be brief: the answer in a few lines or a short list, no preamble.',
      AnswerStyle.balanced => 'Be concise and well structured: short paragraphs, bullet lists, bold for chat names.',
      AnswerStyle.detailed => 'Be thorough: cover context, specifics and nuance, organised with headings and lists.',
    }} Use markdown.
- ${settings.answerLanguage.isEmpty ? 'Answer in the language the user writes in.' : 'Always answer in ${settings.answerLanguage}, whatever language the user writes in (quote messages in their original language when it matters).'}
- When you mention a specific message or post, cite it with a markdown link whose URL is its ref, e.g. [Channel name](post:-1001234:5678). The app turns these into chips that open the original post. Cite every post you summarize; keep link text short (chat name or a 2-4 word topic).
- Dates: speak naturally ("2 hours ago", "yesterday at 9:10").
''';
  }

  /// The conversation as chat-completion messages. Older tool results are
  /// trimmed so long chats stay within the model's context.
  Future<List<Map<String, dynamic>>> _apiMessages(
    Conversation c,
    AppSettings settings, {
    Watch? watch,
  }) async {
    final out = <Map<String, dynamic>>[
      {'role': 'system', 'content': _systemPrompt(watch: watch)},
    ];
    // Long-running watch conversations keep only their recent history.
    var entries = c.entries;
    if (entries.length > 40) entries = entries.sublist(entries.length - 40);
    while (entries.isNotEmpty && entries.first is! UserEntry) {
      entries = entries.sublist(1);
    }
    final lastUser = entries.lastIndexWhere((e) => e is UserEntry);
    final userIndexes = [
      for (final (i, e) in entries.indexed)
        if (e is UserEntry) i,
    ];
    final withFiles = userIndexes.reversed.take(3).toSet();
    for (final (i, e) in entries.indexed) {
      switch (e) {
        case UserEntry():
          out.add({
            'role': 'user',
            'content': await _userContent(e, withFiles: withFiles.contains(i)),
          });
        case AssistantEntry(:final steps):
          final old = i < lastUser;
          for (final s in steps) {
            final calls = s.tools.where((t) => t.result != null).toList();
            if (s.text.isEmpty && calls.isEmpty) continue;
            out.add({
              'role': 'assistant',
              'content': s.text,
              if (calls.isNotEmpty)
                'tool_calls': [
                  for (final t in calls)
                    {
                      'id': t.callId,
                      'type': 'function',
                      'function': {
                        'name': t.name,
                        'arguments': t.arguments.isEmpty ? '{}' : t.arguments,
                      },
                    },
                ],
              if (!old && s.reasoningDetails != null)
                'reasoning_details': s.reasoningDetails,
            });
            final seen = <String>[];
            for (final t in calls) {
              final r = t.result!;
              out.add({
                'role': 'tool',
                'tool_call_id': t.callId,
                'content': old && r.length > 6000
                    ? '${r.substring(0, 6000)}… [trimmed]'
                    : r,
              });
              if (t.name == 'view_image' && !old) {
                try {
                  final j = jsonDecode(r);
                  if (j is Map && j['_images'] is List) seen.addAll([for (final p in j['_images'] as List) '$p']);
                } catch (_) {}
              }
            }
            // Tool results can't carry pictures, so what view_image fetched
            // follows as a message of its own.
            if (seen.isNotEmpty) {
              final parts = <Map<String, dynamic>>[
                {'type': 'text', 'text': 'The images you asked to see (view_image), in order:'},
              ];
              for (final path in seen) {
                final f = File(path);
                if (!await f.exists()) continue;
                parts.add({
                  'type': 'image_url',
                  'image_url': {'url': 'data:${lookupMimeType(path) ?? 'image/jpeg'};base64,${base64Encode(await f.readAsBytes())}'},
                });
              }
              if (parts.length > 1) out.add({'role': 'user', 'content': parts});
            }
          }
      }
    }
    return out;
  }
}

final chatControllerProvider = NotifierProvider<ChatController, ChatState>(
  ChatController.new,
);
