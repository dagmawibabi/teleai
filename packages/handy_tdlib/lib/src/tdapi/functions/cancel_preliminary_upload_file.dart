part of '../tdapi.dart';

/// **CancelPreliminaryUploadFile** *(cancelPreliminaryUploadFile)* - TDLib function
///
/// Stops the preliminary uploading of a file. Supported only for files uploaded by using preliminaryUploadFile.
///
/// * [fileId]: Identifier of the file to stop uploading.
///
/// [Ok] is returned on completion.
final class CancelPreliminaryUploadFile extends TdFunction {
  /// **CancelPreliminaryUploadFile** *(cancelPreliminaryUploadFile)* - TDLib function
  ///
  /// Stops the preliminary uploading of a file. Supported only for files uploaded by using preliminaryUploadFile.
  ///
  /// * [fileId]: Identifier of the file to stop uploading.
  ///
  /// [Ok] is returned on completion.
  const CancelPreliminaryUploadFile({
    required this.fileId,
  });

  /// Identifier of the file to stop uploading
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
  /// * [file_id]: Identifier of the file to stop uploading
  CancelPreliminaryUploadFile copyWith({
    int? fileId,
  }) =>
      CancelPreliminaryUploadFile(
        fileId: fileId ?? this.fileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'cancelPreliminaryUploadFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
