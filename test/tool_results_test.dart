import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/chat/presentation/widgets/tool_result_view.dart';
import 'package:teleai/features/integrations/app_results.dart';

Future<void> _show(WidgetTester tester, String name, Map<String, dynamic> json) => tester.pumpWidget(
  ProviderScope(
    child: MaterialApp(
      home: Scaffold(body: SingleChildScrollView(child: ToolResultView(name: name, json: json))),
    ),
  ),
);

void main() {
  testWidgets('saving a GIF says so instead of "Remembered: null"', (tester) async {
    await _show(tester, 'save_gif', {'saved': true, 'gif': true});
    expect(find.textContaining('Remembered'), findsNothing);
    expect(find.text('Saved the GIF to your Telegram GIFs'), findsOneWidget);
  });

  testWidgets('a memory still reads as remembered', (tester) async {
    await _show(tester, 'remember', {'saved': true, 'memory_id': 'm1', 'content': 'Likes tea'});
    expect(find.text('Remembered: Likes tea'), findsOneWidget);
  });

  testWidgets('Canvas folders show their paths and item counts', (tester) async {
    await _show(tester, 'canvas_overview', {
      'folders': [
        {'folder_id': 'f1', 'path': 'Work / Ideas', 'items': 3},
      ],
    });
    expect(find.text('Work / Ideas'), findsOneWidget);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.textContaining('null'), findsNothing);
  });

  testWidgets('fields beside a list stay reachable under More details', (tester) async {
    await _show(tester, 'list_chats', {
      'chats': <Object>[],
      'next_page': 'abc123',
      'total_matching': 40,
    });
    expect(find.text('MORE DETAILS · 1'), findsOneWidget);
    await tester.tap(find.text('MORE DETAILS · 1'));
    await tester.pumpAndSettle();
    expect(find.text('abc123'), findsOneWidget);
  });

  testWidgets('a failed run still shows its output under the error', (tester) async {
    await _show(tester, 'e2b_run_command', {'error': 'The command exited with code 2.', 'stderr': 'boom'});
    expect(find.text('The command exited with code 2.'), findsOneWidget);
    expect(find.textContaining('boom'), findsWidgets);
  });

  test('app results say how many records were left out', () {
    final data = {
      'messages': [
        for (var i = 0; i < 30; i++) {'id': 'm$i', 'subject': 'Hello $i', 'sender': 'a@b.c', 'messageText': 'x'},
      ],
    };
    final out = AppResults.summarize('gmail', 'GMAIL_FETCH_EMAILS', data);
    expect((out['emails'] as List).length, 25);
    expect(out['not_shown'], {'emails': 5});
  });
}
