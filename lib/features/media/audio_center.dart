import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:handy_tdlib/api.dart' as td;

import '../telegram/data/file_loader.dart';
import '../telegram/data/telegram_store.dart';
import '../voice/speaker.dart';

/// One voice message or song.
class Track {
  const Track({
    required this.chatId,
    required this.messageId,
    required this.file,
    required this.title,
    required this.subtitle,
    required this.seconds,
    required this.voice,
    this.cover,
  });

  final int chatId;
  final int messageId;
  final td.File file;
  final String title;
  final String subtitle;
  final int seconds;
  final bool voice;
  final td.Minithumbnail? cover;

  String get key => '$chatId:$messageId';

  static Track? of(td.Message m, TelegramStore store) {
    switch (m.content) {
      case td.MessageVoiceNote(:final voiceNote):
        return Track(
          chatId: m.chatId,
          messageId: m.id,
          file: voiceNote.voice,
          title: m.isOutgoing ? 'You' : store.senderName(m.senderId),
          subtitle: 'Voice message',
          seconds: voiceNote.duration,
          voice: true,
        );
      case td.MessageAudio(:final audio):
        return Track(
          chatId: m.chatId,
          messageId: m.id,
          file: audio.audio,
          title: audio.title.isNotEmpty ? audio.title : audio.fileName,
          subtitle: audio.performer.isNotEmpty ? audio.performer : (store.chat(m.chatId)?.title ?? ''),
          seconds: audio.duration,
          voice: false,
          cover: audio.albumCoverMinithumbnail,
        );
      default:
        return null;
    }
  }
}

/// Plays voice messages and music from any chat, with a queue so the next
/// one in the chat follows, like Telegram's player.
class AudioCenter extends ChangeNotifier {
  AudioCenter(this._ref) {
    _player.onPositionChanged.listen((p) {
      position = p;
      notifyListeners();
    });
    _player.onDurationChanged.listen((d) {
      duration = d;
      notifyListeners();
    });
    _player.onPlayerComplete.listen((_) => _completed());
  }

  final Ref _ref;
  final _player = AudioPlayer();

  Track? current;
  List<Track> queue = const [];
  bool playing = false;
  bool loading = false;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  double speed = 1;
  String? error;

  bool isCurrent(int chatId, int messageId) => current?.chatId == chatId && current?.messageId == messageId;

  int get _index => current == null ? -1 : queue.indexWhere((t) => t.key == current!.key);
  bool get hasNext => _index >= 0 && _index < queue.length - 1;
  bool get hasPrevious => _index > 0;

  /// Plays [track]; [playlist] (oldest first) sets what plays after it.
  Future<void> play(Track track, {List<Track>? playlist}) async {
    if (current?.key == track.key) return toggle();
    await _ref.read(speakerProvider).stop();
    current = track;
    if (playlist != null) queue = playlist;
    if (!queue.any((t) => t.key == track.key)) queue = [track];
    position = Duration.zero;
    duration = Duration(seconds: track.seconds);
    loading = true;
    error = null;
    playing = true;
    notifyListeners();
    final path = await _ref.read(fileLoaderProvider).download(track.file, priority: 32);
    if (current?.key != track.key) return;
    loading = false;
    if (path == null) {
      error = 'Couldn\'t download the audio.';
      playing = false;
      notifyListeners();
      return;
    }
    try {
      await _player.setPlaybackRate(speed);
      await _player.play(DeviceFileSource(path));
    } catch (e) {
      error = '$e';
      playing = false;
    }
    notifyListeners();
  }

  Future<void> toggle() async {
    if (current == null) return;
    if (playing) {
      await _player.pause();
      playing = false;
    } else {
      await _player.resume();
      playing = true;
    }
    notifyListeners();
  }

  Future<void> seek(Duration to) => _player.seek(to);

  Future<void> skip(int seconds) {
    var t = position + Duration(seconds: seconds);
    if (t < Duration.zero) t = Duration.zero;
    if (duration > Duration.zero && t > duration) t = duration;
    return _player.seek(t);
  }

  Future<void> next() async {
    if (hasNext) await play(queue[_index + 1]);
  }

  Future<void> previous() async {
    if (position > const Duration(seconds: 3) || !hasPrevious) {
      await _player.seek(Duration.zero);
    } else {
      await play(queue[_index - 1]);
    }
  }

  Future<void> setSpeed(double v) async {
    speed = v;
    await _player.setPlaybackRate(v);
    notifyListeners();
  }

  void _completed() {
    if (hasNext) {
      unawaited(next());
    } else {
      playing = false;
      position = Duration.zero;
      notifyListeners();
    }
  }

  Future<void> stop() async {
    await _player.stop();
    current = null;
    playing = false;
    loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

final audioCenterProvider = ChangeNotifierProvider<AudioCenter>((ref) => AudioCenter(ref));
