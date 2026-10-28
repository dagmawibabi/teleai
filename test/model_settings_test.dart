import 'package:flutter_test/flutter_test.dart';
import 'package:teleai/features/ai/data/ai.dart';
import 'package:teleai/features/ai/data/decision_settings.dart';
import 'package:teleai/features/ai/data/selected_models.dart';
import 'package:teleai/features/settings/data/settings.dart';

void main() {
  test('reports every selected model and its readiness', () {
    const settings = AppSettings(
      loaded: true,
      model: 'gateway:anthropic/claude-sonnet-5.5',
      imageModel: 'gateway:google/gemini-3.1-flash-lite-image',
      videoModel: 'gateway:google/veo-3',
      elevenKey: 'el-key',
      voiceEngine: VoiceEngine.elevenLabs,
      elevenModel: 'eleven_flash_v2_5',
      elevenVoiceId: 'voice-123',
      elevenVoiceName: 'Aria',
      dictationEngine: DictationEngine.ai,
      transcriptionModel: 'gateway:google/gemini-3-flash',
      aiChatEnabled: true,
      mediaEnabled: true,
      videoEnabled: true,
      voiceEnabled: true,
    );
    const decisions = DecisionSettings(
      loaded: true,
      apiKey: 'jev-key',
      enabled: true,
      model: 'jev-1.14.0',
      threshold: 0.7,
    );

    final result = selectedModels(
      settings: settings,
      decisions: decisions,
      catalog: const CatalogState(),
      providerReady: (id) => id == 'gateway',
    );

    expect(
      result['text'],
      containsPair('model', 'gateway:anthropic/claude-sonnet-5.5'),
    );
    expect(result['text'], containsPair('enabled', true));
    expect(result['text'], containsPair('available', true));
    expect(result['decisions'], containsPair('model', 'jev-1.14.0'));
    expect(result['decisions'], containsPair('provider', 'TypeSafe Jev'));
    expect(result['decisions'], containsPair('threshold', 0.7));
    expect(
      result['image'],
      containsPair('model', 'gateway:google/gemini-3.1-flash-lite-image'),
    );
    expect(result['image'], containsPair('enabled', true));
    expect(result['video'], containsPair('model', 'gateway:google/veo-3'));
    expect(result['video'], containsPair('configured', true));

    final audio = result['audio'] as Map<String, dynamic>;
    expect(audio['enabled'], isTrue);
    final output = audio['output'] as Map<String, dynamic>;
    expect(output['engine'], 'ElevenLabs');
    expect(output['model'], 'elevenlabs:eleven_flash_v2_5');
    expect(output['voice_id'], 'voice-123');
    expect(output['voice_name'], 'Aria');
    expect(output['available'], isTrue);
    final dictation = audio['dictation'] as Map<String, dynamic>;
    expect(dictation['engine'], 'AI model');
    expect(dictation['model'], 'gateway:google/gemini-3-flash');
    expect(dictation['available'], isTrue);
  });

  test('reports an unchosen video model and device engines', () {
    const settings = AppSettings(
      loaded: true,
      videoModel: '',
      voiceEngine: VoiceEngine.device,
      dictationEngine: DictationEngine.device,
    );

    final result = selectedModels(
      settings: settings,
      decisions: const DecisionSettings(),
      catalog: const CatalogState(),
      providerReady: (_) => false,
    );

    final video = result['video'] as Map<String, dynamic>;
    expect(video['model'], isNull);
    expect(video['configured'], isFalse);
    expect(video['available'], isFalse);
    final audio = result['audio'] as Map<String, dynamic>;
    final output = audio['output'] as Map<String, dynamic>;
    expect(output['engine'], 'Device');
    expect(output['model'], isNull);
    expect(output['available'], isTrue);
    final dictation = audio['dictation'] as Map<String, dynamic>;
    expect(dictation['engine'], 'Device');
    expect(dictation['model'], isNull);
    expect(dictation['available'], isTrue);
  });

  test('reports Addis AI output and ElevenLabs dictation', () {
    const settings = AppSettings(
      loaded: true,
      addisKey: 'addis-key',
      elevenKey: 'eleven-key',
      voiceEngine: VoiceEngine.addis,
      aiVoice: 'am-voice',
      dictationEngine: DictationEngine.elevenLabs,
    );

    final result = selectedModels(
      settings: settings,
      decisions: const DecisionSettings(),
      catalog: const CatalogState(),
      providerReady: (_) => false,
    );

    final audio = result['audio'] as Map<String, dynamic>;
    final output = audio['output'] as Map<String, dynamic>;
    expect(output['engine'], 'Addis AI');
    expect(output['model'], 'addis:voices-2');
    expect(output['voice_id'], 'am-voice');
    expect(output['available'], isTrue);
    final dictation = audio['dictation'] as Map<String, dynamic>;
    expect(dictation['engine'], 'ElevenLabs');
    expect(dictation['model'], 'elevenlabs:scribe_v1');
    expect(dictation['available'], isTrue);
  });
}
