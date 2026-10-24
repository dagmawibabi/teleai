part of '../tdapi.dart';

/// **DeleteAllChatWelcomeMessages** *(deleteAllChatWelcomeMessages)* - TDLib function
///
/// Deletes all welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat.
///
/// * [chatId]: The identifier of the chat.
///
/// [Ok] is returned on completion.
final class DeleteAllChatWelcomeMessages extends TdFunction {
  /// **DeleteAllChatWelcomeMessages** *(deleteAllChatWelcomeMessages)* - TDLib function
  ///
  /// Deletes all welcome messages of a chat; requires can_send_welcome_messages administrator right in the chat.
  ///
  /// * [chatId]: The identifier of the chat.
  ///
  /// [Ok] is returned on completion.
  const DeleteAllChatWelcomeMessages({
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
  DeleteAllChatWelcomeMessages copyWith({
    int? chatId,
  }) =>
      DeleteAllChatWelcomeMessages(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteAllChatWelcomeMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
