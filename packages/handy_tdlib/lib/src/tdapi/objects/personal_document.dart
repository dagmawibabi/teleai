part of '../tdapi.dart';

/// **PersonalDocument** *(personalDocument)* - basic class
///
/// A personal document, containing some information about a user.
///
/// * [files]: List of files containing the pages of the document.
/// * [translation]: List of files containing a certified English translation of the document.
final class PersonalDocument extends TdObject {
  /// **PersonalDocument** *(personalDocument)* - basic class
  ///
  /// A personal document, containing some information about a user.
  ///
  /// * [files]: List of files containing the pages of the document.
  /// * [translation]: List of files containing a certified English translation of the document.
  const PersonalDocument({
    required this.files,
    required this.translation,
  });

  /// List of files containing the pages of the document
  final List<DatedFile> files;

  /// List of files containing a certified English translation of the document
  final List<DatedFile> translation;

  /// Parse from a json
  factory PersonalDocument.fromJson(Map<String, dynamic> json) =>
      PersonalDocument(
        files: List<DatedFile>.from((json['files'] ?? [])
            .map((item) => DatedFile.fromJson(item))
            .toList()),
        translation: List<DatedFile>.from((json['translation'] ?? [])
            .map((item) => DatedFile.fromJson(item))
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
  PersonalDocument copyWith({
    List<DatedFile>? files,
    List<DatedFile>? translation,
  }) =>
      PersonalDocument(
        files: files ?? this.files,
        translation: translation ?? this.translation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'personalDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
