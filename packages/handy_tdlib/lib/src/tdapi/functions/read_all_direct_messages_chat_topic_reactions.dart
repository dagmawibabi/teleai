part of '../tdapi.dart';

/// **ReadAllDirectMessagesChatTopicReactions** *(readAllDirectMessagesChatTopicReactions)* - TDLib function
///
/// Removes all unread reactions in the topic in a channel direct messages chat administered by the current user.
///
/// * [chatId]: Identifier of the chat.
/// * [topicId]: Topic identifier.
///
/// [Ok] is returned on completion.
final class ReadAllDirectMessagesChatTopicReactions extends TdFunction {
  /// **ReadAllDirectMessagesChatTopicReactions** *(readAllDirectMessagesChatTopicReactions)* - TDLib function
  ///
  /// Removes all unread reactions in the topic in a channel direct messages chat administered by the current user.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [topicId]: Topic identifier.
  ///
  /// [Ok] is returned on completion.
  const ReadAllDirectMessagesChatTopicReactions({
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
  ReadAllDirectMessagesChatTopicReactions copyWith({
    int? chatId,
    int? topicId,
  }) =>
      ReadAllDirectMessagesChatTopicReactions(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'readAllDirectMessagesChatTopicReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
