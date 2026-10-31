// Writes the website's list of PC tools from the companion's real tools.
// From companion/: flutter test ../site/scripts/export_companion_tools_test.dart

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:triangle_companion/app/controller.dart';

void main() {
  test('export the tools', () {
    final tools = [
      for (final t in CompanionController.tools)
        {
          'name': t.name,
          'label': t.title,
          'description': t.description,
          'category': t.feature.name,
          'categoryLabel': t.feature.label,
          'access': t.access.name,
          'approval': t.access.name != 'read',
        },
    ];
    File('../site/src/lib/data/pc-tools.json')
      ..createSync(recursive: true)
      ..writeAsStringSync(const JsonEncoder.withIndent('\t').convert(tools));
  });
}
