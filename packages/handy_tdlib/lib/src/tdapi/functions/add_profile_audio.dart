part of '../tdapi.dart';

/// **AddProfileAudio** *(addProfileAudio)* - TDLib function
///
/// Adds an audio file to the beginning of the profile audio files of the current user.
///
/// * [audio]: The audio to add.
///
/// [Ok] is returned on completion.
final class AddProfileAudio extends TdFunction {
  /// **AddProfileAudio** *(addProfileAudio)* - TDLib function
  ///
  /// Adds an audio file to the beginning of the profile audio files of the current user.
  ///
  /// * [audio]: The audio to add.
  ///
  /// [Ok] is returned on completion.
  const AddProfileAudio({
    required this.audio,
  });

  /// The audio to add
  final InputAudio audio;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "audio": audio.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio]: The audio to add
  AddProfileAudio copyWith({
    InputAudio? audio,
  }) =>
      AddProfileAudio(
        audio: audio ?? this.audio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addProfileAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
