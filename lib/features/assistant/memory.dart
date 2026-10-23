import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// One thing the assistant was asked to remember.
@immutable
class Memory {
  const Memory({required this.id, required this.content, required this.createdAt, required this.updatedAt, this.tags = const []});

  final String id;
  final String content;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  Memory copyWith({String? content, List<String>? tags}) => Memory(
    id: id,
    content: content ?? this.content,
    tags: tags ?? this.tags,
    createdAt: createdAt,
    updatedAt: DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'tags': tags,
    'created': createdAt.toIso8601String(),
    'updated': updatedAt.toIso8601String(),
  };

  factory Memory.fromJson(Map<String, dynamic> j) => Memory(
    id: j['id'],
    content: j['content'] ?? '',
    tags: List<String>.from(j['tags'] ?? const []),
    createdAt: DateTime.tryParse(j['created'] ?? '') ?? DateTime.now(),
    updatedAt: DateTime.tryParse(j['updated'] ?? '') ?? DateTime.now(),
  );
}

/// Long-term memory, on this phone only. Every conversation starts with it,
/// so the assistant knows what it was told to keep in mind.
class MemoryStore extends Notifier<List<Memory>> {
  static const _key = 'memories.v1';
  static const _uuid = Uuid();

  @override
  List<Memory> build() {
    _load();
    return const [];
  }

  Future<void> _load() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(_key);
      if (raw == null) return;
      state = [for (final m in jsonDecode(raw) as List) Memory.fromJson(Map<String, dynamic>.from(m))];
    } catch (e) {
      debugPrint('[Memory] $e');
    }
  }

  Future<void> _save() async =>
      (await SharedPreferences.getInstance()).setString(_key, jsonEncode([for (final m in state) m.toJson()]));

  Future<Memory> add(String content, {List<String> tags = const []}) async {
    final now = DateTime.now();
    final m = Memory(id: _uuid.v4().substring(0, 8), content: content.trim(), tags: tags, createdAt: now, updatedAt: now);
    state = [...state, m];
    await _save();
    return m;
  }

  Future<Memory?> update(String id, {String? content, List<String>? tags}) async {
    Memory? updated;
    state = [
      for (final m in state)
        if (m.id == id) updated = m.copyWith(content: content?.trim(), tags: tags) else m,
    ];
    await _save();
    return updated;
  }

  Future<bool> remove(String id) async {
    final before = state.length;
    state = state.where((m) => m.id != id).toList();
    await _save();
    return state.length != before;
  }
}

final memoryProvider = NotifierProvider<MemoryStore, List<Memory>>(MemoryStore.new);
