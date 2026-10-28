import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../assistant/watch_engine.dart';
import '../assistant/watches.dart';

/// One row of a home-screen widget: a line of text, optionally with a
/// title, a small subtitle, a picture and a link to open.
@immutable
class WidgetItem {
  const WidgetItem({this.title = '', this.text = '', this.subtitle = '', this.imageUrl, this.imagePath, this.link});

  final String title;
  final String text;
  final String subtitle;

  /// Where the picture came from, and the copy on this phone the widget
  /// draws (launchers can't load from the web).
  final String? imageUrl;
  final String? imagePath;
  final String? link;

  bool get isEmpty => title.isEmpty && text.isEmpty && imagePath == null;

  WidgetItem withImage(String? path) =>
      WidgetItem(title: title, text: text, subtitle: subtitle, imageUrl: imageUrl, imagePath: path, link: link);

  Map<String, dynamic> toJson() => {
    if (title.isNotEmpty) 'title': title,
    if (text.isNotEmpty) 'text': text,
    if (subtitle.isNotEmpty) 'subtitle': subtitle,
    'image_url': ?imageUrl,
    'image_path': ?imagePath,
    'link': ?link,
  };

  factory WidgetItem.fromJson(Map j) => WidgetItem(
    title: '${j['title'] ?? ''}'.trim(),
    text: '${j['text'] ?? ''}'.trim(),
    subtitle: '${j['subtitle'] ?? ''}'.trim(),
    imageUrl: (j['image_url'] as String?)?.trim().isEmpty ?? true ? null : (j['image_url'] as String).trim(),
    imagePath: j['image_path'] as String?,
    link: (j['link'] as String?)?.trim().isEmpty ?? true ? null : (j['link'] as String).trim(),
  );

  /// What the launcher's list reads (BriefWidget.kt).
  Map<String, dynamic> payload() => {
    if (title.isNotEmpty) 't': title,
    if (text.isNotEmpty) 'x': text,
    if (subtitle.isNotEmpty) 's': subtitle,
    'img': ?imagePath,
    'link': ?link,
  };
}

/// One refresh of a widget: when, whether it updated, and what happened.
@immutable
class WidgetRun {
  const WidgetRun({required this.at, required this.ok, this.rows = 0, this.note = ''});
  final DateTime at;
  final bool ok;
  final int rows;
  final String note;

  Map<String, dynamic> toJson() => {'at': at.toIso8601String(), 'ok': ok, if (rows > 0) 'rows': rows, if (note.isNotEmpty) 'note': note};

  factory WidgetRun.fromJson(Map j) => WidgetRun(
    at: DateTime.tryParse('${j['at']}') ?? DateTime.now(),
    ok: j['ok'] == true,
    rows: (j['rows'] as num?)?.toInt() ?? 0,
    note: '${j['note'] ?? ''}',
  );
}

/// A home-screen widget's content: the brief, or something custom — text
/// the person wrote, or rows the assistant refreshes on a schedule
/// ("YouTube subscribers", "latest news", "new movies with posters").
@immutable
class HomeWidgetDef {
  const HomeWidgetDef({
    required this.id,
    required this.title,
    this.items = const [],
    this.prompt = '',
    this.everyHours,
    this.watchId,
    this.updatedAt,
    required this.createdAt,
    this.showImages = true,
    this.linkPreviews = true,
    this.openLinks = true,
    this.runs = const [],
  });

  final String id;
  final String title;
  final List<WidgetItem> items;

  /// Pictures in its rows.
  final bool showImages;

  /// Rows with a link get its page's title, summary and picture.
  final bool linkPreviews;

  /// Tapping a row with a link opens it (otherwise it opens Triangle).
  final bool openLinks;

  /// Its latest refreshes, newest first.
  final List<WidgetRun> runs;

  /// What the assistant should show, for widgets it keeps up to date.
  final String prompt;

  /// How often the assistant refreshes it; null when it is static.
  final int? everyHours;

  /// The scheduled watch that refreshes it.
  final String? watchId;
  final DateTime? updatedAt;
  final DateTime createdAt;

  bool get isBrief => id == briefWidgetId;
  bool get byAssistant => prompt.isNotEmpty;

  HomeWidgetDef copyWith({
    String? title,
    List<WidgetItem>? items,
    String? prompt,
    int? everyHours,
    bool clearEvery = false,
    String? watchId,
    bool clearWatch = false,
    DateTime? updatedAt,
    bool? showImages,
    bool? linkPreviews,
    bool? openLinks,
    List<WidgetRun>? runs,
  }) => HomeWidgetDef(
    id: id,
    title: title ?? this.title,
    items: items ?? this.items,
    prompt: prompt ?? this.prompt,
    everyHours: clearEvery ? null : everyHours ?? this.everyHours,
    watchId: clearWatch ? null : watchId ?? this.watchId,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt,
    showImages: showImages ?? this.showImages,
    linkPreviews: linkPreviews ?? this.linkPreviews,
    openLinks: openLinks ?? this.openLinks,
    runs: runs ?? this.runs,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'items': [for (final i in items) i.toJson()],
    if (prompt.isNotEmpty) 'prompt': prompt,
    'every_hours': ?everyHours,
    'watch_id': ?watchId,
    'updated': ?updatedAt?.toIso8601String(),
    'created': createdAt.toIso8601String(),
    if (!showImages) 'show_images': false,
    if (!linkPreviews) 'link_previews': false,
    if (!openLinks) 'open_links': false,
    if (runs.isNotEmpty) 'runs': [for (final r in runs) r.toJson()],
  };

  factory HomeWidgetDef.fromJson(Map j) => HomeWidgetDef(
    id: '${j['id']}',
    title: '${j['title'] ?? 'Widget'}',
    items: [for (final i in (j['items'] as List? ?? const [])) if (i is Map) WidgetItem.fromJson(i)],
    prompt: '${j['prompt'] ?? ''}',
    everyHours: (j['every_hours'] as num?)?.toInt(),
    watchId: j['watch_id'] as String?,
    updatedAt: DateTime.tryParse('${j['updated'] ?? ''}'),
    createdAt: DateTime.tryParse('${j['created'] ?? ''}') ?? DateTime.now(),
    showImages: j['show_images'] != false,
    linkPreviews: j['link_previews'] != false,
    openLinks: j['open_links'] != false,
    runs: [for (final r in (j['runs'] as List? ?? const [])) if (r is Map) WidgetRun.fromJson(r)],
  );

  /// For the assistant's tools.
  Map<String, dynamic> describe() => {
    'widget_id': id,
    'title': title,
    if (isBrief) 'kind': 'the brief (built in)' else 'kind': byAssistant ? 'refreshed by the assistant' : 'static text',
    if (prompt.isNotEmpty) 'shows': prompt,
    'every_hours': ?everyHours,
    'items': items.length,
    if (updatedAt != null) 'updated': updatedAt!.toIso8601String().substring(0, 16),
    if (!showImages) 'pictures': 'off',
    if (!linkPreviews) 'link_previews': 'off',
    if (runs.isNotEmpty) 'last_run': '${runs.first.at.toIso8601String().substring(0, 16)} ${runs.first.ok ? 'updated' : 'did not update'}',
  };
}

/// The built-in widget that shows the latest brief.
const briefWidgetId = 'brief';

/// Most rows a widget keeps.
const maxWidgetItems = 20;

/// Widgets the person or the assistant made, plus the brief, and which one
/// each widget on the home screen shows.
class HomeWidgetStore extends Notifier<List<HomeWidgetDef>> {
  static const _key = 'home_widgets.v1';

  /// Home-screen widget id → widget shown, read by BriefWidget.kt.
  static const bindingsKey = 'widget_bindings';

  /// What a newly added home-screen widget shows.
  static const defaultKey = 'widget_default';
  static const _uuid = Uuid();
  static const _channel = MethodChannel('teleai/brief_widget');

  late Future<void> ready;

  @override
  List<HomeWidgetDef> build() {
    ready = _load();
    return [HomeWidgetDef(id: briefWidgetId, title: 'Brief', createdAt: DateTime(2024))];
  }

  Future<void> _load() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(_key);
      if (raw == null) return;
      final saved = [for (final j in jsonDecode(raw) as List) if (j is Map) HomeWidgetDef.fromJson(j)];
      state = [state.first, ...saved.where((d) => !d.isBrief)];
    } catch (e) {
      debugPrint('[Widgets] $e');
    }
  }

  Future<void> _save() async => (await SharedPreferences.getInstance()).setString(
    _key,
    jsonEncode([for (final d in state) if (!d.isBrief) d.toJson()]),
  );

  HomeWidgetDef? byId(String id) => state.where((d) => d.id == id).firstOrNull;

  /// A new widget. With [prompt], the assistant keeps it up to date every
  /// [everyHours] through a scheduled watch.
  Future<HomeWidgetDef> create({
    required String title,
    List<WidgetItem> items = const [],
    String prompt = '',
    int? everyHours,
  }) async {
    await ready;
    var d = HomeWidgetDef(
      id: 'w${_uuid.v4().substring(0, 6)}',
      title: title.trim().isEmpty ? 'Widget' : title.trim(),
      prompt: prompt.trim(),
      everyHours: prompt.trim().isEmpty ? null : (everyHours ?? 6).clamp(1, 168),
      createdAt: DateTime.now(),
    );
    state = [...state, d];
    if (d.byAssistant) d = (await _syncWatch(d))!;
    if (items.isNotEmpty) d = (await setItems(d.id, items, note: 'Created with ${items.length} rows'))!;
    await _save();
    await publish(d);
    // Filled in now, not at the first scheduled refresh; the schedule
    // counts from here.
    if (d.byAssistant) refreshNow(d.id);
    return d;
  }

  /// Changes a widget's title, what it shows or how often it refreshes.
  Future<HomeWidgetDef?> edit(String id, {String? title, String? prompt, int? everyHours}) async {
    await ready;
    final old = byId(id);
    if (old == null || old.isBrief) return null;
    var d = old.copyWith(
      title: title?.trim().isEmpty ?? true ? null : title!.trim(),
      prompt: prompt?.trim(),
      everyHours: everyHours?.clamp(1, 168),
    );
    if (d.prompt.isEmpty) d = d.copyWith(clearEvery: true);
    _put(d);
    d = (await _syncWatch(d)) ?? d;
    await _save();
    await publish(d);
    return d;
  }

  /// Runs [id]'s refresh now (an assistant-kept widget).
  void refreshNow(String id) {
    final d = byId(id);
    final watch = d?.watchId == null ? null : ref.read(watchStoreProvider.notifier).byId(d!.watchId!);
    if (watch != null) unawaited(ref.read(watchEngineProvider).runNow(watch));
  }

  /// A refresh of the widget [watchId] keeps ended: it counts as updated
  /// when the widget changed after [started]. [result] is what the
  /// assistant said, for the history.
  Future<void> recordRun(String watchId, {required DateTime started, String result = '', bool failed = false}) async {
    await ready;
    final d = state.where((x) => x.watchId == watchId).firstOrNull;
    if (d == null) return;
    final ok = !failed && d.updatedAt != null && !d.updatedAt!.isBefore(started);
    final said = result.replaceAll(RegExp(r'\s+'), ' ').trim();
    final note = ok
        ? 'Updated ${d.items.length} row${d.items.length == 1 ? '' : 's'}'
        : said.isEmpty
        ? 'Ran without updating the widget'
        : (said.length > 200 ? '${said.substring(0, 200)}…' : said);
    _addRun(d.id, WidgetRun(at: started, ok: ok, rows: ok ? d.items.length : 0, note: note));
    await _save();
  }

  void _addRun(String id, WidgetRun run) {
    final d = byId(id);
    if (d == null) return;
    _put(d.copyWith(runs: [run, ...d.runs].take(20).toList()));
  }

  /// Turns a widget's pictures, link previews or tappable links on or off.
  Future<void> setOptions(String id, {bool? showImages, bool? linkPreviews, bool? openLinks}) async {
    await ready;
    final old = byId(id);
    if (old == null || old.isBrief) return;
    var d = old.copyWith(showImages: showImages, linkPreviews: linkPreviews, openLinks: openLinks);
    _put(d);
    // Previews just turned on: fetch them for the rows there are.
    if (linkPreviews == true && !old.linkPreviews) d = (await setItems(id, d.items)) ?? d;
    await _save();
    await publish(d);
  }

  /// Replaces a widget's rows: link previews are filled in and pictures
  /// saved on this phone first. [note] goes in its history when set.
  Future<HomeWidgetDef?> setItems(String id, List<WidgetItem> items, {String? title, String? note}) async {
    await ready;
    final old = byId(id);
    if (old == null || old.isBrief) return null;
    final dir = await _dir(id);
    final kept = <String>{};
    final saved = <WidgetItem>[];
    var rows = items.where((i) => !i.isEmpty || i.imageUrl != null || i.link != null).take(maxWidgetItems).toList();
    if (old.linkPreviews) rows = [for (final r in rows) await _withPreview(r, old.showImages)];
    for (final (n, item) in rows.indexed) {
      var path = item.imagePath;
      if (item.imageUrl != null) path = await _download(item.imageUrl!, '${dir.path}/$n') ?? _reuse(old, item.imageUrl!);
      if (path != null) kept.add(path);
      saved.add(item.withImage(path));
    }
    // Pictures no longer shown are deleted.
    await for (final f in dir.list()) {
      if (f is File && !kept.contains(f.path)) await f.delete().catchError((_) => f);
    }
    final d = old.copyWith(items: saved, title: title?.trim().isEmpty ?? true ? null : title!.trim(), updatedAt: DateTime.now());
    _put(d);
    if (note != null) _addRun(id, WidgetRun(at: DateTime.now(), ok: true, rows: saved.length, note: note));
    await _save();
    await publish(d);
    return byId(id);
  }

  /// [item] with what its link's page says about itself (title, summary,
  /// picture) where the row doesn't say it already.
  static Future<WidgetItem> _withPreview(WidgetItem item, bool pictures) async {
    final link = item.link;
    if (link == null || (item.title.isNotEmpty && item.text.isNotEmpty && (item.imageUrl != null || !pictures))) return item;
    final p = await linkPreview(link);
    if (p == null) return item;
    final host = Uri.tryParse(link)?.host.replaceFirst('www.', '') ?? '';
    return WidgetItem(
      title: item.title.isNotEmpty ? item.title : p.title,
      text: item.text.isNotEmpty ? item.text : p.description,
      subtitle: item.subtitle.isNotEmpty ? item.subtitle : host,
      imageUrl: item.imageUrl ?? (pictures ? p.image : null),
      imagePath: item.imagePath,
      link: link,
    );
  }

  /// A page's title, summary and picture from its Open Graph and HTML tags.
  static Future<({String title, String description, String? image})?> linkPreview(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.scheme != 'https') return null;
    try {
      final r = await http.get(uri, headers: {'User-Agent': 'Mozilla/5.0 (Triangle link preview)'}).timeout(const Duration(seconds: 10));
      if (r.statusCode >= 400 || !(r.headers['content-type'] ?? '').contains('html')) return null;
      final html = utf8.decode(r.bodyBytes.take(512 * 1024).toList(), allowMalformed: true);
      String? meta(String key) {
        for (final tag in RegExp(r'<meta\b[^>]*>', caseSensitive: false).allMatches(html)) {
          final t = tag[0]!;
          final name = RegExp('(?:property|name)\\s*=\\s*["\']([^"\']+)["\']', caseSensitive: false).firstMatch(t)?[1];
          if (name?.toLowerCase() != key) continue;
          final content = RegExp('content\\s*=\\s*["\']([^"\']*)["\']', caseSensitive: false).firstMatch(t)?[1];
          if (content != null && content.trim().isNotEmpty) return _unescape(content.trim());
        }
        return null;
      }

      final title = meta('og:title') ??
          meta('twitter:title') ??
          _unescape(RegExp(r'<title[^>]*>([^<]*)</title>', caseSensitive: false).firstMatch(html)?[1]?.trim() ?? '');
      final description = meta('og:description') ?? meta('twitter:description') ?? meta('description') ?? '';
      final image = meta('og:image') ?? meta('twitter:image');
      final imageUri = image == null ? null : uri.resolve(image);
      return (
        title: title.length > 120 ? '${title.substring(0, 120)}…' : title,
        description: description.length > 220 ? '${description.substring(0, 220)}…' : description,
        image: imageUri?.scheme == 'https' ? imageUri.toString() : null,
      );
    } catch (_) {
      return null;
    }
  }

  static String _unescape(String s) => s
      .replaceAll('&amp;', '&')
      .replaceAll('&quot;', '"')
      .replaceAll('&#39;', "'")
      .replaceAll('&#039;', "'")
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>');

  /// Adds a picture from this phone (the gallery) as a new row, with an
  /// optional caption.
  Future<HomeWidgetDef?> addPicture(String id, File picture, {String caption = ''}) async {
    await ready;
    final d = byId(id);
    if (d == null || d.isBrief) return null;
    final dir = await _dir(id);
    final ext = picture.path.split('.').last.toLowerCase();
    final copy = await picture.copy('${dir.path}/pick.${DateTime.now().millisecondsSinceEpoch}.${ext.length <= 4 ? ext : 'jpg'}');
    return setItems(id, [...d.items, WidgetItem(text: caption.trim(), imagePath: copy.path)], note: 'Picture added');
  }

  String? _reuse(HomeWidgetDef d, String url) => d.items.where((i) => i.imageUrl == url).firstOrNull?.imagePath;

  /// Deletes a widget, its pictures and its refresh watch. The brief stays.
  Future<bool> remove(String id) async {
    await ready;
    final d = byId(id);
    if (d == null || d.isBrief) return false;
    state = state.where((x) => x.id != id).toList();
    if (d.watchId != null) await ref.read(watchStoreProvider.notifier).remove(d.watchId!);
    // Its pictures; a failure here never keeps the widget.
    try {
      final dir = await _dir(id);
      if (await dir.exists()) await dir.delete(recursive: true);
    } catch (e) {
      debugPrint('[Widgets] pictures of $id: $e');
    }
    await _save();
    final p = await SharedPreferences.getInstance();
    await p.remove('widget_payload.$id');
    // Home-screen widgets that showed it go back to the brief.
    final bindings = await this.bindings();
    if (bindings.values.contains(id)) {
      await p.setString(bindingsKey, jsonEncode({for (final e in bindings.entries) if (e.value != id) '${e.key}': e.value}));
    }
    if (p.getString(defaultKey) == id) await p.remove(defaultKey);
    await _redraw();
    return true;
  }

  void _put(HomeWidgetDef d) => state = [for (final x in state) x.id == d.id ? d : x];

  /// Creates, updates or removes the scheduled watch that refreshes [d].
  Future<HomeWidgetDef?> _syncWatch(HomeWidgetDef d) async {
    final watches = ref.read(watchStoreProvider.notifier);
    final existing = d.watchId == null ? null : watches.byId(d.watchId!);
    if (!d.byAssistant) {
      if (existing != null) await watches.remove(existing.id);
      final cleared = d.copyWith(clearWatch: true);
      _put(cleared);
      return cleared;
    }
    final instructions = refreshInstructions(d);
    if (existing != null) {
      await watches.update(
        existing.id,
        (w) => w.copyWith(name: 'Widget: ${d.title}', instructions: instructions, everyMinutes: (d.everyHours ?? 6) * 60),
      );
      return d;
    }
    final w = await watches.add(
      (id) => Watch(
        id: id,
        name: 'Widget: ${d.title}',
        scope: WatchScope.schedule,
        mode: WatchMode.act,
        everyMinutes: (d.everyHours ?? 6) * 60,
        instructions: instructions,
        notify: false,
        createdAt: DateTime.now(),
      ),
    );
    final linked = d.copyWith(watchId: w.id);
    _put(linked);
    return linked;
  }

  /// What the refresh watch tells the assistant.
  static String refreshInstructions(HomeWidgetDef d) =>
      'Refresh the home-screen widget "${d.title}" (widget_id ${d.id}). It shows: ${d.prompt}. '
      'Find current information with your tools (web search, connected apps, Telegram), then call update_widget '
      'with widget_id ${d.id} and up to 12 short items (title, text, optional subtitle, image_url for a picture, '
      'link to open). Keep each text to one or two lines. Do not message or notify the user.';

  // ---- the launcher ------------------------------------------------------------

  /// Writes [d]'s rows where the launcher reads them and redraws.
  Future<void> publish(HomeWidgetDef d) async {
    if (kIsWeb || !Platform.isAndroid || d.isBrief) return;
    try {
      final p = await SharedPreferences.getInstance();
      await p.setString('widget_payload.${d.id}', jsonEncode(payloadOf(d)));
      await _redraw();
    } catch (e) {
      debugPrint('[Widgets] publish: $e');
    }
  }

  /// [d] as BriefWidget.kt reads it.
  static Map<String, dynamic> payloadOf(HomeWidgetDef d) => {
    'title': d.title,
    'images': d.showImages,
    'links': d.openLinks,
    if (d.updatedAt != null) 'when': DateFormat('EEE d MMM, HH:mm').format(d.updatedAt!),
    'empty': d.byAssistant ? 'The assistant fills this in on its next refresh. Tap to open Triangle.' : 'Nothing here yet.',
    'items': [for (final i in d.items) i.payload()],
  };

  Future<void> _redraw() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      await _channel.invokeMethod<void>('update');
    } catch (_) {}
  }

  /// Widget ids on the home screen (Android), in the order they were added.
  Future<List<int>> instances() async {
    if (kIsWeb || !Platform.isAndroid) return const [];
    try {
      return [for (final x in await _channel.invokeMethod<List<Object?>>('instances') ?? const []) (x as num).toInt()];
    } catch (_) {
      return const [];
    }
  }

  Future<Map<int, String>> bindings() async {
    final raw = (await SharedPreferences.getInstance()).getString(bindingsKey);
    if (raw == null) return {};
    try {
      return {for (final e in (jsonDecode(raw) as Map).entries) int.parse('${e.key}'): '${e.value}'};
    } catch (_) {
      return {};
    }
  }

  /// Which widget the home-screen widget [instance] shows.
  Future<void> bind(int instance, String widgetId) async {
    final p = await SharedPreferences.getInstance();
    final b = await bindings()..[instance] = widgetId;
    await p.setString(bindingsKey, jsonEncode({for (final e in b.entries) '${e.key}': e.value}));
    await _redraw();
  }

  Future<String> defaultWidget() async => (await SharedPreferences.getInstance()).getString(defaultKey) ?? briefWidgetId;

  Future<void> setDefault(String widgetId) async {
    await (await SharedPreferences.getInstance()).setString(defaultKey, widgetId);
    await _redraw();
  }

  /// Writes every widget's rows again (on start, after a restore); pictures
  /// missing on this phone are fetched again from their links.
  Future<void> publishAll() async {
    await ready;
    for (final d in state.where((d) => !d.isBrief).toList()) {
      final missing = d.items.any((i) => i.imageUrl != null && (i.imagePath == null || !File(i.imagePath!).existsSync()));
      if (missing) {
        await setItems(d.id, [for (final i in d.items) i.withImage(null)]);
      } else {
        await publish(d);
      }
    }
  }

  static Future<Directory> _dir(String id) async {
    final d = Directory('${(await getApplicationSupportDirectory()).path}/widgets/$id');
    if (!await d.exists()) await d.create(recursive: true);
    return d;
  }

  /// Saves a picture for the widget: https only, an image, at most 4 MB.
  static Future<String?> _download(String url, String base) async {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.scheme != 'https') return null;
    try {
      final r = await http.get(uri, headers: {'User-Agent': 'Triangle'}).timeout(const Duration(seconds: 20));
      final type = r.headers['content-type'] ?? '';
      if (r.statusCode >= 400 || !type.startsWith('image/') || r.bodyBytes.length > 4 * 1024 * 1024) return null;
      final ext = switch (type.split(';').first) {
        'image/png' => 'png',
        'image/webp' => 'webp',
        'image/gif' => 'gif',
        _ => 'jpg',
      };
      final f = File('$base.${DateTime.now().millisecondsSinceEpoch}.$ext');
      await f.writeAsBytes(r.bodyBytes, flush: true);
      return f.path;
    } catch (e) {
      debugPrint('[Widgets] image $url: $e');
      return null;
    }
  }
}

final homeWidgetsProvider = NotifierProvider<HomeWidgetStore, List<HomeWidgetDef>>(HomeWidgetStore.new);
