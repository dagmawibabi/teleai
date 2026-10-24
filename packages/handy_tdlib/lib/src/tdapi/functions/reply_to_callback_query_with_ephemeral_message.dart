part of '../tdapi.dart';

/// **ReplyToCallbackQueryWithEphemeralMessage** *(replyToCallbackQueryWithEphemeralMessage)* - TDLib function
///
/// Replies to a callback query with an ephemeral message; for bots only.
///
/// * [callbackQueryId]: Identifier of the callback query.
/// * [replaceCallbackQueryMessage]: Pass true if the ephemeral message must replace the message from which the callback query originated.
/// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote.
///
/// [Ok] is returned on completion.
final class ReplyToCallbackQueryWithEphemeralMessage extends TdFunction {
  /// **ReplyToCallbackQueryWithEphemeralMessage** *(replyToCallbackQueryWithEphemeralMessage)* - TDLib function
  ///
  /// Replies to a callback query with an ephemeral message; for bots only.
  ///
  /// * [callbackQueryId]: Identifier of the callback query.
  /// * [replaceCallbackQueryMessage]: Pass true if the ephemeral message must replace the message from which the callback query originated.
  /// * [protectContent]: Pass true if the content of the message must be protected from forwarding and saving.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote.
  ///
  /// [Ok] is returned on completion.
  const ReplyToCallbackQueryWithEphemeralMessage({
    required this.callbackQueryId,
    required this.replaceCallbackQueryMessage,
    required this.protectContent,
    this.replyMarkup,
    required this.inputMessageContent,
  });

  /// Identifier of the callback query
  final int callbackQueryId;

  /// Pass true if the ephemeral message must replace the message from which the callback query originated
  final bool replaceCallbackQueryMessage;

  /// Pass true if the content of the message must be protected from forwarding and saving
  final bool protectContent;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "callback_query_id": callbackQueryId,
      "replace_callback_query_message": replaceCallbackQueryMessage,
      "protect_content": protectContent,
      "reply_markup": replyMarkup?.toJson(),
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [callback_query_id]: Identifier of the callback query
  /// * [replace_callback_query_message]: Pass true if the ephemeral message must replace the message from which the callback query originated
  /// * [protect_content]: Pass true if the content of the message must be protected from forwarding and saving
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [input_message_content]: New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
  ReplyToCallbackQueryWithEphemeralMessage copyWith({
    int? callbackQueryId,
    bool? replaceCallbackQueryMessage,
    bool? protectContent,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      ReplyToCallbackQueryWithEphemeralMessage(
        callbackQueryId: callbackQueryId ?? this.callbackQueryId,
        replaceCallbackQueryMessage:
            replaceCallbackQueryMessage ?? this.replaceCallbackQueryMessage,
        protectContent: protectContent ?? this.protectContent,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'replyToCallbackQueryWithEphemeralMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
