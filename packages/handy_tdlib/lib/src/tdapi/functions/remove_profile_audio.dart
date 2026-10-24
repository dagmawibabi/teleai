part of '../tdapi.dart';

/// **RemoveProfileAudio** *(removeProfileAudio)* - TDLib function
///
/// Removes an audio file from the profile audio files of the current user.
///
/// * [fileId]: Identifier of the audio file to be removed.
///
/// [Ok] is returned on completion.
final class RemoveProfileAudio extends TdFunction {
  /// **RemoveProfileAudio** *(removeProfileAudio)* - TDLib function
  ///
  /// Removes an audio file from the profile audio files of the current user.
  ///
  /// * [fileId]: Identifier of the audio file to be removed.
  ///
  /// [Ok] is returned on completion.
  const RemoveProfileAudio({
    required this.fileId,
  });

  /// Identifier of the audio file to be removed
  final int fileId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the audio file to be removed
  RemoveProfileAudio copyWith({
    int? fileId,
  }) =>
      RemoveProfileAudio(
        fileId: fileId ?? this.fileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeProfileAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
