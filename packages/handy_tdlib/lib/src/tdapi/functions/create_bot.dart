part of '../tdapi.dart';

/// **CreateBot** *(createBot)* - TDLib function
///
/// Creates a bot which will be managed by another bot. Returns the created bot. May return an error with a message "BOT_CREATE_LIMIT_EXCEEDED". if the user already owns the maximum allowed number of bots as per getOption("owned_bot_count_max"). An internal link "https://t.me/BotFather?start=deletebot" can be processed to handle the error.
///
/// * [managerBotUserId]: Identifier of the bot that will manage the created bot.
/// * [name]: Name of the bot; 1-64 characters.
/// * [username]: Username of the bot. The username must end with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive.. Use checkBotUsername to find whether the name is suitable. If the username doesn't end with "bot", then the current user must have Telegram Premium subscription,. the chosen username will be assigned as secondary and an additional regular username ending with "bot" will be automatically assigned to the created bot.
/// * [viaLink]: Pass true if the bot is created from an internalLinkTypeRequestManagedBot link.
///
/// [User] is returned on completion.
final class CreateBot extends TdFunction {
  /// **CreateBot** *(createBot)* - TDLib function
  ///
  /// Creates a bot which will be managed by another bot. Returns the created bot. May return an error with a message "BOT_CREATE_LIMIT_EXCEEDED". if the user already owns the maximum allowed number of bots as per getOption("owned_bot_count_max"). An internal link "https://t.me/BotFather?start=deletebot" can be processed to handle the error.
  ///
  /// * [managerBotUserId]: Identifier of the bot that will manage the created bot.
  /// * [name]: Name of the bot; 1-64 characters.
  /// * [username]: Username of the bot. The username must end with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive.. Use checkBotUsername to find whether the name is suitable. If the username doesn't end with "bot", then the current user must have Telegram Premium subscription,. the chosen username will be assigned as secondary and an additional regular username ending with "bot" will be automatically assigned to the created bot.
  /// * [viaLink]: Pass true if the bot is created from an internalLinkTypeRequestManagedBot link.
  ///
  /// [User] is returned on completion.
  const CreateBot({
    required this.managerBotUserId,
    required this.name,
    required this.username,
    required this.viaLink,
  });

  /// Identifier of the bot that will manage the created bot
  final int managerBotUserId;

  /// Name of the bot; 1-64 characters
  final String name;

  /// Username of the bot. The username must end with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive.. Use checkBotUsername to find whether the name is suitable. If the username doesn't end with "bot", then the current user must have Telegram Premium subscription,. the chosen username will be assigned as secondary and an additional regular username ending with "bot" will be automatically assigned to the created bot
  final String username;

  /// Pass true if the bot is created from an internalLinkTypeRequestManagedBot link
  final bool viaLink;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "manager_bot_user_id": managerBotUserId,
      "name": name,
      "username": username,
      "via_link": viaLink,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [manager_bot_user_id]: Identifier of the bot that will manage the created bot
  /// * [name]: Name of the bot; 1-64 characters
  /// * [username]: Username of the bot. The username must end with "bot" or a string from updateAllowedBotUsernamePremiumSuffixes case-insensitive.. Use checkBotUsername to find whether the name is suitable. If the username doesn't end with "bot", then the current user must have Telegram Premium subscription,. the chosen username will be assigned as secondary and an additional regular username ending with "bot" will be automatically assigned to the created bot
  /// * [via_link]: Pass true if the bot is created from an internalLinkTypeRequestManagedBot link
  CreateBot copyWith({
    int? managerBotUserId,
    String? name,
    String? username,
    bool? viaLink,
  }) =>
      CreateBot(
        managerBotUserId: managerBotUserId ?? this.managerBotUserId,
        name: name ?? this.name,
        username: username ?? this.username,
        viaLink: viaLink ?? this.viaLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
