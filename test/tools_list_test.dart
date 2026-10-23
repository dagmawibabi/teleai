import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';

void main() {
  test('every defined tool is in the list the Tools page shows', () {
    final listed = {for (final t in telegramTools) t.name};
    final defined = <String>{};
    for (final f in Directory('lib/features/telegram/data').listSync().whereType<File>()) {
      if (!f.path.contains('telegram_')) continue;
      final src = f.readAsStringSync();
      for (final m in RegExp(r"TelegramTool\(\s*name: '([a-z_0-9]+)'").allMatches(src)) {
        defined.add(m[1]!);
      }
    }
    expect(defined.difference(listed), isEmpty);
    expect(defined.length, greaterThan(100));
  });
}
