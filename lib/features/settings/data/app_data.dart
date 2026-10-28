import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ai/data/ai.dart';
import '../../ai/data/decision_settings.dart';
import '../../assistant/memory.dart';
import '../../assistant/online_alerts.dart';
import '../../assistant/reminders.dart';
import '../../assistant/watches.dart';
import '../../brief/brief_prefs.dart';
import '../../brief/brief_store.dart';
import '../../brief/brief_widget.dart';
import '../../brief/home_widgets.dart';
import '../../canvas/canvas_store.dart';
import '../../chat/data/chat_controller.dart';
import '../../integrations/integrations_store.dart';
import '../../usage/usage.dart';
import 'settings.dart';

/// What the app keeps on this phone, besides Telegram's own database: one
/// place to back it up, bring it back and wipe it.
abstract final class AppData {
  static const format = 'triangle-profile';
  /// 2 added MCP servers without their headers, for exports without keys.
  static const version = 2;

  /// Where omni_ai keeps installed MCP servers (secure storage, with their
  /// headers), and the plain copy a keyless profile restores into.
  static const _mcpKey = 'omni_ai.mcp.servers';

  /// Telegram's database key never leaves the phone: with it, a copy of the
  /// session could be opened elsewhere.
  static const _neverExported = {'tdlib_database_key'};

  /// Files under the app's folder that belong in a profile.
  static const _profileFiles = ['content_canvas.json', 'usage.json'];

  /// Folders of things the assistant made, saved or downloaded.
  static const _dataFolders = [
    'conversations',
    'generated',
    'attachments',
    'viewed_images',
    'voice_notes',
    'screenshots',
    'downloads',
    'exports',
    'mail',
    'sandbox',
    'briefs',
    'widgets',
  ];

  static Future<String> _root() async => (await getApplicationSupportDirectory()).path;

  /// Everything needed to carry on after reinstalling: settings (appearance,
  /// decisions, home-screen widgets and their look), memories, instructions,
  /// watches and the check-in, reminders, brief settings, installed skills,
  /// the Content Canvas, usage, MCP servers, and (when [keys]) API keys, bot
  /// tokens and MCP headers. [chats] adds the AI conversations. Widget
  /// pictures aren't copied: they're fetched again from their links.
  static Future<Map<String, dynamic>> export({bool keys = true, bool chats = false}) async {
    final prefs = await SharedPreferences.getInstance();
    final root = await _root();
    final files = <String, String>{};
    for (final name in _profileFiles) {
      final f = File('$root/$name');
      if (await f.exists()) files[name] = await f.readAsString();
    }
    if (chats) {
      final dir = Directory('$root/conversations');
      if (await dir.exists()) {
        await for (final e in dir.list()) {
          if (e is File && e.path.endsWith('.json')) {
            files['conversations/${e.uri.pathSegments.last}'] = await e.readAsString();
          }
        }
      }
    }
    final secrets = await const FlutterSecureStorage().readAll();
    return {
      'format': format,
      'version': version,
      'exported_at': DateTime.now().toIso8601String(),
      // Without keys, MCP servers still come along, minus their headers.
      if (!keys) 'mcp_servers': _withoutHeaders(secrets),
      'prefs': {
        for (final k in prefs.getKeys())
          if (prefs.get(k) case final v?) k: v,
      },
      if (keys)
        'secrets': {
          for (final e in secrets.entries)
            if (!_neverExported.contains(e.key)) e.key: e.value,
        },
      'files': files,
    };
  }

  static List<Object?> _withoutHeaders(Map<String, String> secrets) {
    final raw = secrets.entries.where((e) => e.key.endsWith(_mcpKey)).firstOrNull?.value;
    if (raw == null) return const [];
    try {
      return [
        for (final s in jsonDecode(raw) as List)
          if (s is Map) {...s, 'headers': const {}, 'env': const {}},
      ];
    } catch (_) {
      return const [];
    }
  }

  static int _count(Map prefs, String key) {
    try {
      return (jsonDecode('${prefs[key] ?? '[]'}') as List).length;
    } catch (_) {
      return 0;
    }
  }

  /// Short counts of what [profile] holds, to show before restoring it.
  static Map<String, int> describe(Map<String, dynamic> profile) {
    final files = (profile['files'] as Map?) ?? const {};
    final prefs = (profile['prefs'] as Map?) ?? const {};
    final secrets = (profile['secrets'] as Map?) ?? const {};
    final mcp = secrets.entries.where((e) => '${e.key}'.endsWith(_mcpKey)).firstOrNull?.value;
    return {
      'settings': prefs.length,
      'keys': secrets.length,
      'chats': files.keys.where((k) => '$k'.startsWith('conversations/')).length,
      'watches': _count(prefs, 'watches.v1'),
      'widgets': _count(prefs, 'home_widgets.v1'),
      'skills': _count(prefs, 'omni_ai.skills'),
      'mcp': mcp != null ? _count({'m': mcp}, 'm') : ((profile['mcp_servers'] as List?) ?? const []).length,
    };
  }

  /// Writes [profile] back: its settings over the current ones, its keys
  /// and files. Then [ref]'s stores reload from it.
  static Future<void> restore(Ref ref, Map<String, dynamic> profile) async {
    if (profile['format'] != format) throw const FormatException('This is not a Triangle profile.');
    final prefs = await SharedPreferences.getInstance();
    for (final e in ((profile['prefs'] as Map?) ?? const {}).entries) {
      final k = '${e.key}', v = e.value;
      switch (v) {
        case bool():
          await prefs.setBool(k, v);
        case int():
          await prefs.setInt(k, v);
        case double():
          await prefs.setDouble(k, v);
        case String():
          await prefs.setString(k, v);
        case List():
          await prefs.setStringList(k, [for (final x in v) '$x']);
      }
    }
    const secure = FlutterSecureStorage();
    final secrets = (profile['secrets'] as Map?) ?? const {};
    for (final e in secrets.entries) {
      if (!_neverExported.contains(e.key)) await secure.write(key: '${e.key}', value: '${e.value}');
    }
    // A keyless profile's MCP servers: added without headers, unless this
    // phone already has servers (which keep theirs).
    final servers = profile['mcp_servers'];
    if (servers is List && servers.isNotEmpty && !secrets.keys.any((k) => '$k'.endsWith(_mcpKey))) {
      final here = (await secure.readAll()).entries.where((e) => e.key.endsWith(_mcpKey)).firstOrNull?.value;
      if (here == null || here == '[]') await prefs.setString(_mcpKey, jsonEncode(servers));
    }
    final root = await _root();
    for (final e in ((profile['files'] as Map?) ?? const {}).entries) {
      final name = '${e.key}';
      // Only the files a profile writes, never a path outside the app.
      if (name.contains('..') || !(name.startsWith('conversations/') || _profileFiles.contains(name))) continue;
      final f = File('$root/$name');
      await f.parent.create(recursive: true);
      await f.writeAsString('${e.value}');
    }
    _reload(ref);
    // The restored widgets' rows (and pictures) go back to the home screen.
    await ref.read(homeWidgetsProvider.notifier).publishAll();
    await BriefHomeWidget.publish(ref.read(briefStoreProvider).briefs);
  }

  /// Deletes the assistant's data on this phone: AI chats, memories, files
  /// it made or downloaded, briefs, the Content Canvas, watches, reminders,
  /// alerts and usage. With [settings], preferences and API keys go too.
  /// Telegram stays signed in.
  static Future<void> clearAll(Ref ref, {bool settings = false}) async {
    await ref.read(chatControllerProvider.notifier).deleteAll();
    await ref.read(aiProvider).memory.clear();
    await ref.read(canvasProvider.notifier).clear();
    await ref.read(briefStoreProvider.notifier).deleteAll();
    final root = await _root();
    for (final name in _dataFolders) {
      final d = Directory('$root/$name');
      if (await d.exists()) await d.delete(recursive: true);
    }
    for (final name in _profileFiles) {
      final f = File('$root/$name');
      if (await f.exists()) await f.delete();
    }
    final prefs = await SharedPreferences.getInstance();
    for (final k in const [
      'watches.v1',
      'reminders.v1',
      'online_alerts.v1',
      'e2b_history.v1',
      'e2b_editor_draft',
      'home_widgets.v1',
      HomeWidgetStore.bindingsKey,
      HomeWidgetStore.defaultKey,
    ]) {
      await prefs.remove(k);
    }
    for (final k in prefs.getKeys().where((k) => k.startsWith('widget_payload.') && k != 'widget_payload.brief').toList()) {
      await prefs.remove(k);
    }
    if (settings) {
      // Keep only whether Telegram was skipped, so the app opens where it was.
      final skipped = prefs.getBool('telegram_skipped');
      await prefs.clear();
      if (skipped != null) await prefs.setBool('telegram_skipped', skipped);
      const secure = FlutterSecureStorage();
      for (final k in (await secure.readAll()).keys) {
        if (!_neverExported.contains(k)) await secure.delete(key: k);
      }
    }
    _reload(ref);
  }

  static void _reload(Ref ref) {
    ref
      ..invalidate(settingsProvider)
      ..invalidate(decisionSettingsProvider)
      ..invalidate(aiProvider)
      ..invalidate(memoryProvider)
      ..invalidate(watchStoreProvider)
      ..invalidate(reminderStoreProvider)
      ..invalidate(onlineAlertStoreProvider)
      ..invalidate(briefPrefsProvider)
      ..invalidate(canvasProvider)
      ..invalidate(usageProvider)
      ..invalidate(homeWidgetsProvider)
      ..invalidate(widgetLookProvider)
      ..invalidate(integrationsProvider);
  }

  /// [profile] as a pretty JSON file's bytes.
  static List<int> encode(Map<String, dynamic> profile) =>
      utf8.encode(const JsonEncoder.withIndent('  ').convert(profile));
}

/// [AppData]'s actions with the app's providers at hand.
final appDataProvider = Provider<AppDataActions>(AppDataActions.new);

class AppDataActions {
  AppDataActions(this._ref);
  final Ref _ref;

  Future<void> restore(Map<String, dynamic> profile) => AppData.restore(_ref, profile);
  Future<void> clearAll({bool settings = false}) => AppData.clearAll(_ref, settings: settings);
}
