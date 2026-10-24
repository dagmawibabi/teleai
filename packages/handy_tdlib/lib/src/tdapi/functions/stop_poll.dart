part of '../tdapi.dart';

/// **StopPoll** *(stopPoll)* - TDLib function
///
/// Stops a poll.
///
/// * [chatId]: Identifier of the chat to which the poll belongs.
/// * [messageId]: Identifier of the message containing the poll. Use messageProperties.can_be_edited to check whether the poll can be stopped.
/// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
///
/// [Ok] is returned on completion.
final class StopPoll extends TdFunction {
  /// **StopPoll** *(stopPoll)* - TDLib function
  ///
  /// Stops a poll.
  ///
  /// * [chatId]: Identifier of the chat to which the poll belongs.
  /// * [messageId]: Identifier of the message containing the poll. Use messageProperties.can_be_edited to check whether the poll can be stopped.
  /// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const StopPoll({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  /// Identifier of the chat to which the poll belongs
  final int chatId;

  /// Identifier of the message containing the poll. Use messageProperties.can_be_edited to check whether the poll can be stopped
  final int messageId;

  /// The new message reply markup; pass null if none; for bots only
  final ReplyMarkup? replyMarkup;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the poll belongs
  /// * [message_id]: Identifier of the message containing the poll. Use messageProperties.can_be_edited to check whether the poll can be stopped
  /// * [reply_markup]: The new message reply markup; pass null if none; for bots only
  StopPoll copyWith({
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) =>
      StopPoll(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stopPoll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
