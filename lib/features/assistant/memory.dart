import 'dart:convert';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_ai/omni_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ai/data/ai.dart';

/// Long-term memory, on this phone only: omni_ai's [AgentMemory]
/// (`ai.memory`), whose tools the assistant uses and whose memories are in
/// every conversation's prompt. This mirrors it for the Memory screen.
class MemoryStore extends Notifier<List<MemoryItem>> {
  /// Where the app kept memories before omni_ai did.
  static const _legacyKey = 'memories.v1';

  AgentMemory get _memory => ref.read(aiProvider).memory;

  @override
  List<MemoryItem> build() {
    final memory = ref.watch(aiProvider).memory;
    void sync() => unawaited(_reload());
    memory.addListener(sync);
    ref.onDispose(() => memory.removeListener(sync));
    unawaited(_migrate().then((_) => _reload()));
    return const [];
  }

  Future<void> _reload() async {
    final all = await _memory.all();
    if (ref.mounted) state = all;
  }

  /// Moves memories saved by earlier versions into omni_ai's store, once.
  Future<void> _migrate() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_legacyKey);
      if (raw == null) return;
      for (final m in jsonDecode(raw) as List) {
        final item = MemoryItem.fromJson(m as Map);
        if (item.text.trim().isNotEmpty) await _memory.store.save(_memory.scope, item.text, tags: item.tags);
      }
      await prefs.remove(_legacyKey);
    } catch (e) {
      debugPrint('[Memory] migrating: $e');
    }
  }

  Future<MemoryItem> add(String content, {List<String> tags = const []}) => _memory.save(content, tags: tags);

  Future<MemoryItem?> update(String id, {String? content, List<String>? tags}) =>
      _memory.update(id, text: content, tags: tags);

  Future<bool> remove(String id) => _memory.remove(id);
}

final memoryProvider = NotifierProvider<MemoryStore, List<MemoryItem>>(MemoryStore.new);
