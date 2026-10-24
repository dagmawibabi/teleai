part of '../tdapi.dart';

/// **CreateRichMessageWithAi** *(createRichMessageWithAi)* - TDLib function
///
/// Creates a new rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
///
/// * [prompt]: Prompt that will be used to create the message; 0-getOption("text_composition_style_prompt_length_max") characters.
/// * [languageCode]: Pass a language code in which the text will be created.
/// * [addEmojis]: Pass true to add emoji to the text.
///
/// [RichMessage] is returned on completion.
final class CreateRichMessageWithAi extends TdFunction {
  /// **CreateRichMessageWithAi** *(createRichMessageWithAi)* - TDLib function
  ///
  /// Creates a new rich message using an AI model. May return an error with a message "AICOMPOSE_FLOOD_PREMIUM" if Telegram Premium is required to send further requests.
  ///
  /// * [prompt]: Prompt that will be used to create the message; 0-getOption("text_composition_style_prompt_length_max") characters.
  /// * [languageCode]: Pass a language code in which the text will be created.
  /// * [addEmojis]: Pass true to add emoji to the text.
  ///
  /// [RichMessage] is returned on completion.
  const CreateRichMessageWithAi({
    required this.prompt,
    required this.languageCode,
    required this.addEmojis,
  });

  /// Prompt that will be used to create the message; 0-getOption("text_composition_style_prompt_length_max") characters
  final String prompt;

  /// Pass a language code in which the text will be created
  final String languageCode;

  /// Pass true to add emoji to the text
  final bool addEmojis;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "prompt": prompt,
      "language_code": languageCode,
      "add_emojis": addEmojis,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [prompt]: Prompt that will be used to create the message; 0-getOption("text_composition_style_prompt_length_max") characters
  /// * [language_code]: Pass a language code in which the text will be created
  /// * [add_emojis]: Pass true to add emoji to the text
  CreateRichMessageWithAi copyWith({
    String? prompt,
    String? languageCode,
    bool? addEmojis,
  }) =>
      CreateRichMessageWithAi(
        prompt: prompt ?? this.prompt,
        languageCode: languageCode ?? this.languageCode,
        addEmojis: addEmojis ?? this.addEmojis,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createRichMessageWithAi';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
