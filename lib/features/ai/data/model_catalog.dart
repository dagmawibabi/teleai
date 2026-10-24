import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../settings/data/settings.dart';

/// Which service a model is reached through.
enum AiRouter { vercel, openRouter, gemini }

abstract final class AiRoute {
  static const prefix = 'or:';
  static const geminiPrefix = 'g:';
  static AiRouter of(String model) => model.startsWith(prefix)
      ? AiRouter.openRouter
      : (model.startsWith(geminiPrefix) ? AiRouter.gemini : AiRouter.vercel);
  static bool isOpenRouter(String model) => model.startsWith(prefix);
  static bool isGemini(String model) => model.startsWith(geminiPrefix);
  static String bare(String model) => isOpenRouter(model)
      ? model.substring(prefix.length)
      : (isGemini(model) ? model.substring(geminiPrefix.length) : model);
  static String routerName(String model) => switch (of(model)) {
    AiRouter.openRouter => 'OpenRouter',
    AiRouter.gemini => 'Google AI Studio',
    AiRouter.vercel => 'Vercel AI Gateway',
  };
}

/// What a model is picked for.
enum ModelKind {
  text('Chat model'),
  image('Image model'),
  speech('Voice model'),
  transcription('Dictation model');

  const ModelKind(this.title);
  final String title;
}

/// A model from the Vercel AI Gateway or OpenRouter, enriched with
/// models.dev metadata.
@immutable
class ModelInfo {
  const ModelInfo({
    required this.id,
    required this.name,
    required this.provider,
    this.type = 'language',
    this.description = '',
    this.contextWindow,
    this.maxOutput,
    this.inputPrice,
    this.outputPrice,
    this.cacheReadPrice,
    this.inputModalities = const ['text'],
    this.outputModalities = const ['text'],
    this.reasoning = false,
    this.toolCall = false,
    this.openWeights = false,
    this.structuredOutput = false,
    this.attachment = false,
    this.temperature = true,
    this.releaseDate,
    this.lastUpdated,
    this.knowledge,
    this.family,
    this.tags = const [],
    this.voices = const [],
    this.imagePrice,
  });

  /// OpenRouter models are prefixed with `or:`.
  final String id;
  final String name;
  final String provider;

  /// language | image | speech
  final String type;
  final String description;
  final int? contextWindow;
  final int? maxOutput;

  /// USD per 1M tokens.
  final double? inputPrice;
  final double? outputPrice;
  final double? cacheReadPrice;
  final List<String> inputModalities;
  final List<String> outputModalities;
  final bool reasoning;
  final bool toolCall;
  final bool openWeights;
  final bool structuredOutput;
  final bool attachment;
  final bool temperature;
  final String? releaseDate;
  final String? lastUpdated;
  final String? knowledge;
  final String? family;
  final List<String> tags;

  /// Built-in voices (speech models).
  final List<String> voices;

  /// USD per image, when the catalog says.
  final double? imagePrice;

  AiRouter get router => AiRoute.of(id);
  String get bareId => AiRoute.bare(id);
  bool get vision => inputModalities.contains('image');
  bool get audioIn => inputModalities.contains('audio');
  bool get pdfIn =>
      inputModalities.contains('pdf') ||
      inputModalities.contains('file') ||
      attachment;
  bool get isText => type == 'language' && outputModalities.contains('text');
  bool get makesImages => type == 'image' || outputModalities.contains('image');
  bool get isSpeech => type == 'speech';

  bool fits(ModelKind kind) => switch (kind) {
    ModelKind.text => isText,
    ModelKind.image => makesImages,
    ModelKind.speech => isSpeech,
    ModelKind.transcription => isText && audioIn,
  };
  bool get isVariant =>
      id.endsWith('-batch') || id.endsWith(':batch') || (inputPrice ?? 0) < 0;
  bool get isFree =>
      id.endsWith(':free') || (inputPrice == 0 && outputPrice == 0);

  double get sortPrice =>
      (inputPrice ?? 999) * 0.75 + (outputPrice ?? 999) * 0.25;

  static String usd(double v) => v >= 10
      ? '\$${v.toStringAsFixed(0)}'
      : (v >= 1 ? '\$${v.toStringAsFixed(2)}' : '\$${v.toStringAsFixed(3)}');

  String get priceLabel {
    if (isFree) return 'Free';
    if (type == 'image' && imagePrice != null) return '${usd(imagePrice!)}/img';
    if (inputPrice == null && outputPrice == null) return '—';
    return '${usd(inputPrice ?? 0)} / ${usd(outputPrice ?? 0)}';
  }

  static String tokens(int? c) {
    if (c == null) return '—';
    if (c >= 1000000)
      return '${(c / 1000000).toStringAsFixed(c % 1000000 == 0 ? 0 : 1)}M';
    return '${(c / 1000).round()}K';
  }

  String get contextLabel => tokens(contextWindow);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'provider': provider,
    'type': type,
    'desc': description,
    'ctx': contextWindow,
    'out': maxOutput,
    'ip': inputPrice,
    'op': outputPrice,
    'cr': cacheReadPrice,
    'im': inputModalities,
    'om': outputModalities,
    'r': reasoning,
    'tc': toolCall,
    'ow': openWeights,
    'so': structuredOutput,
    'at': attachment,
    'tp': temperature,
    'rd': releaseDate,
    'lu': lastUpdated,
    'kn': knowledge,
    'fam': family,
    'tags': tags,
    'voices': voices,
    'imp': imagePrice,
  };

  factory ModelInfo.fromJson(Map<String, dynamic> j) => ModelInfo(
    id: j['id'],
    name: j['name'] ?? j['id'],
    provider: j['provider'] ?? '',
    type: j['type'] ?? 'language',
    description: j['desc'] ?? '',
    contextWindow: j['ctx'],
    maxOutput: j['out'],
    inputPrice: (j['ip'] as num?)?.toDouble(),
    outputPrice: (j['op'] as num?)?.toDouble(),
    cacheReadPrice: (j['cr'] as num?)?.toDouble(),
    inputModalities: List<String>.from(j['im'] ?? const ['text']),
    outputModalities: List<String>.from(j['om'] ?? const ['text']),
    reasoning: j['r'] ?? false,
    toolCall: j['tc'] ?? false,
    openWeights: j['ow'] ?? false,
    structuredOutput: j['so'] ?? false,
    attachment: j['at'] ?? false,
    temperature: j['tp'] ?? true,
    releaseDate: j['rd'],
    lastUpdated: j['lu'],
    knowledge: j['kn'],
    family: j['fam'],
    tags: List<String>.from(j['tags'] ?? const []),
    voices: List<String>.from(j['voices'] ?? const []),
    imagePrice: (j['imp'] as num?)?.toDouble(),
  );
}

@immutable
class CatalogState {
  const CatalogState({
    this.models = const [],
    this.loading = false,
    this.error,
    this.fetchedAt,
  });

  final List<ModelInfo> models;
  final bool loading;
  final String? error;
  final DateTime? fetchedAt;

  /// Chat models, without batch variants.
  List<ModelInfo> get chatModels => ofKind(ModelKind.text);

  List<ModelInfo> ofKind(ModelKind kind) =>
      models.where((m) => !m.isVariant && m.fits(kind)).toList();

  ModelInfo? byId(String id) => models.where((m) => m.id == id).firstOrNull;

  CatalogState copyWith({
    List<ModelInfo>? models,
    bool? loading,
    String? error,
    DateTime? fetchedAt,
    bool clearError = false,
  }) => CatalogState(
    models: models ?? this.models,
    loading: loading ?? this.loading,
    error: clearError ? null : (error ?? this.error),
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
}

/// Every text model both routers offer, cached for three days.
class ModelCatalog extends Notifier<CatalogState> {
  static const _cacheKey = 'model_catalog.v2';
  static const _cacheTimeKey = 'model_catalog.time.v2';
  static const gatewayModelsUrl = 'https://ai-gateway.vercel.sh/v1/models';
  static const modelsDevUrl = 'https://models.dev/api.json';
  static const openRouterModelsUrl =
      'https://openrouter.ai/api/v1/models?output_modalities=all';
  static const geminiModelsUrl =
      'https://generativelanguage.googleapis.com/v1beta/openai/models';

  @override
  CatalogState build() {
    _loadCache();
    return const CatalogState();
  }

  Future<void> _loadCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_cacheKey);
      if (raw == null) return;
      final t = prefs.getString(_cacheTimeKey);
      state = state.copyWith(
        models: [
          for (final m in jsonDecode(raw) as List)
            ModelInfo.fromJson(Map<String, dynamic>.from(m)),
        ],
        fetchedAt: t == null ? null : DateTime.tryParse(t),
      );
    } catch (e) {
      debugPrint('[Catalog] cache unreadable: $e');
    }
  }

  Future<void> ensureLoaded() async {
    final at = state.fetchedAt;
    if (state.models.isEmpty ||
        at == null ||
        DateTime.now().difference(at) > const Duration(days: 3)) {
      await refresh();
    }
  }

  static Future<String?> _get(
    String url, {
    Duration timeout = const Duration(seconds: 45),
  }) async {
    try {
      final r = await http.get(Uri.parse(url)).timeout(timeout);
      return r.statusCode == 200 ? utf8.decode(r.bodyBytes) : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> refresh() async {
    if (state.loading) return;
    state = state.copyWith(loading: true, clearError: true);
    try {
      final geminiKey = ref.read(settingsProvider).geminiKey.trim();
      final results = await Future.wait([
        _get(gatewayModelsUrl),
        _get(modelsDevUrl, timeout: const Duration(seconds: 60)),
        _get(openRouterModelsUrl),
        if (geminiKey.isNotEmpty) _getAuthed(geminiModelsUrl, geminiKey),
      ]);
      if (results[0] == null &&
          results[2] == null &&
          (results.length < 4 || results[3] == null)) {
        throw Exception(
          'Could not reach the model lists. Check your connection.',
        );
      }
      final merged = await compute(mergeCatalogs, (
        results[0],
        results[1],
        results[2],
      ));
      if (geminiKey.isNotEmpty && results.length > 3 && results[3] != null) {
        merged.addAll(_gemini(results[3]!));
      }
      final now = DateTime.now();
      state = state.copyWith(models: merged, fetchedAt: now, loading: false);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _cacheKey,
        jsonEncode(merged.map((m) => m.toJson()).toList()),
      );
      await prefs.setString(_cacheTimeKey, now.toIso8601String());
    } catch (e) {
      state = state.copyWith(
        loading: false,
        error: '$e'.replaceFirst('Exception: ', ''),
      );
    }
  }

  static Future<String?> _getAuthed(String url, String key) async {
    try {
      final r = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $key'})
          .timeout(const Duration(seconds: 45));
      return r.statusCode == 200 ? utf8.decode(r.bodyBytes) : null;
    } catch (_) {
      return null;
    }
  }
}

final modelCatalogProvider = NotifierProvider<ModelCatalog, CatalogState>(
  ModelCatalog.new,
);

double? _num(dynamic v) =>
    v is num ? v.toDouble() : double.tryParse(v?.toString() ?? '');

double? _perMillion(dynamic v) {
  final d = _num(v);
  return d == null ? null : d * 1000000;
}

String? _str(dynamic v) {
  final s = v?.toString() ?? '';
  return s.isEmpty ? null : s;
}

String? _released(dynamic unix) {
  final n = _num(unix);
  if (n == null || n <= 0) return null;
  return DateTime.fromMillisecondsSinceEpoch(
    (n * 1000).toInt(),
    isUtc: true,
  ).toIso8601String().substring(0, 10);
}

/// models.dev keyed by `provider/model` across all its providers, with the
/// `vercel` and `openrouter` entries taking priority for their own router.
({Map<String, Map> vercel, Map<String, Map> openRouter, Map<String, Map> any})
_modelsDev(String? raw) {
  final vercel = <String, Map>{};
  final openRouter = <String, Map>{};
  final any = <String, Map>{};
  if (raw == null) return (vercel: vercel, openRouter: openRouter, any: any);
  try {
    final all = jsonDecode(raw) as Map<String, dynamic>;
    all.forEach((providerId, p) {
      final models = (p is Map ? p['models'] : null);
      if (models is! Map) return;
      models.forEach((id, m) {
        if (m is! Map) return;
        if (providerId == 'vercel') vercel['$id'] = m;
        if (providerId == 'openrouter') openRouter['$id'] = m;
        any.putIfAbsent('$providerId/$id', () => m);
      });
    });
  } catch (_) {}
  return (vercel: vercel, openRouter: openRouter, any: any);
}

List<ModelInfo> mergeCatalogs((String?, String?, String?) input) {
  final (gateway, modelsDev, openRouter) = input;
  final dev = _modelsDev(modelsDev);
  final out = <ModelInfo>[
    if (gateway != null) ..._vercel(gateway, dev.vercel, dev.any),
    if (openRouter != null) ..._openRouter(openRouter, dev.openRouter, dev.any),
  ];
  out.sort((a, b) {
    final r = a.router.index.compareTo(b.router.index);
    if (r != 0) return r;
    final p = a.provider.compareTo(b.provider);
    if (p != 0) return p;
    return (b.releaseDate ?? '').compareTo(a.releaseDate ?? '');
  });
  return out;
}

List<ModelInfo> _vercel(
  String gateway,
  Map<String, Map> dev,
  Map<String, Map> any,
) {
  final gw = (jsonDecode(gateway)['data'] as List).cast<Map<String, dynamic>>();
  final out = <ModelInfo>[];
  for (final m in gw) {
    final id = m['id'] as String;
    final type = (m['type'] ?? 'language') as String;
    if (!const {'language', 'image', 'speech'}.contains(type)) continue;
    final d = dev[id] ?? any[id];
    final pricing = (m['pricing'] as Map?) ?? const {};
    final mod =
        (m['modalities'] as Map?) ?? d?['modalities'] as Map? ?? const {};
    final outMods = List<String>.from(
      mod['output'] ??
          (type == 'image'
              ? const ['image']
              : (type == 'speech' ? const ['audio'] : const ['text'])),
    );
    final tags = List<String>.from(m['tags'] ?? const []);
    out.add(
      ModelInfo(
        id: id,
        name: (d?['name'] ?? m['name'] ?? id).toString(),
        provider: (m['owned_by'] ?? id.split('/').first).toString(),
        type: type,
        imagePrice: double.tryParse('${pricing['image']}'),
        voices: List<String>.from(m['voices'] ?? const []),
        description: (m['description'] ?? d?['description'] ?? '').toString(),
        contextWindow:
            (m['context_window'] as num?)?.toInt() ??
            (d?['limit']?['context'] as num?)?.toInt(),
        maxOutput:
            (m['max_tokens'] as num?)?.toInt() ??
            (d?['limit']?['output'] as num?)?.toInt(),
        inputPrice:
            _perMillion(pricing['input']) ??
            (d?['cost']?['input'] as num?)?.toDouble(),
        outputPrice:
            _perMillion(pricing['output']) ??
            (d?['cost']?['output'] as num?)?.toDouble(),
        cacheReadPrice:
            _perMillion(pricing['input_cache_read']) ??
            (d?['cost']?['cache_read'] as num?)?.toDouble(),
        inputModalities: List<String>.from(mod['input'] ?? const ['text']),
        outputModalities: outMods,
        reasoning: (d?['reasoning'] as bool?) ?? tags.contains('reasoning'),
        toolCall: (d?['tool_call'] as bool?) ?? tags.contains('tool-use'),
        openWeights:
            (d?['open_weights'] as bool?) ?? tags.contains('open-weights'),
        structuredOutput: (d?['structured_output'] as bool?) ?? false,
        attachment: (d?['attachment'] as bool?) ?? false,
        temperature: (d?['temperature'] as bool?) ?? true,
        releaseDate: _str(d?['release_date']) ?? _released(m['released']),
        lastUpdated: _str(d?['last_updated']),
        knowledge: _str(d?['knowledge'] ?? m['knowledge']),
        family: _str(d?['family']),
        tags: tags,
      ),
    );
  }
  return out;
}

List<ModelInfo> _openRouter(
  String raw,
  Map<String, Map> dev,
  Map<String, Map> any,
) {
  final list = (jsonDecode(raw)['data'] as List).cast<Map<String, dynamic>>();
  final out = <ModelInfo>[];
  for (final m in list) {
    final id = m['id'] as String;
    final arch = (m['architecture'] as Map?) ?? const {};
    final outMods = List<String>.from(
      arch['output_modalities'] ?? const ['text'],
    );
    final String type;
    if (outMods.contains('speech') ||
        outMods.contains('audio') && !outMods.contains('text')) {
      type = 'speech';
    } else if (outMods.contains('text')) {
      type = 'language';
    } else if (outMods.contains('image')) {
      type = 'image';
    } else {
      continue;
    }
    final inMods = List<String>.from(
      arch['input_modalities'] ?? const ['text'],
    );
    final pricing = (m['pricing'] as Map?) ?? const {};
    final params = List.from(m['supported_parameters'] ?? const []);
    final d = dev[id] ?? any[id.replaceAll(':free', '')];
    final prompt = _num(pricing['prompt']);
    final completion = _num(pricing['completion']);
    final cacheRead = _num(pricing['input_cache_read']);
    final name = (m['name'] ?? id).toString();
    out.add(
      ModelInfo(
        id: '${AiRoute.prefix}$id',
        name: name.contains(': ')
            ? name.substring(name.indexOf(': ') + 2)
            : name,
        provider: id.split('/').first,
        type: type,
        voices: List<String>.from(m['supported_voices'] ?? const []),
        imagePrice: outMods.contains('image')
            ? ((_num(pricing['image_output']) ?? completion ?? 0) * 1290)
            : null,
        description: (m['description'] ?? d?['description'] ?? '').toString(),
        contextWindow:
            (m['context_length'] as num?)?.toInt() ??
            (d?['limit']?['context'] as num?)?.toInt(),
        maxOutput:
            (m['top_provider']?['max_completion_tokens'] as num?)?.toInt() ??
            (d?['limit']?['output'] as num?)?.toInt(),
        inputPrice: prompt == null ? null : prompt * 1e6,
        outputPrice: completion == null ? null : completion * 1e6,
        cacheReadPrice: cacheRead == null ? null : cacheRead * 1e6,
        inputModalities: inMods,
        outputModalities: outMods,
        reasoning:
            params.contains('reasoning') || (d?['reasoning'] as bool? ?? false),
        toolCall: params.contains('tools'),
        openWeights:
            (d?['open_weights'] as bool?) ??
            (m['hugging_face_id'] != null &&
                '${m['hugging_face_id']}'.isNotEmpty),
        structuredOutput: params.contains('structured_outputs'),
        attachment: (d?['attachment'] as bool?) ?? false,
        temperature: params.contains('temperature'),
        releaseDate: _str(d?['release_date']) ?? _released(m['created']),
        lastUpdated: _str(d?['last_updated']),
        knowledge: _str(d?['knowledge']),
        family: _str(d?['family']),
      ),
    );
  }
  return out;
}

/// Gemini's OpenAI-compatible model list is scoped to the user's API key.
/// Its ids come as `models/gemini-…`; chat completions take the bare name.
/// Embedding, live (native audio) and TTS models can't chat through that
/// endpoint, so they are left out; image models are marked as such.
List<ModelInfo> _gemini(String raw) {
  final data = (jsonDecode(raw) as Map)['data'] as List? ?? const [];
  final out = <ModelInfo>[];
  final seen = <String>{};
  for (final item in data.whereType<Map>()) {
    final id = '${item['id']}'.replaceFirst('models/', '');
    if (!id.startsWith('gemini-') || !seen.add(id)) continue;
    if (RegExp(r'embedding|live|native-audio|tts|aqa').hasMatch(id)) continue;
    final image = id.contains('image');
    out.add(
      ModelInfo(
        id: '${AiRoute.geminiPrefix}$id',
        name: '${item['display_name'] ?? id}',
        provider: 'Google AI Studio',
        type: image ? 'image' : 'language',
        description: 'Available through this Google AI Studio key.',
        inputModalities: const ['text', 'image', 'audio', 'file'],
        outputModalities: image ? const ['image', 'text'] : const ['text'],
        reasoning: !image && !id.startsWith('gemini-2.0'),
        toolCall: !image,
        attachment: !image,
      ),
    );
  }
  return out;
}
