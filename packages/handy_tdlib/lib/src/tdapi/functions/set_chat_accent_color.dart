part of '../tdapi.dart';

/// **SetChatAccentColor** *(setChatAccentColor)* - TDLib function
///
/// Changes accent color and background custom emoji of a channel chat. Requires can_change_info administrator right.
///
/// * [chatId]: Chat identifier.
/// * [accentColorId]: Identifier of the accent color to use. The chat must have at least accentColor.min_channel_chat_boost_level boost level to pass the corresponding color.
/// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none. Use chatBoostLevelFeatures.can_set_background_custom_emoji to check whether a custom emoji can be set.
///
/// [Ok] is returned on completion.
final class SetChatAccentColor extends TdFunction {
  /// **SetChatAccentColor** *(setChatAccentColor)* - TDLib function
  ///
  /// Changes accent color and background custom emoji of a channel chat. Requires can_change_info administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [accentColorId]: Identifier of the accent color to use. The chat must have at least accentColor.min_channel_chat_boost_level boost level to pass the corresponding color.
  /// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none. Use chatBoostLevelFeatures.can_set_background_custom_emoji to check whether a custom emoji can be set.
  ///
  /// [Ok] is returned on completion.
  const SetChatAccentColor({
    required this.chatId,
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the accent color to use. The chat must have at least accentColor.min_channel_chat_boost_level boost level to pass the corresponding color
  final int accentColorId;

  /// Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none. Use chatBoostLevelFeatures.can_set_background_custom_emoji to check whether a custom emoji can be set
  final int backgroundCustomEmojiId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "accent_color_id": accentColorId,
      "background_custom_emoji_id": backgroundCustomEmojiId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [accent_color_id]: Identifier of the accent color to use. The chat must have at least accentColor.min_channel_chat_boost_level boost level to pass the corresponding color
  /// * [background_custom_emoji_id]: Identifier of a custom emoji to be shown on the reply header and link preview background; 0 if none. Use chatBoostLevelFeatures.can_set_background_custom_emoji to check whether a custom emoji can be set
  SetChatAccentColor copyWith({
    int? chatId,
    int? accentColorId,
    int? backgroundCustomEmojiId,
  }) =>
      SetChatAccentColor(
        chatId: chatId ?? this.chatId,
        accentColorId: accentColorId ?? this.accentColorId,
        backgroundCustomEmojiId:
            backgroundCustomEmojiId ?? this.backgroundCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatAccentColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
