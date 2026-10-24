part of '../tdapi.dart';

/// **ResendMessages** *(resendMessages)* - TDLib function
///
/// Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true. and after specified in messageSendingStateFailed.retry_after time passed. If a message is re-sent, the corresponding failed to send message is deleted.. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message.
///
/// * [chatId]: Identifier of the chat to send messages.
/// * [messageIds]: Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order.
/// * [quote]: New manually chosen quote from the message to be replied; pass null if none. Ignored if more than one message is re-sent, or if messageSendingStateFailed.need_another_reply_quote == false *(optional)*.
/// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay to send the messages. Ignored if messageSendingStateFailed.required_paid_message_star_count == 0.
///
/// [Messages] is returned on completion.
final class ResendMessages extends TdFunction {
  /// **ResendMessages** *(resendMessages)* - TDLib function
  ///
  /// Resends messages which failed to send. Can be called only for messages for which messageSendingStateFailed.can_retry is true. and after specified in messageSendingStateFailed.retry_after time passed. If a message is re-sent, the corresponding failed to send message is deleted.. Returns the sent messages in the same order as the message identifiers passed in message_ids. If a message can't be re-sent, null will be returned instead of the message.
  ///
  /// * [chatId]: Identifier of the chat to send messages.
  /// * [messageIds]: Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order.
  /// * [quote]: New manually chosen quote from the message to be replied; pass null if none. Ignored if more than one message is re-sent, or if messageSendingStateFailed.need_another_reply_quote == false *(optional)*.
  /// * [paidMessageStarCount]: The number of Telegram Stars the user agreed to pay to send the messages. Ignored if messageSendingStateFailed.required_paid_message_star_count == 0.
  ///
  /// [Messages] is returned on completion.
  const ResendMessages({
    required this.chatId,
    required this.messageIds,
    this.quote,
    required this.paidMessageStarCount,
  });

  /// Identifier of the chat to send messages
  final int chatId;

  /// Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
  final List<int> messageIds;

  /// New manually chosen quote from the message to be replied; pass null if none. Ignored if more than one message is re-sent, or if messageSendingStateFailed.need_another_reply_quote == false
  final InputTextQuote? quote;

  /// The number of Telegram Stars the user agreed to pay to send the messages. Ignored if messageSendingStateFailed.required_paid_message_star_count == 0
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_ids": messageIds.map((i) => i).toList(),
      "quote": quote?.toJson(),
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to send messages
  /// * [message_ids]: Identifiers of the messages to resend. Message identifiers must be in a strictly increasing order
  /// * [quote]: New manually chosen quote from the message to be replied; pass null if none. Ignored if more than one message is re-sent, or if messageSendingStateFailed.need_another_reply_quote == false
  /// * [paid_message_star_count]: The number of Telegram Stars the user agreed to pay to send the messages. Ignored if messageSendingStateFailed.required_paid_message_star_count == 0
  ResendMessages copyWith({
    int? chatId,
    List<int>? messageIds,
    InputTextQuote? quote,
    int? paidMessageStarCount,
  }) =>
      ResendMessages(
        chatId: chatId ?? this.chatId,
        messageIds: messageIds ?? this.messageIds,
        quote: quote ?? this.quote,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'resendMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
