part of '../tdapi.dart';

/// **GetFileDownloadedPrefixSize** *(getFileDownloadedPrefixSize)* - TDLib function
///
/// Returns file downloaded prefix size from a given offset, in bytes.
///
/// * [fileId]: Identifier of the file.
/// * [offset]: Offset from which downloaded prefix size needs to be calculated.
///
/// [FileDownloadedPrefixSize] is returned on completion.
final class GetFileDownloadedPrefixSize extends TdFunction {
  /// **GetFileDownloadedPrefixSize** *(getFileDownloadedPrefixSize)* - TDLib function
  ///
  /// Returns file downloaded prefix size from a given offset, in bytes.
  ///
  /// * [fileId]: Identifier of the file.
  /// * [offset]: Offset from which downloaded prefix size needs to be calculated.
  ///
  /// [FileDownloadedPrefixSize] is returned on completion.
  const GetFileDownloadedPrefixSize({
    required this.fileId,
    required this.offset,
  });

  /// Identifier of the file
  final int fileId;

  /// Offset from which downloaded prefix size needs to be calculated
  final int offset;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "offset": offset,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the file
  /// * [offset]: Offset from which downloaded prefix size needs to be calculated
  GetFileDownloadedPrefixSize copyWith({
    int? fileId,
    int? offset,
  }) =>
      GetFileDownloadedPrefixSize(
        fileId: fileId ?? this.fileId,
        offset: offset ?? this.offset,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getFileDownloadedPrefixSize';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
