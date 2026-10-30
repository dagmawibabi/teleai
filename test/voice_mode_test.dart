// Voice mode: sentences come out of a reply as it streams, the listen, send,
// speak loop runs and can be interrupted, and the orb drags down to show the
// conversation.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/chat/data/chat_controller.dart';
import 'package:teleai/features/chat/domain/chat_models.dart';
import 'package:teleai/features/settings/data/settings.dart';
import 'package:teleai/features/voice/voice_mode_screen.dart';
import 'package:teleai/features/voice/voice_session.dart';

class FakePorts implements VoicePorts {
  void Function(String, bool)? onWords;
  final sent = <String>[];
  final spoken = <String>[];
  final reply = ValueNotifier(0);
  final speech = ValueNotifier(0);
  Completer<void>? turn;
  String text = '';
  bool isSpeaking = false;
  bool live = true;
  bool stopped = false;
  bool speechEnded = false;
  int listens = 0;
  int cancels = 0;
  double mic = 0;
  ToolPart? approval;
  String? listenProblem;
  bool active = false;

  /// Reads everything at once when the answer ends.
  bool finishSpeechOnEnd = true;

  @override
  Future<void> listen(void Function(String, bool) onWords) async {
    listens++;
    this.onWords = onWords;
  }

  @override
  Future<void> finishListening() async {
    final cb = onWords;
    onWords = null;
    cb?.call(lastWords, true);
  }

  String lastWords = '';
  void say(String words) {
    lastWords = words;
    onWords?.call(words, false);
  }

  @override
  Future<void> cancelListening() async {
    cancels++;
    onWords = null;
  }

  @override
  double get micLevel => mic;
  @override
  bool get liveWords => live;
  @override
  String? get listenError => listenProblem;
  @override
  bool get transcribing => false;

  @override
  Future<void> send(String t, List<Attachment> attachments) {
    sent.add(t);
    text = '';
    return (turn = Completer<void>()).future;
  }

  void write(String more) {
    text += more;
    reply.value++;
  }

  void finishTurn() => turn?.complete();

  @override
  void stopTurn() {
    stopped = true;
    finishTurn();
  }

  @override
  bool get turnRunning => turn != null && !turn!.isCompleted;
  @override
  String get replyText => text;
  @override
  String? get replyError => null;
  @override
  ToolPart? get approvalNeeded => approval;
  @override
  String? get runningTool => null;
  @override
  Listenable get replyChanges => reply;

  @override
  Future<void> beginSpeech() async {
    isSpeaking = true;
    speechEnded = false;
  }

  @override
  void addSpeech(String s) => spoken.add(s);
  @override
  void endSpeech() {
    speechEnded = true;
    if (finishSpeechOnEnd) isSpeaking = false;
  }

  @override
  Future<void> stopSpeech() async => isSpeaking = false;
  @override
  bool get speaking => isSpeaking;
  @override
  bool get audible => isSpeaking;
  @override
  Listenable get speechChanges => speech;
  @override
  Future<double?> outputLevel() async => 0.6;
  @override
  Future<void> setActive(bool a) async => active = a;
}

Future<void> settle([int ms = 20]) => Future<void>.delayed(Duration(milliseconds: ms));

void main() {
  group('SpeechStreamer', () {
    test('gives out finished sentences as the text grows', () {
      final s = SpeechStreamer();
      expect(s.feed('Hello there'), isEmpty);
      expect(s.feed('Hello there, friend. How'), ['Hello there, friend.']);
      expect(s.feed('Hello there, friend. How are you'), isEmpty);
      expect(s.feed('Hello there, friend. How are you?', done: true), ['How are you?']);
      expect(s.feed('Hello there, friend. How are you?', done: true), isEmpty);
    });

    test('does not break numbers or read markdown, links or code', () {
      final s = SpeechStreamer();
      expect(s.feed('It costs 3.14 birr today. '), ['It costs 3.14 birr today.']);
      final t = SpeechStreamer();
      final parts = t.feed('**Bold** and [a link](https://x.y) here. See https://a.b/c now. ', done: true);
      expect(parts.join(' '), 'Bold and a link here. See  now.');
      final code = SpeechStreamer();
      expect(code.feed('Here it is.\n```dart\nfinal a = 1.\nprint(a).\n'), ['Here it is.']);
      expect(code.feed('Here it is.\n```dart\nfinal a = 1.\nprint(a).\n```\nDone now. ', done: true).join(' '), 'Done now.');
    });

    test('handles Amharic sentence ends and cuts very long sentences', () {
      final s = SpeechStreamer();
      expect(s.feed('ሰላም እንዴት ነህ። ደህና'), ['ሰላም እንዴት ነህ።']);
      final long = SpeechStreamer();
      final parts = long.feed('${'word ' * 80}and on');
      expect(parts, hasLength(1));
      expect(parts.first.length, lessThan(240));
    });

    test('skips pieces with nothing to say', () {
      expect(SpeechStreamer().feed('*** --- \n\n', done: true), isEmpty);
    });
  });

  group('VoiceSession', () {
    late FakePorts ports;
    late VoiceSession session;

    setUp(() {
      ports = FakePorts();
      session = VoiceSession(ports, silence: const Duration(milliseconds: 150));
    });

    tearDown(() async {
      await session.close();
      session.dispose();
    });

    test('listens, sends after a pause, speaks while it streams, listens again', () async {
      await session.start();
      expect(session.phase, VoicePhase.listening);
      expect(ports.active, true);

      ports.say('what time');
      ports.say('what time is it');
      expect(session.heard, 'what time is it');
      await settle(350);
      expect(ports.sent, ['what time is it']);
      expect(session.phase, VoicePhase.thinking);

      ports.write('It is three o');
      expect(ports.spoken, isEmpty);
      ports.write("'clock. And");
      expect(ports.spoken, ["It is three o'clock."]);
      expect(session.phase, VoicePhase.speaking);
      expect(session.level, closeTo(0, 0.01));
      await settle(90);
      expect(session.level, 0.6, reason: 'the orb follows the AI voice');

      ports.write(" it's sunny.");
      ports.finishTurn();
      await settle(150);
      expect(ports.spoken.last, "And it's sunny.");
      expect(ports.speechEnded, true);
      expect(session.phase, VoicePhase.listening);
      expect(ports.listens, 2);
    });

    test('tapping the orb interrupts an answer and listens', () async {
      await session.start();
      ports.say('tell me a long story');
      await settle(300);
      ports.write('Once upon a time there was a fox. ');
      ports.finishSpeechOnEnd = false;
      await session.interrupt();
      expect(ports.stopped, true);
      expect(ports.isSpeaking, false);
      expect(session.phase, VoicePhase.listening);
      // The stopped answer doesn't speak any more.
      final before = ports.spoken.length;
      ports.write('The fox ran away. ');
      await settle(50);
      expect(ports.spoken.length, before);
      expect(ports.listens, 2);
    });

    test('mic off stops listening, and on again resumes', () async {
      await session.start();
      await session.toggleMute();
      expect(session.muted, true);
      expect(session.phase, VoicePhase.muted);
      expect(ports.cancels, 1);
      await session.toggleMute();
      expect(session.phase, VoicePhase.listening);
    });

    test('muted during an answer stays quiet afterwards', () async {
      await session.start();
      ports.say('hello there');
      await settle(300);
      await session.toggleMute();
      ports.finishTurn();
      await settle(150);
      expect(session.phase, VoicePhase.muted);
      expect(ports.listens, 1);
    });

    test('hearing nothing keeps listening without sending', () async {
      await session.start();
      ports.onWords?.call('', true);
      await settle(320);
      expect(ports.sent, isEmpty);
      expect(ports.listens, 2);
    });

    test('a denied mic stops instead of looping', () async {
      await session.start();
      ports.listenProblem = 'Microphone access is off.';
      ports.onWords?.call('', true);
      await settle(320);
      expect(session.phase, VoicePhase.muted);
      expect(session.status, contains('Microphone'));
      expect(ports.listens, 1);
    });

    test('recordings end by the mic level, not by words', () async {
      ports.live = false;
      ports.mic = 0.05;
      await session.start();
      await settle(130);
      ports.mic = 0.8;
      await settle(300);
      ports.mic = 0.05;
      ports.lastWords = 'from the recording';
      await settle(500);
      expect(ports.sent, ['from the recording']);
    });

    test('a recording still ends in a room louder than any fixed level', () async {
      ports.live = false;
      ports.mic = 0.62;
      await session.start();
      await settle(130);
      ports.mic = 0.95;
      await settle(300);
      ports.mic = 0.62;
      ports.lastWords = 'over the fan';
      await settle(500);
      expect(ports.sent, ['over the fan']);
    });

    test('soft speech counts, and a brief knock does not', () async {
      ports.live = false;
      ports.mic = 0.1;
      await session.start();
      await settle(130);
      ports.mic = 0.6;
      await settle(40);
      ports.mic = 0.1;
      await settle(500);
      expect(ports.sent, isEmpty, reason: 'a knock is not talking');

      ports.mic = 0.36;
      await settle(400);
      ports.mic = 0.1;
      ports.lastWords = 'quietly said';
      await settle(500);
      expect(ports.sent, ['quietly said']);
    });

    test('the orb stays still for the room and moves for a voice', () async {
      ports.mic = 0.6;
      await session.start();
      await settle(400);
      expect(session.level, closeTo(0, 0.01), reason: 'a steady hum shows as stillness');
      ports.mic = 0.95;
      await settle(300);
      expect(session.level, greaterThan(0.1));
    });

    test('typed text interrupts and sends', () async {
      await session.start();
      unawaited(session.sendText('typed question'));
      await settle();
      expect(ports.sent, ['typed question']);
      expect(session.phase, VoicePhase.thinking);
    });

    test('a tool needing approval is announced once and shown', () async {
      await session.start();
      ports.say('send it');
      await settle(300);
      ports.approval = ToolPart(callId: 'a', name: 'send_message', status: ToolStatus.awaitingApproval);
      ports.reply.value++;
      ports.reply.value++;
      expect(session.approval?.callId, 'a');
      expect(ports.spoken.where((s) => s.contains('OK')), hasLength(1));
      expect(session.status, 'Waiting for your OK');
    });

    test('the mic switches off after a long quiet', () async {
      final quiet = FakePorts();
      final s = VoiceSession(quiet, giveUpAfter: Duration.zero);
      await s.start();
      await settle(5);
      quiet.onWords?.call('', true);
      await settle(320);
      expect(s.phase, VoicePhase.muted);
      await s.close();
      s.dispose();
    });
  });

  group('screen', () {
    Future<(FakePorts, VoiceSession)> open(WidgetTester tester) async {
      final ports = FakePorts();
      late VoiceSession session;
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            voiceSessionProvider.overrideWith((ref) => session = VoiceSession(ports)),
          ],
          child: const MaterialApp(home: VoiceModeScreen()),
        ),
      );
      await tester.pump();
      await tester.pump();
      return (ports, session);
    }

    Future<void> leave(WidgetTester tester) async {
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 200));
    }

    testWidgets('starts listening with a big orb and no conversation', (tester) async {
      final (ports, _) = await open(tester);
      expect(ports.listens, 1);
      expect(find.text('Listening'), findsOneWidget);
      expect(tester.getSize(find.byKey(const Key('voice-orb'))).width, greaterThan(200));
      expect(find.byKey(const Key('voice-transcript-list')), findsNothing);
      await leave(tester);
    });

    testWidgets('dragging the orb down shrinks it and shows the conversation, and back up', (tester) async {
      final (ports, _) = await open(tester);
      ports.say('hello from my voice');
      await tester.pump();

      final orb = find.byKey(const Key('voice-orb'));
      final before = tester.getCenter(orb);
      await tester.drag(orb, const Offset(0, 400));
      await tester.pump(const Duration(milliseconds: 500));
      final after = tester.getCenter(orb);
      expect(after.dy, greaterThan(before.dy + 100));
      expect(tester.getSize(orb).width, lessThan(120));
      expect(find.text('hello from my voice'), findsOneWidget, reason: 'the words show while still talking');
      expect(ports.cancels, 0, reason: 'dragging does not stop listening');

      await tester.drag(orb, const Offset(0, -400));
      await tester.pump(const Duration(milliseconds: 500));
      expect(tester.getSize(orb).width, greaterThan(200));
      expect(find.text('hello from my voice'), findsNothing);
      await leave(tester);
    });

    test('the shape is a triangle unless changed', () {
      expect(const AppSettings().orbShape, OrbShape.triangle);
    });

    testWidgets('the conversation draws the AI\'s Markdown replies', (tester) async {
      await open(tester);
      ProviderScope.containerOf(tester.element(find.byType(VoiceModeScreen)))
          .read(chatControllerProvider)
          .conversation
          .entries
          .add(AssistantEntry(id: 'a', steps: [ModelStep(text: '# Plan\n\nIt is **sunny**.\n\n- one\n\n`code`')], done: true));

      await tester.drag(find.byKey(const Key('voice-orb')), const Offset(0, 400));
      await tester.pump(const Duration(milliseconds: 500));
      expect(tester.takeException(), isNull);
      expect(find.byType(MarkdownBody), findsOneWidget);
      expect(find.text('Plan', findRichText: true), findsOneWidget);
      await leave(tester);
    });

    testWidgets('a short drag snaps back', (tester) async {
      await open(tester);
      final orb = find.byKey(const Key('voice-orb'));
      final before = tester.getCenter(orb);
      await tester.timedDrag(orb, const Offset(0, 40), const Duration(seconds: 1));
      await tester.pump(const Duration(milliseconds: 500));
      expect(tester.getCenter(orb).dy, closeTo(before.dy, 1));
      await leave(tester);
    });

    testWidgets('tap on the orb interrupts; mic button switches the mic', (tester) async {
      final (ports, session) = await open(tester);
      unawaited(session.sendText('question'));
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 30)));
      await tester.pump();
      expect(session.phase, VoicePhase.thinking);
      await tester.tap(find.byKey(const Key('voice-orb')));
      await tester.pump();
      expect(ports.stopped, true);

      await tester.tap(find.byKey(const Key('voice-mute')));
      await tester.pump();
      expect(session.muted, true);
      expect(find.text('Mic off'), findsOneWidget);
      await leave(tester);
    });

    testWidgets('the X ends voice mode and stops everything', (tester) async {
      final ports = FakePorts();
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        ProviderScope(
          overrides: [voiceSessionProvider.overrideWith((ref) => VoiceSession(ports))],
          child: MaterialApp(
            home: Builder(
              builder: (context) => TextButton(onPressed: () => VoiceModeScreen.open(context), child: const Text('open')),
            ),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(ports.active, true);
      await tester.tap(find.byKey(const Key('voice-close')));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      expect(find.text('open'), findsOneWidget);
      expect(ports.active, false);
      expect(ports.isSpeaking, false);
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(milliseconds: 200));
    });
  });
}
