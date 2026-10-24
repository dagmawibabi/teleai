part of '../tdapi.dart';

/// **ReadAllForumTopicReactions** *(readAllForumTopicReactions)* - TDLib function
///
/// Marks all reactions in a topic in a forum supergroup chat or a chat with a bot with topics as read.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier in which reactions are marked as read.
///
/// [Ok] is returned on completion.
final class ReadAllForumTopicReactions extends TdFunction {
  /// **ReadAllForumTopicReactions** *(readAllForumTopicReactions)* - TDLib function
  ///
  /// Marks all reactions in a topic in a forum supergroup chat or a chat with a bot with topics as read.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier in which reactions are marked as read.
  ///
  /// [Ok] is returned on completion.
  const ReadAllForumTopicReactions({
    required this.chatId,
    required this.forumTopicId,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier in which reactions are marked as read
  final int forumTopicId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: Forum topic identifier in which reactions are marked as read
  ReadAllForumTopicReactions copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      ReadAllForumTopicReactions(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readAllForumTopicReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
