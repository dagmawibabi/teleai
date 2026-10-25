import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';

import '../ai/data/media_client.dart';
import '../settings/data/settings.dart';
import '../usage/usage.dart';

/// Reads answers aloud with the device voice, an AI voice model or
/// ElevenLabs, a part at a time, with the controls the player sheet shows.
/// A cloud voice that fails hands the part to the device voice.
class Speaker extends ChangeNotifier {
  Speaker(this._ref);
  final Ref _ref;

  FlutterTts? _tts;
  AudioPlayer? _player;
  final Map<int, Future<Uint8List>> _audio = {};

  List<String> parts = const [];
  int index = 0;
  String title = '';

  /// Which reply is being read, so its speaker button shows as active.
  String? sourceId;
  bool speaking = false;
  bool paused = false;
  bool loading = false;

  /// The part playing is cloud audio (seekable) rather than the device voice.
  bool playingAudio = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  String? lastError;
  List<Map<String, String>> deviceVoices = const [];

  int _gen = 0;
  Completer<void>? _resume;
  Completer<void>? _done;

  AppSettings get _settings => _ref.read(settingsProvider);
  double get speed => _settings.speechRate;

  String get engineLabel => switch (_settings.voiceEngine) {
    VoiceEngine.device => 'Device voice',
    VoiceEngine.ai => 'AI voice',
    VoiceEngine.addis => 'Addis AI',
    VoiceEngine.elevenLabs => 'ElevenLabs',
  };

  Future<FlutterTts> _deviceTts() async {
    final tts = _tts ??= FlutterTts();
    await tts.awaitSpeakCompletion(true);
    // Android's 0.5 is normal speed; iOS's is 0.5 as well.
    await tts.setSpeechRate((0.5 * speed).clamp(0.1, 1.0));
    final voice = _settings.deviceVoice;
    if (voice.isNotEmpty) {
      final match = deviceVoices.where((v) => v['name'] == voice).firstOrNull;
      if (match != null)
        await tts.setVoice({
          'name': match['name']!,
          'locale': match['locale'] ?? '',
        });
    }
    return tts;
  }

  Future<List<Map<String, String>>> loadDeviceVoices() async {
    try {
      final tts = _tts ??= FlutterTts();
      final raw = await tts.getVoices;
      deviceVoices =
          [
            for (final v in (raw as List? ?? const []))
              if (v is Map)
                {for (final e in v.entries) '${e.key}': '${e.value}'},
          ]..sort(
            (a, b) => '${a['locale']}${a['name']}'.compareTo(
              '${b['locale']}${b['name']}',
            ),
          );
      notifyListeners();
    } catch (e) {
      debugPrint('[Speaker] voices: $e');
    }
    return deviceVoices;
  }

  /// Plain words for speaking: no markdown, no post links.
  static String clean(String text) => text
      .replaceAllMapped(RegExp(r'\[([^\]]+)\]\([^)]*\)'), (m) => m[1]!)
      .replaceAll(RegExp(r'```[\s\S]*?```'), ' ')
      .replaceAll(RegExp(r'[*_`#>|]'), '')
      .replaceAll(RegExp(r'^\s*[-•]\s+', multiLine: true), '')
      .replaceAll(RegExp(r'\n{2,}'), '\n')
      .trim();

  /// Sentences grouped into parts of about [size] characters.
  static List<String> chunk(String text, {int size = 380}) {
    final sentences = RegExp(r'[^.!?\n]+[.!?]*\s*|\n')
        .allMatches(text)
        .map((m) => m[0]!.trim())
        .where((s) => s.isNotEmpty);
    final out = <String>[];
    var current = StringBuffer();
    for (final s in sentences) {
      if (current.length + s.length > size && current.isNotEmpty) {
        out.add(current.toString().trim());
        current = StringBuffer();
      }
      current.write('$s ');
    }
    if (current.isNotEmpty) out.add(current.toString().trim());
    return out;
  }

  Future<void> play(
    String text, {
    String title = 'Answer',
    String? sourceId,
  }) async {
    await stop();
    final words = clean(text);
    if (words.isEmpty) return;
    parts = chunk(words);
    index = 0;
    this.title = title;
    this.sourceId = sourceId;
    speaking = true;
    paused = false;
    lastError = null;
    _audio.clear();
    notifyListeners();
    unawaited(_run(++_gen));
  }

  Future<void> _run(int gen) async {
    while (gen == _gen && index < parts.length) {
      final i = index;
      await _waitIfPaused(gen);
      if (gen != _gen) return;
      final engine = _settings.voiceEngine;
      var ok = false;
      if (engine != VoiceEngine.device) {
        ok = await _playCloud(i, gen);
      }
      if (!ok && gen == _gen) await _playDevice(i, gen);
      if (gen != _gen) return;
      // A jump changed [index] while the part played; carry on from there.
      if (index == i) index++;
      notifyListeners();
    }
    if (gen == _gen) {
      speaking = false;
      sourceId = null;
      playingAudio = false;
      notifyListeners();
    }
  }

  Future<void> _waitIfPaused(int gen) async {
    while (paused && gen == _gen) {
      _resume = Completer<void>();
      await _resume!.future;
    }
  }

  Future<Uint8List> _fetch(int i) => _audio[i] ??= () async {
    final s = _settings;
    final text = parts[i];
    final eleven = s.voiceEngine == VoiceEngine.elevenLabs;
    final addis = s.voiceEngine == VoiceEngine.addis;
    final Uint8List bytes;
    if (addis) {
      if (!s.hasAddisKey) throw Exception('Add an Addis AI key in Settings.');
      final addisClient = AddisAiClient(s.addisKey);
      try {
        // aiVoice is shared with the AI voice engine, so it may hold a
        // gateway voice name rather than an Addis voice.
        final language = await addisClient.languageOf(s.aiVoice);
        if (language == null)
          throw Exception('Pick an Addis AI voice in Settings.');
        bytes = await addisClient.speak(
          voiceId: s.aiVoice,
          language: language,
          text: text,
          speed: speed,
        );
      } finally {
        addisClient.close();
      }
    } else if (eleven) {
      if (!s.hasElevenKey)
        throw Exception('Add an ElevenLabs key in Settings.');
      if (s.elevenVoiceId.isEmpty)
        throw Exception('Pick an ElevenLabs voice in Settings.');
      bytes = await ElevenLabsClient(s.elevenKey)
          .speak(voiceId: s.elevenVoiceId, text: text, model: s.elevenModel);
    } else {
      bytes = await MediaClient(s)
          .speak(model: s.speechModel, text: text, voice: s.aiVoice);
    }
    // List prices per character: ElevenLabs Flash about $0.05 and the
    // other models about $0.10 per 1,000; AI voices about $15 per million.
    final perChar = eleven
        ? (s.elevenModel.contains('flash') ? 0.00005 : 0.0001)
        : (addis ? 0.00001 : 0.000015);
    _ref
        .read(usageProvider.notifier)
        .add(
          UsageEvent(
            at: DateTime.now(),
            model: eleven
                ? 'elevenlabs/${s.elevenModel}'
                : (addis ? 'addis/voices-2' : s.speechModel),
            modality: Modality.speech,
            conversationTitle: title,
            units: text.length,
            cost: text.length * perChar,
            estimated: true,
          ),
        );
    return bytes;
  }();

  Future<bool> _playCloud(int i, int gen) async {
    loading = true;
    notifyListeners();
    try {
      final bytes = await _fetch(i);
      if (i + 1 < parts.length)
        unawaited(_fetch(i + 1).then((_) {}, onError: (_) {}));
      if (gen != _gen) return true;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/triangle_voice_$i.mp3')
          .writeAsBytes(bytes);
      final player = _player ??= AudioPlayer();
      _done = Completer<void>();
      final sub = player.onPlayerComplete.listen((_) {
        if (!(_done?.isCompleted ?? true)) _done!.complete();
      });
      final pos = player.onPositionChanged.listen((p) {
        position = p;
        notifyListeners();
      });
      final dur = player.onDurationChanged.listen((d) {
        duration = d;
        notifyListeners();
      });
      loading = false;
      playingAudio = true;
      position = Duration.zero;
      notifyListeners();
      await player.setPlaybackRate(speed);
      await player.play(DeviceFileSource(file.path));
      await _done!.future;
      await sub.cancel();
      await pos.cancel();
      await dur.cancel();
      return true;
    } catch (e) {
      lastError = '$e'.replaceFirst('Exception: ', '');
      debugPrint('[Speaker] cloud voice failed: $e');
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> _playDevice(int i, int gen) async {
    playingAudio = false;
    notifyListeners();
    try {
      final tts = await _deviceTts();
      _done = Completer<void>();
      // awaitSpeakCompletion makes speak() return once the part is spoken
      // or stopped.
      unawaited(
        tts.speak(parts[i]).whenComplete(() {
          if (!(_done?.isCompleted ?? true)) _done!.complete();
        }),
      );
      await _done!.future;
      // A pause stops the device voice mid-part; it replays the part.
      if (paused && gen == _gen) {
        await _waitIfPaused(gen);
        if (gen == _gen && index == i) await _playDevice(i, gen);
      }
    } catch (e) {
      lastError = 'The device voice failed: $e';
      notifyListeners();
    }
  }

  Future<void> pause() async {
    if (!speaking || paused) return;
    paused = true;
    if (playingAudio) {
      await _player?.pause();
    } else {
      await _tts?.stop();
    }
    notifyListeners();
  }

  Future<void> resume() async {
    if (!paused) return;
    paused = false;
    if (playingAudio) await _player?.resume();
    if (!(_resume?.isCompleted ?? true)) _resume!.complete();
    notifyListeners();
  }

  Future<void> togglePause() => paused ? resume() : pause();

  Future<void> _jumpTo(int i) async {
    if (!speaking || i < 0 || i >= parts.length) return;
    index = i;
    paused = false;
    await _player?.stop();
    await _tts?.stop();
    if (!(_done?.isCompleted ?? true)) _done!.complete();
    if (!(_resume?.isCompleted ?? true)) _resume!.complete();
    // Restart the loop from the new part.
    unawaited(_run(++_gen));
    notifyListeners();
  }

  Future<void> next() => _jumpTo(index + 1);
  Future<void> previous() => _jumpTo(index - 1);
  Future<void> restart() => _jumpTo(0);

  /// Seconds forward or back within a cloud part; parts for the device voice.
  Future<void> seekBy(int seconds) async {
    if (!playingAudio || _player == null) {
      await (seconds < 0 ? previous() : next());
      return;
    }
    var target = position + Duration(seconds: seconds);
    if (target < Duration.zero) target = Duration.zero;
    if (duration > Duration.zero && target > duration) target = duration;
    await _player!.seek(target);
  }

  Future<void> setSpeed(double v) async {
    await _ref.read(settingsProvider.notifier).setSpeechRate(v);
    if (playingAudio) await _player?.setPlaybackRate(v);
    notifyListeners();
  }

  Future<void> stop() async {
    _gen++;
    speaking = false;
    paused = false;
    loading = false;
    playingAudio = false;
    sourceId = null;
    await _player?.stop();
    await _tts?.stop();
    if (!(_done?.isCompleted ?? true)) _done!.complete();
    if (!(_resume?.isCompleted ?? true)) _resume!.complete();
    notifyListeners();
  }

  @override
  void dispose() {
    _gen++;
    _player?.dispose();
    _tts?.stop();
    super.dispose();
  }
}

final speakerProvider = ChangeNotifierProvider<Speaker>((ref) => Speaker(ref));
