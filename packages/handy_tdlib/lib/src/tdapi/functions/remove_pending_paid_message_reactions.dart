part of '../tdapi.dart';

/// **RemovePendingPaidMessageReactions** *(removePendingPaidMessageReactions)* - TDLib function
///
/// Removes all pending paid reactions on a message.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
///
/// [Ok] is returned on completion.
final class RemovePendingPaidMessageReactions extends TdFunction {
  /// **RemovePendingPaidMessageReactions** *(removePendingPaidMessageReactions)* - TDLib function
  ///
  /// Removes all pending paid reactions on a message.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  ///
  /// [Ok] is returned on completion.
  const RemovePendingPaidMessageReactions({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
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
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  RemovePendingPaidMessageReactions copyWith({
    int? chatId,
    int? messageId,
  }) =>
      RemovePendingPaidMessageReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removePendingPaidMessageReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
