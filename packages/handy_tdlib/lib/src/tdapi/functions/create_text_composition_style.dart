part of '../tdapi.dart';

/// **CreateTextCompositionStyle** *(createTextCompositionStyle)* - TDLib function
///
/// Creates a custom text composition style. May return an error with a message "TONES_SAVED_TOO_MANY" if the maximum number of added custom styles has been reached.
///
/// * [title]: Title of the style; 1-getOption("text_composition_style_title_length_max") characters.
/// * [customEmojiId]: Identifier of the custom emoji corresponding to the style.
/// * [prompt]: Prompt that will be used for text composition; 1-getOption("text_composition_style_prompt_length_max") characters.
/// * [showCreator]: Pass true if the current user must be shown as the creator of the style.
///
/// [TextCompositionStyle] is returned on completion.
final class CreateTextCompositionStyle extends TdFunction {
  /// **CreateTextCompositionStyle** *(createTextCompositionStyle)* - TDLib function
  ///
  /// Creates a custom text composition style. May return an error with a message "TONES_SAVED_TOO_MANY" if the maximum number of added custom styles has been reached.
  ///
  /// * [title]: Title of the style; 1-getOption("text_composition_style_title_length_max") characters.
  /// * [customEmojiId]: Identifier of the custom emoji corresponding to the style.
  /// * [prompt]: Prompt that will be used for text composition; 1-getOption("text_composition_style_prompt_length_max") characters.
  /// * [showCreator]: Pass true if the current user must be shown as the creator of the style.
  ///
  /// [TextCompositionStyle] is returned on completion.
  const CreateTextCompositionStyle({
    required this.title,
    required this.customEmojiId,
    required this.prompt,
    required this.showCreator,
  });

  /// Title of the style; 1-getOption("text_composition_style_title_length_max") characters
  final String title;

  /// Identifier of the custom emoji corresponding to the style
  final int customEmojiId;

  /// Prompt that will be used for text composition; 1-getOption("text_composition_style_prompt_length_max") characters
  final String prompt;

  /// Pass true if the current user must be shown as the creator of the style
  final bool showCreator;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "title": title,
      "custom_emoji_id": customEmojiId,
      "prompt": prompt,
      "show_creator": showCreator,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [title]: Title of the style; 1-getOption("text_composition_style_title_length_max") characters
  /// * [custom_emoji_id]: Identifier of the custom emoji corresponding to the style
  /// * [prompt]: Prompt that will be used for text composition; 1-getOption("text_composition_style_prompt_length_max") characters
  /// * [show_creator]: Pass true if the current user must be shown as the creator of the style
  CreateTextCompositionStyle copyWith({
    String? title,
    int? customEmojiId,
    String? prompt,
    bool? showCreator,
  }) =>
      CreateTextCompositionStyle(
        title: title ?? this.title,
        customEmojiId: customEmojiId ?? this.customEmojiId,
        prompt: prompt ?? this.prompt,
        showCreator: showCreator ?? this.showCreator,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createTextCompositionStyle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
