part of '../tdapi.dart';

/// **ReadAllForumTopicPollVotes** *(readAllForumTopicPollVotes)* - TDLib function
///
/// Marks all poll votes in a topic in a forum supergroup chat as read.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier in which poll votes are marked as read.
///
/// [Ok] is returned on completion.
final class ReadAllForumTopicPollVotes extends TdFunction {
  /// **ReadAllForumTopicPollVotes** *(readAllForumTopicPollVotes)* - TDLib function
  ///
  /// Marks all poll votes in a topic in a forum supergroup chat as read.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier in which poll votes are marked as read.
  ///
  /// [Ok] is returned on completion.
  const ReadAllForumTopicPollVotes({
    required this.chatId,
    required this.forumTopicId,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier in which poll votes are marked as read
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
  /// * [forum_topic_id]: Forum topic identifier in which poll votes are marked as read
  ReadAllForumTopicPollVotes copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      ReadAllForumTopicPollVotes(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readAllForumTopicPollVotes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
