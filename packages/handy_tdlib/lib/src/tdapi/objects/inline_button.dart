part of '../tdapi.dart';

/// **InlineButton** *(inlineButton)* - basic class
///
/// Represents a button inside a rich message.
///
/// * [text]: Text of the button; only richTexts, richTextPlain, and richTextCustomEmoji are allowed.
/// * [style]: Style of the button.
/// * [type]: Type of the button; must be one of inlineKeyboardButtonTypeUrl, inlineKeyboardButtonTypeLoginUrl, inlineKeyboardButtonTypeWebApp, inlineKeyboardButtonTypeCallback,. inlineKeyboardButtonTypeSwitchInline, inlineKeyboardButtonTypeUser, inlineKeyboardButtonTypeCopyText. Additionally,. inlineKeyboardButtonTypeCallbackWithPassword and inlineKeyboardButtonTypeDisabled may be received in incoming messages. Regular users may use only inlineKeyboardButtonTypeUrl,. inlineKeyboardButtonTypeUser and inlineKeyboardButtonTypeCopyText.
final class InlineButton extends TdObject {
  /// **InlineButton** *(inlineButton)* - basic class
  ///
  /// Represents a button inside a rich message.
  ///
  /// * [text]: Text of the button; only richTexts, richTextPlain, and richTextCustomEmoji are allowed.
  /// * [style]: Style of the button.
  /// * [type]: Type of the button; must be one of inlineKeyboardButtonTypeUrl, inlineKeyboardButtonTypeLoginUrl, inlineKeyboardButtonTypeWebApp, inlineKeyboardButtonTypeCallback,. inlineKeyboardButtonTypeSwitchInline, inlineKeyboardButtonTypeUser, inlineKeyboardButtonTypeCopyText. Additionally,. inlineKeyboardButtonTypeCallbackWithPassword and inlineKeyboardButtonTypeDisabled may be received in incoming messages. Regular users may use only inlineKeyboardButtonTypeUrl,. inlineKeyboardButtonTypeUser and inlineKeyboardButtonTypeCopyText.
  const InlineButton({
    required this.text,
    required this.style,
    required this.type,
  });

  /// Text of the button; only richTexts, richTextPlain, and richTextCustomEmoji are allowed
  final RichText text;

  /// Style of the button
  final ButtonStyle style;

  /// Type of the button; must be one of inlineKeyboardButtonTypeUrl, inlineKeyboardButtonTypeLoginUrl, inlineKeyboardButtonTypeWebApp, inlineKeyboardButtonTypeCallback,. inlineKeyboardButtonTypeSwitchInline, inlineKeyboardButtonTypeUser, inlineKeyboardButtonTypeCopyText. Additionally,. inlineKeyboardButtonTypeCallbackWithPassword and inlineKeyboardButtonTypeDisabled may be received in incoming messages. Regular users may use only inlineKeyboardButtonTypeUrl,. inlineKeyboardButtonTypeUser and inlineKeyboardButtonTypeCopyText
  final InlineKeyboardButtonType type;

  /// Parse from a json
  factory InlineButton.fromJson(Map<String, dynamic> json) => InlineButton(
        text: RichText.fromJson(json['text']),
        style: ButtonStyle.fromJson(json['style']),
        type: InlineKeyboardButtonType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "style": style.toJson(),
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the button; only richTexts, richTextPlain, and richTextCustomEmoji are allowed
  /// * [style]: Style of the button
  /// * [type]: Type of the button; must be one of inlineKeyboardButtonTypeUrl, inlineKeyboardButtonTypeLoginUrl, inlineKeyboardButtonTypeWebApp, inlineKeyboardButtonTypeCallback,. inlineKeyboardButtonTypeSwitchInline, inlineKeyboardButtonTypeUser, inlineKeyboardButtonTypeCopyText. Additionally,. inlineKeyboardButtonTypeCallbackWithPassword and inlineKeyboardButtonTypeDisabled may be received in incoming messages. Regular users may use only inlineKeyboardButtonTypeUrl,. inlineKeyboardButtonTypeUser and inlineKeyboardButtonTypeCopyText
  InlineButton copyWith({
    RichText? text,
    ButtonStyle? style,
    InlineKeyboardButtonType? type,
  }) =>
      InlineButton(
        text: text ?? this.text,
        style: style ?? this.style,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
