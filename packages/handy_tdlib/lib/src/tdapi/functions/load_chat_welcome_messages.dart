part of '../tdapi.dart';

/// **LoadChatWelcomeMessages** *(loadChatWelcomeMessages)* - TDLib function
///
/// Loads welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. The loaded messages will be sent through updateChatWelcomeMessages.
///
/// * [chatId]: The identifier of the chat.
///
/// [Ok] is returned on completion.
final class LoadChatWelcomeMessages extends TdFunction {
  /// **LoadChatWelcomeMessages** *(loadChatWelcomeMessages)* - TDLib function
  ///
  /// Loads welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat. The loaded messages will be sent through updateChatWelcomeMessages.
  ///
  /// * [chatId]: The identifier of the chat.
  ///
  /// [Ok] is returned on completion.
  const LoadChatWelcomeMessages({
    required this.chatId,
  });

  /// The identifier of the chat
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat
  LoadChatWelcomeMessages copyWith({
    int? chatId,
  }) =>
      LoadChatWelcomeMessages(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadChatWelcomeMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
