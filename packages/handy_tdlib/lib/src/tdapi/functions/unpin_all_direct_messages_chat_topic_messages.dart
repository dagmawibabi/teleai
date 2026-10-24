part of '../tdapi.dart';

/// **UnpinAllDirectMessagesChatTopicMessages** *(unpinAllDirectMessagesChatTopicMessages)* - TDLib function
///
/// Removes all pinned messages from the topic in a channel direct messages chat administered by the current user.
///
/// * [chatId]: Identifier of the chat.
/// * [topicId]: Topic identifier.
///
/// [Ok] is returned on completion.
final class UnpinAllDirectMessagesChatTopicMessages extends TdFunction {
  /// **UnpinAllDirectMessagesChatTopicMessages** *(unpinAllDirectMessagesChatTopicMessages)* - TDLib function
  ///
  /// Removes all pinned messages from the topic in a channel direct messages chat administered by the current user.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [topicId]: Topic identifier.
  ///
  /// [Ok] is returned on completion.
  const UnpinAllDirectMessagesChatTopicMessages({
    required this.chatId,
    required this.topicId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Topic identifier
  final int topicId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [topic_id]: Topic identifier
  UnpinAllDirectMessagesChatTopicMessages copyWith({
    int? chatId,
    int? topicId,
  }) =>
      UnpinAllDirectMessagesChatTopicMessages(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'unpinAllDirectMessagesChatTopicMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
