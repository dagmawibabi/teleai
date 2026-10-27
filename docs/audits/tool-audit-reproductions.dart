// Audit evidence: these tests intentionally assert the defects observed on 2026-10-28.
// Run: flutter test --no-pub docs/audits/tool-audit-reproductions.dart
// Reverse the expectations when converting these examples into regression tests.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/chat/presentation/widgets/tool_result_view.dart';
import 'package:teleai/features/integrations/app_results.dart';
void main() {
  testWidgets('reproduce non-memory saves shown as Remembered null', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ToolResultView(name:'save_gif',json:{'saved':true,'gif':true}))));
    expect(find.text('Remembered: null'), findsOneWidget);
  });
  testWidgets('reproduce successful DNS result hidden by done branch', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ToolResultView(name:'cloudflare_update_dns_record',json:{'done':true,'zone':'example.test','dns_records':[{'type':'A','name':'example.test','content':'192.0.2.10'}]}))));
    expect(find.text('Done'), findsOneWidget);
    expect(find.textContaining('192.0.2.10'), findsNothing);
  });
  testWidgets('reproduce scalar pagination hidden beside rendered collections', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ToolResultView(name:'r2_list',json:{'count':1,'cursor':'next-sentinel','truncated':true,'objects':[{'key':'one'}]}))));
    expect(find.textContaining('next-sentinel'), findsNothing);
  });
  testWidgets('reproduce canvas folders rendered as Telegram folders', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ToolResultView(name:'canvas_overview',json:{'folders':[{'folder_id':'f1','path':'Work/Reports','items':3}]}))));
    expect(find.text('null'), findsOneWidget);
    expect(find.textContaining('Work/Reports'), findsNothing);
  });
  test('reproduce loss of returned records and Linear pagination metadata', () {
    final source={'issues':[for(var i=0;i<30;i++){'id':'$i','identifier':'TEAM-$i','title':'Issue $i','url':'https://linear.app/team/issue/$i','state':{'name':'Todo'},'description':'Long issue description repeated to make the response large. '*4}],'page_info':{'has_next_page':true,'end_cursor':'next-sentinel'}};
    final result=AppResults.summarize('linear','LINEAR_LIST_LINEAR_ISSUES',source);
    expect((result['issues'] as List).length,25);
    expect(result.containsKey('data'),false);
    expect(result.containsKey('truncated'),false);
    expect(result.containsKey('next_page'),false);
  });
}
