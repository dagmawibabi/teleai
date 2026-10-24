part of '../tdapi.dart';

/// **ToggleBotCanManageEmojiStatus** *(toggleBotCanManageEmojiStatus)* - TDLib function
///
/// Toggles whether the bot can manage emoji status of the current user.
///
/// * [botUserId]: User identifier of the bot.
/// * [canManageEmojiStatus]: Pass true if the bot is allowed to change emoji status of the user; pass false otherwise.
///
/// [Ok] is returned on completion.
final class ToggleBotCanManageEmojiStatus extends TdFunction {
  /// **ToggleBotCanManageEmojiStatus** *(toggleBotCanManageEmojiStatus)* - TDLib function
  ///
  /// Toggles whether the bot can manage emoji status of the current user.
  ///
  /// * [botUserId]: User identifier of the bot.
  /// * [canManageEmojiStatus]: Pass true if the bot is allowed to change emoji status of the user; pass false otherwise.
  ///
  /// [Ok] is returned on completion.
  const ToggleBotCanManageEmojiStatus({
    required this.botUserId,
    required this.canManageEmojiStatus,
  });

  /// User identifier of the bot
  final int botUserId;

  /// Pass true if the bot is allowed to change emoji status of the user; pass false otherwise
  final bool canManageEmojiStatus;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "can_manage_emoji_status": canManageEmojiStatus,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot
  /// * [can_manage_emoji_status]: Pass true if the bot is allowed to change emoji status of the user; pass false otherwise
  ToggleBotCanManageEmojiStatus copyWith({
    int? botUserId,
    bool? canManageEmojiStatus,
  }) =>
      ToggleBotCanManageEmojiStatus(
        botUserId: botUserId ?? this.botUserId,
        canManageEmojiStatus: canManageEmojiStatus ?? this.canManageEmojiStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleBotCanManageEmojiStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
