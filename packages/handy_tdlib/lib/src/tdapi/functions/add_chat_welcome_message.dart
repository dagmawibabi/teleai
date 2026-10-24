part of '../tdapi.dart';

/// **AddChatWelcomeMessage** *(addChatWelcomeMessage)* - TDLib function
///
/// Adds a message to the list of welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. There can be up to getOption("welcome_message_count_max") welcome messages in a chat.
///
/// * [chatId]: The identifier of the chat.
/// * [inputMessageContent]: The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact.
///
/// [Ok] is returned on completion.
final class AddChatWelcomeMessage extends TdFunction {
  /// **AddChatWelcomeMessage** *(addChatWelcomeMessage)* - TDLib function
  ///
  /// Adds a message to the list of welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. There can be up to getOption("welcome_message_count_max") welcome messages in a chat.
  ///
  /// * [chatId]: The identifier of the chat.
  /// * [inputMessageContent]: The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact.
  ///
  /// [Ok] is returned on completion.
  const AddChatWelcomeMessage({
    required this.chatId,
    required this.inputMessageContent,
  });

  /// The identifier of the chat
  final int chatId;

  /// The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat
  /// * [input_message_content]: The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote,. inputMessageLocation, inputMessageVenue, inputMessageContact
  AddChatWelcomeMessage copyWith({
    int? chatId,
    InputMessageContent? inputMessageContent,
  }) =>
      AddChatWelcomeMessage(
        chatId: chatId ?? this.chatId,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addChatWelcomeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
