part of '../tdapi.dart';

/// **GetLanguagePackInfo** *(getLanguagePackInfo)* - TDLib function
///
/// Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization.
///
/// * [languagePackId]: Language pack identifier.
///
/// [LanguagePackInfo] is returned on completion.
final class GetLanguagePackInfo extends TdFunction {
  /// **GetLanguagePackInfo** *(getLanguagePackInfo)* - TDLib function
  ///
  /// Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization.
  ///
  /// * [languagePackId]: Language pack identifier.
  ///
  /// [LanguagePackInfo] is returned on completion.
  const GetLanguagePackInfo({
    required this.languagePackId,
  });

  /// Language pack identifier
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
  /// * [language_pack_id]: Language pack identifier
  GetLanguagePackInfo copyWith({
    String? languagePackId,
  }) =>
      GetLanguagePackInfo(
        languagePackId: languagePackId ?? this.languagePackId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLanguagePackInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
