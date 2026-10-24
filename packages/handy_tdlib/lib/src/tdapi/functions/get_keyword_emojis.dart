part of '../tdapi.dart';

/// **GetKeywordEmojis** *(getKeywordEmojis)* - TDLib function
///
/// Returns emojis matching the keyword. Supported only if the file database is enabled. Order of results is unspecified.
///
/// * [text]: Text to search for.
/// * [inputLanguageCodes]: List of possible IETF language tags of the user's input language; may be empty if unknown.
///
/// [Emojis] is returned on completion.
final class GetKeywordEmojis extends TdFunction {
  /// **GetKeywordEmojis** *(getKeywordEmojis)* - TDLib function
  ///
  /// Returns emojis matching the keyword. Supported only if the file database is enabled. Order of results is unspecified.
  ///
  /// * [text]: Text to search for.
  /// * [inputLanguageCodes]: List of possible IETF language tags of the user's input language; may be empty if unknown.
  ///
  /// [Emojis] is returned on completion.
  const GetKeywordEmojis({
    required this.text,
    required this.inputLanguageCodes,
  });

  /// Text to search for
  final String text;

  /// List of possible IETF language tags of the user's input language; may be empty if unknown
  final List<String> inputLanguageCodes;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text,
      "input_language_codes": inputLanguageCodes.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text to search for
  /// * [input_language_codes]: List of possible IETF language tags of the user's input language; may be empty if unknown
  GetKeywordEmojis copyWith({
    String? text,
    List<String>? inputLanguageCodes,
  }) =>
      GetKeywordEmojis(
        text: text ?? this.text,
        inputLanguageCodes: inputLanguageCodes ?? this.inputLanguageCodes,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getKeywordEmojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
