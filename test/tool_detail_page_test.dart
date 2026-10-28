import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teleai/features/settings/presentation/tools_screen.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';
import 'package:teleai/infrastructure/telegram/telegram_client.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  // Phone width, where long names, enums and nested inputs are most likely
  // to overflow.
  testWidgets('every tool detail page lays out at phone width', (tester) async {
    tester.view.physicalSize = const Size(360, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    for (final tool in telegramTools) {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [authStateProvider.overrideWith((ref) => const Stream.empty())],
          child: MaterialApp(home: ToolDetailScreen(tool: tool)),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull, reason: tool.name);
      expect(find.text(tool.name), findsWidgets, reason: tool.name);
    }
  });
}
