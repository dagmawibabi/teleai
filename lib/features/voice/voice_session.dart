import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../chat/data/chat_controller.dart';
import '../chat/domain/chat_models.dart';
import '../telegram/data/telegram_tools.dart' show toolNamed;
import 'dictation.dart';
import 'speaker.dart';
import 'voice_listener.dart';

/// Cuts a reply into sentences to read aloud while it is still being written.
class SpeechStreamer {
  int _spoken = 0;

  static final _end = RegExp(r'''[.!?…。؟።]+["')\]]*(?=\s)|\n+''');

  void reset() => _spoken = 0;

  /// The sentences of [text] not given out yet. With [done] everything left
  /// comes out, including an unfinished sentence. Code blocks are never read:
  /// one still open holds back whatever follows it.
  List<String> feed(String text, {bool done = false}) {
    if (text.length < _spoken) _spoken = 0;
    final out = <String>[];
    while (true) {
      final open = text.indexOf('```', _spoken);
      if (open < 0) {
        _spoken += _sentences(text.substring(_spoken), out, flush: done);
        return out;
      }
      // A code block ends the sentence before it.
      _sentences(text.substring(_spoken, open), out, flush: true);
      final close = text.indexOf('```', open + 3);
      if (close < 0) {
        _spoken = done ? text.length : open;
        return out;
      }
      _spoken = close + 3;
    }
  }

  /// Adds the sentences of [pending] to [out]; returns how much it used.
  int _sentences(String pending, List<String> out, {required bool flush}) {
    var from = 0;
    for (final m in _end.allMatches(pending)) {
      // Very short pieces ("Yes.") wait for the next sentence unless first.
      if (m.end - from < 12 && out.isNotEmpty) continue;
      _add(out, pending.substring(from, m.end));
      from = m.end;
    }
    if (flush) {
      _add(out, pending.substring(from));
      from = pending.length;
    } else if (pending.length - from > 240) {
      // A long sentence: don't leave the voice silent, cut at a pause.
      final cut = pending.lastIndexOf(RegExp(r'[,;:]\s|\s'), from + 220);
      if (cut > from) {
        _add(out, pending.substring(from, cut + 1));
        from = cut + 1;
      }
    }
    return from;
  }

  static void _add(List<String> out, String raw) {
    final words = Speaker.clean(raw).replaceAll(RegExp(r'https?://\S+'), '').trim();
    if (RegExp(r'[\p{L}\p{N}]', unicode: true).hasMatch(words)) out.add(words);
  }
}

/// Mic loudness against the room it's in. Phones differ and rooms hum, so a
/// fixed level can't say when someone is talking: this learns the background
/// (quick to fall to a quieter reading, slow to rise) and measures above it.
class MicMeter {
  static const _opens = 0.16, _closes = 0.09;

  double _smooth = 0, _floor = 0;
  bool _started = false;

  void reset() {
    _started = false;
    _smooth = _floor = 0;
  }

  void add(double raw, double seconds) {
    if (!_started) {
      // Nothing reads 0 until the mic has really started.
      if (raw <= 0) return;
      _started = true;
      _smooth = _floor = raw;
      return;
    }
    _smooth += (raw - _smooth) * (1 - math.exp(-seconds / 0.12));
    _floor += (_smooth - _floor) * (1 - math.exp(-seconds / (_smooth < _floor ? 0.25 : 8)));
  }

  /// Clearly louder than the room.
  bool get talking => _smooth > _floor + _opens;

  /// Back down to about the room.
  bool get quiet => _smooth < _floor + _closes;

  /// How far above the room, 0 to 1, for the orb. The room itself shows as
  /// stillness.
  double get loudness {
    final above = ((_smooth - _floor - _closes) / 0.5).clamp(0.0, 1.0);
    return above * above;
  }
}

/// What voice mode needs from the rest of the app; the real one is
/// [AppVoicePorts].
abstract class VoicePorts {
  /// Listens; [onWords] gets the words so far, then once with `done: true`.
  Future<void> listen(void Function(String words, bool done) onWords);
  Future<void> finishListening();
  Future<void> cancelListening();

  /// Microphone loudness, 0 to 1.
  double get micLevel;

  /// Words appear while speaking (the device recognizer), rather than after
  /// a recording is sent off.
  bool get liveWords;
  String? get listenError;
  bool get transcribing;

  /// Runs a turn; completes when the answer is finished.
  Future<void> send(String text, List<Attachment> attachments);
  void stopTurn();
  bool get turnRunning;

  /// The answer being written.
  String get replyText;
  String? get replyError;
  ToolPart? get approvalNeeded;

  /// A tool the answer is running now, in words.
  String? get runningTool;

  /// Something changed in the answer.
  Listenable get replyChanges;

  Future<void> beginSpeech();
  void addSpeech(String sentence);
  void endSpeech();
  Future<void> stopSpeech();

  /// Whether the voice is still reading.
  bool get speaking;

  /// The voice is making sound, not waiting for audio to arrive.
  bool get audible;
  Listenable get speechChanges;

  /// The AI voice's loudness, 0 to 1, or null when the phone won't say.
  Future<double?> outputLevel();
  Future<void> setActive(bool active);
}

enum VoicePhase {
  listening('Listening'),
  transcribing('Working out what you said'),
  thinking('Thinking'),
  speaking('Speaking'),
  muted('Mic off');

  const VoicePhase(this.label);
  final String label;
}

/// One voice conversation: listen, send what was said, read the answer aloud
/// as it arrives, listen again. Tapping the orb interrupts.
class VoiceSession extends ChangeNotifier {
  VoiceSession(this._ports, {this.silence = const Duration(milliseconds: 1200), this.giveUpAfter = const Duration(minutes: 3)}) {
    _ports.replyChanges.addListener(_onReply);
    _ports.speechChanges.addListener(_onSpeech);
  }

  final VoicePorts _ports;

  /// How long a pause ends what you're saying.
  final Duration silence;

  /// With nothing said for this long, the mic switches off to save battery.
  final Duration giveUpAfter;

  VoicePhase phase = VoicePhase.muted;
  bool muted = false;

  /// The words heard so far of what you're saying now.
  String heard = '';

  /// The last problem, in words.
  String? problem;
  ToolPart? approval;

  final _streamer = SpeechStreamer();
  Timer? _endpoint;
  Timer? _level;
  DateTime _lastWords = DateTime.now();
  DateTime _lastLoud = DateTime.now();
  DateTime _listeningSince = DateTime.now();
  DateTime _quietSince = DateTime.now();
  final _meter = MicMeter();
  int _talkingFor = 0;
  bool _spoke = false;
  int _turn = 0;
  bool _closed = false;
  bool _active = false;
  bool _inTurn = false;
  String? _announced;
  double _output = 0;
  double _silentFor = 0;
  double _clock = 0;

  /// What to show under the orb.
  String get status {
    if (problem case final p?) return p;
    if (approval != null) return 'Waiting for your OK';
    return switch (phase) {
      VoicePhase.thinking || VoicePhase.speaking when !_ports.audible => _ports.runningTool ?? VoicePhase.thinking.label,
      _ => phase.label,
    };
  }

  /// Loudness for the orb: yours while listening, the AI's while it talks.
  double get level => switch (phase) {
    VoicePhase.listening => _meter.loudness,
    VoicePhase.speaking => _output,
    _ => 0,
  };

  Future<void> start() async {
    _active = true;
    await _ports.setActive(true);
    _level = Timer.periodic(const Duration(milliseconds: 60), (_) => _measure());
    _quietSince = DateTime.now();
    if (_ports.turnRunning) {
      // A turn was already running in this chat: follow it, then listen.
      _inTurn = true;
      _set(VoicePhase.thinking);
      _awaitRunningTurn(++_turn);
    } else {
      await _listen();
    }
  }

  Future<void> _measure() async {
    if (phase == VoicePhase.listening) _meter.add(_ports.micLevel, 0.06);
    if (phase != VoicePhase.speaking) {
      _output = 0;
      return;
    }
    _clock += 0.06;
    final real = await _ports.outputLevel();
    if (real != null && real > 0.02) {
      _output = real;
      _silentFor = 0;
      return;
    }
    // No reading: gently animate from "is speaking", as speech rises and falls.
    _silentFor += 0.06;
    if (real == null || _silentFor > 1.2) {
      _output = _ports.audible ? 0.34 + 0.2 * math.sin(_clock * 9) + 0.14 * math.sin(_clock * 23) : 0;
    } else {
      _output = 0;
    }
  }

  void _set(VoicePhase p) {
    if (_closed) return;
    phase = p;
    notifyListeners();
  }

  Future<void> _listen() async {
    if (_closed || muted) {
      _set(VoicePhase.muted);
      return;
    }
    if (DateTime.now().difference(_quietSince) > giveUpAfter) {
      muted = true;
      problem = 'Mic turned off after a quiet while. Tap the orb to talk.';
      _set(VoicePhase.muted);
      return;
    }
    heard = '';
    _spoke = false;
    _talkingFor = 0;
    _meter.reset();
    _lastWords = _lastLoud = _listeningSince = DateTime.now();
    final turn = _turn;
    _set(VoicePhase.listening);
    await _ports.listen((words, done) => _onWords(words, done, turn));
    final error = _ports.listenError;
    if (error != null && error.contains('Microphone') || error != null && error.contains('not available')) {
      muted = true;
      problem = error;
      _set(VoicePhase.muted);
      return;
    }
    _endpoint?.cancel();
    _endpoint = Timer.periodic(const Duration(milliseconds: 100), (_) => _checkEndpoint());
  }

  void _checkEndpoint() {
    if (phase != VoicePhase.listening) return;
    final now = DateTime.now();
    if (_ports.liveWords) {
      if (heard.trim().isNotEmpty && now.difference(_lastWords) >= silence) {
        _endpoint?.cancel();
        unawaited(_ports.finishListening());
      }
      return;
    }
    // A recording: the mic's level against the room says when you stopped.
    // A moment of noise isn't talking, and a room that never settles still
    // gets sent after a minute.
    _talkingFor = _meter.talking ? _talkingFor + 1 : 0;
    if (_talkingFor >= 2) _spoke = true;
    if (!_meter.quiet) _lastLoud = now;
    if (_spoke && (now.difference(_lastLoud) >= silence || now.difference(_listeningSince) >= const Duration(seconds: 60))) {
      _endpoint?.cancel();
      _set(VoicePhase.transcribing);
      unawaited(_ports.finishListening());
    } else if (!_spoke && now.difference(_listeningSince) >= const Duration(seconds: 45)) {
      // Nothing said: drop this recording rather than let it grow.
      _endpoint?.cancel();
      unawaited(_ports.cancelListening().then((_) => _listen()));
    }
  }

  void _onWords(String words, bool done, int turn) {
    if (_closed || turn != _turn) return;
    if (words != heard) {
      heard = words;
      _lastWords = DateTime.now();
      if (words.trim().isNotEmpty) _quietSince = DateTime.now();
      notifyListeners();
    }
    if (!done) return;
    _endpoint?.cancel();
    final text = words.trim();
    if (text.isEmpty) {
      final error = _ports.listenError;
      if (error != null && error.contains('Microphone')) {
        muted = true;
        problem = error;
        _set(VoicePhase.muted);
        return;
      }
      // Nothing recognized; keep listening, more slowly without a connection.
      final offline = error != null && error.contains('connection');
      problem = offline ? error : null;
      unawaited(Future<void>.delayed(Duration(milliseconds: offline ? 2500 : 250)).then((_) {
        if (!_closed && turn == _turn && phase != VoicePhase.muted) _listen();
      }));
      return;
    }
    unawaited(_submit(text));
  }

  /// Sends typed text as if it had been said.
  Future<void> sendText(String text, {List<Attachment> attachments = const []}) async {
    if (text.trim().isEmpty && attachments.isEmpty) return;
    await _stopEverything();
    await _submit(text.trim(), attachments: attachments);
  }

  Future<void> _submit(String text, {List<Attachment> attachments = const []}) async {
    if (_closed) return;
    final turn = ++_turn;
    heard = '';
    problem = null;
    _announced = null;
    approval = null;
    _streamer.reset();
    _set(VoicePhase.thinking);
    await _ports.beginSpeech();
    if (turn != _turn || _closed) return;
    _inTurn = true;
    try {
      await _ports.send(text, attachments);
    } catch (e) {
      problem = '$e';
    }
    if (turn != _turn || _closed) return;
    _finishTurn(turn);
  }

  void _awaitRunningTurn(int turn) {
    unawaited(_ports.beginSpeech().then((_) async {
      while (_ports.turnRunning && turn == _turn && !_closed) {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
      if (turn == _turn && !_closed) _finishTurn(turn);
    }));
  }

  void _finishTurn(int turn) {
    _inTurn = false;
    approval = null;
    problem = _ports.replyError ?? problem;
    for (final s in _streamer.feed(_ports.replyText, done: true)) {
      _ports.addSpeech(s);
    }
    _ports.endSpeech();
    _quietSince = DateTime.now();
    notifyListeners();
    unawaited(_afterSpeech(turn));
  }

  Future<void> _afterSpeech(int turn) async {
    while (_ports.speaking && turn == _turn && !_closed) {
      await Future<void>.delayed(const Duration(milliseconds: 80));
    }
    if (turn != _turn || _closed) return;
    _quietSince = DateTime.now();
    await _listen();
  }

  void _onReply() {
    if (_closed || !_inTurn) return;
    for (final s in _streamer.feed(_ports.replyText)) {
      _ports.addSpeech(s);
      if (phase == VoicePhase.thinking) phase = VoicePhase.speaking;
    }
    final need = _ports.approvalNeeded;
    if (need?.callId != approval?.callId) {
      approval = need;
      if (need != null && _announced != need.callId) {
        _announced = need.callId;
        _ports.addSpeech('I need your OK for this.');
      }
    }
    notifyListeners();
  }

  void _onSpeech() {
    if (!_closed) notifyListeners();
  }

  /// Tapping the orb: stops the answer and listens, or switches the mic back
  /// on.
  Future<void> interrupt() async {
    switch (phase) {
      case VoicePhase.thinking || VoicePhase.speaking || VoicePhase.transcribing:
        await _stopEverything();
        await _listen();
      case VoicePhase.muted:
        muted = false;
        problem = null;
        _quietSince = DateTime.now();
        await _listen();
      case VoicePhase.listening:
        // Done talking, without waiting for the pause.
        if (heard.trim().isNotEmpty || !_ports.liveWords) {
          _endpoint?.cancel();
          if (!_ports.liveWords) _set(VoicePhase.transcribing);
          await _ports.finishListening();
        }
    }
  }

  Future<void> _stopEverything() async {
    _turn++;
    _endpoint?.cancel();
    _inTurn = false;
    approval = null;
    heard = '';
    await _ports.cancelListening();
    await _ports.stopSpeech();
    if (_ports.turnRunning) _ports.stopTurn();
  }

  Future<void> toggleMute() async {
    muted = !muted;
    problem = null;
    _quietSince = DateTime.now();
    if (muted) {
      if (phase == VoicePhase.listening) {
        _endpoint?.cancel();
        _turn++;
        await _ports.cancelListening();
        _set(VoicePhase.muted);
      } else {
        notifyListeners();
      }
    } else if (phase == VoicePhase.muted) {
      await _listen();
    } else {
      notifyListeners();
    }
  }

  /// The app went to the background or came back.
  Future<void> setForeground(bool foreground) async {
    if (_closed || foreground == _active) return;
    _active = foreground;
    if (!foreground) {
      if (phase == VoicePhase.listening) {
        _endpoint?.cancel();
        _turn++;
        await _ports.cancelListening();
        _set(VoicePhase.muted);
      }
    } else if (phase == VoicePhase.muted && !muted) {
      _quietSince = DateTime.now();
      await _listen();
    }
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    _turn++;
    _endpoint?.cancel();
    _level?.cancel();
    await _ports.cancelListening();
    await _ports.stopSpeech();
    await _ports.setActive(false);
  }

  @override
  void dispose() {
    _closed = true;
    _endpoint?.cancel();
    _level?.cancel();
    _ports.replyChanges.removeListener(_onReply);
    _ports.speechChanges.removeListener(_onSpeech);
    super.dispose();
  }
}

/// [VoicePorts] on the app's dictation, speaker and chat controller.
class AppVoicePorts implements VoicePorts {
  AppVoicePorts(this._ref)
    : _listener = VoiceListener(),
      _dictation = _ref.read(dictationProvider),
      _speaker = _ref.read(speakerProvider),
      _chat = _ref.read(chatControllerProvider.notifier) {
    _ref.listen(chatControllerProvider, (_, _) => _reply.value++);
    _ref.listen(speakerProvider, (_, _) => _speech.value++);
  }

  final Ref _ref;
  final _reply = ValueNotifier(0);
  final _speech = ValueNotifier(0);
  static const _level = MethodChannel('teleai/voice_level');
  bool _metering = false;
  AssistantEntry? _answer;

  // Kept, not looked up: closing runs while the provider is going away.
  final VoiceListener _listener;
  final Dictation _dictation;
  final Speaker _speaker;
  final ChatController _chat;

  Conversation get _conversation => _ref.read(chatControllerProvider).conversation;

  AssistantEntry? get _latest => _conversation.entries.whereType<AssistantEntry>().lastOrNull;

  @override
  Future<void> listen(void Function(String words, bool done) onWords) =>
      liveWords ? _listener.listen(onWords) : _dictation.start(onText: onWords);
  @override
  Future<void> finishListening() => liveWords ? _listener.stop() : _dictation.stop();
  @override
  Future<void> cancelListening() => liveWords ? _listener.cancel() : _dictation.cancel();
  @override
  double get micLevel => liveWords ? _listener.level : _dictation.level;
  @override
  bool get liveWords => _dictation.model == null;
  @override
  String? get listenError => liveWords ? _listener.error : _dictation.error;
  @override
  bool get transcribing => !liveWords && _dictation.transcribing;

  @override
  Future<void> send(String text, List<Attachment> attachments) async {
    // An interrupted answer takes a moment to stop, and a chat runs one turn
    // at a time.
    for (var i = 0; i < 50 && turnRunning; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
    if (turnRunning) throw Exception('Still finishing the last answer. Try again in a moment.');
    _chat.voiceConversationId = _conversation.id;
    _answer = null;
    final done = _chat.send(text, attachments: attachments);
    _answer = _latest;
    return done;
  }

  @override
  void stopTurn() => _chat.stop();
  @override
  bool get turnRunning => _chat.runningIds.contains(_conversation.id);

  @override
  String get replyText => [for (final s in (_answer ?? _latest)?.steps ?? const <ModelStep>[]) s.text].where((t) => t.trim().isNotEmpty).join('\n');
  @override
  String? get replyError => (_answer ?? _latest)?.error;
  @override
  ToolPart? get approvalNeeded {
    for (final s in (_answer ?? _latest)?.steps ?? const <ModelStep>[]) {
      for (final t in s.tools) {
        if (t.status == ToolStatus.awaitingApproval) return t;
      }
    }
    return null;
  }

  @override
  String? get runningTool {
    final steps = (_answer ?? _latest)?.steps ?? const <ModelStep>[];
    for (final s in steps.reversed) {
      for (final t in s.tools) {
        if (t.status == ToolStatus.running) return voiceToolLabel(t);
      }
    }
    return null;
  }

  @override
  Listenable get replyChanges => _reply;

  @override
  Future<void> beginSpeech() => _speaker.beginLive();
  @override
  void addSpeech(String sentence) => _speaker.addLive(sentence);
  @override
  void endSpeech() => _speaker.endLive();
  @override
  Future<void> stopSpeech() => _speaker.stop();
  @override
  bool get speaking => _speaker.speaking;
  @override
  bool get audible => _speaker.speaking && !_speaker.loading && !_speaker.paused && !_speaker.waitingForMore;
  @override
  Listenable get speechChanges => _speech;

  @override
  Future<double?> outputLevel() async {
    if (!_metering) return null;
    try {
      return await _level.invokeMethod<double>('level');
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> setActive(bool active) async {
    _chat.voiceConversationId = active ? _conversation.id : null;
    try {
      _metering = active && (await _level.invokeMethod<bool>('start') ?? false);
      if (!active) await _level.invokeMethod<void>('stop');
    } catch (_) {
      _metering = false;
    }
    try {
      await const MethodChannel('teleai/device').invokeMethod<void>('keepScreenOn', {'on': active});
    } catch (_) {
      // Not on screen, or not on Android.
    }
  }
}

/// The voice session while voice mode is open.
final voiceSessionProvider = ChangeNotifierProvider.autoDispose<VoiceSession>((ref) => VoiceSession(AppVoicePorts(ref)));

/// A tool's name in words, for the approval prompt.
String voiceToolLabel(ToolPart part) => toolNamed(part.name)?.label ?? part.name.replaceAll('_', ' ');
