part of '../tdapi.dart';

/// **GetFileExtension** *(getFileExtension)* - TDLib function
///
/// Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously.
///
/// * [mimeType]: The MIME type of the file.
///
/// [Text] is returned on completion.
final class GetFileExtension extends TdFunction {
  /// **GetFileExtension** *(getFileExtension)* - TDLib function
  ///
  /// Returns the extension of a file, guessed by its MIME type. Returns an empty string on failure. Can be called synchronously.
  ///
  /// * [mimeType]: The MIME type of the file.
  ///
  /// [Text] is returned on completion.
  const GetFileExtension({
    required this.mimeType,
  });

  /// The MIME type of the file
  final String mimeType;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "mime_type": mimeType,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [mime_type]: The MIME type of the file
  GetFileExtension copyWith({
    String? mimeType,
  }) =>
      GetFileExtension(
        mimeType: mimeType ?? this.mimeType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getFileExtension';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
