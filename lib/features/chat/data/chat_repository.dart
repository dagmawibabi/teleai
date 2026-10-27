import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/chat_models.dart';

/// Conversations as one JSON file each, plus a small index for the drawer.
class ChatRepository {
  Directory? _dir;

  Future<Directory> _root() async {
    final dir = _dir ??= Directory('${(await getApplicationSupportDirectory()).path}/conversations');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir;
  }

  Future<File> _index() async => File('${(await _root()).path}/index.json');

  Future<List<ConversationSummary>> list() async {
    try {
      final file = await _index();
      if (!await file.exists()) return [];
      final raw = jsonDecode(await file.readAsString()) as List;
      final out = [
        for (final r in raw.whereType<Map>())
          ConversationSummary(
            id: r['id'],
            title: r['title'] ?? 'New chat',
            updatedAt: DateTime.tryParse(r['updated'] ?? '') ?? DateTime.now(),
            unread: (r['unread'] as num?)?.toInt() ?? 0,
          ),
      ]..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return out;
    } catch (e) {
      debugPrint('[Chats] index unreadable: $e');
      return [];
    }
  }

  Future<void> _writeIndex(List<ConversationSummary> items) async {
    final file = await _index();
    await file.writeAsString(
      jsonEncode([
        for (final i in items)
          {'id': i.id, 'title': i.title, 'updated': i.updatedAt.toIso8601String(), if (i.unread > 0) 'unread': i.unread},
      ]),
    );
  }

  Future<Conversation?> load(String id) async {
    try {
      final file = File('${(await _root()).path}/$id.json');
      if (!await file.exists()) return null;
      return Conversation.fromJson(jsonDecode(await file.readAsString()));
    } catch (e) {
      debugPrint('[Chats] $id unreadable: $e');
      return null;
    }
  }

  /// The save in progress; saves run one after another, since they share
  /// the conversation's temp file and the index.
  Future<void> _saving = Future.value();

  /// Writes the conversation and moves it to the top of the index.
  Future<List<ConversationSummary>> save(Conversation c) {
    final done = _saving.then((_) => _save(c));
    _saving = done.then((_) {}, onError: (_) {});
    return done;
  }

  Future<List<ConversationSummary>> _save(Conversation c) async {
    final dir = await _root();
    final tmp = File('${dir.path}/${c.id}.json.tmp');
    await tmp.writeAsString(jsonEncode(c.toJson()));
    await tmp.rename('${dir.path}/${c.id}.json');
    final items = (await list()).where((i) => i.id != c.id).toList()
      ..insert(0, ConversationSummary(id: c.id, title: c.title, updatedAt: c.updatedAt, unread: c.unread));
    await _writeIndex(items);
    return items;
  }

  /// Removes a conversation from this app. Nothing in Telegram is touched.
  Future<List<ConversationSummary>> remove(String id) async {
    final dir = await _root();
    final file = File('${dir.path}/$id.json');
    if (await file.exists()) await file.delete();
    final items = (await list()).where((i) => i.id != id).toList();
    await _writeIndex(items);
    return items;
  }

  Future<List<ConversationSummary>> rename(String id, String title) async {
    final c = await load(id);
    if (c == null) return list();
    c.title = title;
    return save(c);
  }

  Future<void> clearAll() async {
    final dir = await _root();
    if (await dir.exists()) await dir.delete(recursive: true);
    _dir = null;
  }
}

final chatRepositoryProvider = Provider<ChatRepository>((ref) => ChatRepository());
