part of '../tdapi.dart';

/// **DeleteChatMessagesBySender** *(deleteChatMessagesBySender)* - TDLib function
///
/// Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator right.
///
/// * [chatId]: Chat identifier.
/// * [senderId]: Identifier of the sender of messages to delete.
///
/// [Ok] is returned on completion.
final class DeleteChatMessagesBySender extends TdFunction {
  /// **DeleteChatMessagesBySender** *(deleteChatMessagesBySender)* - TDLib function
  ///
  /// Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [senderId]: Identifier of the sender of messages to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatMessagesBySender({
    required this.chatId,
    required this.senderId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the sender of messages to delete
  final MessageSender senderId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "sender_id": senderId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [sender_id]: Identifier of the sender of messages to delete
  DeleteChatMessagesBySender copyWith({
    int? chatId,
    MessageSender? senderId,
  }) =>
      DeleteChatMessagesBySender(
        chatId: chatId ?? this.chatId,
        senderId: senderId ?? this.senderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatMessagesBySender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
