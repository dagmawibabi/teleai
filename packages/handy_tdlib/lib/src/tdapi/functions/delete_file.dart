part of '../tdapi.dart';

/// **DeleteFile** *(deleteFile)* - TDLib function
///
/// Deletes a file from the TDLib file cache.
///
/// * [fileId]: Identifier of the file to delete.
///
/// [Ok] is returned on completion.
final class DeleteFile extends TdFunction {
  /// **DeleteFile** *(deleteFile)* - TDLib function
  ///
  /// Deletes a file from the TDLib file cache.
  ///
  /// * [fileId]: Identifier of the file to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteFile({
    required this.fileId,
  });

  /// Identifier of the file to delete
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
  /// * [file_id]: Identifier of the file to delete
  DeleteFile copyWith({
    int? fileId,
  }) =>
      DeleteFile(
        fileId: fileId ?? this.fileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
