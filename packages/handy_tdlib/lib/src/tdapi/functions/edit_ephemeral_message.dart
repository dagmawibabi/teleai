part of '../tdapi.dart';

/// **EditEphemeralMessage** *(editEphemeralMessage)* - TDLib function
///
/// Edits the text, media, or reply markup of an ephemeral message sent by the bot; for bots only.
///
/// * [chatId]: The chat the message belongs to.
/// * [receiverUserId]: Identifier of the user who received the message.
/// * [ephemeralMessageId]: Identifier of the ephemeral message.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [inputMessageContent]: New content of the message; pass null to edit only reply markup. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote *(optional)*.
///
/// [Ok] is returned on completion.
final class EditEphemeralMessage extends TdFunction {
  /// **EditEphemeralMessage** *(editEphemeralMessage)* - TDLib function
  ///
  /// Edits the text, media, or reply markup of an ephemeral message sent by the bot; for bots only.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [receiverUserId]: Identifier of the user who received the message.
  /// * [ephemeralMessageId]: Identifier of the ephemeral message.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [inputMessageContent]: New content of the message; pass null to edit only reply markup. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const EditEphemeralMessage({
    required this.chatId,
    required this.receiverUserId,
    required this.ephemeralMessageId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the user who received the message
  final int receiverUserId;

  /// Identifier of the ephemeral message
  final int ephemeralMessageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// New content of the message; pass null to edit only reply markup. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
  final InputMessageContent? inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "receiver_user_id": receiverUserId,
      "ephemeral_message_id": ephemeralMessageId,
      "reply_markup": replyMarkup?.toJson(),
      "input_message_content": inputMessageContent?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat the message belongs to
  /// * [receiver_user_id]: Identifier of the user who received the message
  /// * [ephemeral_message_id]: Identifier of the ephemeral message
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [input_message_content]: New content of the message; pass null to edit only reply markup. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
  EditEphemeralMessage copyWith({
    int? chatId,
    int? receiverUserId,
    int? ephemeralMessageId,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      EditEphemeralMessage(
        chatId: chatId ?? this.chatId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        ephemeralMessageId: ephemeralMessageId ?? this.ephemeralMessageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editEphemeralMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
