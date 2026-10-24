part of '../tdapi.dart';

/// **CommitPendingPaidMessageReactions** *(commitPendingPaidMessageReactions)* - TDLib function
///
/// Applies all pending paid reactions on a message.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
///
/// [Ok] is returned on completion.
final class CommitPendingPaidMessageReactions extends TdFunction {
  /// **CommitPendingPaidMessageReactions** *(commitPendingPaidMessageReactions)* - TDLib function
  ///
  /// Applies all pending paid reactions on a message.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  ///
  /// [Ok] is returned on completion.
  const CommitPendingPaidMessageReactions({
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
  CommitPendingPaidMessageReactions copyWith({
    int? chatId,
    int? messageId,
  }) =>
      CommitPendingPaidMessageReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'commitPendingPaidMessageReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
