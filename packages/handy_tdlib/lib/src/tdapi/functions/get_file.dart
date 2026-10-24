part of '../tdapi.dart';

/// **GetFile** *(getFile)* - TDLib function
///
/// Returns information about a file. This is an offline method.
///
/// * [fileId]: Identifier of the file to get.
///
/// [File] is returned on completion.
final class GetFile extends TdFunction {
  /// **GetFile** *(getFile)* - TDLib function
  ///
  /// Returns information about a file. This is an offline method.
  ///
  /// * [fileId]: Identifier of the file to get.
  ///
  /// [File] is returned on completion.
  const GetFile({
    required this.fileId,
  });

  /// Identifier of the file to get
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
  /// * [file_id]: Identifier of the file to get
  GetFile copyWith({
    int? fileId,
  }) =>
      GetFile(
        fileId: fileId ?? this.fileId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
