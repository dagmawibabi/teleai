import 'package:omni_ai/omni_ai.dart' as omni;

/// Generates creative audio through the app's configured ElevenLabs provider.
Future<omni.GeneratedFile> generateElevenLabsAudio(
  omni.OmniAI ai,
  Map<String, dynamic> args, {
  required bool music,
  omni.CancelToken? cancelToken,
}) {
  final prompt = '${args['prompt'] ?? ''}'.trim();
  if (prompt.isEmpty) throw ArgumentError('Give a non-empty prompt.');
  final rawDuration = args['duration_seconds'];
  if (rawDuration != null &&
      (rawDuration is! num || !rawDuration.isFinite || rawDuration <= 0)) {
    throw ArgumentError('duration_seconds must be a positive number.');
  }
  final seconds = (rawDuration as num?)?.toDouble();
  if (music) {
    return ai.elevenLabs.music(
      prompt,
      length: Duration(milliseconds: ((seconds ?? 30) * 1000).round()),
      cancelToken: cancelToken,
    );
  }
  final influence = args['prompt_influence'];
  if (influence != null &&
      (influence is! num ||
          !influence.isFinite ||
          influence < 0 ||
          influence > 1)) {
    throw ArgumentError('prompt_influence must be between 0 and 1.');
  }
  return ai.elevenLabs.soundEffect(
    prompt,
    durationSeconds: seconds,
    promptInfluence: (influence as num?)?.toDouble(),
    loop: args['loop'] == true,
    cancelToken: cancelToken,
  );
}
