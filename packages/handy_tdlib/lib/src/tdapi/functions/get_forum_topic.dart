part of '../tdapi.dart';

/// **GetForumTopic** *(getForumTopic)* - TDLib function
///
/// Returns information about a topic in a forum supergroup chat or a chat with a bot with topics.
///
/// * [chatId]: Identifier of the chat.
/// * [forumTopicId]: Forum topic identifier.
///
/// [ForumTopic] is returned on completion.
final class GetForumTopic extends TdFunction {
  /// **GetForumTopic** *(getForumTopic)* - TDLib function
  ///
  /// Returns information about a topic in a forum supergroup chat or a chat with a bot with topics.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [forumTopicId]: Forum topic identifier.
  ///
  /// [ForumTopic] is returned on completion.
  const GetForumTopic({
    required this.chatId,
    required this.forumTopicId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Forum topic identifier
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
  /// * [chat_id]: Identifier of the chat
  /// * [forum_topic_id]: Forum topic identifier
  GetForumTopic copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      GetForumTopic(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getForumTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
