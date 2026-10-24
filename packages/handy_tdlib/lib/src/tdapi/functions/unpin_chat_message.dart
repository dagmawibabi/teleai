part of '../tdapi.dart';

/// **UnpinChatMessage** *(unpinChatMessage)* - TDLib function
///
/// Removes a pinned message from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel.
///
/// * [chatId]: Identifier of the chat.
/// * [messageId]: Identifier of the removed pinned message.
///
/// [Ok] is returned on completion.
final class UnpinChatMessage extends TdFunction {
  /// **UnpinChatMessage** *(unpinChatMessage)* - TDLib function
  ///
  /// Removes a pinned message from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [messageId]: Identifier of the removed pinned message.
  ///
  /// [Ok] is returned on completion.
  const UnpinChatMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Identifier of the removed pinned message
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [message_id]: Identifier of the removed pinned message
  UnpinChatMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      UnpinChatMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'unpinChatMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
