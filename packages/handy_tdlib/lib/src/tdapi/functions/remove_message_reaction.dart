part of '../tdapi.dart';

/// **RemoveMessageReaction** *(removeMessageReaction)* - TDLib function
///
/// Removes a reaction from a message. A chosen reaction can always be removed.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [reactionType]: Type of the reaction to remove. The paid reaction can't be removed.
///
/// [Ok] is returned on completion.
final class RemoveMessageReaction extends TdFunction {
  /// **RemoveMessageReaction** *(removeMessageReaction)* - TDLib function
  ///
  /// Removes a reaction from a message. A chosen reaction can always be removed.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [reactionType]: Type of the reaction to remove. The paid reaction can't be removed.
  ///
  /// [Ok] is returned on completion.
  const RemoveMessageReaction({
    required this.chatId,
    required this.messageId,
    required this.reactionType,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Type of the reaction to remove. The paid reaction can't be removed
  final ReactionType reactionType;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reaction_type": reactionType.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [reaction_type]: Type of the reaction to remove. The paid reaction can't be removed
  RemoveMessageReaction copyWith({
    int? chatId,
    int? messageId,
    ReactionType? reactionType,
  }) =>
      RemoveMessageReaction(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        reactionType: reactionType ?? this.reactionType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeMessageReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
