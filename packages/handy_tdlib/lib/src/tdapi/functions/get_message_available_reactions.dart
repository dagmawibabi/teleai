part of '../tdapi.dart';

/// **GetMessageAvailableReactions** *(getMessageAvailableReactions)* - TDLib function
///
/// Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [rowSize]: Number of reactions per row, 5-25.
///
/// [AvailableReactions] is returned on completion.
final class GetMessageAvailableReactions extends TdFunction {
  /// **GetMessageAvailableReactions** *(getMessageAvailableReactions)* - TDLib function
  ///
  /// Returns reactions, which can be added to a message. The list can change after updateActiveEmojiReactions, updateChatAvailableReactions for the chat, or updateMessageInteractionInfo for the message.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [rowSize]: Number of reactions per row, 5-25.
  ///
  /// [AvailableReactions] is returned on completion.
  const GetMessageAvailableReactions({
    required this.chatId,
    required this.messageId,
    required this.rowSize,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Number of reactions per row, 5-25
  final int rowSize;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "row_size": rowSize,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [row_size]: Number of reactions per row, 5-25
  GetMessageAvailableReactions copyWith({
    int? chatId,
    int? messageId,
    int? rowSize,
  }) =>
      GetMessageAvailableReactions(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        rowSize: rowSize ?? this.rowSize,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageAvailableReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
