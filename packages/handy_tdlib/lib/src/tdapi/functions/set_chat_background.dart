part of '../tdapi.dart';

/// **SetChatBackground** *(setChatBackground)* - TDLib function
///
/// Sets the background in a specific chat. Supported only in private and secret chats with non-deleted users, and in chats with sufficient boost level and can_change_info administrator right.
///
/// * [chatId]: Chat identifier.
/// * [background]: The input background to use; pass null to create a new filled or chat theme background *(optional)*.
/// * [type]: Background type; pass null to use default background type for the chosen background; backgroundTypeChatTheme isn't supported for private and secret chats.. Use chatBoostLevelFeatures.chat_theme_background_count and chatBoostLevelFeatures.can_set_custom_background to check whether the background type can be set in the boosted chat *(optional)*.
/// * [darkThemeDimming]: Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background.
/// * [onlyForSelf]: Pass true to set background only for self; pass false to set background for all chat users. Always false for backgrounds set in boosted chats.. Background can be set for both users only by Telegram Premium users and if set background isn't of the type inputBackgroundPrevious.
///
/// [Ok] is returned on completion.
final class SetChatBackground extends TdFunction {
  /// **SetChatBackground** *(setChatBackground)* - TDLib function
  ///
  /// Sets the background in a specific chat. Supported only in private and secret chats with non-deleted users, and in chats with sufficient boost level and can_change_info administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [background]: The input background to use; pass null to create a new filled or chat theme background *(optional)*.
  /// * [type]: Background type; pass null to use default background type for the chosen background; backgroundTypeChatTheme isn't supported for private and secret chats.. Use chatBoostLevelFeatures.chat_theme_background_count and chatBoostLevelFeatures.can_set_custom_background to check whether the background type can be set in the boosted chat *(optional)*.
  /// * [darkThemeDimming]: Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background.
  /// * [onlyForSelf]: Pass true to set background only for self; pass false to set background for all chat users. Always false for backgrounds set in boosted chats.. Background can be set for both users only by Telegram Premium users and if set background isn't of the type inputBackgroundPrevious.
  ///
  /// [Ok] is returned on completion.
  const SetChatBackground({
    required this.chatId,
    this.background,
    this.type,
    required this.darkThemeDimming,
    required this.onlyForSelf,
  });

  /// Chat identifier
  final int chatId;

  /// The input background to use; pass null to create a new filled or chat theme background
  final InputBackground? background;

  /// Background type; pass null to use default background type for the chosen background; backgroundTypeChatTheme isn't supported for private and secret chats.. Use chatBoostLevelFeatures.chat_theme_background_count and chatBoostLevelFeatures.can_set_custom_background to check whether the background type can be set in the boosted chat
  final BackgroundType? type;

  /// Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
  final int darkThemeDimming;

  /// Pass true to set background only for self; pass false to set background for all chat users. Always false for backgrounds set in boosted chats.. Background can be set for both users only by Telegram Premium users and if set background isn't of the type inputBackgroundPrevious
  final bool onlyForSelf;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "background": background?.toJson(),
      "type": type?.toJson(),
      "dark_theme_dimming": darkThemeDimming,
      "only_for_self": onlyForSelf,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [background]: The input background to use; pass null to create a new filled or chat theme background
  /// * [type]: Background type; pass null to use default background type for the chosen background; backgroundTypeChatTheme isn't supported for private and secret chats.. Use chatBoostLevelFeatures.chat_theme_background_count and chatBoostLevelFeatures.can_set_custom_background to check whether the background type can be set in the boosted chat
  /// * [dark_theme_dimming]: Dimming of the background in dark themes, as a percentage; 0-100. Applied only to Wallpaper and Fill types of background
  /// * [only_for_self]: Pass true to set background only for self; pass false to set background for all chat users. Always false for backgrounds set in boosted chats.. Background can be set for both users only by Telegram Premium users and if set background isn't of the type inputBackgroundPrevious
  SetChatBackground copyWith({
    int? chatId,
    InputBackground? background,
    BackgroundType? type,
    int? darkThemeDimming,
    bool? onlyForSelf,
  }) =>
      SetChatBackground(
        chatId: chatId ?? this.chatId,
        background: background ?? this.background,
        type: type ?? this.type,
        darkThemeDimming: darkThemeDimming ?? this.darkThemeDimming,
        onlyForSelf: onlyForSelf ?? this.onlyForSelf,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
