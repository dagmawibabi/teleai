part of '../tdapi.dart';

/// **GetEmojiSuggestionsUrl** *(getEmojiSuggestionsUrl)* - TDLib function
///
/// Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation.
///
/// * [languageCode]: Language code for which the emoji replacements will be suggested.
///
/// [HttpUrl] is returned on completion.
final class GetEmojiSuggestionsUrl extends TdFunction {
  /// **GetEmojiSuggestionsUrl** *(getEmojiSuggestionsUrl)* - TDLib function
  ///
  /// Returns an HTTP URL which can be used to automatically log in to the translation platform and suggest new emoji replacements. The URL will be valid for 30 seconds after generation.
  ///
  /// * [languageCode]: Language code for which the emoji replacements will be suggested.
  ///
  /// [HttpUrl] is returned on completion.
  const GetEmojiSuggestionsUrl({
    required this.languageCode,
  });

  /// Language code for which the emoji replacements will be suggested
  final String languageCode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_code": languageCode,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_code]: Language code for which the emoji replacements will be suggested
  GetEmojiSuggestionsUrl copyWith({
    String? languageCode,
  }) =>
      GetEmojiSuggestionsUrl(
        languageCode: languageCode ?? this.languageCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getEmojiSuggestionsUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
