part of '../tdapi.dart';

/// **TranslateRichMessage** *(translateRichMessage)* - TDLib function
///
/// Translates a rich message to the given language.
///
/// * [message]: Rich message to translate.
/// * [toLanguageCode]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values.
/// * [tone]: Tone of the translation; see translateText.tone for the list of supported values.
///
/// [RichMessage] is returned on completion.
final class TranslateRichMessage extends TdFunction {
  /// **TranslateRichMessage** *(translateRichMessage)* - TDLib function
  ///
  /// Translates a rich message to the given language.
  ///
  /// * [message]: Rich message to translate.
  /// * [toLanguageCode]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values.
  /// * [tone]: Tone of the translation; see translateText.tone for the list of supported values.
  ///
  /// [RichMessage] is returned on completion.
  const TranslateRichMessage({
    required this.message,
    required this.toLanguageCode,
    required this.tone,
  });

  /// Rich message to translate
  final InputRichMessage message;

  /// Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values
  final String toLanguageCode;

  /// Tone of the translation; see translateText.tone for the list of supported values
  final String tone;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "to_language_code": toLanguageCode,
      "tone": tone,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: Rich message to translate
  /// * [to_language_code]: Language code of the language to which the message is translated. See translateText.to_language_code for the list of supported values
  /// * [tone]: Tone of the translation; see translateText.tone for the list of supported values
  TranslateRichMessage copyWith({
    InputRichMessage? message,
    String? toLanguageCode,
    String? tone,
  }) =>
      TranslateRichMessage(
        message: message ?? this.message,
        toLanguageCode: toLanguageCode ?? this.toLanguageCode,
        tone: tone ?? this.tone,
      );

  /// TDLib object type
  static const String defaultObjectId = 'translateRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
