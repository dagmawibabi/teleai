part of '../tdapi.dart';

/// **ComposeRichMessageWithAi** *(composeRichMessageWithAi)* - TDLib function
///
/// Changes a rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
///
/// * [message]: The original message.
/// * [translateToLanguageCode]: Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values.
/// * [styleName]: Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text or if a custom prompt is used.
/// * [customPrompt]: Custom prompt that will be used instead of style_name; 0-getOption("text_composition_style_prompt_length_max") characters.
/// * [addEmojis]: Pass true to add emoji to the text.
///
/// [RichMessage] is returned on completion.
final class ComposeRichMessageWithAi extends TdFunction {
  /// **ComposeRichMessageWithAi** *(composeRichMessageWithAi)* - TDLib function
  ///
  /// Changes a rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
  ///
  /// * [message]: The original message.
  /// * [translateToLanguageCode]: Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values.
  /// * [styleName]: Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text or if a custom prompt is used.
  /// * [customPrompt]: Custom prompt that will be used instead of style_name; 0-getOption("text_composition_style_prompt_length_max") characters.
  /// * [addEmojis]: Pass true to add emoji to the text.
  ///
  /// [RichMessage] is returned on completion.
  const ComposeRichMessageWithAi({
    required this.message,
    required this.translateToLanguageCode,
    required this.styleName,
    required this.customPrompt,
    required this.addEmojis,
  });

  /// The original message
  final InputRichMessage message;

  /// Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
  final String translateToLanguageCode;

  /// Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text or if a custom prompt is used
  final String styleName;

  /// Custom prompt that will be used instead of style_name; 0-getOption("text_composition_style_prompt_length_max") characters
  final String customPrompt;

  /// Pass true to add emoji to the text
  final bool addEmojis;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "translate_to_language_code": translateToLanguageCode,
      "style_name": styleName,
      "custom_prompt": customPrompt,
      "add_emojis": addEmojis,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The original message
  /// * [translate_to_language_code]: Pass a language code to which the text will be translated; pass an empty string if translation isn't needed. See translateText.to_language_code for the list of supported values
  /// * [style_name]: Name of the style of the resulting text; handle updateTextCompositionStyles to get the list of supported styles; pass an empty string to keep the current style of the text or if a custom prompt is used
  /// * [custom_prompt]: Custom prompt that will be used instead of style_name; 0-getOption("text_composition_style_prompt_length_max") characters
  /// * [add_emojis]: Pass true to add emoji to the text
  ComposeRichMessageWithAi copyWith({
    InputRichMessage? message,
    String? translateToLanguageCode,
    String? styleName,
    String? customPrompt,
    bool? addEmojis,
  }) =>
      ComposeRichMessageWithAi(
        message: message ?? this.message,
        translateToLanguageCode:
            translateToLanguageCode ?? this.translateToLanguageCode,
        styleName: styleName ?? this.styleName,
        customPrompt: customPrompt ?? this.customPrompt,
        addEmojis: addEmojis ?? this.addEmojis,
      );

  /// TDLib object type
  static const String defaultObjectId = 'composeRichMessageWithAi';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
