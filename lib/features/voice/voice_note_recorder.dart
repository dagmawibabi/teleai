import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../app/theme.dart';

class RecordedVoiceNote {
  const RecordedVoiceNote({required this.path, required this.duration});
  final String path;
  final int duration;
}

Future<RecordedVoiceNote?> recordVoiceNote(BuildContext context) => showModalBottomSheet<RecordedVoiceNote>(
  context: context,
  useSafeArea: true,
  isDismissible: false,
  enableDrag: false,
  builder: (_) => const _VoiceNoteRecorderSheet(),
);

enum _Phase { starting, recording, paused, review, failed }

/// Records a voice message (Opus, as Telegram sends them): pause and resume,
/// start over, listen back, then send.
class _VoiceNoteRecorderSheet extends StatefulWidget {
  const _VoiceNoteRecorderSheet();

  @override
  State<_VoiceNoteRecorderSheet> createState() => _VoiceNoteRecorderSheetState();
}

class _VoiceNoteRecorderSheetState extends State<_VoiceNoteRecorderSheet> {
  final _recorder = AudioRecorder();
  final _player = AudioPlayer();
  StreamSubscription<Amplitude>? _amp;
  Timer? _ticker;
  _Phase _phase = _Phase.starting;
  String? _error;
  String? _path;

  /// Time recorded before the current stretch, and when that began.
  Duration _banked = Duration.zero;
  DateTime? _since;
  final List<double> _levels = [];
  bool _playing = false;

  Duration get _elapsed => _banked + (_since == null ? Duration.zero : DateTime.now().difference(_since!));

  @override
  void initState() {
    super.initState();
    _player.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _playing = false);
    });
    _start();
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _amp?.cancel();
    _recorder.dispose();
    _player.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() {
      _phase = _Phase.starting;
      _error = null;
      _banked = Duration.zero;
      _since = null;
      _levels.clear();
    });
    try {
      if (!await _recorder.hasPermission()) throw Exception('Microphone access is off for Triangle.');
      final dir = Directory('${(await getApplicationSupportDirectory()).path}/voice_notes');
      if (!await dir.exists()) await dir.create(recursive: true);
      final path = '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.opus';
      await _recorder.start(const RecordConfig(encoder: AudioEncoder.opus, sampleRate: 48000, numChannels: 1), path: path);
      _path = path;
      _since = DateTime.now();
      _amp?.cancel();
      _amp = _recorder.onAmplitudeChanged(const Duration(milliseconds: 90)).listen((a) {
        if (_phase != _Phase.recording) return;
        _levels.add(((a.current + 50) / 50).clamp(0.05, 1).toDouble());
        if (_levels.length > 60) _levels.removeAt(0);
        if (mounted) setState(() {});
      });
      _ticker?.cancel();
      _ticker = Timer.periodic(const Duration(milliseconds: 250), (_) {
        if (mounted) setState(() {});
      });
      if (mounted) setState(() => _phase = _Phase.recording);
    } catch (e) {
      if (mounted) {
        setState(() {
          _phase = _Phase.failed;
          _error = '$e'.replaceFirst('Exception: ', '');
        });
      }
    }
  }

  Future<void> _pause() async {
    await _recorder.pause();
    _banked = _elapsed;
    _since = null;
    setState(() => _phase = _Phase.paused);
  }

  Future<void> _resume() async {
    await _player.stop();
    await _recorder.resume();
    _since = DateTime.now();
    setState(() {
      _phase = _Phase.recording;
      _playing = false;
    });
  }

  /// Throws this take away and records a new one.
  Future<void> _restart() async {
    await _player.stop();
    await _recorder.cancel();
    _playing = false;
    await _start();
  }

  /// Stops recording to listen back; sending is still a tap away.
  Future<void> _review() async {
    if (_phase == _Phase.recording) await _pause();
    final path = await _recorder.stop();
    _ticker?.cancel();
    if (path != null) _path = path;
    setState(() => _phase = _Phase.review);
  }

  Future<void> _togglePlay() async {
    if (_path == null) return;
    if (_playing) {
      await _player.pause();
    } else {
      await _player.play(DeviceFileSource(_path!));
    }
    setState(() => _playing = !_playing);
  }

  Future<void> _discard() async {
    await _player.stop();
    if (_phase != _Phase.review) await _recorder.cancel();
    if (mounted) Navigator.pop(context);
  }

  Future<void> _send() async {
    if (_phase == _Phase.recording || _phase == _Phase.paused) {
      _banked = _elapsed;
      _since = null;
      final path = await _recorder.stop();
      if (path != null) _path = path;
    }
    await _player.stop();
    if (!mounted) return;
    if (_path == null || !File(_path!).existsSync()) {
      setState(() => _error = 'Nothing was recorded. Try again.');
      return;
    }
    Navigator.pop(context, RecordedVoiceNote(path: _path!, duration: _banked.inSeconds.clamp(1, 3600)));
  }

  @override
  Widget build(BuildContext context) {
    final e = _elapsed;
    final clock = '${e.inMinutes.toString().padLeft(2, '0')}:${(e.inSeconds % 60).toString().padLeft(2, '0')}';
    final recording = _phase == _Phase.recording;
    final paused = _phase == _Phase.paused;
    final review = _phase == _Phase.review;

    Widget round(IconData icon, String tip, VoidCallback? onTap, {bool big = false, Color? color}) => Tooltip(
      message: tip,
      child: Material(
        color: big ? (color ?? AppColors.danger) : AppColors.surface3,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox.square(
            dimension: big ? 68 : 50,
            child: Icon(icon, size: big ? 32 : 24, color: big ? Colors.white : AppColors.text),
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(Space.xl, Space.l, Space.xl, Space.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 4,
            decoration: BoxDecoration(color: AppColors.text3, borderRadius: BorderRadius.circular(99)),
          ),
          const SizedBox(height: Space.l),
          Text(
            switch (_phase) {
              _Phase.starting => 'Starting the microphone…',
              _Phase.recording => 'Recording',
              _Phase.paused => 'Paused',
              _Phase.review => 'Listen back, then send',
              _Phase.failed => _error ?? 'Couldn\'t record',
            },
            style: context.text.titleMedium?.copyWith(color: _phase == _Phase.failed ? AppColors.danger : null),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Space.s),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (recording)
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(color: AppColors.danger, shape: BoxShape.circle),
                ),
              Text(clock, style: context.text.headlineMedium?.copyWith(fontFeatures: tabularFigures)),
            ],
          ),
          const SizedBox(height: Space.l),
          SizedBox(
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final v in [...List.filled((60 - _levels.length).clamp(0, 60), 0.05), ..._levels])
                  Container(
                    width: 3,
                    height: 4 + v * 40,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: recording ? AppColors.accent : AppColors.text3,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          ),
          if (_error != null && _phase != _Phase.failed)
            Padding(
              padding: const EdgeInsets.only(top: Space.s),
              child: Text(_error!, style: context.text.bodySmall?.copyWith(color: AppColors.danger)),
            ),
          const SizedBox(height: Space.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              round(Icons.delete_outline_rounded, 'Discard', _discard),
              round(Icons.restart_alt_rounded, 'Start over', _phase == _Phase.starting ? null : _restart),
              if (review)
                round(_playing ? Icons.pause_rounded : Icons.play_arrow_rounded, 'Listen', _togglePlay, big: true, color: AppColors.accent)
              else
                round(
                  recording ? Icons.pause_rounded : Icons.mic_rounded,
                  recording ? 'Pause' : 'Resume',
                  recording ? _pause : (paused ? _resume : null),
                  big: true,
                ),
              round(Icons.hearing_outlined, 'Listen back', recording || paused ? _review : null),
              Tooltip(
                message: 'Send',
                child: Material(
                  color: AppColors.text,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: recording || paused || review ? _send : null,
                    child: SizedBox.square(dimension: 50, child: Icon(Icons.send_rounded, color: AppColors.bg)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Space.s),
          Text(
            review ? 'Tap start over to record again' : 'Pause any time; start over throws this take away',
            style: context.text.labelSmall,
          ),
        ],
      ),
    );
  }
}
