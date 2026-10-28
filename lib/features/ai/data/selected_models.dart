import '../../settings/data/settings.dart';
import 'ai.dart';
import 'decision_settings.dart';

/// The models chosen in AI & models, with what each is called and whether it
/// can be used right now.
Map<String, dynamic> selectedModels({
  required AppSettings settings,
  required DecisionSettings decisions,
  required CatalogState catalog,
  required bool Function(String providerId) providerReady,
}) {
  String providerName(String id) {
    final model = canonicalModelId(id);
    return switch (model.split(':').first) {
      'elevenlabs' => 'ElevenLabs',
      'addis' => 'Addis AI',
      _ => AiRouter.nameOf(model),
    };
  }

  bool available(String id) {
    final model = canonicalModelId(id);
    final router = AiRouter.of(model);
    if (router != null) return providerReady(router.providerId);
    return switch (model.split(':').first) {
      'elevenlabs' => settings.hasElevenKey,
      'addis' => settings.hasAddisKey,
      _ => false,
    };
  }

  Map<String, dynamic> entry(String id, {bool? enabled, bool? isAvailable}) {
    final model = canonicalModelId(id);
    final info = catalog.byId(model);
    return {
      'model': model,
      'name': info?.name ?? modelLabel(model),
      'provider': providerName(model),
      'maker': ?info?.lab,
      'enabled': ?enabled,
      'available': isAvailable ?? available(model),
    };
  }

  final output = switch (settings.voiceEngine) {
    VoiceEngine.device => {
      'engine': VoiceEngine.device.label,
      'model': null,
      'name': null,
      'provider': null,
      'voice_id': null,
      'voice_name': settings.deviceVoice.isEmpty ? null : settings.deviceVoice,
      'available': true,
    },
    VoiceEngine.ai => {
      ...entry(settings.speechModel),
      'engine': VoiceEngine.ai.label,
      'voice_id': settings.aiVoice.isEmpty ? null : settings.aiVoice,
      'voice_name': settings.aiVoice.isEmpty ? null : settings.aiVoice,
    },
    VoiceEngine.addis => {
      ...entry('addis:voices-2'),
      'engine': VoiceEngine.addis.label,
      'voice_id': settings.aiVoice.isEmpty ? null : settings.aiVoice,
      'voice_name': settings.aiVoice.isEmpty ? null : settings.aiVoice,
    },
    VoiceEngine.elevenLabs => {
      ...entry('elevenlabs:${settings.elevenModel}'),
      'engine': VoiceEngine.elevenLabs.label,
      'voice_id': settings.elevenVoiceId.isEmpty
          ? null
          : settings.elevenVoiceId,
      'voice_name': settings.elevenVoiceName.isEmpty
          ? null
          : settings.elevenVoiceName,
    },
  };

  final dictation = switch (settings.dictationEngine) {
    DictationEngine.device => {
      'engine': DictationEngine.device.label,
      'model': null,
      'name': null,
      'provider': null,
      'available': true,
    },
    DictationEngine.ai => {
      ...entry(settings.transcriptionModel),
      'engine': DictationEngine.ai.label,
    },
    DictationEngine.elevenLabs => {
      ...entry('elevenlabs:scribe_v1'),
      'engine': DictationEngine.elevenLabs.label,
    },
  };

  return {
    'text': entry(settings.model, enabled: settings.aiChatEnabled),
    'decisions': {
      'model': decisions.model,
      'name': decisions.model,
      'provider': 'TypeSafe Jev',
      'enabled': decisions.enabled,
      'available': decisions.apiKey.trim().isNotEmpty,
      'threshold': decisions.threshold,
    },
    'image': entry(settings.imageModel, enabled: settings.mediaEnabled),
    'video': settings.videoModel.isEmpty
        ? {
            'model': null,
            'name': null,
            'provider': null,
            'configured': false,
            'enabled': settings.videoEnabled,
            'available': false,
          }
        : {
            ...entry(settings.videoModel, enabled: settings.videoEnabled),
            'configured': true,
          },
    'audio': {
      'enabled': settings.voiceEnabled,
      'speech_rate': settings.speechRate,
      'output': output,
      'dictation': dictation,
    },
  };
}
