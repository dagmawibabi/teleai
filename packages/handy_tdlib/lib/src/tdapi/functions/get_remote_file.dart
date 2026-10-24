part of '../tdapi.dart';

/// **GetRemoteFile** *(getRemoteFile)* - TDLib function
///
/// Returns information about a file by its remote identifier. This is an offline method.. Can be used to register a URL as a file for further uploading, or sending as a message.. Even if the request succeeds, the file can be used only if it is still accessible to the user.. For example, if the file is from a message, then the message must be not deleted and accessible to the user.. If the file database is disabled, then the corresponding object with the file must be preloaded by the application.
///
/// * [remoteFileId]: Remote identifier of the file to get.
/// * [fileType]: File type; pass null if unknown *(optional)*.
///
/// [File] is returned on completion.
final class GetRemoteFile extends TdFunction {
  /// **GetRemoteFile** *(getRemoteFile)* - TDLib function
  ///
  /// Returns information about a file by its remote identifier. This is an offline method.. Can be used to register a URL as a file for further uploading, or sending as a message.. Even if the request succeeds, the file can be used only if it is still accessible to the user.. For example, if the file is from a message, then the message must be not deleted and accessible to the user.. If the file database is disabled, then the corresponding object with the file must be preloaded by the application.
  ///
  /// * [remoteFileId]: Remote identifier of the file to get.
  /// * [fileType]: File type; pass null if unknown *(optional)*.
  ///
  /// [File] is returned on completion.
  const GetRemoteFile({
    required this.remoteFileId,
    this.fileType,
  });

  /// Remote identifier of the file to get
  final String remoteFileId;

  /// File type; pass null if unknown
  final FileType? fileType;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "remote_file_id": remoteFileId,
      "file_type": fileType?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [remote_file_id]: Remote identifier of the file to get
  /// * [file_type]: File type; pass null if unknown
  GetRemoteFile copyWith({
    String? remoteFileId,
    FileType? fileType,
  }) =>
      GetRemoteFile(
        remoteFileId: remoteFileId ?? this.remoteFileId,
        fileType: fileType ?? this.fileType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getRemoteFile';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
