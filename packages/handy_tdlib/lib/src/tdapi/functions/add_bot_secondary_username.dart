part of '../tdapi.dart';

/// **AddBotSecondaryUsername** *(addBotSecondaryUsername)* - TDLib function
///
/// Adds a secondary username to a bot. Can be called only if userTypeBot.can_be_edited, the bot has no secondary username and the current user has Telegram Premium subscription.. May return an error with a message "OWNER_USERNAMES_LIMIT_EXCEEDED" if the current user already owns at least getOption("secondary_bot_username_count_max") bots with a secondary username.
///
/// * [botUserId]: Identifier of the target bot.
/// * [username]: The new secondary username; must be non-empty. Use checkBotUsername to check username validness.
///
/// [Ok] is returned on completion.
final class AddBotSecondaryUsername extends TdFunction {
  /// **AddBotSecondaryUsername** *(addBotSecondaryUsername)* - TDLib function
  ///
  /// Adds a secondary username to a bot. Can be called only if userTypeBot.can_be_edited, the bot has no secondary username and the current user has Telegram Premium subscription.. May return an error with a message "OWNER_USERNAMES_LIMIT_EXCEEDED" if the current user already owns at least getOption("secondary_bot_username_count_max") bots with a secondary username.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [username]: The new secondary username; must be non-empty. Use checkBotUsername to check username validness.
  ///
  /// [Ok] is returned on completion.
  const AddBotSecondaryUsername({
    required this.botUserId,
    required this.username,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// The new secondary username; must be non-empty. Use checkBotUsername to check username validness
  final String username;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "username": username,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [username]: The new secondary username; must be non-empty. Use checkBotUsername to check username validness
  AddBotSecondaryUsername copyWith({
    int? botUserId,
    String? username,
  }) =>
      AddBotSecondaryUsername(
        botUserId: botUserId ?? this.botUserId,
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addBotSecondaryUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
