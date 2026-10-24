part of '../tdapi.dart';

/// **EditBusinessMessageReplyMarkup** *(editBusinessMessageReplyMarkup)* - TDLib function
///
/// Edits the reply markup of a message sent on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
///
/// [BusinessMessage] is returned on completion.
final class EditBusinessMessageReplyMarkup extends TdFunction {
  /// **EditBusinessMessageReplyMarkup** *(editBusinessMessageReplyMarkup)* - TDLib function
  ///
  /// Edits the reply markup of a message sent on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  ///
  /// [BusinessMessage] is returned on completion.
  const EditBusinessMessageReplyMarkup({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  /// Unique identifier of business connection on behalf of which the message was sent
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message
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
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which the message was sent
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  /// * [reply_markup]: The new message reply markup; pass null if none
  EditBusinessMessageReplyMarkup copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) =>
      EditBusinessMessageReplyMarkup(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBusinessMessageReplyMarkup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
