part of '../tdapi.dart';

/// **ReadAllForumTopicMentions** *(readAllForumTopicMentions)* - TDLib function
///
/// Marks all mentions in a topic in a forum supergroup chat as read.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier in which mentions are marked as read.
///
/// [Ok] is returned on completion.
final class ReadAllForumTopicMentions extends TdFunction {
  /// **ReadAllForumTopicMentions** *(readAllForumTopicMentions)* - TDLib function
  ///
  /// Marks all mentions in a topic in a forum supergroup chat as read.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier in which mentions are marked as read.
  ///
  /// [Ok] is returned on completion.
  const ReadAllForumTopicMentions({
    required this.chatId,
    required this.forumTopicId,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier in which mentions are marked as read
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
  /// * [forum_topic_id]: Forum topic identifier in which mentions are marked as read
  ReadAllForumTopicMentions copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      ReadAllForumTopicMentions(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readAllForumTopicMentions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
