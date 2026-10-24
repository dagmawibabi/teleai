part of '../tdapi.dart';

/// **SetChatPaidMessageStarCount** *(setChatPaidMessageStarCount)* - TDLib function
///
/// Changes the Telegram Star amount that must be paid to send a message to a supergroup chat; requires can_restrict_members administrator right and supergroupFullInfo.can_enable_paid_messages.
///
/// * [chatId]: Identifier of the supergroup chat.
/// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid for each message that is sent to the supergroup chat unless the sender is an administrator of the chat; 0-getOption("paid_message_star_count_max").. The supergroup will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending.
///
/// [Ok] is returned on completion.
final class SetChatPaidMessageStarCount extends TdFunction {
  /// **SetChatPaidMessageStarCount** *(setChatPaidMessageStarCount)* - TDLib function
  ///
  /// Changes the Telegram Star amount that must be paid to send a message to a supergroup chat; requires can_restrict_members administrator right and supergroupFullInfo.can_enable_paid_messages.
  ///
  /// * [chatId]: Identifier of the supergroup chat.
  /// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid for each message that is sent to the supergroup chat unless the sender is an administrator of the chat; 0-getOption("paid_message_star_count_max").. The supergroup will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending.
  ///
  /// [Ok] is returned on completion.
  const SetChatPaidMessageStarCount({
    required this.chatId,
    required this.paidMessageStarCount,
  });

  /// Identifier of the supergroup chat
  final int chatId;

  /// The new number of Telegram Stars that must be paid for each message that is sent to the supergroup chat unless the sender is an administrator of the chat; 0-getOption("paid_message_star_count_max").. The supergroup will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the supergroup chat
  /// * [paid_message_star_count]: The new number of Telegram Stars that must be paid for each message that is sent to the supergroup chat unless the sender is an administrator of the chat; 0-getOption("paid_message_star_count_max").. The supergroup will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending
  SetChatPaidMessageStarCount copyWith({
    int? chatId,
    int? paidMessageStarCount,
  }) =>
      SetChatPaidMessageStarCount(
        chatId: chatId ?? this.chatId,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatPaidMessageStarCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
