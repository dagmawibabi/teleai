part of '../tdapi.dart';

/// **GetLanguagePackString** *(getLanguagePackString)* - TDLib function
///
/// Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously.
///
/// * [languagePackDatabasePath]: Path to the language pack database in which strings are stored.
/// * [localizationTarget]: Localization target to which the language pack belongs.
/// * [languagePackId]: Language pack identifier.
/// * [key]: Language pack key of the string to be returned.
///
/// [LanguagePackStringValue] is returned on completion.
final class GetLanguagePackString extends TdFunction {
  /// **GetLanguagePackString** *(getLanguagePackString)* - TDLib function
  ///
  /// Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously.
  ///
  /// * [languagePackDatabasePath]: Path to the language pack database in which strings are stored.
  /// * [localizationTarget]: Localization target to which the language pack belongs.
  /// * [languagePackId]: Language pack identifier.
  /// * [key]: Language pack key of the string to be returned.
  ///
  /// [LanguagePackStringValue] is returned on completion.
  const GetLanguagePackString({
    required this.languagePackDatabasePath,
    required this.localizationTarget,
    required this.languagePackId,
    required this.key,
  });

  /// Path to the language pack database in which strings are stored
  final String languagePackDatabasePath;

  /// Localization target to which the language pack belongs
  final String localizationTarget;

  /// Language pack identifier
  final String languagePackId;

  /// Language pack key of the string to be returned
  final String key;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_pack_database_path": languagePackDatabasePath,
      "localization_target": localizationTarget,
      "language_pack_id": languagePackId,
      "key": key,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_pack_database_path]: Path to the language pack database in which strings are stored
  /// * [localization_target]: Localization target to which the language pack belongs
  /// * [language_pack_id]: Language pack identifier
  /// * [key]: Language pack key of the string to be returned
  GetLanguagePackString copyWith({
    String? languagePackDatabasePath,
    String? localizationTarget,
    String? languagePackId,
    String? key,
  }) =>
      GetLanguagePackString(
        languagePackDatabasePath:
            languagePackDatabasePath ?? this.languagePackDatabasePath,
        localizationTarget: localizationTarget ?? this.localizationTarget,
        languagePackId: languagePackId ?? this.languagePackId,
        key: key ?? this.key,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLanguagePackString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
