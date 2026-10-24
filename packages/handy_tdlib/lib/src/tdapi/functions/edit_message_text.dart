part of '../tdapi.dart';

/// **EditMessageText** *(editMessageText)* - TDLib function
///
/// Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side.
///
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
/// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
/// * [inputMessageContent]: New text content of the message. Must be of type inputMessageText or inputMessageRichMessage.
///
/// [Message] is returned on completion.
final class EditMessageText extends TdFunction {
  /// **EditMessageText** *(editMessageText)* - TDLib function
  ///
  /// Edits the text of a message (or a text of a game message). Returns the edited message after the edit is completed on the server side.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
  /// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
  /// * [inputMessageContent]: New text content of the message. Must be of type inputMessageText or inputMessageRichMessage.
  ///
  /// [Message] is returned on completion.
  const EditMessageText({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    required this.inputMessageContent,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  final int messageId;

  /// The new message reply markup; pass null if none; for bots only
  final ReplyMarkup? replyMarkup;

  /// New text content of the message. Must be of type inputMessageText or inputMessageRichMessage
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup?.toJson(),
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  /// * [reply_markup]: The new message reply markup; pass null if none; for bots only
  /// * [input_message_content]: New text content of the message. Must be of type inputMessageText or inputMessageRichMessage
  EditMessageText copyWith({
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      EditMessageText(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editMessageText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
