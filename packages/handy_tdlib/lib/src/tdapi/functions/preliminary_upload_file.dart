part of '../tdapi.dart';

/// **PreliminaryUploadFile** *(preliminaryUploadFile)* - TDLib function
///
/// Preliminarily uploads a file to the cloud before sending it in a message, which can be useful for uploading of being recorded voice and video notes.. In all other cases there is no need to preliminary upload a file. Updates updateFile will be used to notify about upload progress.. The upload will not be completed until the file is sent in a message.
///
/// * [file]: File to upload.
/// * [fileType]: File type; pass null if unknown *(optional)*.
/// * [priority]: Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which preliminaryUploadFile was called will be uploaded first.
///
/// [File] is returned on completion.
final class PreliminaryUploadFile extends TdFunction {
  /// **PreliminaryUploadFile** *(preliminaryUploadFile)* - TDLib function
  ///
  /// Preliminarily uploads a file to the cloud before sending it in a message, which can be useful for uploading of being recorded voice and video notes.. In all other cases there is no need to preliminary upload a file. Updates updateFile will be used to notify about upload progress.. The upload will not be completed until the file is sent in a message.
  ///
  /// * [file]: File to upload.
  /// * [fileType]: File type; pass null if unknown *(optional)*.
  /// * [priority]: Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which preliminaryUploadFile was called will be uploaded first.
  ///
  /// [File] is returned on completion.
  const PreliminaryUploadFile({
    required this.file,
    this.fileType,
    required this.priority,
  });

  /// File to upload
  final InputFile file;

  /// File type; pass null if unknown
  final FileType? fileType;

  /// Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which preliminaryUploadFile was called will be uploaded first
  final int priority;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file": file.toJson(),
      "file_type": fileType?.toJson(),
      "priority": priority,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file]: File to upload
  /// * [file_type]: File type; pass null if unknown
  /// * [priority]: Priority of the upload (1-32). The higher the priority, the earlier the file will be uploaded. If the priorities of two files are equal, then the first one for which preliminaryUploadFile was called will be uploaded first
  PreliminaryUploadFile copyWith({
    InputFile? file,
    FileType? fileType,
    int? priority,
  }) =>
      PreliminaryUploadFile(
        file: file ?? this.file,
        fileType: fileType ?? this.fileType,
        priority: priority ?? this.priority,
      );

  /// TDLib object type
  static const String defaultObjectId = 'preliminaryUploadFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
