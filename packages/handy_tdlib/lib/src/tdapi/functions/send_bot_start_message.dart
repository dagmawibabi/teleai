part of '../tdapi.dart';

/// **SendBotStartMessage** *(sendBotStartMessage)* - TDLib function
///
/// Invites a bot to a chat (if it is not yet a member) and sends it the /start command; requires can_invite_users member right. Bots can't be invited to a private chat other than the chat with the bot.. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message.
///
/// * [botUserId]: Identifier of the bot.
/// * [chatId]: Identifier of the target chat.
/// * [parameter]: A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking).
///
/// [Message] is returned on completion.
final class SendBotStartMessage extends TdFunction {
  /// **SendBotStartMessage** *(sendBotStartMessage)* - TDLib function
  ///
  /// Invites a bot to a chat (if it is not yet a member) and sends it the /start command; requires can_invite_users member right. Bots can't be invited to a private chat other than the chat with the bot.. Bots can't be invited to channels (although they can be added as admins) and secret chats. Returns the sent message.
  ///
  /// * [botUserId]: Identifier of the bot.
  /// * [chatId]: Identifier of the target chat.
  /// * [parameter]: A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking).
  ///
  /// [Message] is returned on completion.
  const SendBotStartMessage({
    required this.botUserId,
    required this.chatId,
    required this.parameter,
  });

  /// Identifier of the bot
  final int botUserId;

  /// Identifier of the target chat
  final int chatId;

  /// A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
  final String parameter;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "chat_id": chatId,
      "parameter": parameter,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot
  /// * [chat_id]: Identifier of the target chat
  /// * [parameter]: A hidden parameter sent to the bot for deep linking purposes (https://core.telegram.org/bots#deep-linking)
  SendBotStartMessage copyWith({
    int? botUserId,
    int? chatId,
    String? parameter,
  }) =>
      SendBotStartMessage(
        botUserId: botUserId ?? this.botUserId,
        chatId: chatId ?? this.chatId,
        parameter: parameter ?? this.parameter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendBotStartMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
