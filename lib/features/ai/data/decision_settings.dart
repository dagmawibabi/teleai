import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_ai/omni_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';

final decisionKeyStoreProvider = Provider<KeyStore>((ref) => SecureKeyStore(prefix: 'triangle.'));

class DecisionSettings {
  const DecisionSettings({
    this.loaded = false,
    this.apiKey = '',
    this.enabled = true,
    this.model = 'jev-latest',
    this.baseUrl = 'https://api.typesafe.ai',
    this.threshold = 0.5,
    this.gateConfidence = false,
    this.minConfidence = 0.5,
    this.longContext = false,
    this.maxRetries = 2,
    this.timeoutSeconds = 120,
  });

  final bool loaded;
  final String apiKey;
  final bool enabled;
  final String model;
  final String baseUrl;
  final double threshold;
  final bool gateConfidence;
  final double minConfidence;
  final bool longContext;
  final int maxRetries;
  final int timeoutSeconds;

  DecisionSettings copyWith({
    bool? loaded,
    String? apiKey,
    bool? enabled,
    String? model,
    String? baseUrl,
    double? threshold,
    bool? gateConfidence,
    double? minConfidence,
    bool? longContext,
    int? maxRetries,
    int? timeoutSeconds,
  }) => DecisionSettings(
    loaded: loaded ?? this.loaded,
    apiKey: apiKey ?? this.apiKey,
    enabled: enabled ?? this.enabled,
    model: model ?? this.model,
    baseUrl: baseUrl ?? this.baseUrl,
    threshold: threshold ?? this.threshold,
    gateConfidence: gateConfidence ?? this.gateConfidence,
    minConfidence: minConfidence ?? this.minConfidence,
    longContext: longContext ?? this.longContext,
    maxRetries: maxRetries ?? this.maxRetries,
    timeoutSeconds: timeoutSeconds ?? this.timeoutSeconds,
  );

  Map<String, dynamic> toJson() => {
    'enabled': enabled,
    'model': model,
    'baseUrl': baseUrl,
    'threshold': threshold,
    'gateConfidence': gateConfidence,
    'minConfidence': minConfidence,
    'longContext': longContext,
    'maxRetries': maxRetries,
    'timeoutSeconds': timeoutSeconds,
  };

  factory DecisionSettings.fromJson(Map j, {String apiKey = ''}) => DecisionSettings(
    loaded: true,
    apiKey: apiKey,
    enabled: j['enabled'] != false,
    model: j['model'] as String? ?? 'jev-latest',
    baseUrl: j['baseUrl'] as String? ?? 'https://api.typesafe.ai',
    threshold: ((j['threshold'] as num?)?.toDouble() ?? 0.5).clamp(0, 1),
    gateConfidence: j['gateConfidence'] == true,
    minConfidence: ((j['minConfidence'] as num?)?.toDouble() ?? 0.5).clamp(0, 1),
    longContext: j['longContext'] == true,
    maxRetries: ((j['maxRetries'] as num?)?.toInt() ?? 2).clamp(0, 5),
    timeoutSeconds: ((j['timeoutSeconds'] as num?)?.toInt() ?? 120).clamp(5, 300),
  );
}

class DecisionSettingsController extends Notifier<DecisionSettings> {
  late Future<void> ready;
  static const preferencesKey = 'ai_decision_settings';
  static const secretKey = 'jev_api_key';

  @override
  DecisionSettings build() {
    ready = _load();
    return const DecisionSettings();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey = await ref.read(decisionKeyStoreProvider).read(secretKey) ?? '';
    Map options = const {};
    try {
      options = jsonDecode(prefs.getString(preferencesKey) ?? '{}') as Map;
    } on FormatException {
      /* Use defaults. */
    }
    if (ref.mounted) state = DecisionSettings.fromJson(options, apiKey: apiKey);
  }

  Future<void> setApiKey(String value) async {
    await ready;
    final key = value.trim();
    await ref.read(decisionKeyStoreProvider).write(secretKey, key.isEmpty ? null : key);
    if (ref.mounted) state = state.copyWith(apiKey: key);
  }

  Future<void> update({
    bool? enabled,
    String? model,
    String? baseUrl,
    double? threshold,
    bool? gateConfidence,
    double? minConfidence,
    bool? longContext,
    int? maxRetries,
    int? timeoutSeconds,
  }) async {
    await ready;
    state = state.copyWith(
      enabled: enabled,
      model: model,
      baseUrl: baseUrl,
      threshold: threshold,
      gateConfidence: gateConfidence,
      minConfidence: minConfidence,
      longContext: longContext,
      maxRetries: maxRetries,
      timeoutSeconds: timeoutSeconds,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(preferencesKey, jsonEncode(state.toJson()));
  }
}

final decisionSettingsProvider = NotifierProvider<DecisionSettingsController, DecisionSettings>(DecisionSettingsController.new);

/// Jev tools can run: decisions are on and a key is set.
final decisionsReadyProvider = Provider<bool>((ref) {
  final d = ref.watch(decisionSettingsProvider);
  return d.enabled && d.apiKey.trim().isNotEmpty;
});
