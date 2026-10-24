part of '../tdapi.dart';

/// **SetChatProfileAccentColor** *(setChatProfileAccentColor)* - TDLib function
///
/// Changes accent color and background custom emoji for profile of a supergroup or channel chat. Requires can_change_info administrator right.
///
/// * [chatId]: Chat identifier.
/// * [profileAccentColorId]: Identifier of the accent color to use for profile; pass -1 if none. The chat must have at least profileAccentColor.min_supergroup_chat_boost_level for supergroups. or profileAccentColor.min_channel_chat_boost_level for channels boost level to pass the corresponding color.
/// * [profileBackgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the chat's profile photo background; 0 if none. Use chatBoostLevelFeatures.can_set_profile_background_custom_emoji to check whether a custom emoji can be set.
///
/// [Ok] is returned on completion.
final class SetChatProfileAccentColor extends TdFunction {
  /// **SetChatProfileAccentColor** *(setChatProfileAccentColor)* - TDLib function
  ///
  /// Changes accent color and background custom emoji for profile of a supergroup or channel chat. Requires can_change_info administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [profileAccentColorId]: Identifier of the accent color to use for profile; pass -1 if none. The chat must have at least profileAccentColor.min_supergroup_chat_boost_level for supergroups. or profileAccentColor.min_channel_chat_boost_level for channels boost level to pass the corresponding color.
  /// * [profileBackgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the chat's profile photo background; 0 if none. Use chatBoostLevelFeatures.can_set_profile_background_custom_emoji to check whether a custom emoji can be set.
  ///
  /// [Ok] is returned on completion.
  const SetChatProfileAccentColor({
    required this.chatId,
    required this.profileAccentColorId,
    required this.profileBackgroundCustomEmojiId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the accent color to use for profile; pass -1 if none. The chat must have at least profileAccentColor.min_supergroup_chat_boost_level for supergroups. or profileAccentColor.min_channel_chat_boost_level for channels boost level to pass the corresponding color
  final int profileAccentColorId;

  /// Identifier of a custom emoji to be shown on the chat's profile photo background; 0 if none. Use chatBoostLevelFeatures.can_set_profile_background_custom_emoji to check whether a custom emoji can be set
  final int profileBackgroundCustomEmojiId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "profile_accent_color_id": profileAccentColorId,
      "profile_background_custom_emoji_id": profileBackgroundCustomEmojiId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [profile_accent_color_id]: Identifier of the accent color to use for profile; pass -1 if none. The chat must have at least profileAccentColor.min_supergroup_chat_boost_level for supergroups. or profileAccentColor.min_channel_chat_boost_level for channels boost level to pass the corresponding color
  /// * [profile_background_custom_emoji_id]: Identifier of a custom emoji to be shown on the chat's profile photo background; 0 if none. Use chatBoostLevelFeatures.can_set_profile_background_custom_emoji to check whether a custom emoji can be set
  SetChatProfileAccentColor copyWith({
    int? chatId,
    int? profileAccentColorId,
    int? profileBackgroundCustomEmojiId,
  }) =>
      SetChatProfileAccentColor(
        chatId: chatId ?? this.chatId,
        profileAccentColorId: profileAccentColorId ?? this.profileAccentColorId,
        profileBackgroundCustomEmojiId: profileBackgroundCustomEmojiId ??
            this.profileBackgroundCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatProfileAccentColor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
