part of '../tdapi.dart';

/// **SetChatDirectMessagesGroup** *(setChatDirectMessagesGroup)* - TDLib function
///
/// Changes direct messages group settings for a channel chat; requires owner privileges in the chat.
///
/// * [chatId]: Identifier of the channel chat.
/// * [isEnabled]: Pass true if the direct messages group is enabled for the channel chat; pass false otherwise.
/// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid for each message that is sent to the direct messages chat unless the sender is an administrator of the channel chat; 0-getOption("paid_message_star_count_max").. The channel will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending. Requires supergroupFullInfo.can_enable_paid_messages for positive amounts.
///
/// [Ok] is returned on completion.
final class SetChatDirectMessagesGroup extends TdFunction {
  /// **SetChatDirectMessagesGroup** *(setChatDirectMessagesGroup)* - TDLib function
  ///
  /// Changes direct messages group settings for a channel chat; requires owner privileges in the chat.
  ///
  /// * [chatId]: Identifier of the channel chat.
  /// * [isEnabled]: Pass true if the direct messages group is enabled for the channel chat; pass false otherwise.
  /// * [paidMessageStarCount]: The new number of Telegram Stars that must be paid for each message that is sent to the direct messages chat unless the sender is an administrator of the channel chat; 0-getOption("paid_message_star_count_max").. The channel will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending. Requires supergroupFullInfo.can_enable_paid_messages for positive amounts.
  ///
  /// [Ok] is returned on completion.
  const SetChatDirectMessagesGroup({
    required this.chatId,
    required this.isEnabled,
    required this.paidMessageStarCount,
  });

  /// Identifier of the channel chat
  final int chatId;

  /// Pass true if the direct messages group is enabled for the channel chat; pass false otherwise
  final bool isEnabled;

  /// The new number of Telegram Stars that must be paid for each message that is sent to the direct messages chat unless the sender is an administrator of the channel chat; 0-getOption("paid_message_star_count_max").. The channel will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending. Requires supergroupFullInfo.can_enable_paid_messages for positive amounts
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_enabled": isEnabled,
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat
  /// * [is_enabled]: Pass true if the direct messages group is enabled for the channel chat; pass false otherwise
  /// * [paid_message_star_count]: The new number of Telegram Stars that must be paid for each message that is sent to the direct messages chat unless the sender is an administrator of the channel chat; 0-getOption("paid_message_star_count_max").. The channel will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending. Requires supergroupFullInfo.can_enable_paid_messages for positive amounts
  SetChatDirectMessagesGroup copyWith({
    int? chatId,
    bool? isEnabled,
    int? paidMessageStarCount,
  }) =>
      SetChatDirectMessagesGroup(
        chatId: chatId ?? this.chatId,
        isEnabled: isEnabled ?? this.isEnabled,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatDirectMessagesGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
