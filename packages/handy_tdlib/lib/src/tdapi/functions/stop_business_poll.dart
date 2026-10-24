part of '../tdapi.dart';

/// **StopBusinessPoll** *(stopBusinessPoll)* - TDLib function
///
/// Stops a poll sent on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message with the poll was sent.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message containing the poll.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
///
/// [BusinessMessage] is returned on completion.
final class StopBusinessPoll extends TdFunction {
  /// **StopBusinessPoll** *(stopBusinessPoll)* - TDLib function
  ///
  /// Stops a poll sent on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message with the poll was sent.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message containing the poll.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  ///
  /// [BusinessMessage] is returned on completion.
  const StopBusinessPoll({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  /// Unique identifier of business connection on behalf of which the message with the poll was sent
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message containing the poll
  final int messageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which the message with the poll was sent
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message containing the poll
  /// * [reply_markup]: The new message reply markup; pass null if none
  StopBusinessPoll copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) =>
      StopBusinessPoll(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stopBusinessPoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
