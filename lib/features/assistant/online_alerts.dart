import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// "Tell me when this person comes online." Telegram pushes a user's status
/// as it changes to accounts that may see it (contacts and people chatted
/// with recently), unless their privacy hides their last seen.
@immutable
class OnlineAlert {
  const OnlineAlert({
    required this.userId,
    required this.name,
    this.once = true,
    required this.createdAt,
    this.lastFired,
    this.fired = 0,
  });

  final int userId;

  /// Their name when the alert was made, for when the store hasn't loaded.
  final String name;

  /// Alert the first time only, then remove itself.
  final bool once;
  final DateTime createdAt;
  final DateTime? lastFired;
  final int fired;

  OnlineAlert copyWith({bool? once, DateTime? lastFired, int? fired}) => OnlineAlert(
    userId: userId,
    name: name,
    once: once ?? this.once,
    createdAt: createdAt,
    lastFired: lastFired ?? this.lastFired,
    fired: fired ?? this.fired,
  );

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'name': name,
    'once': once,
    'created': createdAt.toIso8601String(),
    'last_fired': lastFired?.toIso8601String(),
    'fired': fired,
  };

  factory OnlineAlert.fromJson(Map<String, dynamic> j) => OnlineAlert(
    userId: (j['user_id'] as num).toInt(),
    name: j['name'] ?? 'Someone',
    once: j['once'] ?? true,
    createdAt: DateTime.tryParse(j['created'] ?? '') ?? DateTime.now(),
    lastFired: DateTime.tryParse(j['last_fired'] ?? ''),
    fired: (j['fired'] as num?)?.toInt() ?? 0,
  );
}

class OnlineAlertStore extends Notifier<List<OnlineAlert>> {
  static const _key = 'online_alerts.v1';

  @override
  List<OnlineAlert> build() {
    _load();
    return const [];
  }

  Future<void> _load() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(_key);
      if (raw == null) return;
      state = [for (final a in jsonDecode(raw) as List) OnlineAlert.fromJson(Map<String, dynamic>.from(a))];
    } catch (e) {
      debugPrint('[OnlineAlerts] $e');
    }
  }

  Future<void> _save() async =>
      (await SharedPreferences.getInstance()).setString(_key, jsonEncode([for (final a in state) a.toJson()]));

  OnlineAlert? of(int userId) => state.where((a) => a.userId == userId).firstOrNull;

  /// Adds an alert, or replaces the one for the same person.
  Future<OnlineAlert> add(int userId, String name, {bool once = true}) async {
    final a = OnlineAlert(userId: userId, name: name, once: once, createdAt: DateTime.now());
    state = [...state.where((x) => x.userId != userId), a];
    await _save();
    return a;
  }

  Future<void> fired(int userId) async {
    final a = of(userId);
    if (a == null) return;
    state = a.once
        ? state.where((x) => x.userId != userId).toList()
        : [for (final x in state) x.userId == userId ? x.copyWith(lastFired: DateTime.now(), fired: x.fired + 1) : x];
    await _save();
  }

  Future<bool> remove(int userId) async {
    final before = state.length;
    state = state.where((a) => a.userId != userId).toList();
    await _save();
    return before != state.length;
  }
}

final onlineAlertStoreProvider = NotifierProvider<OnlineAlertStore, List<OnlineAlert>>(OnlineAlertStore.new);
