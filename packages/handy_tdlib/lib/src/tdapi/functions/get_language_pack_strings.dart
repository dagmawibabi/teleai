part of '../tdapi.dart';

/// **GetLanguagePackStrings** *(getLanguagePackStrings)* - TDLib function
///
/// Returns strings from a language pack in the current localization target by their keys. Can be called before authorization.
///
/// * [languagePackId]: Language pack identifier of the strings to be returned.
/// * [keys]: Language pack keys of the strings to be returned; leave empty to request all available strings.
///
/// [LanguagePackStrings] is returned on completion.
final class GetLanguagePackStrings extends TdFunction {
  /// **GetLanguagePackStrings** *(getLanguagePackStrings)* - TDLib function
  ///
  /// Returns strings from a language pack in the current localization target by their keys. Can be called before authorization.
  ///
  /// * [languagePackId]: Language pack identifier of the strings to be returned.
  /// * [keys]: Language pack keys of the strings to be returned; leave empty to request all available strings.
  ///
  /// [LanguagePackStrings] is returned on completion.
  const GetLanguagePackStrings({
    required this.languagePackId,
    required this.keys,
  });

  /// Language pack identifier of the strings to be returned
  final String languagePackId;

  /// Language pack keys of the strings to be returned; leave empty to request all available strings
  final List<String> keys;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_pack_id": languagePackId,
      "keys": keys.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_pack_id]: Language pack identifier of the strings to be returned
  /// * [keys]: Language pack keys of the strings to be returned; leave empty to request all available strings
  GetLanguagePackStrings copyWith({
    String? languagePackId,
    List<String>? keys,
  }) =>
      GetLanguagePackStrings(
        languagePackId: languagePackId ?? this.languagePackId,
        keys: keys ?? this.keys,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLanguagePackStrings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
