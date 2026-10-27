import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/core/widgets/code_highlight.dart';
import 'package:teleai/features/settings/data/settings.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';

void main() {
  test('Cloudflare and E2B tools need their keys and sit on the Apps & web screen', () {
    const none = AppSettings();
    const keyed = AppSettings(cloudflareToken: 't', e2bKey: 'e');
    for (final name in ['e2b_run_code', 'cloudflare_zones', 'r2_list', 'cloudflare_delete_dns_record']) {
      final t = toolNamed(name)!;
      expect(t.category.onAppsScreen, isTrue, reason: name);
      expect(cloudToolReady(t, none), isFalse, reason: name);
      expect(cloudToolReady(t, keyed), isTrue, reason: name);
    }
    expect(cloudToolNeeds(toolNamed('r2_list')!, keyed), 'Needs an R2 access key');
    expect(toolNamed('cloudflare_delete_dns_record')!.destructive, isTrue);
    expect(toolNamed('r2_delete')!.destructive, isTrue);
    expect(toolNamed('cloudflare_create_dns_record')!.requiresApproval, isTrue);
    expect(toolNamed('cloudflare_create_dns_record')!.destructive, isFalse);
    expect(toolNamed('e2b_run_code')!.requiresApproval, isFalse);
  });

  test('code highlighting colours keywords, strings, comments and calls', () {
    final p = CodePalette.of(CodeThemeChoice.midnight);
    final spans = highlightCode('def f(x):\n    return "hi"  # done\nprint(f(1))', 'python', p);
    Color? colorOf(String text) => spans.firstWhere((s) => s.text == text).style?.color;
    expect(colorOf('def'), p.keyword);
    expect(colorOf('"hi"'), p.string);
    expect(colorOf('# done'), p.comment);
    expect(colorOf('print'), p.function);
    expect(colorOf('1'), p.number);
    expect(spans.map((s) => s.text).join(), 'def f(x):\n    return "hi"  # done\nprint(f(1))');
  });
}
