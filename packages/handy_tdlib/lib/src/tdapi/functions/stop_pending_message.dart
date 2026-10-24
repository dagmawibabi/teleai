part of '../tdapi.dart';

/// **StopPendingMessage** *(stopPendingMessage)* - TDLib function
///
/// Stops a pending message generation by a bot.
///
/// * [chatId]: Identifier of the chat with the bot.
/// * [topicId]: Identifier of the topic in which the action is performed; pass null if none *(optional)*.
/// * [draftId]: Unique identifier of the message draft within the message thread.
///
/// [Ok] is returned on completion.
final class StopPendingMessage extends TdFunction {
  /// **StopPendingMessage** *(stopPendingMessage)* - TDLib function
  ///
  /// Stops a pending message generation by a bot.
  ///
  /// * [chatId]: Identifier of the chat with the bot.
  /// * [topicId]: Identifier of the topic in which the action is performed; pass null if none *(optional)*.
  /// * [draftId]: Unique identifier of the message draft within the message thread.
  ///
  /// [Ok] is returned on completion.
  const StopPendingMessage({
    required this.chatId,
    this.topicId,
    required this.draftId,
  });

  /// Identifier of the chat with the bot
  final int chatId;

  /// Identifier of the topic in which the action is performed; pass null if none
  final MessageTopic? topicId;

  /// Unique identifier of the message draft within the message thread
  final int draftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "draft_id": draftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the bot
  /// * [topic_id]: Identifier of the topic in which the action is performed; pass null if none
  /// * [draft_id]: Unique identifier of the message draft within the message thread
  StopPendingMessage copyWith({
    int? chatId,
    MessageTopic? topicId,
    int? draftId,
  }) =>
      StopPendingMessage(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        draftId: draftId ?? this.draftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stopPendingMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
