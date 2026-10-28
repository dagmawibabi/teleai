import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/chat/presentation/widgets/message_view.dart';

void main() {
  test('answers split around tables, not inside code blocks', () {
    final parts = splitTables('Intro\n\n| A | B |\n|---|--:|\n| 1 | 2 |\n| x \\| y | 3 |\n\nAfter\n```\n| no | table |\n|---|---|\n```');
    expect(parts, hasLength(3));
    expect(parts[0].markdown!.trim(), 'Intro');
    expect(parts[1].head, ['A', 'B']);
    expect(parts[1].rows, [
      ['1', '2'],
      ['x | y', '3'],
    ]);
    expect(parts[2].markdown, contains('| no | table |'));
  });

  testWidgets('a wide table scrolls sideways on its own at phone width', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final parts = splitTables(
      '| Name | Price | Rating | Released | Studio | Country | Language | Notes |\n'
      '|---|---|---|---|---|---|---|---|\n'
      '| **Dune** | \$12.50 | 8.4 | 2024 | Legendary Pictures | United States | English | A very long note about sand that keeps going and going and going |\n'
      '| [Arrival](https://example.com) | \$9 | 7.9 | 2016 | Paramount | United States | English | Linguistics |',
    );
    String? opened;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [MarkdownTable(head: parts.single.head!, rows: parts.single.rows!, onLink: (h) => opened = h)],
        ),
      ),
    ));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    final sideways = find.descendant(of: find.byType(MarkdownTable), matching: find.byType(SingleChildScrollView));
    expect(tester.widget<SingleChildScrollView>(sideways).scrollDirection, Axis.horizontal);
    final position = tester.state<ScrollableState>(find.descendant(of: sideways, matching: find.byType(Scrollable))).position;
    expect(position.maxScrollExtent, greaterThan(0));
    await tester.drag(sideways, const Offset(-300, 0));
    await tester.pumpAndSettle();
    expect(position.pixels, greaterThan(0));
    expect(tester.state<ScrollableState>(find.byType(Scrollable).first).position.pixels, 0);
    await tester.drag(sideways, const Offset(600, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('Arrival', findRichText: true));
    expect(opened, 'https://example.com');
  });
}
