part of '../tdapi.dart';

/// **DeleteChatWelcomeMessage** *(deleteChatWelcomeMessage)* - TDLib function
///
/// Deletes a welcome message of a chat; requires can_send_welcome_messages administrator right in the chat.
///
/// * [chatId]: The identifier of the chat.
/// * [welcomeMessageId]: The identifier of the welcome message.
///
/// [Ok] is returned on completion.
final class DeleteChatWelcomeMessage extends TdFunction {
  /// **DeleteChatWelcomeMessage** *(deleteChatWelcomeMessage)* - TDLib function
  ///
  /// Deletes a welcome message of a chat; requires can_send_welcome_messages administrator right in the chat.
  ///
  /// * [chatId]: The identifier of the chat.
  /// * [welcomeMessageId]: The identifier of the welcome message.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatWelcomeMessage({
    required this.chatId,
    required this.welcomeMessageId,
  });

  /// The identifier of the chat
  final int chatId;

  /// The identifier of the welcome message
  final int welcomeMessageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "welcome_message_id": welcomeMessageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat
  /// * [welcome_message_id]: The identifier of the welcome message
  DeleteChatWelcomeMessage copyWith({
    int? chatId,
    int? welcomeMessageId,
  }) =>
      DeleteChatWelcomeMessage(
        chatId: chatId ?? this.chatId,
        welcomeMessageId: welcomeMessageId ?? this.welcomeMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatWelcomeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
