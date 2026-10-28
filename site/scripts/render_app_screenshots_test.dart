// Run from the Flutter project root:
// flutter test site/scripts/render_app_screenshots_test.dart --update-goldens
// These screenshots use Triangle's real Flutter message and brief widgets.
// All conversations are fictional; no account, network or device is accessed.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../lib/app/theme.dart';
import '../../lib/core/widgets/brand_mark.dart';
import '../../lib/features/brief/brief_screen.dart';
import '../../lib/features/brief/brief_store.dart';
import '../../lib/features/chat/domain/chat_models.dart';
import '../../lib/features/chat/presentation/widgets/message_view.dart';
import '../../lib/features/settings/data/settings.dart';

class ScreenshotSettings extends SettingsController {
  @override
  AppSettings build() => const AppSettings(
    showChatSpeakButton: false,
    showMessageUsage: false,
    showModelName: false,
  );
}

final date = DateTime(2026, 10, 28, 9, 41);
AssistantEntry answer(String text) => AssistantEntry(
  id: 'demo-answer',
  at: date,
  done: true,
  steps: [ModelStep(text: text)],
);

class ConversationPreview extends StatelessWidget {
  const ConversationPreview({super.key, this.watch = false});
  final bool watch;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const Padding(padding: EdgeInsets.all(14), child: BrandMark(size: 28)),
      title: Row(children: [Text(watch ? 'Launch watch' : 'Claude Sonnet'), const SizedBox(width: 3), const Icon(Icons.keyboard_arrow_down, size: 20)]),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined, size: 21))],
    ),
    body: Column(children: [
      Expanded(child: ListView(padding: const EdgeInsets.all(18), children: [
        Center(child: Padding(padding: const EdgeInsets.only(bottom: 22), child: Text('TODAY', style: Theme.of(context).textTheme.labelSmall))),
        UserBubble(entry: UserEntry(
          id: 'demo-user', at: date,
          event: watch ? 'Design team updates' : null,
          text: watch
            ? 'The design team shared an update in the launch group.'
            : 'Catch me up on my day. What needs my attention?',
        )),
        AssistantMessage(
          posts: const {},
          entry: answer(watch
            ? '## Your launch is looking good.\n\nThe team just shared the final designs. Here\'s what changed:\n\n**The new home screen is ready.** The latest mockups include the feedback from yesterday.\n\n**Two things need your eye:**\n\n- Review the updated onboarding flow.\n- Give the green light on the new app icon.\n\nEverything else is on track for Friday.\n\nWant me to draft a reply to the team?'
            : '## A little clarity for your morning.\n\nHere\'s what matters across your connected apps.\n\n**Your design review is at 11:00.** The updated files are in Drive, ready when you are.\n\n**Alex is waiting on a reply** in your Telegram launch group about Friday\'s release.\n\n**Your inbox is looking calm.** Two emails need a response; the rest can wait.\n\nYou have a clear afternoon. A good time for that thing you\'ve been putting off.\n\nWant me to help with those replies?'),
          streaming: false,
        ),
      ])),
      Container(
        margin: const EdgeInsets.fromLTRB(12, 8, 12, 18),
        padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
        decoration: BoxDecoration(color: AppColors.surface2, borderRadius: BorderRadius.circular(26), border: Border.all(color: AppColors.line)),
        child: const Row(children: [Icon(Icons.add, size: 22), SizedBox(width: 12), Expanded(child: Text('Ask anything', style: TextStyle(color: Color(0xFF8B8B95), fontSize: 15))), Icon(Icons.mic_none_rounded, size: 22), SizedBox(width: 12), Icon(Icons.arrow_upward_rounded, size: 22)]),
      ),
    ]),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('render safe product screenshots from real app widgets', (tester) async {
    final fontRoot = '${File(Platform.resolvedExecutable).parent.parent.parent.path}/material_fonts';
    for (final font in [('Roboto', 'roboto-regular.ttf'), ('Roboto', 'roboto-bold.ttf'), ('MaterialIcons', 'materialicons-regular.otf')]) {
      final loader = FontLoader(font.$1)..addFont(Future.value(ByteData.sublistView(File('$fontRoot/${font.$2}').readAsBytesSync())));
      await loader.load();
    }
    final emoji = File('C:/Windows/Fonts/seguiemj.ttf');
    if (emoji.existsSync()) {
      await (FontLoader('ScreenshotEmoji')..addFont(Future.value(ByteData.sublistView(emoji.readAsBytesSync())))).load();
    }
    tester.view.physicalSize = const Size(390, 820);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    AppColors.palette = Palette.dark;
    final brief = Brief(
      id: 'demo-brief', kind: BriefKind.morning, at: date,
      since: date.subtract(const Duration(hours: 12)),
      conversation: Conversation(id: 'demo-conversation', entries: [answer(
        '## Good morning. You\'re all caught up.\n\nA quieter start to a full day. Here\'s your morning, in focus.\n\n### First things first\n\n**11:00 · Design review**\nThe team has shared the final round of feedback. You\'re ready to go.\n\n**A reply for Alex**\nFriday\'s launch is on track. A quick confirmation is all they need.\n\n### From your world\n\nYour saved channels shared a few good reads overnight. The best one: a thoughtful piece on making space for creative work.\n\n### Room to breathe\n\nNo meetings after 14:00. Keep a little of that time for yourself.'
      )]),
    );
    for (final screen in <String, Widget>{
      'assistant': const ConversationPreview(),
      'brief': BriefView(brief: brief),
      'watches': const ConversationPreview(watch: true),
    }.entries) {
      final key = GlobalKey();
      await tester.pumpWidget(ProviderScope(
        overrides: [settingsProvider.overrideWith(ScreenshotSettings.new)],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: buildTheme().copyWith(appBarTheme: buildTheme().appBarTheme.copyWith(titleTextStyle: const TextStyle(fontFamily: 'Roboto', fontFamilyFallback: ['ScreenshotEmoji'], fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white))),
          home: RepaintBoundary(key: key, child: Column(children: [
            Container(color: AppColors.bg, padding: const EdgeInsets.fromLTRB(24, 10, 20, 6), child: const Row(children: [Text('9:41', style: TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white, decoration: TextDecoration.none)), Spacer(), Icon(Icons.signal_cellular_alt, color: Colors.white, size: 15), SizedBox(width: 5), Icon(Icons.wifi, color: Colors.white, size: 15), SizedBox(width: 5), Icon(Icons.battery_full, color: Colors.white, size: 15)])),
            Expanded(child: screen.value),
            Container(color: AppColors.bg, height: 16, alignment: Alignment.center, child: Container(width: 105, height: 4, decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(8)))),
          ])),
        ),
      ));
      await tester.pumpAndSettle(const Duration(milliseconds: 100), EnginePhase.sendSemanticsUpdate, const Duration(seconds: 8));
      final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      await tester.runAsync(() async {
        final rendered = await boundary.toImage(pixelRatio: 2);
        final png = await rendered.toByteData(format: ui.ImageByteFormat.png);
        final output = File('site/static/screenshots/${screen.key}.png');
        await output.parent.create(recursive: true);
        await output.writeAsBytes(png!.buffer.asUint8List());
        rendered.dispose();
      });
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
    }
  });
}
