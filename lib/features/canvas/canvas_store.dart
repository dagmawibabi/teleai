import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../chat/domain/chat_models.dart';

const _uuid = Uuid();

/// A folder in the Content Canvas. Folders nest through [parentId].
class CanvasFolder {
  const CanvasFolder({
    required this.id,
    required this.name,
    this.parentId,
    this.description = '',
    this.color = 0,
    required this.createdAt,
  });
  final String id;
  final String name;
  final String? parentId;
  final String description;

  /// An index into the canvas palette.
  final int color;
  final DateTime createdAt;

  CanvasFolder copyWith({String? name, String? description, int? color, String? parentId, bool root = false}) =>
      CanvasFolder(
        id: id,
        name: name ?? this.name,
        parentId: root ? null : (parentId ?? this.parentId),
        description: description ?? this.description,
        color: color ?? this.color,
        createdAt: createdAt,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'parent': parentId,
    'desc': description,
    'color': color,
    'at': createdAt.toIso8601String(),
  };

  factory CanvasFolder.fromJson(Map<String, dynamic> j) => CanvasFolder(
    id: j['id'],
    name: j['name'] ?? 'Folder',
    parentId: j['parent'],
    description: j['desc'] ?? '',
    color: j['color'] ?? 0,
    createdAt: DateTime.tryParse(j['at'] ?? '') ?? DateTime.now(),
  );
}

/// What an item is: a channel post, a DM or group message, a comment, a
/// note of the user's (or the assistant's) own, or something from beyond
/// Telegram: a web link, an email, a file on the phone, or an item from a
/// connected app (a Notion page, a Slack message, an issue…).
enum CanvasKind { post, message, comment, note, link, email, file, app }

/// One thing saved into a folder. Messages keep a snapshot so the canvas
/// reads without Telegram, and open the original when tapped.
class CanvasItem {
  const CanvasItem({
    required this.id,
    required this.folderId,
    required this.kind,
    this.post,
    this.text = '',
    this.note = '',
    this.tags = const [],
    required this.addedAt,
    this.title = '',
    this.url = '',
    this.source = '',
    this.path = '',
  });
  final String id;
  final String folderId;
  final CanvasKind kind;

  /// For links, emails, files and app items: what it is called, where it
  /// lives (a web address or a file on the phone), and where it came from
  /// ("Gmail", "Slack", "The web"…).
  final String title;
  final String url;
  final String source;
  final String path;
  final PostSnapshot? post;

  /// A note's body (messages carry theirs in [post]).
  final String text;

  /// Why it's here, in the user's or assistant's words.
  final String note;
  final List<String> tags;
  final DateTime addedAt;

  String get key => post?.key ?? id;

  CanvasItem copyWith({String? folderId, String? note, List<String>? tags, String? text}) => CanvasItem(
    id: id,
    folderId: folderId ?? this.folderId,
    kind: kind,
    post: post,
    text: text ?? this.text,
    note: note ?? this.note,
    tags: tags ?? this.tags,
    addedAt: addedAt,
    title: title,
    url: url,
    source: source,
    path: path,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'folder': folderId,
    'kind': kind.name,
    if (post != null) 'post': post!.toJson(),
    if (text.isNotEmpty) 'text': text,
    if (note.isNotEmpty) 'note': note,
    if (tags.isNotEmpty) 'tags': tags,
    'at': addedAt.toIso8601String(),
    if (title.isNotEmpty) 'title': title,
    if (url.isNotEmpty) 'url': url,
    if (source.isNotEmpty) 'source': source,
    if (path.isNotEmpty) 'path': path,
  };

  factory CanvasItem.fromJson(Map<String, dynamic> j) => CanvasItem(
    id: j['id'],
    folderId: j['folder'],
    kind: CanvasKind.values.asNameMap()[j['kind']] ?? CanvasKind.note,
    post: j['post'] is Map ? PostSnapshot.fromJson(Map<String, dynamic>.from(j['post'])) : null,
    text: j['text'] ?? '',
    note: j['note'] ?? '',
    tags: [for (final t in (j['tags'] as List? ?? const [])) '$t'],
    addedAt: DateTime.tryParse(j['at'] ?? '') ?? DateTime.now(),
    title: j['title'] ?? '',
    url: j['url'] ?? '',
    source: j['source'] ?? '',
    path: j['path'] ?? '',
  );
}

class CanvasState {
  const CanvasState({this.folders = const [], this.items = const [], this.loaded = false});
  final List<CanvasFolder> folders;
  final List<CanvasItem> items;
  final bool loaded;

  List<CanvasFolder> childrenOf(String? parentId) =>
      folders.where((f) => f.parentId == parentId).toList()..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  List<CanvasItem> itemsIn(String folderId) =>
      items.where((i) => i.folderId == folderId).toList()..sort((a, b) => b.addedAt.compareTo(a.addedAt));

  /// Items in a folder and everything under it.
  int countDeep(String folderId) =>
      itemsIn(folderId).length + childrenOf(folderId).fold<int>(0, (n, f) => n + countDeep(f.id));

  CanvasFolder? folder(String? id) => id == null ? null : folders.where((f) => f.id == id).firstOrNull;

  /// A folder by id, or by name (case-insensitive), or a path "A/B".
  CanvasFolder? find(String idOrName) {
    final byId = folder(idOrName);
    if (byId != null) return byId;
    final parts = idOrName.split('/').map((p) => p.trim().toLowerCase()).where((p) => p.isNotEmpty).toList();
    if (parts.length > 1) {
      String? parent;
      CanvasFolder? hit;
      for (final p in parts) {
        hit = childrenOf(parent).where((f) => f.name.toLowerCase() == p).firstOrNull;
        if (hit == null) return null;
        parent = hit.id;
      }
      return hit;
    }
    return folders.where((f) => f.name.toLowerCase() == idOrName.trim().toLowerCase()).firstOrNull;
  }

  String pathOf(CanvasFolder f) {
    final names = <String>[f.name];
    var p = folder(f.parentId);
    while (p != null) {
      names.insert(0, p.name);
      p = folder(p.parentId);
    }
    return names.join(' / ');
  }

  CanvasState copyWith({List<CanvasFolder>? folders, List<CanvasItem>? items}) =>
      CanvasState(folders: folders ?? this.folders, items: items ?? this.items, loaded: true);
}

/// The Content Canvas: the user's own folders of saved posts, messages,
/// comments and notes, kept on this phone.
class CanvasStore extends Notifier<CanvasState> {
  @override
  CanvasState build() {
    _load();
    return const CanvasState();
  }

  Future<File> _file() async => File('${(await getApplicationSupportDirectory()).path}/content_canvas.json');

  Future<void> _load() async {
    try {
      final f = await _file();
      if (!await f.exists()) {
        state = state.copyWith();
        return;
      }
      final j = jsonDecode(await f.readAsString()) as Map<String, dynamic>;
      state = CanvasState(
        folders: [for (final x in (j['folders'] as List? ?? const [])) CanvasFolder.fromJson(Map<String, dynamic>.from(x))],
        items: [for (final x in (j['items'] as List? ?? const [])) CanvasItem.fromJson(Map<String, dynamic>.from(x))],
        loaded: true,
      );
    } catch (e) {
      debugPrint('[Canvas] load: $e');
      state = state.copyWith();
    }
  }

  /// Waits for the file to be read, so tools see what's there.
  Future<CanvasState> ready() async {
    for (var i = 0; i < 50 && !state.loaded; i++) {
      await Future<void>.delayed(const Duration(milliseconds: 40));
    }
    return state;
  }

  Future<void> _save() async {
    try {
      await (await _file()).writeAsString(
        jsonEncode({
          'folders': [for (final f in state.folders) f.toJson()],
          'items': [for (final i in state.items) i.toJson()],
        }),
      );
    } catch (e) {
      debugPrint('[Canvas] save: $e');
    }
  }

  Future<void> clear() async {
    state = state.copyWith(folders: const [], items: const []);
    await _save();
  }

  Future<CanvasFolder> createFolder(String name, {String? parentId, String description = '', int? color}) async {
    await ready();
    final existing = state.childrenOf(parentId).where((f) => f.name.toLowerCase() == name.trim().toLowerCase()).firstOrNull;
    if (existing != null) return existing;
    final f = CanvasFolder(
      id: _uuid.v4().substring(0, 8),
      name: name.trim(),
      parentId: parentId,
      description: description,
      color: color ?? state.folders.length % 8,
      createdAt: DateTime.now(),
    );
    state = state.copyWith(folders: [...state.folders, f]);
    await _save();
    return f;
  }

  Future<void> updateFolder(CanvasFolder f) async {
    state = state.copyWith(folders: [for (final x in state.folders) x.id == f.id ? f : x]);
    await _save();
  }

  /// Deletes a folder with its subfolders; their items go too unless
  /// [moveItemsTo] names a folder to keep them in.
  Future<void> deleteFolder(String id, {String? moveItemsTo}) async {
    final gone = <String>{};
    void collect(String fid) {
      gone.add(fid);
      for (final c in state.childrenOf(fid)) {
        collect(c.id);
      }
    }

    collect(id);
    state = state.copyWith(
      folders: state.folders.where((f) => !gone.contains(f.id)).toList(),
      items: [
        for (final i in state.items)
          if (!gone.contains(i.folderId))
            i
          else if (moveItemsTo != null)
            i.copyWith(folderId: moveItemsTo),
      ],
    );
    await _save();
  }

  /// Adds messages to a folder, skipping ones already in it.
  Future<int> addPosts(String folderId, List<PostSnapshot> posts, {String note = '', List<String> tags = const []}) async {
    await ready();
    final have = {for (final i in state.itemsIn(folderId)) i.key};
    final fresh = [
      for (final p in posts)
        if (have.add(p.key))
          CanvasItem(
            id: _uuid.v4().substring(0, 8),
            folderId: folderId,
            kind: p.sender == null && p.kind != 'comment' ? CanvasKind.post : CanvasKind.message,
            post: p,
            note: note,
            tags: tags,
            addedAt: DateTime.now(),
          ),
    ];
    state = state.copyWith(items: [...state.items, ...fresh]);
    await _save();
    return fresh.length;
  }

  Future<CanvasItem> addNote(String folderId, String text, {List<String> tags = const []}) async {
    final i = CanvasItem(
      id: _uuid.v4().substring(0, 8),
      folderId: folderId,
      kind: CanvasKind.note,
      text: text,
      tags: tags,
      addedAt: DateTime.now(),
    );
    state = state.copyWith(items: [...state.items, i]);
    await _save();
    return i;
  }

  /// Saves something from beyond Telegram: a link, an email, a file or an
  /// app item.
  Future<CanvasItem> addSaved(
    String folderId, {
    required CanvasKind kind,
    required String title,
    String text = '',
    String url = '',
    String source = '',
    String path = '',
    String note = '',
    List<String> tags = const [],
  }) async {
    final i = CanvasItem(
      id: _uuid.v4().substring(0, 8),
      folderId: folderId,
      kind: kind,
      title: title,
      text: text,
      url: url,
      source: source,
      path: path,
      note: note,
      tags: tags,
      addedAt: DateTime.now(),
    );
    state = state.copyWith(items: [...state.items, i]);
    await _save();
    return i;
  }

  Future<void> updateItem(CanvasItem item) async {
    state = state.copyWith(items: [for (final x in state.items) x.id == item.id ? item : x]);
    await _save();
  }

  Future<int> moveItems(Iterable<String> ids, String folderId) async {
    final set = ids.toSet();
    var n = 0;
    state = state.copyWith(
      items: [
        for (final i in state.items)
          if (set.contains(i.id)) (() {
            n++;
            return i.copyWith(folderId: folderId);
          })() else i,
      ],
    );
    await _save();
    return n;
  }

  Future<int> removeItems(Iterable<String> ids) async {
    final set = ids.toSet();
    final before = state.items.length;
    state = state.copyWith(items: state.items.where((i) => !set.contains(i.id)).toList());
    await _save();
    return before - state.items.length;
  }
}

final canvasProvider = NotifierProvider<CanvasStore, CanvasState>(CanvasStore.new);
