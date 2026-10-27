import 'package:flutter_riverpod/legacy.dart';
import 'package:omni_ai/omni_ai.dart';

import '../ai/data/ai.dart';
import '../settings/data/settings.dart';
import '../usage/usage.dart';

export 'package:omni_ai/omni_ai.dart' show Dictation, joinDictation;

/// Speech to text for the input boxes: omni_ai's [Dictation], with the
/// engine from Settings (the device's recognizer, live, or a recording sent
/// to an AI model or ElevenLabs Scribe when it stops). Cloud transcriptions
/// are counted in Usage.
final dictationProvider = ChangeNotifierProvider<Dictation>((ref) {
  final ai = ref.watch(aiProvider);
  final d = Dictation();
  void sync(AppSettings s) {
    d.model = switch (s.dictationEngine) {
      DictationEngine.device => null,
      DictationEngine.elevenLabs => ai.transcriptionModel('elevenlabs:scribe_v1'),
      DictationEngine.ai => ai.transcriptionModel(canonicalModelId(s.transcriptionModel)),
    };
  }

  sync(ref.read(settingsProvider));
  ref.listen(settingsProvider, (_, s) => sync(s));
  d.onTranscribed = (result, audio) {
    final model = '${d.model!.provider}:${d.model!.modelId}';
    final seconds = audio.inMilliseconds / 1000;
    final eleven = d.model!.provider == 'elevenlabs';
    ref
        .read(usageProvider.notifier)
        .add(
          UsageEvent(
            at: DateTime.now(),
            model: model,
            modality: Modality.dictation,
            units: seconds.ceil(),
            // Scribe is about $0.40 an hour; chat models hear about 32
            // tokens a second.
            cost: eleven
                ? seconds * 0.40 / 3600
                : ref.read(modelCatalogProvider).byId(model)?.estimateCost((seconds * 32).round(), result.text.length ~/ 4) ?? 0,
            estimated: true,
          ),
        );
  };
  return d;
});
