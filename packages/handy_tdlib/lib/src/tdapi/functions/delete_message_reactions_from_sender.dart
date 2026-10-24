part of '../tdapi.dart';

/// **DeleteMessageReactionsFromSender** *(deleteMessageReactionsFromSender)* - TDLib function
///
/// Deletes all reactions added by the specified sender on a message.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message containing the reactions. Use messageProperties.can_delete_reactions to check whether the method can be used for a message.
/// * [senderId]: Identifier of the sender of reactions to delete.
///
/// [Ok] is returned on completion.
final class DeleteMessageReactionsFromSender extends TdFunction {
  /// **DeleteMessageReactionsFromSender** *(deleteMessageReactionsFromSender)* - TDLib function
  ///
  /// Deletes all reactions added by the specified sender on a message.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message containing the reactions. Use messageProperties.can_delete_reactions to check whether the method can be used for a message.
  /// * [senderId]: Identifier of the sender of reactions to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteMessageReactionsFromSender({
    required this.chatId,
    required this.messageId,
    required this.senderId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the message containing the reactions. Use messageProperties.can_delete_reactions to check whether the method can be used for a message
  final int messageId;

  /// Identifier of the sender of reactions to delete
  final MessageSender senderId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "sender_id": senderId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Identifier of the message containing the reactions. Use messageProperties.can_delete_reactions to check whether the method can be used for a message
  /// * [sender_id]: Identifier of the sender of reactions to delete
  DeleteMessageReactionsFromSender copyWith({
    int? chatId,
    int? messageId,
    MessageSender? senderId,
  }) =>
      DeleteMessageReactionsFromSender(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        senderId: senderId ?? this.senderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteMessageReactionsFromSender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
