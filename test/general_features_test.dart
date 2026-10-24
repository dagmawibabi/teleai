import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/assistant/watches.dart';
import 'package:teleai/features/brief/brief_widget.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';

void main() {
  test('app watches survive a save and load, and need no Telegram', () {
    final w = Watch(
      id: 'w1',
      name: 'Boss emails',
      scope: WatchScope.app,
      mode: WatchMode.summarize,
      app: 'gmail',
      query: 'emails from my manager',
      everyMinutes: 30,
      createdAt: DateTime(2026, 10, 24),
    );
    final back = Watch.fromJson(w.toJson());
    expect(back.scope, WatchScope.app);
    expect(back.app, 'gmail');
    expect(back.query, 'emails from my manager');
    expect(back.everyMinutes, 30);
    expect(WatchScope.app.needsTelegram, isFalse);
    expect(WatchScope.schedule.needsTelegram, isFalse);
    expect(WatchScope.allDms.needsTelegram, isTrue);
  });

  test('without Telegram only its own tools drop out', () {
    expect(toolNamed('read_messages')!.category.needsTelegram, isTrue);
    expect(toolNamed('send_message')!.category.needsTelegram, isTrue);
    for (final name in ['remember', 'create_reminder', 'canvas_save', 'gmail_fetch_emails', 'e2b_run_code', 'device_info', 'web_search']) {
      expect(toolNamed(name)!.category.needsTelegram, isFalse, reason: name);
    }
  });

  test('the home-screen widget can show just the TL;DR or what needs you', () {
    const brief = '**TL;DR**: Two people wait on you; the meeting moved to 10:00.\n\n'
        '**🔴 Needs you now**\n- Liya wants the budget by tonight.\n\n'
        '**🟠 Important**\n- The launch slipped a week.';
    final tldr = BriefHomeWidget.forWidget(brief, WidgetContent.tldr);
    expect(tldr, contains('Two people wait on you'));
    expect(tldr, isNot(contains('Liya')));
    final needs = BriefHomeWidget.forWidget(brief, WidgetContent.needs);
    expect(needs, contains('Liya'));
    expect(needs, isNot(contains('launch slipped')));
    expect(BriefHomeWidget.forWidget(brief), contains('launch slipped'));
  });
}
