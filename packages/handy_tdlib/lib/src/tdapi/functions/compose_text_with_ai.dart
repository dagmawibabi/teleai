part of '../tdapi.dart';

/// **ComposeTextWithAi** *(composeTextWithAi)* - TDLib function
///
/// Changes text using an AI model; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
///
/// * [text]: The original text.
/// * [translateToLanguageCode]: Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values.
/// * [styleName]: Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text.
/// * [addEmojis]: Pass true to add emoji to the text.
///
/// [FormattedText] is returned on completion.
final class ComposeTextWithAi extends TdFunction {
  /// **ComposeTextWithAi** *(composeTextWithAi)* - TDLib function
  ///
  /// Changes text using an AI model; must not be used in secret chats. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
  ///
  /// * [text]: The original text.
  /// * [translateToLanguageCode]: Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values.
  /// * [styleName]: Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text.
  /// * [addEmojis]: Pass true to add emoji to the text.
  ///
  /// [FormattedText] is returned on completion.
  const ComposeTextWithAi({
    required this.text,
    required this.translateToLanguageCode,
    required this.styleName,
    required this.addEmojis,
  });

  /// The original text
  final FormattedText text;

  /// Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
  final String translateToLanguageCode;

  /// Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text
  final String styleName;

  /// Pass true to add emoji to the text
  final bool addEmojis;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "translate_to_language_code": translateToLanguageCode,
      "style_name": styleName,
      "add_emojis": addEmojis,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The original text
  /// * [translate_to_language_code]: Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
  /// * [style_name]: Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text
  /// * [add_emojis]: Pass true to add emoji to the text
  ComposeTextWithAi copyWith({
    FormattedText? text,
    String? translateToLanguageCode,
    String? styleName,
    bool? addEmojis,
  }) =>
      ComposeTextWithAi(
        text: text ?? this.text,
        translateToLanguageCode:
            translateToLanguageCode ?? this.translateToLanguageCode,
        styleName: styleName ?? this.styleName,
        addEmojis: addEmojis ?? this.addEmojis,
      );

  /// TDLib object type
  static const String defaultObjectId = 'composeTextWithAi';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
