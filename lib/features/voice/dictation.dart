import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../ai/data/media_client.dart';
import '../ai/data/model_catalog.dart';
import '../settings/data/settings.dart';
import '../usage/usage.dart';

/// Speech to text for the input box: the device's recognizer, live, or a
/// recording sent to an AI model or ElevenLabs when it stops.
class Dictation extends ChangeNotifier {
  Dictation(this._ref);
  final Ref _ref;

  final _stt = SpeechToText();
  bool? _sttReady;
  AudioRecorder? _recorder;
  StreamSubscription<Amplitude>? _amp;
  void Function(String words, bool done)? _onText;
  String _heard = '';

  bool listening = false;

  /// A recording is being turned into text.
  bool transcribing = false;

  /// Microphone loudness 0..1 while listening.
  double level = 0;
  String? error;

  AppSettings get _settings => _ref.read(settingsProvider);

  /// Starts listening. [onText] gets the words so far, then once more with
  /// done = true.
  Future<void> start(void Function(String words, bool done) onText) async {
    if (listening || transcribing) return;
    error = null;
    _onText = onText;
    _heard = '';
    if (_settings.dictationEngine == DictationEngine.device) {
      await _startDevice();
    } else {
      await _startRecording();
    }
  }

  Future<void> stop() async {
    if (!listening) return;
    if (_recorder != null && _settings.dictationEngine != DictationEngine.device) {
      await _finishRecording();
    } else {
      try {
        await _stt.stop();
      } catch (_) {}
      _finish();
    }
  }

  Future<void> cancel() async {
    _onText = null;
    if (_recorder != null) {
      await _recorder!.cancel();
      await _amp?.cancel();
    }
    try {
      await _stt.cancel();
    } catch (_) {}
    listening = false;
    transcribing = false;
    level = 0;
    notifyListeners();
  }

  // ---- device ---------------------------------------------------------------

  Future<void> _startDevice() async {
    _sttReady ??= await _stt.initialize(onError: _onError, onStatus: _onStatus).catchError((_) => false);
    if (_sttReady != true) {
      error = 'Speech recognition isn\'t available. Allow microphone access, or pick another dictation engine in Settings.';
      notifyListeners();
      return;
    }
    listening = true;
    notifyListeners();
    try {
      await _stt.listen(
        onResult: _onResult,
        onSoundLevelChange: (db) {
          final v = db > 1 ? (db + 2) / 12 : db;
          level = v.clamp(0, 1).toDouble();
          notifyListeners();
        },
        listenOptions: SpeechListenOptions(
          partialResults: true,
          listenMode: ListenMode.dictation,
          cancelOnError: true,
          autoPunctuation: true,
          listenFor: const Duration(seconds: 60),
          pauseFor: const Duration(seconds: 4),
        ),
      );
    } catch (e) {
      error = 'Couldn\'t start listening: $e';
      _finish();
    }
  }

  void _onResult(SpeechRecognitionResult r) {
    _heard = r.recognizedWords;
    _onText?.call(_heard, false);
    if (r.finalResult) _finish();
  }

  void _onStatus(String status) {
    if ((status == SpeechToText.doneStatus || status == SpeechToText.notListeningStatus) && listening) _finish();
  }

  void _onError(SpeechRecognitionError e) {
    error = switch (e.errorMsg) {
      'error_no_match' || 'error_speech_timeout' => 'Didn\'t catch that. Try again.',
      'error_permission' || 'error_insufficient_permissions' => 'Microphone access is off for TeleAI.',
      'error_network' || 'error_network_timeout' || 'error_server' => 'Speech recognition needs a connection.',
      _ => 'Dictation stopped: ${e.errorMsg}',
    };
    _finish();
  }

  void _finish() {
    if (!listening && !transcribing) return;
    final cb = _onText;
    listening = false;
    transcribing = false;
    level = 0;
    _onText = null;
    notifyListeners();
    cb?.call(_heard, true);
  }

  // ---- recording --------------------------------------------------------------

  Future<void> _startRecording() async {
    final s = _settings;
    if (s.dictationEngine == DictationEngine.elevenLabs && !s.hasElevenKey) {
      error = 'Add an ElevenLabs key in Settings to dictate with ElevenLabs.';
      notifyListeners();
      return;
    }
    final recorder = _recorder ??= AudioRecorder();
    if (!await recorder.hasPermission()) {
      error = 'Microphone access is off for TeleAI.';
      notifyListeners();
      return;
    }
    final path = '${(await getTemporaryDirectory()).path}/teleai_dictation.wav';
    await recorder.start(
      const RecordConfig(encoder: AudioEncoder.wav, sampleRate: 16000, numChannels: 1),
      path: path,
    );
    _amp = recorder.onAmplitudeChanged(const Duration(milliseconds: 120)).listen((a) {
      // dBFS, about -60 (quiet) to 0 (loud).
      level = ((a.current + 50) / 50).clamp(0, 1).toDouble();
      notifyListeners();
    });
    listening = true;
    notifyListeners();
  }

  Future<void> _finishRecording() async {
    final recorder = _recorder!;
    final path = await recorder.stop();
    await _amp?.cancel();
    listening = false;
    transcribing = true;
    level = 0;
    notifyListeners();
    try {
      if (path == null) throw Exception('Nothing was recorded.');
      final bytes = await File(path).readAsBytes();
      final s = _settings;
      final eleven = s.dictationEngine == DictationEngine.elevenLabs;
      _heard = eleven
          ? await ElevenLabsClient(s.elevenKey).transcribe(bytes)
          : await MediaClient(s).transcribe(model: s.transcriptionModel, wav: bytes);
      // 16 kHz, 16-bit mono WAV: 32,000 bytes a second.
      final seconds = (bytes.length / 32000).ceil();
      final info = eleven ? null : _ref.read(modelCatalogProvider).byId(s.transcriptionModel);
      _ref
          .read(usageProvider.notifier)
          .add(
            UsageEvent(
              at: DateTime.now(),
              model: eleven ? 'elevenlabs/scribe_v1' : s.transcriptionModel,
              modality: Modality.dictation,
              units: seconds,
              // Scribe is about $0.40 an hour; chat models hear about 32
              // tokens a second.
              cost: eleven ? seconds * 0.40 / 3600 : UsageStore.listPrice(info, seconds * 32, _heard.length ~/ 4, 0),
              estimated: true,
            ),
          );
    } catch (e) {
      error = 'Couldn\'t transcribe: $e';
      _heard = '';
    }
    transcribing = true;
    _finish();
  }

  @override
  void dispose() {
    _amp?.cancel();
    _recorder?.dispose();
    super.dispose();
  }
}

final dictationProvider = ChangeNotifierProvider<Dictation>((ref) => Dictation(ref));

/// Puts dictated words after what was already typed.
String joinDictation(String typed, String spoken) {
  final a = typed.trimRight();
  final b = spoken.trim();
  if (a.isEmpty) return b;
  if (b.isEmpty) return a;
  return '$a $b';
}
