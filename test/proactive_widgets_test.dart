import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teleai/app/theme.dart';
import 'package:teleai/features/assistant/watches.dart';
import 'package:teleai/features/brief/home_widgets.dart';
import 'package:teleai/features/brief/widget_customizer_screen.dart';
import 'package:teleai/features/settings/data/app_data.dart';
import 'package:teleai/features/telegram/data/telegram_tools.dart';
import 'package:teleai/features/usage/usage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('check-in', () {
    test('is always there, can be turned off and changed, never deleted', () async {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      final store = c.read(watchStoreProvider.notifier);
      await store.ready;
      final w = store.byId(checkInWatchId)!;
      expect(w.builtIn, isTrue);
      expect(w.enabled, isTrue);
      expect(w.everyMinutes, 360);
      expect(w.quietAtNight, isTrue);
      expect(await store.remove(checkInWatchId), isFalse);
      await store.update(checkInWatchId, (x) => x.copyWith(enabled: false, everyMinutes: 120));
      final saved = jsonDecode((await SharedPreferences.getInstance()).getString('watches.v1')!) as List;
      final again = Watch.fromJson(Map<String, dynamic>.from(saved.single as Map));
      expect(again.enabled, isFalse);
      expect(again.everyMinutes, 120);
      expect(again.builtIn, isTrue);
    });

    test('comes back if the saved list lost it, and a deleted watch stays deleted', () async {
      final old = Watch(
        id: 'abc',
        name: 'DMs',
        scope: WatchScope.allDms,
        mode: WatchMode.notify,
        createdAt: DateTime(2026),
      );
      SharedPreferences.setMockInitialValues({'watches.v1': jsonEncode([old.toJson()])});
      final c = ProviderContainer();
      addTearDown(c.dispose);
      final store = c.read(watchStoreProvider.notifier);
      // Before the saved list has loaded: the delete waits for it instead
      // of being undone by it.
      final removed = store.remove('abc');
      expect(await removed, isTrue);
      expect(c.read(watchStoreProvider).map((w) => w.id), [checkInWatchId]);
    });

    test('quiet hours are 22:00 to 08:00', () {
      expect(Watch.isNight(DateTime(2026, 1, 1, 23)), isTrue);
      expect(Watch.isNight(DateTime(2026, 1, 1, 7, 59)), isTrue);
      expect(Watch.isNight(DateTime(2026, 1, 1, 8)), isFalse);
      expect(Watch.isNight(DateTime(2026, 1, 1, 21, 59)), isFalse);
    });
  });

  group('usage', () {
    test('records decisions with their tokens and MCP and skill calls by subject', () {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      final usage = c.read(usageProvider.notifier);
      usage.recordCapability(
        tool: 'jev_batch',
        input: const {},
        output: const {
          'model': 'jev-latest',
          'count': 10,
          'usage': {'input_tokens': 450},
        },
        ms: 1200,
      );
      usage.recordCapability(tool: 'mcp_call_tool', input: const {'server': 'scholarxiv'}, output: const {'result': 1}, ms: 300);
      usage.recordCapability(tool: 'load_skill', input: const {'name': 'pdf'}, output: const {'error': 'nope'}, ms: 5);
      usage.recordCapability(tool: 'jev_models', input: const {}, output: const {}, ms: 5);
      final events = c.read(usageProvider);
      expect(events, hasLength(3));
      expect(events[0].modality, Modality.decision);
      expect(events[0].units, 10);
      expect(events[0].input, 450);
      expect(events[1].modality, Modality.mcp);
      expect(events[1].model, 'scholarxiv');
      expect(events[2].modality, Modality.skill);
      expect(events[2].ok, isFalse);
      final round = UsageEvent.fromJson(events[1].toJson());
      expect(round.tool, 'mcp_call_tool');
      expect(round.ms, 300);
    });
  });

  group('widgets', () {
    test('a widget the assistant keeps up to date gets a quiet refresh watch, removed with it', () async {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      final widgets = c.read(homeWidgetsProvider.notifier);
      final d = await widgets.create(title: 'Movies', prompt: 'New movies with posters', everyHours: 12);
      expect(d.watchId, isNotNull);
      final watch = c.read(watchStoreProvider.notifier).byId(d.watchId!)!;
      expect(watch.everyMinutes, 720);
      expect(watch.notify, isFalse);
      expect(watch.instructions, contains('update_widget with widget_id ${d.id}'));
      await widgets.edit(d.id, everyHours: 3);
      expect(c.read(watchStoreProvider.notifier).byId(d.watchId!)!.everyMinutes, 180);
      expect(await widgets.remove(briefWidgetId), isFalse);
      expect(await widgets.remove(d.id), isTrue);
      expect(c.read(watchStoreProvider.notifier).byId(d.watchId!), isNull);
    });

    test('each refresh lands in its history; pictures and links are per widget', () async {
      final c = ProviderContainer();
      addTearDown(c.dispose);
      final widgets = c.read(homeWidgetsProvider.notifier);
      final d = await widgets.create(title: 'Subs', prompt: 'My subscriber count', everyHours: 6);
      final quiet = DateTime.now();
      await widgets.recordRun(d.watchId!, started: quiet, result: 'I could not find the channel.');
      // Let the refresh that creating it started finish too (it first waits
      // for settings to load).
      for (var i = 0; i < 120 && !widgets.byId(d.id)!.runs.any((r) => r.note.contains('No AI key')); i++) {
        await Future<void>.delayed(const Duration(milliseconds: 100));
      }
      var now = widgets.byId(d.id)!;
      expect(now.runs.where((r) => r.note == 'I could not find the channel.' && !r.ok), hasLength(1));
      // Made → refreshed at once (here without an AI key, so it failed).
      expect(now.runs.where((r) => r.note.contains('No AI key')), hasLength(1));
      await widgets.setOptions(d.id, showImages: false, openLinks: false);
      now = widgets.byId(d.id)!;
      expect(HomeWidgetStore.payloadOf(now)['images'], isFalse);
      expect(HomeWidgetStore.payloadOf(now)['links'], isFalse);
      final round = HomeWidgetDef.fromJson(now.toJson());
      expect(round.showImages, isFalse);
      expect(round.openLinks, isFalse);
      expect(round.runs, hasLength(2));
    });

    test('rows read from text and back', () {
      final rows = parseWidgetText('Dune:\nSand and worms\nhttps://example.com/dune.jpg\n\nhttps://example.com/news\nBread');
      expect(rows, hasLength(2));
      expect(rows[0].title, 'Dune');
      expect(rows[0].text, 'Sand and worms');
      expect(rows[0].imageUrl, 'https://example.com/dune.jpg');
      expect(rows[1].link, 'https://example.com/news');
      expect(rows[1].text, 'Bread');
      expect(parseWidgetText(widgetText(rows)).map((r) => r.toJson()), rows.map((r) => r.toJson()));
    });

    test('a picture from the gallery survives editing the rows as text', () {
      const rows = [WidgetItem(text: 'Our trip', imagePath: '/data/widgets/w1/pick.1.jpg')];
      final again = parseWidgetText(widgetText(rows));
      // The host's own path spelling (the phone keeps forward slashes).
      expect(again.single.imagePath, Uri.file('/data/widgets/w1/pick.1.jpg').toFilePath());
      expect(again.single.text, 'Our trip');
      expect(again.single.imageUrl, isNull);
    });

    test('the launcher payload is compact', () {
      final d = HomeWidgetDef(
        id: 'w1',
        title: 'News',
        items: const [WidgetItem(title: 'A', text: 'B', imagePath: '/x.jpg', link: 'https://e.com')],
        createdAt: DateTime(2026),
      );
      expect(HomeWidgetStore.payloadOf(d)['items'], [
        {'t': 'A', 'x': 'B', 'img': '/x.jpg', 'link': 'https://e.com'},
      ]);
    });

    test('widget tools are app tools', () {
      for (final name in ['create_widget', 'update_widget', 'list_widgets', 'delete_widget']) {
        expect(telegramTools.any((t) => t.name == name), isTrue, reason: name);
        expect(toolPolicies[name], isNotNull, reason: name);
        expect(toolReferences[name], isNotNull, reason: name);
      }
    });
  });

  test('a profile says what it holds, MCP servers included', () {
    final counts = AppData.describe({
      'prefs': {
        'watches.v1': jsonEncode([{}, {}]),
        'home_widgets.v1': jsonEncode([{}]),
        'omni_ai.skills': jsonEncode([{}, {}, {}]),
      },
      'mcp_servers': [
        {'id': 'scholarxiv'},
      ],
    });
    expect(counts['watches'], 2);
    expect(counts['widgets'], 1);
    expect(counts['skills'], 3);
    expect(counts['mcp'], 1);
  });

  test('leading icons can be turned off', () {
    addTearDown(() => AppLook.leadingIcons = true);
    const icon = Icon(Icons.star);
    expect(lead(icon), icon);
    AppLook.leadingIcons = false;
    expect(lead(icon), isNull);
  });
}
