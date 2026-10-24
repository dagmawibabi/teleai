part of '../tdapi.dart';

/// **SetProfileAudioPosition** *(setProfileAudioPosition)* - TDLib function
///
/// Changes position of an audio file in the profile audio files of the current user.
///
/// * [fileId]: Identifier of the file from profile audio files, which position will be changed.
/// * [afterFileId]: Identifier of the file from profile audio files after which the file will be positioned; pass 0 to move the file to the beginning of the list.
///
/// [Ok] is returned on completion.
final class SetProfileAudioPosition extends TdFunction {
  /// **SetProfileAudioPosition** *(setProfileAudioPosition)* - TDLib function
  ///
  /// Changes position of an audio file in the profile audio files of the current user.
  ///
  /// * [fileId]: Identifier of the file from profile audio files, which position will be changed.
  /// * [afterFileId]: Identifier of the file from profile audio files after which the file will be positioned; pass 0 to move the file to the beginning of the list.
  ///
  /// [Ok] is returned on completion.
  const SetProfileAudioPosition({
    required this.fileId,
    required this.afterFileId,
  });

  /// Identifier of the file from profile audio files, which position will be changed
  final int fileId;

  /// Identifier of the file from profile audio files after which the file will be positioned; pass 0 to move the file to the beginning of the list
  final int afterFileId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "after_file_id": afterFileId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the file from profile audio files, which position will be changed
  /// * [after_file_id]: Identifier of the file from profile audio files after which the file will be positioned; pass 0 to move the file to the beginning of the list
  SetProfileAudioPosition copyWith({
    int? fileId,
    int? afterFileId,
  }) =>
      SetProfileAudioPosition(
        fileId: fileId ?? this.fileId,
        afterFileId: afterFileId ?? this.afterFileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setProfileAudioPosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
