part of '../tdapi.dart';

/// **KeyboardButton** *(keyboardButton)* - basic class
///
/// Represents a single button in a bot keyboard.
///
/// * [text]: Text of the button.
/// * [iconCustomEmojiId]: Identifier of the custom emoji that must be shown on the button; 0 if none.
/// * [style]: Style of the button.
/// * [type]: Type of the button.
final class KeyboardButton extends TdObject {
  /// **KeyboardButton** *(keyboardButton)* - basic class
  ///
  /// Represents a single button in a bot keyboard.
  ///
  /// * [text]: Text of the button.
  /// * [iconCustomEmojiId]: Identifier of the custom emoji that must be shown on the button; 0 if none.
  /// * [style]: Style of the button.
  /// * [type]: Type of the button.
  const KeyboardButton({
    required this.text,
    required this.iconCustomEmojiId,
    required this.style,
    required this.type,
    this.extra,
    this.clientId,
  });

  /// Text of the button
  final String text;

  /// Identifier of the custom emoji that must be shown on the button; 0 if none
  final int iconCustomEmojiId;

  /// Style of the button
  final ButtonStyle style;

  /// Type of the button
  final KeyboardButtonType type;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory KeyboardButton.fromJson(Map<String, dynamic> json) => KeyboardButton(
        text: json['text'],
        iconCustomEmojiId: json['icon_custom_emoji_id'] is int
            ? json['icon_custom_emoji_id']
            : int.tryParse(json['icon_custom_emoji_id'] ?? "") ?? 0,
        style: ButtonStyle.fromJson(json['style']),
        type: KeyboardButtonType.fromJson(json['type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
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
  KeyboardButton copyWith({
    String? text,
    int? iconCustomEmojiId,
    ButtonStyle? style,
    KeyboardButtonType? type,
    dynamic extra,
    int? clientId,
  }) =>
      KeyboardButton(
        text: text ?? this.text,
        iconCustomEmojiId: iconCustomEmojiId ?? this.iconCustomEmojiId,
        style: style ?? this.style,
        type: type ?? this.type,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'keyboardButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
