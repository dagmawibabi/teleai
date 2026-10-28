import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'package:omni_ai/omni_ai.dart' show ModelInfo, Usage;
import '../chat/domain/chat_models.dart';

/// What a request was for.
enum Modality {
  chat('Chat', 'Answers, thinking and tool calls'),
  image('Images', 'Pictures from generate_image'),
  video('Video', 'Clips from generate_video'),
  speech('Read aloud', 'AI and ElevenLabs voices'),
  dictation('Dictation', 'Speech turned into text'),
  decision('Decisions', 'Typed answers from TypeSafe Jev'),
  mcp('MCP servers', 'Calls to MCP servers and the registry'),
  skill('Skills', 'Skills searched, read, installed or removed');

  const Modality(this.label, this.description);
  final String label;
  final String description;

  /// Tool calls rather than model requests: counted, timed, not priced.
  bool get isCapability => this == mcp || this == skill;
}

/// One AI request and what it cost.
@immutable
class UsageEvent {
  const UsageEvent({
    required this.at,
    required this.model,
    required this.modality,
    this.conversationId,
    this.conversationTitle,
    this.input = 0,
    this.output = 0,
    this.cached = 0,
    this.units = 0,
    this.cost = 0,
    this.estimated = false,
    this.tool,
    this.ok = true,
    this.ms = 0,
  });

  /// For MCP and skill calls: the tool used (mcp_call_tool, load_skill…).
  /// [model] then holds the server or skill.
  final String? tool;

  /// Whether the call worked.
  final bool ok;

  /// How long it took.
  final int ms;

  final DateTime at;
  final String model;
  final Modality modality;
  final String? conversationId;
  final String? conversationTitle;
  final int input;
  final int output;
  final int cached;

  /// Images, characters or seconds, by modality.
  final int units;

  /// USD.
  final double cost;

  /// Worked out from list prices rather than reported by the provider.
  final bool estimated;

  int get tokens => input + output;

  Map<String, dynamic> toJson() => {
    'at': at.millisecondsSinceEpoch,
    'm': model,
    'k': modality.name,
    'c': ?conversationId,
    't': ?conversationTitle,
    if (input > 0) 'i': input,
    if (output > 0) 'o': output,
    if (cached > 0) 'ca': cached,
    if (units > 0) 'u': units,
    'usd': cost,
    if (estimated) 'e': true,
    'tl': ?tool,
    if (!ok) 'ok': false,
    if (ms > 0) 'ms': ms,
  };

  factory UsageEvent.fromJson(Map<String, dynamic> j) => UsageEvent(
    at: DateTime.fromMillisecondsSinceEpoch((j['at'] as num).toInt()),
    model: j['m'] ?? '',
    modality: Modality.values.asNameMap()[j['k']] ?? Modality.chat,
    conversationId: j['c'],
    conversationTitle: j['t'],
    input: (j['i'] as num?)?.toInt() ?? 0,
    output: (j['o'] as num?)?.toInt() ?? 0,
    cached: (j['ca'] as num?)?.toInt() ?? 0,
    units: (j['u'] as num?)?.toInt() ?? 0,
    cost: (j['usd'] as num?)?.toDouble() ?? 0,
    estimated: j['e'] ?? false,
    tool: j['tl'],
    ok: j['ok'] ?? true,
    ms: (j['ms'] as num?)?.toInt() ?? 0,
  );
}

/// Every AI request this phone made, kept on this phone.
class UsageStore extends Notifier<List<UsageEvent>> {
  static const _max = 20000;
  File? _file;
  bool _saving = false;
  bool _again = false;

  @override
  List<UsageEvent> build() {
    _load();
    return const [];
  }

  Future<File> _path() async => _file ??= File('${(await getApplicationSupportDirectory()).path}/usage.json');

  bool _loaded = false;

  Future<void> _load() async {
    try {
      final f = await _path();
      // A save cut short used to leave the file empty; the copy written
      // before the swap is the last good one.
      for (final file in [f, File('${f.path}.tmp')]) {
        if (!await file.exists()) continue;
        final raw = (await file.readAsString()).trim();
        if (raw.isEmpty) continue;
        try {
          final list = jsonDecode(raw) as List;
          state = [for (final e in list) UsageEvent.fromJson(Map<String, dynamic>.from(e)), ...state];
          break;
        } on FormatException {
          continue;
        }
      }
    } catch (e) {
      debugPrint('[Usage] $e');
    } finally {
      _loaded = true;
      if (_again) unawaited(_save());
    }
  }

  /// Writes are coalesced: a burst of events is one write. Each write goes
  /// to a temporary file that then replaces the old one, so the app being
  /// killed mid-write never leaves an empty or half file.
  Future<void> _save() async {
    if (_saving || !_loaded) {
      _again = true;
      return;
    }
    _saving = true;
    try {
      do {
        _again = false;
        final f = await _path();
        final tmp = File('${f.path}.tmp');
        await tmp.writeAsString(jsonEncode([for (final e in state) e.toJson()]), flush: true);
        await tmp.rename(f.path);
      } while (_again);
    } catch (e) {
      debugPrint('[Usage] save: $e');
    } finally {
      _saving = false;
    }
  }

  void add(UsageEvent e) {
    final next = [...state, e];
    state = next.length > _max ? next.sublist(next.length - _max) : next;
    _save();
  }

  /// A model call: tokens from the provider's usage report, and its
  /// reported cost when there is one (OpenRouter and the gateway send it),
  /// else list price.
  StepUsage recordChat({
    required String model,
    required Usage usage,
    ModelInfo? info,
    String? conversationId,
    String? conversationTitle,
  }) {
    final reported = usage.cost;
    final cost = reported ??
        info?.estimateCost(usage.inputTokens, usage.outputTokens, cachedInput: usage.cachedInputTokens) ??
        0;
    add(
      UsageEvent(
        at: DateTime.now(),
        model: model,
        modality: Modality.chat,
        conversationId: conversationId,
        conversationTitle: conversationTitle,
        input: usage.inputTokens,
        output: usage.outputTokens,
        cached: usage.cachedInputTokens,
        cost: cost,
        estimated: reported == null,
      ),
    );
    return StepUsage(
      input: usage.inputTokens,
      output: usage.outputTokens,
      cached: usage.cachedInputTokens,
      reasoning: usage.reasoningTokens,
      cost: cost,
      estimated: reported == null,
    );
  }

  /// A Jev, MCP or skill tool call. Jev calls count their input tokens
  /// (TypeSafe bills those; output is free) and how many decisions they
  /// made; MCP and skill calls count the server or skill they used.
  void recordCapability({
    required String tool,
    required Map<String, dynamic> input,
    required Map<String, dynamic> output,
    required int ms,
    String? conversationId,
    String? conversationTitle,
  }) {
    final ok = output['error'] == null;
    if (tool.startsWith('jev_')) {
      if (tool == 'jev_models') return;
      final usage = output['usage'];
      add(UsageEvent(
        at: DateTime.now(),
        model: '${output['model'] ?? 'jev'}',
        modality: Modality.decision,
        conversationId: conversationId,
        conversationTitle: conversationTitle,
        input: usage is Map ? (usage['input_tokens'] as num?)?.toInt() ?? 0 : 0,
        units: tool == 'jev_batch' ? (output['count'] as num?)?.toInt() ?? 0 : 1,
        tool: tool,
        ok: ok,
        ms: ms,
      ));
      return;
    }
    final mcp = tool.startsWith('mcp_');
    add(UsageEvent(
      at: DateTime.now(),
      model: capabilitySubject(tool, input),
      modality: mcp ? Modality.mcp : Modality.skill,
      conversationId: conversationId,
      conversationTitle: conversationTitle,
      units: 1,
      tool: tool,
      ok: ok,
      ms: ms,
    ));
  }

  /// The server or skill a call was about, or what it searched.
  static String capabilitySubject(String tool, Map<String, dynamic> input) {
    for (final k in const ['server', 'server_id', 'id', 'name', 'skill']) {
      final v = input[k];
      if (v is String && v.trim().isNotEmpty) return v.trim();
    }
    if (tool == 'mcp_search' || tool == 'search_skills') return 'Search';
    return tool.startsWith('mcp_') ? 'Registry' : 'Skills';
  }

  void clear() {
    state = const [];
    _save();
  }
}

final usageProvider = NotifierProvider<UsageStore, List<UsageEvent>>(UsageStore.new);
