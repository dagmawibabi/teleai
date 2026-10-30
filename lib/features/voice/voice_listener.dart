import 'dart:async';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'dictation.dart';

/// The parts of the device's recognizer [VoiceListener] uses.
abstract class Recognizer {
  Future<bool> ready();

  /// Starts one listen. Errors and status changes go to [onError] and
  /// [onStatus] until [release].
  Future<void> start({
    required bool onDevice,
    required Duration pauseFor,
    required void Function(String words, bool isFinal) onResult,
    required void Function(double level) onLevel,
    required void Function(String error) onError,
    required void Function(String status) onStatus,
  });
  Future<void> stop();
  Future<void> cancel();
  void release();
}

class _DeviceRecognizer implements Recognizer {
  final _stt = SpeechToText();
  SpeechErrorListener? _savedError;
  SpeechStatusListener? _savedStatus;
  bool _holding = false;

  @override
  Future<bool> ready() => Dictation.deviceAvailable();

  @override
  Future<void> start({
    required bool onDevice,
    required Duration pauseFor,
    required void Function(String words, bool isFinal) onResult,
    required void Function(double level) onLevel,
    required void Function(String error) onError,
    required void Function(String status) onStatus,
  }) async {
    // The recognizer is shared with the input boxes' dictation: borrow its
    // listeners and give them back in release.
    if (!_holding) {
      _holding = true;
      _savedError = _stt.errorListener;
      _savedStatus = _stt.statusListener;
    }
    _stt.errorListener = (SpeechRecognitionError e) => onError(e.errorMsg);
    _stt.statusListener = onStatus;
    await _stt.listen(
      onResult: (SpeechRecognitionResult r) => onResult(r.recognizedWords, r.finalResult),
      onSoundLevelChange: onLevel,
      listenOptions: SpeechListenOptions(
        partialResults: true,
        listenMode: ListenMode.dictation,
        cancelOnError: true,
        autoPunctuation: true,
        onDevice: onDevice,
        listenFor: const Duration(seconds: 60),
        pauseFor: pauseFor,
      ),
    );
  }

  @override
  Future<void> stop() => _stt.stop();
  @override
  Future<void> cancel() => _stt.cancel();

  @override
  void release() {
    if (!_holding) return;
    _holding = false;
    _stt.errorListener = _savedError;
    _stt.statusListener = _savedStatus;
  }
}

/// Listens for voice mode, for as long as a conversation needs.
///
/// Unlike the input boxes' [Dictation], it asks for the recognizer on the
/// phone, whose words arrive as you speak. Google's online one can stall and
/// hold everything back until listening stops, so words may also come just
/// after the end: this waits for them rather than reporting nothing heard.
class VoiceListener {
  VoiceListener({Recognizer? recognizer, this.lateWords = const Duration(milliseconds: 1500)})
    : _recognizer = recognizer ?? _DeviceRecognizer();

  final Recognizer _recognizer;

  /// How long after listening ends words can still arrive.
  final Duration lateWords;

  /// Microphone loudness from 0 to 1.
  double level = 0;
  String? error;

  bool _onDevice = true;
  String _heard = '', _said = '', _part = '';
  Timer? _grace;
  void Function(String words, bool done)? _onWords;

  /// With live words the session decides when you've finished, so quiet
  /// shouldn't end the listen. Without them, a pause is the only way to get
  /// the words at all.
  static const _onDevicePause = Duration(seconds: 30);
  static const _onlinePause = Duration(seconds: 4);
  static const _lastWords = Duration(milliseconds: 250);

  /// Errors that mean nobody spoke or the mic is refused, not that the
  /// recognizer on the phone can't do this.
  static const _notTheRecognizer = {
    'error_no_match',
    'error_speech_timeout',
    'error_permission',
    'error_insufficient_permissions',
    'error_busy',
  };

  Future<void> listen(void Function(String words, bool done) onWords) async {
    error = null;
    _heard = _said = _part = '';
    level = 0;
    _grace?.cancel();
    _grace = null;
    if (!await _recognizer.ready()) {
      error = 'Speech recognition is not available. Allow microphone access, or use a cloud transcription model.';
      return;
    }
    _onWords = onWords;
    await _start();
  }

  Future<void> _start() async {
    try {
      await _recognizer.start(
        onDevice: _onDevice,
        pauseFor: _onDevice ? _onDevicePause : _onlinePause,
        onResult: _result,
        // Android reports about -2..10 dB, iOS 0..1.
        onLevel: (db) => level = (db > 1 ? (db + 2) / 12 : db).clamp(0, 1).toDouble(),
        onError: _error,
        onStatus: _status,
      );
    } catch (e) {
      error = 'Could not start listening: $e';
      _finish();
    }
  }

  void _result(String words, bool isFinal) {
    final cb = _onWords;
    if (cb == null) return;
    final all = _merge(words.trim());
    if (all != _heard) {
      _heard = all;
      cb(_heard, false);
    }
    if (isFinal) _finish();
  }

  /// [words] added to what was said before. After a long stretch the phone's
  /// recognizer can start its text over, dropping what it already gave out.
  String _merge(String words) {
    if (words.isEmpty) return _heard;
    if (_said.isNotEmpty && words.startsWith(_said)) {
      // A final result with the whole thing again.
      _said = '';
    } else if (_startedOver(_part, words)) {
      _said = '$_said $_part'.trim();
    }
    _part = words;
    return '$_said $_part'.trim();
  }

  /// A correction changes a few words; this much shorter is a fresh start.
  static bool _startedOver(String before, String now) {
    final was = before.split(RegExp(r'\s+')), is_ = now.split(RegExp(r'\s+'));
    if (before.isEmpty || is_.length >= was.length) return false;
    return is_.length < was.length / 2 || is_.first.toLowerCase() != was.first.toLowerCase();
  }

  void _status(String status) {
    if (_onWords != null && (status == SpeechToText.doneStatus || status == SpeechToText.notListeningStatus)) _waitForLateWords();
  }

  void _error(String message) {
    if (_onWords == null) return;
    if (_onDevice && _heard.isEmpty && !_notTheRecognizer.contains(message)) {
      // The phone can't do this one, say for a language it has no pack for.
      _onDevice = false;
      _grace?.cancel();
      _grace = null;
      unawaited(_start());
      return;
    }
    error = switch (message) {
      'error_no_match' || 'error_speech_timeout' => 'Didn\'t catch that. Try again.',
      'error_permission' || 'error_insufficient_permissions' => 'Microphone access is off.',
      'error_network' || 'error_network_timeout' || 'error_server' => 'Speech recognition needs a connection.',
      _ => 'Dictation stopped: $message',
    };
    _finish();
  }

  void _waitForLateWords() {
    level = 0;
    // With words in hand a final result rarely adds anything, and the phone's
    // recognizer often sends none: don't keep the person waiting for it.
    _grace ??= Timer(_heard.isEmpty ? lateWords : _lastWords, _finish);
  }

  /// Stops listening and delivers the final words.
  Future<void> stop() async {
    if (_onWords == null) return;
    _waitForLateWords();
    try {
      await _recognizer.stop();
    } catch (_) {}
  }

  /// Stops without delivering anything.
  Future<void> cancel() async {
    _onWords = null;
    _grace?.cancel();
    _grace = null;
    level = 0;
    try {
      await _recognizer.cancel();
    } catch (_) {}
    _recognizer.release();
  }

  void _finish() {
    final cb = _onWords;
    if (cb == null) return;
    _onWords = null;
    _grace?.cancel();
    _grace = null;
    level = 0;
    _recognizer.release();
    cb(_heard, true);
  }
}
