part of '../tdapi.dart';

/// **EditMessageReplyMarkup** *(editMessageReplyMarkup)* - TDLib function
///
/// Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side.
///
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
///
/// [Message] is returned on completion.
final class EditMessageReplyMarkup extends TdFunction {
  /// **EditMessageReplyMarkup** *(editMessageReplyMarkup)* - TDLib function
  ///
  /// Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  ///
  /// [Message] is returned on completion.
  const EditMessageReplyMarkup({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  final int messageId;

  /// The new message reply markup; pass null if none
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
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  /// * [reply_markup]: The new message reply markup; pass null if none
  EditMessageReplyMarkup copyWith({
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) =>
      EditMessageReplyMarkup(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editMessageReplyMarkup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
