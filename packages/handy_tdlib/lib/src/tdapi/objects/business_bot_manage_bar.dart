part of '../tdapi.dart';

/// **BusinessBotManageBar** *(businessBotManageBar)* - basic class
///
/// Contains information about a business bot that manages the chat.
///
/// * [botUserId]: User identifier of the bot.
/// * [manageUrl]: URL to be opened to manage the bot.
/// * [isBotPaused]: True, if the bot is paused. Use toggleBusinessConnectedBotChatIsPaused to change the value of the field.
/// * [canBotReply]: True, if the bot can reply.
final class BusinessBotManageBar extends TdObject {
  /// **BusinessBotManageBar** *(businessBotManageBar)* - basic class
  ///
  /// Contains information about a business bot that manages the chat.
  ///
  /// * [botUserId]: User identifier of the bot.
  /// * [manageUrl]: URL to be opened to manage the bot.
  /// * [isBotPaused]: True, if the bot is paused. Use toggleBusinessConnectedBotChatIsPaused to change the value of the field.
  /// * [canBotReply]: True, if the bot can reply.
  const BusinessBotManageBar({
    required this.botUserId,
    required this.manageUrl,
    required this.isBotPaused,
    required this.canBotReply,
  });

  /// User identifier of the bot
  final int botUserId;

  /// URL to be opened to manage the bot
  final String manageUrl;

  /// True, if the bot is paused. Use toggleBusinessConnectedBotChatIsPaused to change the value of the field
  final bool isBotPaused;

  /// True, if the bot can reply
  final bool canBotReply;

  /// Parse from a json
  factory BusinessBotManageBar.fromJson(Map<String, dynamic> json) =>
      BusinessBotManageBar(
        botUserId: json['bot_user_id'],
        manageUrl: json['manage_url'],
        isBotPaused: json['is_bot_paused'],
        canBotReply: json['can_bot_reply'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "manage_url": manageUrl,
      "is_bot_paused": isBotPaused,
      "can_bot_reply": canBotReply,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: User identifier of the bot
  /// * [manage_url]: URL to be opened to manage the bot
  /// * [is_bot_paused]: True, if the bot is paused. Use toggleBusinessConnectedBotChatIsPaused to change the value of the field
  /// * [can_bot_reply]: True, if the bot can reply
  BusinessBotManageBar copyWith({
    int? botUserId,
    String? manageUrl,
    bool? isBotPaused,
    bool? canBotReply,
  }) =>
      BusinessBotManageBar(
        botUserId: botUserId ?? this.botUserId,
        manageUrl: manageUrl ?? this.manageUrl,
        isBotPaused: isBotPaused ?? this.isBotPaused,
        canBotReply: canBotReply ?? this.canBotReply,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessBotManageBar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
