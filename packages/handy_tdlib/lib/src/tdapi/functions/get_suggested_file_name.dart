part of '../tdapi.dart';

/// **GetSuggestedFileName** *(getSuggestedFileName)* - TDLib function
///
/// Returns suggested name for saving a file in a given directory.
///
/// * [fileId]: Identifier of the file.
/// * [directory]: Directory in which the file is expected to be saved.
///
/// [Text] is returned on completion.
final class GetSuggestedFileName extends TdFunction {
  /// **GetSuggestedFileName** *(getSuggestedFileName)* - TDLib function
  ///
  /// Returns suggested name for saving a file in a given directory.
  ///
  /// * [fileId]: Identifier of the file.
  /// * [directory]: Directory in which the file is expected to be saved.
  ///
  /// [Text] is returned on completion.
  const GetSuggestedFileName({
    required this.fileId,
    required this.directory,
  });

  /// Identifier of the file
  final int fileId;

  /// Directory in which the file is expected to be saved
  final String directory;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "directory": directory,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the file
  /// * [directory]: Directory in which the file is expected to be saved
  GetSuggestedFileName copyWith({
    int? fileId,
    String? directory,
  }) =>
      GetSuggestedFileName(
        fileId: fileId ?? this.fileId,
        directory: directory ?? this.directory,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSuggestedFileName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
