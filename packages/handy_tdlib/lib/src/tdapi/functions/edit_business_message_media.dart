part of '../tdapi.dart';

/// **EditBusinessMessageMedia** *(editBusinessMessageMedia)* - TDLib function
///
/// Edits the media content of a message with a text, an animation, an audio, a document, a photo or a video in a message sent on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
/// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
/// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, or inputMessageVideo.
///
/// [BusinessMessage] is returned on completion.
final class EditBusinessMessageMedia extends TdFunction {
  /// **EditBusinessMessageMedia** *(editBusinessMessageMedia)* - TDLib function
  ///
  /// Edits the media content of a message with a text, an animation, an audio, a document, a photo or a video in a message sent on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  /// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
  /// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, or inputMessageVideo.
  ///
  /// [BusinessMessage] is returned on completion.
  const EditBusinessMessageMedia({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    required this.inputMessageContent,
  });

  /// Unique identifier of business connection on behalf of which the message was sent
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// The new message reply markup; pass null if none; for bots only
  final ReplyMarkup? replyMarkup;

  /// New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, or inputMessageVideo
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
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
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which the message was sent
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  /// * [reply_markup]: The new message reply markup; pass null if none; for bots only
  /// * [input_message_content]: New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto, or inputMessageVideo
  EditBusinessMessageMedia copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      EditBusinessMessageMedia(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBusinessMessageMedia';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
