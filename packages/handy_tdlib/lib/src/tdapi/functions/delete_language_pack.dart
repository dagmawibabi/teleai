part of '../tdapi.dart';

/// **DeleteLanguagePack** *(deleteLanguagePack)* - TDLib function
///
/// Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted.. Can be called before authorization.
///
/// * [languagePackId]: Identifier of the language pack to delete.
///
/// [Ok] is returned on completion.
final class DeleteLanguagePack extends TdFunction {
  /// **DeleteLanguagePack** *(deleteLanguagePack)* - TDLib function
  ///
  /// Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted.. Can be called before authorization.
  ///
  /// * [languagePackId]: Identifier of the language pack to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteLanguagePack({
    required this.languagePackId,
  });

  /// Identifier of the language pack to delete
  final String languagePackId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_pack_id": languagePackId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_pack_id]: Identifier of the language pack to delete
  DeleteLanguagePack copyWith({
    String? languagePackId,
  }) =>
      DeleteLanguagePack(
        languagePackId: languagePackId ?? this.languagePackId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteLanguagePack';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
