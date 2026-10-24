part of '../tdapi.dart';

/// **ListenToAudio** *(listenToAudio)* - TDLib function
///
/// Informs TDLib that an audio was listened by the user.
///
/// * [audioFileId]: Identifier of the file with an audio.
/// * [duration]: Duration of the listening to the audio, in seconds.
///
/// [Ok] is returned on completion.
final class ListenToAudio extends TdFunction {
  /// **ListenToAudio** *(listenToAudio)* - TDLib function
  ///
  /// Informs TDLib that an audio was listened by the user.
  ///
  /// * [audioFileId]: Identifier of the file with an audio.
  /// * [duration]: Duration of the listening to the audio, in seconds.
  ///
  /// [Ok] is returned on completion.
  const ListenToAudio({
    required this.audioFileId,
    required this.duration,
  });

  /// Identifier of the file with an audio
  final int audioFileId;

  /// Duration of the listening to the audio, in seconds
  final int duration;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "audio_file_id": audioFileId,
      "duration": duration,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio_file_id]: Identifier of the file with an audio
  /// * [duration]: Duration of the listening to the audio, in seconds
  ListenToAudio copyWith({
    int? audioFileId,
    int? duration,
  }) =>
      ListenToAudio(
        audioFileId: audioFileId ?? this.audioFileId,
        duration: duration ?? this.duration,
      );

  /// TDLib object type
  static const String defaultObjectId = 'listenToAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
