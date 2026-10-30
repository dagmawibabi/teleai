// The recognizer behaviour seen on real phones: Google's online path can hold
// every word back until listening stops, and the one on the phone may not have
// the language.

import 'package:flutter_test/flutter_test.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:teleai/features/voice/voice_listener.dart';

class FakeRecognizer implements Recognizer {
  bool isReady = true;
  final starts = <bool>[];
  final pauses = <Duration>[];
  late void Function(String, bool) result;
  late void Function(double) soundLevel;
  late void Function(String) error;
  late void Function(String) status;
  int stops = 0, cancels = 0, releases = 0;

  @override
  Future<bool> ready() async => isReady;

  @override
  Future<void> start({
    required bool onDevice,
    required Duration pauseFor,
    required void Function(String, bool) onResult,
    required void Function(double) onLevel,
    required void Function(String) onError,
    required void Function(String) onStatus,
  }) async {
    starts.add(onDevice);
    pauses.add(pauseFor);
    result = onResult;
    soundLevel = onLevel;
    error = onError;
    status = onStatus;
  }

  @override
  Future<void> stop() async => stops++;
  @override
  Future<void> cancel() async => cancels++;
  @override
  void release() => releases++;
}

void main() {
  late FakeRecognizer rec;
  late VoiceListener listener;
  late List<(String, bool)> got;

  setUp(() async {
    rec = FakeRecognizer();
    listener = VoiceListener(recognizer: rec, lateWords: const Duration(milliseconds: 60));
    got = [];
    await listener.listen((w, d) => got.add((w, d)));
  });

  test('asks for the recognizer on the phone and doesn\'t cut quiet moments short', () {
    expect(rec.starts, [true]);
    expect(rec.pauses.single, greaterThan(const Duration(seconds: 10)));
  });

  test('words that arrive just after listening ends are kept, not lost', () async {
    rec.status(SpeechToText.notListeningStatus);
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(got, isEmpty, reason: 'nothing is reported while words may still come');
    rec.result('what time is it', false);
    rec.result('what time is it', true);
    expect(got.last, ('what time is it', true));
    expect(rec.releases, 1);
  });

  test('with nothing heard, the end is reported after the wait', () async {
    rec.status(SpeechToText.doneStatus);
    await Future<void>.delayed(const Duration(milliseconds: 90));
    expect(got, [('', true)]);
  });

  test('an empty final result does not wipe what was heard', () async {
    rec.result('hello there', false);
    rec.result('', true);
    expect(got.last, ('hello there', true));
  });

  test('when the recognizer starts its text over, nothing said is lost', () {
    // As seen on a Galaxy: the words drop away mid-way and it starts again.
    rec.result('this is a test of the voice mode', false);
    rec.result('This', false);
    rec.result('This blows my mind', false);
    expect(got.last.$1, 'this is a test of the voice mode This blows my mind');
    rec.result('hello', false);
    expect(got.last.$1, 'this is a test of the voice mode This blows my mind hello');
  });

  test('corrections replace words instead of adding them', () {
    rec.result('hello there but', false);
    rec.result('hello there', false);
    rec.result('hello there but this is a test', false);
    rec.result('hello there but this is the test', false);
    expect(got.last.$1, 'hello there but this is the test');
  });

  test('a final result with everything again is not doubled', () {
    rec.result('one two three four', false);
    rec.result('five', false);
    rec.result('one two three four five', true);
    expect(got.last, ('one two three four five', true));
  });

  test('with words in hand, stop does not wait long for a final that may not come', () async {
    final slow = FakeRecognizer();
    final l = VoiceListener(recognizer: slow);
    final words = <(String, bool)>[];
    await l.listen((w, d) => words.add((w, d)));
    slow.result('hello there', false);
    await l.stop();
    await Future<void>.delayed(const Duration(milliseconds: 400));
    expect(words.last, ('hello there', true));
  });

  test('stop delivers once, even with both the final and the timer', () async {
    rec.result('hello', false);
    await listener.stop();
    expect(rec.stops, 1);
    rec.result('hello there', true);
    rec.status(SpeechToText.doneStatus);
    await Future<void>.delayed(const Duration(milliseconds: 90));
    expect(got.where((g) => g.$2), [('hello there', true)]);
  });

  test('falls back to the online recognizer when the phone can\'t', () async {
    rec.error('error_language_unavailable');
    await Future<void>.delayed(Duration.zero);
    expect(rec.starts, [true, false]);
    expect(rec.pauses.last, lessThan(const Duration(seconds: 10)), reason: 'without live words, a pause ends the listen');
    expect(got, isEmpty);
  });

  test('nobody speaking is not a reason to fall back', () {
    rec.error('error_no_match');
    expect(rec.starts, [true]);
    expect(got, [('', true)]);
    expect(listener.error, contains('catch'));
  });

  test('a refused mic is reported in the words the session looks for', () {
    rec.error('error_permission');
    expect(listener.error, contains('Microphone'));
  });

  test('cancel delivers nothing, then or later', () async {
    rec.result('hello', false);
    got.clear();
    await listener.cancel();
    rec.result('hello there', true);
    await Future<void>.delayed(const Duration(milliseconds: 90));
    expect(got, isEmpty);
    expect(rec.cancels, 1);
  });

  test('sound levels are scaled to 0 to 1', () {
    rec.soundLevel(4);
    expect(listener.level, closeTo(0.5, 0.01));
    rec.soundLevel(-2);
    expect(listener.level, 0);
  });

  test('a recognizer that is not there says so', () async {
    final none = FakeRecognizer()..isReady = false;
    final l = VoiceListener(recognizer: none);
    await l.listen((_, _) {});
    expect(l.error, contains('not available'));
    expect(none.starts, isEmpty);
  });
}
