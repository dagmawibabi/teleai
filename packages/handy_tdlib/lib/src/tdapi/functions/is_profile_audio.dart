part of '../tdapi.dart';

/// **IsProfileAudio** *(isProfileAudio)* - TDLib function
///
/// Checks whether a file is in the profile audio files of the current user. Returns a 404 error if it isn't.
///
/// * [fileId]: Identifier of the audio file to check.
///
/// [Ok] is returned on completion.
final class IsProfileAudio extends TdFunction {
  /// **IsProfileAudio** *(isProfileAudio)* - TDLib function
  ///
  /// Checks whether a file is in the profile audio files of the current user. Returns a 404 error if it isn't.
  ///
  /// * [fileId]: Identifier of the audio file to check.
  ///
  /// [Ok] is returned on completion.
  const IsProfileAudio({
    required this.fileId,
  });

  /// Identifier of the audio file to check
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
  /// * [file_id]: Identifier of the audio file to check
  IsProfileAudio copyWith({
    int? fileId,
  }) =>
      IsProfileAudio(
        fileId: fileId ?? this.fileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'isProfileAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
