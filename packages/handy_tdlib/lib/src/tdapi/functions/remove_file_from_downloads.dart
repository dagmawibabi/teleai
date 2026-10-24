part of '../tdapi.dart';

/// **RemoveFileFromDownloads** *(removeFileFromDownloads)* - TDLib function
///
/// Removes a file from the file download list.
///
/// * [fileId]: Identifier of the downloaded file.
/// * [deleteFromCache]: Pass true to delete the file from the TDLib file cache.
///
/// [Ok] is returned on completion.
final class RemoveFileFromDownloads extends TdFunction {
  /// **RemoveFileFromDownloads** *(removeFileFromDownloads)* - TDLib function
  ///
  /// Removes a file from the file download list.
  ///
  /// * [fileId]: Identifier of the downloaded file.
  /// * [deleteFromCache]: Pass true to delete the file from the TDLib file cache.
  ///
  /// [Ok] is returned on completion.
  const RemoveFileFromDownloads({
    required this.fileId,
    required this.deleteFromCache,
  });

  /// Identifier of the downloaded file
  final int fileId;

  /// Pass true to delete the file from the TDLib file cache
  final bool deleteFromCache;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "delete_from_cache": deleteFromCache,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the downloaded file
  /// * [delete_from_cache]: Pass true to delete the file from the TDLib file cache
  RemoveFileFromDownloads copyWith({
    int? fileId,
    bool? deleteFromCache,
  }) =>
      RemoveFileFromDownloads(
        fileId: fileId ?? this.fileId,
        deleteFromCache: deleteFromCache ?? this.deleteFromCache,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeFileFromDownloads';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
