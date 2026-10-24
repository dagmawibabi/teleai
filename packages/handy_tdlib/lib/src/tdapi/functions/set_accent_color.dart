part of '../tdapi.dart';

/// **SetAccentColor** *(setAccentColor)* - TDLib function
///
/// Changes accent color and background custom emoji for the current user; for Telegram Premium users only.
///
/// * [accentColorId]: Identifier of the accent color to use.
/// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none.
///
/// [Ok] is returned on completion.
final class SetAccentColor extends TdFunction {
  /// **SetAccentColor** *(setAccentColor)* - TDLib function
  ///
  /// Changes accent color and background custom emoji for the current user; for Telegram Premium users only.
  ///
  /// * [accentColorId]: Identifier of the accent color to use.
  /// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none.
  ///
  /// [Ok] is returned on completion.
  const SetAccentColor({
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
  });

  /// Identifier of the accent color to use
  final int accentColorId;

  /// Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
  final int backgroundCustomEmojiId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "accent_color_id": accentColorId,
      "background_custom_emoji_id": backgroundCustomEmojiId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [accent_color_id]: Identifier of the accent color to use
  /// * [background_custom_emoji_id]: Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none
  SetAccentColor copyWith({
    int? accentColorId,
    int? backgroundCustomEmojiId,
  }) =>
      SetAccentColor(
        accentColorId: accentColorId ?? this.accentColorId,
        backgroundCustomEmojiId:
            backgroundCustomEmojiId ?? this.backgroundCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setAccentColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
