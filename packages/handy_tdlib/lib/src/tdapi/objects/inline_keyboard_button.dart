part of '../tdapi.dart';

/// **InlineKeyboardButton** *(inlineKeyboardButton)* - basic class
///
/// Represents a single button in an inline keyboard.
///
/// * [text]: Text of the button.
/// * [iconCustomEmojiId]: Identifier of the custom emoji that must be shown on the button; 0 if none.
/// * [style]: Style of the button.
/// * [type]: Type of the button.
final class InlineKeyboardButton extends TdObject {
  /// **InlineKeyboardButton** *(inlineKeyboardButton)* - basic class
  ///
  /// Represents a single button in an inline keyboard.
  ///
  /// * [text]: Text of the button.
  /// * [iconCustomEmojiId]: Identifier of the custom emoji that must be shown on the button; 0 if none.
  /// * [style]: Style of the button.
  /// * [type]: Type of the button.
  const InlineKeyboardButton({
    required this.text,
    required this.iconCustomEmojiId,
    required this.style,
    required this.type,
  });

  /// Text of the button
  final String text;

  /// Identifier of the custom emoji that must be shown on the button; 0 if none
  final int iconCustomEmojiId;

  /// Style of the button
  final ButtonStyle style;

  /// Type of the button
  final InlineKeyboardButtonType type;

  /// Parse from a json
  factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) =>
      InlineKeyboardButton(
        text: json['text'],
        iconCustomEmojiId: json['icon_custom_emoji_id'] is int
            ? json['icon_custom_emoji_id']
            : int.tryParse(json['icon_custom_emoji_id'] ?? "") ?? 0,
        style: ButtonStyle.fromJson(json['style']),
        type: InlineKeyboardButtonType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "icon_custom_emoji_id": iconCustomEmojiId,
      "style": style.toJson(),
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the button
  /// * [icon_custom_emoji_id]: Identifier of the custom emoji that must be shown on the button; 0 if none
  /// * [style]: Style of the button
  /// * [type]: Type of the button
  InlineKeyboardButton copyWith({
    String? text,
    int? iconCustomEmojiId,
    ButtonStyle? style,
    InlineKeyboardButtonType? type,
  }) =>
      InlineKeyboardButton(
        text: text ?? this.text,
        iconCustomEmojiId: iconCustomEmojiId ?? this.iconCustomEmojiId,
        style: style ?? this.style,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineKeyboardButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
