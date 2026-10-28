import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omni_ai/omni_ai.dart';

import '../../settings/data/settings.dart';
import 'decision_settings.dart';

export 'package:omni_ai/omni_ai.dart' show ModelInfo, ModelType, Voice;

/// Every AI call in the app goes through this one [OmniAI]: chat and tools,
/// images, voices, dictation and the model lists. Keys live in [AppSettings]
/// (the app's own secure storage) and are handed to it as they change.
final aiProvider = Provider<OmniAI>((ref) {
  final ai = OmniAI(
    keyStore: SecureKeyStore(prefix: 'triangle.ai.'),
    loadSavedKeys: false,
    appName: 'Triangle',
    appUrl: 'https://github.com/dagmawibabi/triangle',
  );
  // Installed MCP servers and skills, read now: a new client (after a
  // restore, say) would otherwise list none until something asked.
  unawaited(ai.mcp.load());
  unawaited(ai.skills.load());
  void sync(AppSettings s) {
    // Unchanged keys are ignored, so this is cheap on every settings change.
    ai.setApiKey('gateway', s.vercelKey, persist: false);
    ai.setApiKey('openrouter', s.openRouterKey, persist: false);
    ai.setApiKey('google', s.geminiKey, persist: false);
    ai.setApiKey('lmstudio', s.lmStudioUrl, persist: false);
    ai.setApiKey('elevenlabs', s.elevenKey, persist: false);
    ai.setApiKey('addis', s.addisKey, persist: false);
  }

  // Models and voice engines follow the keys: when they load and whenever
  // one is added or removed, not when the person picks something (a model
  // whose key they are about to add stays). After the provider is built,
  // since that writes settings.
  void fit(AppSettings? before, AppSettings s) {
    if (!s.loaded || (before != null && before.loaded && !keysChanged(before, s))) return;
    final f = fitToKeys(ai, s, before: before);
    if (f.chat == s.model &&
        f.image == s.imageModel &&
        f.speech == s.speechModel &&
        f.transcription == s.transcriptionModel &&
        f.voiceEngine == s.voiceEngine &&
        f.dictationEngine == s.dictationEngine) {
      return;
    }
    Future.microtask(
      () => ref
          .read(settingsProvider.notifier)
          .useModels(
            chat: f.chat,
            image: f.image,
            speech: f.speech,
            transcription: f.transcription,
            voiceEngine: f.voiceEngine,
            dictationEngine: f.dictationEngine,
          ),
    );
  }

  sync(ref.read(settingsProvider));
  void syncDecisions(DecisionSettings s) {
    ai.setApiKey('jev', s.apiKey, persist: false);
    ai.jev.model = s.model;
    ai.jev.threshold = s.threshold;
    ai.jev.minConfidence = s.gateConfidence ? s.minConfidence : null;
    ai.jev.longContext = s.longContext;
    ai.jev.client.baseUrl = s.baseUrl;
    ai.jev.client.maxRetries = s.maxRetries;
    ai.jev.client.timeout = Duration(seconds: s.timeoutSeconds);
  }
  syncDecisions(ref.read(decisionSettingsProvider));
  ref.listen(decisionSettingsProvider, (_, next) => syncDecisions(next));
  fit(null, ref.read(settingsProvider));
  // A service without default models (LM Studio) gets one once its list
  // loads.
  var listed = 0;
  void refit() {
    if (ai.catalog.models.length == listed) return;
    listed = ai.catalog.models.length;
    fit(null, ref.read(settingsProvider));
  }

  ai.catalog.addListener(refit);
  ref.onDispose(() => ai.catalog.removeListener(refit));
  ref.listen(settingsProvider, (before, s) {
    sync(s);
    fit(before, s);
  });
  ref.onDispose(ai.dispose);
  ref.onDispose(() { ai.mcp.dispose(); });
  return ai;
});

/// The services chat, image, voice and dictation models are picked from,
/// by their omni_ai provider id.
enum AiRouter {
  vercel('gateway', 'Vercel', 'Vercel AI Gateway'),
  openRouter('openrouter', 'OpenRouter', 'OpenRouter'),
  gemini('google', 'Gemini', 'Google AI Studio'),
  lmStudio('lmstudio', 'LM Studio', 'LM Studio');

  const AiRouter(this.providerId, this.short, this.title);
  final String providerId;
  final String short;
  final String title;

  static AiRouter? of(String modelId) {
    final provider = canonicalModelId(modelId).split(':').first;
    return values.where((r) => r.providerId == provider).firstOrNull;
  }

  /// "Vercel AI Gateway", or the provider id for one the app doesn't list.
  static String nameOf(String modelId) => of(modelId)?.title ?? canonicalModelId(modelId).split(':').first;
}

const _providerPrefixes = ['gateway:', 'openrouter:', 'google:', 'lmstudio:', 'elevenlabs:', 'addis:'];

/// An omni_ai model id (`gateway:openai/gpt-5`) for one saved by earlier
/// versions of the app: `or:` meant OpenRouter, `g:` Google AI Studio, and
/// no prefix the Vercel AI Gateway.
String canonicalModelId(String id) {
  if (id.startsWith('or:')) return 'openrouter:${id.substring(3)}';
  if (id.startsWith('g:')) return 'google:${id.substring(2)}';
  if (id.isEmpty || _providerPrefixes.any(id.startsWith)) return id;
  return 'gateway:$id';
}

/// The models and engines to use with the keys in [s]: each model whose
/// service has no key becomes a default of one that does, an engine whose
/// key is gone falls back to one that works, and a newly added ElevenLabs
/// key ([before] → [s]) switches reading aloud to ElevenLabs.
({String chat, String image, String speech, String transcription, VoiceEngine voiceEngine, DictationEngine dictationEngine})
fitToKeys(OmniAI ai, AppSettings s, {AppSettings? before}) {
  bool aiFor(ModelType type) => keyedModel(ai, type) != null;
  final elevenAdded = before != null && before.loaded && !before.hasElevenKey && s.hasElevenKey;
  var voice = s.voiceEngine;
  if (elevenAdded && voice != VoiceEngine.addis) voice = VoiceEngine.elevenLabs;
  final voiceWorks = switch (voice) {
    VoiceEngine.device => true,
    VoiceEngine.ai => aiFor(ModelType.speech),
    VoiceEngine.addis => s.hasAddisKey,
    VoiceEngine.elevenLabs => s.hasElevenKey,
  };
  if (!voiceWorks) {
    voice = s.hasElevenKey ? VoiceEngine.elevenLabs : (aiFor(ModelType.speech) ? VoiceEngine.ai : VoiceEngine.device);
  }
  var dictation = s.dictationEngine;
  final dictationWorks = switch (dictation) {
    DictationEngine.device => true,
    DictationEngine.ai => aiFor(ModelType.transcription),
    DictationEngine.elevenLabs => s.hasElevenKey,
  };
  if (!dictationWorks) dictation = aiFor(ModelType.transcription) ? DictationEngine.ai : DictationEngine.device;
  return (
    chat: usableModel(ai, s.model, ModelType.text),
    image: usableModel(ai, s.imageModel, ModelType.image),
    speech: usableModel(ai, s.speechModel, ModelType.speech),
    transcription: usableModel(ai, s.transcriptionModel, ModelType.transcription),
    voiceEngine: voice,
    dictationEngine: dictation,
  );
}

/// Whether a key (or the LM Studio address) was added, changed or removed.
bool keysChanged(AppSettings a, AppSettings b) =>
    a.vercelKey != b.vercelKey ||
    a.openRouterKey != b.openRouterKey ||
    a.geminiKey != b.geminiKey ||
    a.lmStudioUrl != b.lmStudioUrl ||
    a.elevenKey != b.elevenKey ||
    a.addisKey != b.addisKey;

/// [id] when its service has a key; otherwise the default [type] model of
/// the first service the person added a key for (Vercel AI Gateway,
/// OpenRouter, Google AI Studio, then LM Studio). Unchanged when no service has one.
String usableModel(OmniAI ai, String id, ModelType type) {
  final c = canonicalModelId(id);
  final router = AiRouter.of(c);
  if (router == null || ai.provider(router.providerId).isConfigured) return c;
  return keyedModel(ai, type) ?? c;
}

/// A [type] model of a service with a key: its default, or (for one with
/// no defaults, like LM Studio) the first model it lists. Null when none.
String? keyedModel(OmniAI ai, ModelType type) {
  bool keyed(AiRouter r) => ai.provider(r.providerId).isConfigured;
  for (final r in AiRouter.values.where(keyed)) {
    final model = ai.provider(r.providerId).defaultModels[type];
    if (model != null) return '${r.providerId}:$model';
  }
  for (final m in ai.catalog.models) {
    final r = AiRouter.of(m.id);
    if (r != null && keyed(r) && !m.isVariant && m.supports(type)) return m.id;
  }
  return null;
}

/// The model's own id without the provider: `openai/gpt-5`.
String modelLabel(String id) {
  final c = canonicalModelId(id);
  final colon = c.indexOf(':');
  return colon < 0 ? c : c.substring(colon + 1);
}

/// The app's thinking setting as omni_ai's reasoning effort. Auto leaves it
/// to the model.
ReasoningEffort? reasoningFor(Thinking t) => switch (t) {
  Thinking.auto => null,
  Thinking.off => ReasoningEffort.none,
  Thinking.low => ReasoningEffort.low,
  Thinking.medium => ReasoningEffort.medium,
  Thinking.high => ReasoningEffort.high,
};

/// A sentence for the person: where to add a missing key, or what the
/// provider said.
String aiErrorText(Object e) => switch (e) {
  MissingApiKeyException(:final provider) =>
    'Add ${switch (provider) {
      'gateway' => 'a Vercel AI Gateway',
      'openrouter' => 'an OpenRouter',
      'google' => 'a Google AI Studio Gemini',
      'elevenlabs' => 'an ElevenLabs',
      'addis' => 'an Addis AI',
      _ => 'an API',
    }} key in Settings to use this model.',
  AiCancelledException() => 'Stopped.',
  AiException(:final message) => message,
  _ => '$e',
};

/// How the app's screens group and sort catalog models.
extension AppModelInfo on ModelInfo {
  /// The service it is reached through.
  AiRouter? get router => AiRouter.of(id);

  /// Who makes it (`anthropic`), for the maker filter.
  String get maker => lab ?? (modelId.contains('/') ? modelId.split('/').first : provider);

  bool get isText => supports(ModelType.text) && outputModalities.contains('text');

  /// "Chat", "Image", "Voice"…: what kind of model it is.
  String get kindLabel => types.map((t) => t.label).join(', ');
}

extension ModelPickerTitle on ModelType {
  /// "Chat model", "Voice model"…
  String get pickerTitle => '$label model';
}

/// The model lists of every router the app uses, with models.dev details.
@immutable
class CatalogState {
  const CatalogState({this.models = const [], this.loading = false, this.error, this.fetchedAt, this.providerErrors = const {}});

  final List<ModelInfo> models;
  final bool loading;
  final String? error;
  final DateTime? fetchedAt;

  /// What went wrong listing each provider's models, by omni_ai provider id.
  final Map<String, String> providerErrors;

  /// Models of a router for [type], without batch variants. ElevenLabs and
  /// Addis AI have engines of their own in Settings, so they aren't listed.
  List<ModelInfo> ofKind(ModelType type) => models
      .where((m) => !m.isVariant && m.supports(type) && AiRouter.of(m.id) != null)
      .where((m) => type != ModelType.text || m.outputModalities.contains('text'))
      .toList();

  ModelInfo? byId(String id) {
    final c = canonicalModelId(id);
    return models.where((m) => m.id == c).firstOrNull;
  }
}

class ModelCatalogNotifier extends Notifier<CatalogState> {
  @override
  CatalogState build() {
    final catalog = ref.watch(aiProvider).catalog;
    void sync() => state = _read(catalog);
    catalog.addListener(sync);
    ref.onDispose(() => catalog.removeListener(sync));
    return _read(catalog);
  }

  static CatalogState _read(ModelCatalog c) => CatalogState(
    models: c.models,
    loading: c.loading,
    fetchedAt: c.fetchedAt,
    providerErrors: c.errors,
    error: c.models.isEmpty && c.errors.isNotEmpty ? 'Could not reach the model lists. Check your connection.' : null,
  );

  ModelCatalog get _catalog => ref.read(aiProvider).catalog;

  /// The cached lists, refreshed when they are more than three days old.
  Future<void> ensureLoaded() => _catalog.load();

  Future<void> refresh() => _catalog.refresh();
}

final modelCatalogProvider = NotifierProvider<ModelCatalogNotifier, CatalogState>(ModelCatalogNotifier.new);
