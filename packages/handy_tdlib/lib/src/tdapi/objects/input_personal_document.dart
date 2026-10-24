part of '../tdapi.dart';

/// **InputPersonalDocument** *(inputPersonalDocument)* - basic class
///
/// A personal document to be saved to Telegram Passport.
///
/// * [files]: List of files containing the pages of the document.
/// * [translation]: List of files containing a certified English translation of the document.
final class InputPersonalDocument extends TdObject {
  /// **InputPersonalDocument** *(inputPersonalDocument)* - basic class
  ///
  /// A personal document to be saved to Telegram Passport.
  ///
  /// * [files]: List of files containing the pages of the document.
  /// * [translation]: List of files containing a certified English translation of the document.
  const InputPersonalDocument({
    required this.files,
    required this.translation,
  });

  /// List of files containing the pages of the document
  final List<InputFile> files;

  /// List of files containing a certified English translation of the document
  final List<InputFile> translation;

  /// Parse from a json
  factory InputPersonalDocument.fromJson(Map<String, dynamic> json) =>
      InputPersonalDocument(
        files: List<InputFile>.from((json['files'] ?? [])
            .map((item) => InputFile.fromJson(item))
            .toList()),
        translation: List<InputFile>.from((json['translation'] ?? [])
            .map((item) => InputFile.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "files": files.map((i) => i.toJson()).toList(),
      "translation": translation.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [files]: List of files containing the pages of the document
  /// * [translation]: List of files containing a certified English translation of the document
  InputPersonalDocument copyWith({
    List<InputFile>? files,
    List<InputFile>? translation,
  }) =>
      InputPersonalDocument(
        files: files ?? this.files,
        translation: translation ?? this.translation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPersonalDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
