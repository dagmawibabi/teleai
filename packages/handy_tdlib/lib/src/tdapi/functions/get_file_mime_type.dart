part of '../tdapi.dart';

/// **GetFileMimeType** *(getFileMimeType)* - TDLib function
///
/// Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously.
///
/// * [fileName]: The name of the file or path to the file.
///
/// [Text] is returned on completion.
final class GetFileMimeType extends TdFunction {
  /// **GetFileMimeType** *(getFileMimeType)* - TDLib function
  ///
  /// Returns the MIME type of a file, guessed by its extension. Returns an empty string on failure. Can be called synchronously.
  ///
  /// * [fileName]: The name of the file or path to the file.
  ///
  /// [Text] is returned on completion.
  const GetFileMimeType({
    required this.fileName,
  });

  /// The name of the file or path to the file
  final String fileName;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_name": fileName,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_name]: The name of the file or path to the file
  GetFileMimeType copyWith({
    String? fileName,
  }) =>
      GetFileMimeType(
        fileName: fileName ?? this.fileName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getFileMimeType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
