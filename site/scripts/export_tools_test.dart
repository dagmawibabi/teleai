// Writes the website's tool catalogue from the app's real tool list.
// From the Flutter root: flutter test site/scripts/export_tools_test.dart

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';

void main() {
  test('export the tools', () {
    final tools = [
      for (final t in telegramTools)
        {
          'name': t.name,
          'label': t.label,
          'description': t.description,
          'category': t.category.name,
          'categoryLabel': t.category.label,
          'access': t.access.name,
          'approval': t.requiresApproval,
        },
    ];
    File('site/src/lib/data/app-tools.json')
      ..createSync(recursive: true)
      ..writeAsStringSync(const JsonEncoder.withIndent('\t').convert(tools));
  });
}
