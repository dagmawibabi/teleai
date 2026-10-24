part of '../tdapi.dart';

/// **EditChatWelcomeMessage** *(editChatWelcomeMessage)* - TDLib function
///
/// Edits a welcome message of a chat; requires can_send_welcome_messages administrator right in the chat.
///
/// * [chatId]: The identifier of the chat.
/// * [welcomeMessageId]: The identifier of the welcome message.
/// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote.
///
/// [Ok] is returned on completion.
final class EditChatWelcomeMessage extends TdFunction {
  /// **EditChatWelcomeMessage** *(editChatWelcomeMessage)* - TDLib function
  ///
  /// Edits a welcome message of a chat; requires can_send_welcome_messages administrator right in the chat.
  ///
  /// * [chatId]: The identifier of the chat.
  /// * [welcomeMessageId]: The identifier of the welcome message.
  /// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote.
  ///
  /// [Ok] is returned on completion.
  const EditChatWelcomeMessage({
    required this.chatId,
    required this.welcomeMessageId,
    required this.inputMessageContent,
  });

  /// The identifier of the chat
  final int chatId;

  /// The identifier of the welcome message
  final int welcomeMessageId;

  /// New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "welcome_message_id": welcomeMessageId,
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat
  /// * [welcome_message_id]: The identifier of the welcome message
  /// * [input_message_content]: New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation,. inputMessageAudio, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageSticker, inputMessageVideo, inputMessageVideoNote, inputMessageVoiceNote
  EditChatWelcomeMessage copyWith({
    int? chatId,
    int? welcomeMessageId,
    InputMessageContent? inputMessageContent,
  }) =>
      EditChatWelcomeMessage(
        chatId: chatId ?? this.chatId,
        welcomeMessageId: welcomeMessageId ?? this.welcomeMessageId,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editChatWelcomeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
