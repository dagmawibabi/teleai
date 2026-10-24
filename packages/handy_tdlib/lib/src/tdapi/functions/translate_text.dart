part of '../tdapi.dart';

/// **TranslateText** *(translateText)* - TDLib function
///
/// Translates a text to the given language; must not be used in secret chats. If the current user is a Telegram Premium user, then text formatting is preserved.
///
/// * [text]: Text to translate.
/// * [toLanguageCode]: Language code of the language to which the message is translated. Must be one of. "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",. "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",. "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pt-BR", "pa", "ro", "ru", "sm", "gd", "sr",. "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu".
/// * [tone]: Tone of the translation; must be one of "", "formal", "neutral", "casual"; defaults to "neutral".
///
/// [FormattedText] is returned on completion.
final class TranslateText extends TdFunction {
  /// **TranslateText** *(translateText)* - TDLib function
  ///
  /// Translates a text to the given language; must not be used in secret chats. If the current user is a Telegram Premium user, then text formatting is preserved.
  ///
  /// * [text]: Text to translate.
  /// * [toLanguageCode]: Language code of the language to which the message is translated. Must be one of. "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",. "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",. "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pt-BR", "pa", "ro", "ru", "sm", "gd", "sr",. "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu".
  /// * [tone]: Tone of the translation; must be one of "", "formal", "neutral", "casual"; defaults to "neutral".
  ///
  /// [FormattedText] is returned on completion.
  const TranslateText({
    required this.text,
    required this.toLanguageCode,
    required this.tone,
  });

  /// Text to translate
  final FormattedText text;

  /// Language code of the language to which the message is translated. Must be one of. "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",. "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",. "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pt-BR", "pa", "ro", "ru", "sm", "gd", "sr",. "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
  final String toLanguageCode;

  /// Tone of the translation; must be one of "", "formal", "neutral", "casual"; defaults to "neutral"
  final String tone;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "to_language_code": toLanguageCode,
      "tone": tone,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text to translate
  /// * [to_language_code]: Language code of the language to which the message is translated. Must be one of. "af", "sq", "am", "ar", "hy", "az", "eu", "be", "bn", "bs", "bg", "ca", "ceb", "zh-CN", "zh", "zh-Hans", "zh-TW", "zh-Hant", "co", "hr", "cs", "da", "nl", "en", "eo", "et",. "fi", "fr", "fy", "gl", "ka", "de", "el", "gu", "ht", "ha", "haw", "he", "iw", "hi", "hmn", "hu", "is", "ig", "id", "in", "ga", "it", "ja", "jv", "kn", "kk", "km", "rw", "ko",. "ku", "ky", "lo", "la", "lv", "lt", "lb", "mk", "mg", "ms", "ml", "mt", "mi", "mr", "mn", "my", "ne", "no", "ny", "or", "ps", "fa", "pl", "pt", "pt-BR", "pa", "ro", "ru", "sm", "gd", "sr",. "st", "sn", "sd", "si", "sk", "sl", "so", "es", "su", "sw", "sv", "tl", "tg", "ta", "tt", "te", "th", "tr", "tk", "uk", "ur", "ug", "uz", "vi", "cy", "xh", "yi", "ji", "yo", "zu"
  /// * [tone]: Tone of the translation; must be one of "", "formal", "neutral", "casual"; defaults to "neutral"
  TranslateText copyWith({
    FormattedText? text,
    String? toLanguageCode,
    String? tone,
  }) =>
      TranslateText(
        text: text ?? this.text,
        toLanguageCode: toLanguageCode ?? this.toLanguageCode,
        tone: tone ?? this.tone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'translateText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
