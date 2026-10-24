part of '../tdapi.dart';

/// **SendEphemeralMessage** *(sendEphemeralMessage)* - TDLib function
///
/// Sends an ephemeral message which will be received only by one bot in a chat. Currently, only ephemeral bot commands and replies to bot ephemeral messages can be sent using the method.. The message is persistent across application restarts only if the message database is used. Returns the sent message.
///
/// * [chatId]: Target chat.
/// * [topicId]: Topic in which the message will be sent; pass null if none *(optional)*.
/// * [receiverUserId]: Identifier of the user who will receive the message.
/// * [callbackQueryId]: Identifier of the callback query which triggered the message; for bots only.
/// * [replaceCallbackQueryMessage]: Pass true if the ephemeral message must replace the message from which the callback query originated; for bots only.
/// * [replyTo]: Information about the message to be replied; pass null if none. The message can be an incoming ephemeral message *(optional)*.
/// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving; for bots only.
/// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
/// * [onlyPreview]: Pass true to get a fake message instead of actually sending it.
/// * [replyMarkup]: Markup for replying to the message; pass null if none; for bots only *(optional)*.
/// * [inputMessageContent]: The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact.
///
/// [Message] is returned on completion.
final class SendEphemeralMessage extends TdFunction {
  /// **SendEphemeralMessage** *(sendEphemeralMessage)* - TDLib function
  ///
  /// Sends an ephemeral message which will be received only by one bot in a chat. Currently, only ephemeral bot commands and replies to bot ephemeral messages can be sent using the method.. The message is persistent across application restarts only if the message database is used. Returns the sent message.
  ///
  /// * [chatId]: Target chat.
  /// * [topicId]: Topic in which the message will be sent; pass null if none *(optional)*.
  /// * [receiverUserId]: Identifier of the user who will receive the message.
  /// * [callbackQueryId]: Identifier of the callback query which triggered the message; for bots only.
  /// * [replaceCallbackQueryMessage]: Pass true if the ephemeral message must replace the message from which the callback query originated; for bots only.
  /// * [replyTo]: Information about the message to be replied; pass null if none. The message can be an incoming ephemeral message *(optional)*.
  /// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving; for bots only.
  /// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
  /// * [onlyPreview]: Pass true to get a fake message instead of actually sending it.
  /// * [replyMarkup]: Markup for replying to the message; pass null if none; for bots only *(optional)*.
  /// * [inputMessageContent]: The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact.
  ///
  /// [Message] is returned on completion.
  const SendEphemeralMessage({
    required this.chatId,
    this.topicId,
    required this.receiverUserId,
    required this.callbackQueryId,
    required this.replaceCallbackQueryMessage,
    this.replyTo,
    required this.protectContent,
    required this.sendingId,
    required this.onlyPreview,
    this.replyMarkup,
    required this.inputMessageContent,
  });

  /// Target chat
  final int chatId;

  /// Topic in which the message will be sent; pass null if none
  final MessageTopic? topicId;

  /// Identifier of the user who will receive the message
  final int receiverUserId;

  /// Identifier of the callback query which triggered the message; for bots only
  final int callbackQueryId;

  /// Pass true if the ephemeral message must replace the message from which the callback query originated; for bots only
  final bool replaceCallbackQueryMessage;

  /// Information about the message to be replied; pass null if none. The message can be an incoming ephemeral message
  final InputMessageReplyTo? replyTo;

  /// Pass true if the content of the message must be protected from forwarding and saving; for bots only
  final bool protectContent;

  /// Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  final int sendingId;

  /// Pass true to get a fake message instead of actually sending it
  final bool onlyPreview;

  /// Markup for replying to the message; pass null if none; for bots only
  final ReplyMarkup? replyMarkup;

  /// The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "receiver_user_id": receiverUserId,
      "callback_query_id": callbackQueryId,
      "replace_callback_query_message": replaceCallbackQueryMessage,
      "reply_to": replyTo?.toJson(),
      "protect_content": protectContent,
      "sending_id": sendingId,
      "only_preview": onlyPreview,
      "reply_markup": replyMarkup?.toJson(),
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Target chat
  /// * [topic_id]: Topic in which the message will be sent; pass null if none
  /// * [receiver_user_id]: Identifier of the user who will receive the message
  /// * [callback_query_id]: Identifier of the callback query which triggered the message; for bots only
  /// * [replace_callback_query_message]: Pass true if the ephemeral message must replace the message from which the callback query originated; for bots only
  /// * [reply_to]: Information about the message to be replied; pass null if none. The message can be an incoming ephemeral message
  /// * [protect_content]: Pass true if the content of the message must be protected from forwarding and saving; for bots only
  /// * [sending_id]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  /// * [only_preview]: Pass true to get a fake message instead of actually sending it
  /// * [reply_markup]: Markup for replying to the message; pass null if none; for bots only
  /// * [input_message_content]: The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact
  SendEphemeralMessage copyWith({
    int? chatId,
    MessageTopic? topicId,
    int? receiverUserId,
    int? callbackQueryId,
    bool? replaceCallbackQueryMessage,
    InputMessageReplyTo? replyTo,
    bool? protectContent,
    int? sendingId,
    bool? onlyPreview,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      SendEphemeralMessage(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        callbackQueryId: callbackQueryId ?? this.callbackQueryId,
        replaceCallbackQueryMessage:
            replaceCallbackQueryMessage ?? this.replaceCallbackQueryMessage,
        replyTo: replyTo ?? this.replyTo,
        protectContent: protectContent ?? this.protectContent,
        sendingId: sendingId ?? this.sendingId,
        onlyPreview: onlyPreview ?? this.onlyPreview,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendEphemeralMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
