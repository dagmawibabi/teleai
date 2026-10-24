part of '../tdapi.dart';

/// **DeleteForumTopic** *(deleteForumTopic)* - TDLib function
///
/// Deletes all messages from a topic in a forum supergroup chat or a chat with a bot with topics; requires can_delete_messages administrator right in the supergroup. unless the user is creator of the topic, the topic has no messages from other users and has at most 11 messages.
///
/// * [chatId]: Identifier of the chat.
/// * [forumTopicId]: Forum topic identifier.
///
/// [Ok] is returned on completion.
final class DeleteForumTopic extends TdFunction {
  /// **DeleteForumTopic** *(deleteForumTopic)* - TDLib function
  ///
  /// Deletes all messages from a topic in a forum supergroup chat or a chat with a bot with topics; requires can_delete_messages administrator right in the supergroup. unless the user is creator of the topic, the topic has no messages from other users and has at most 11 messages.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [forumTopicId]: Forum topic identifier.
  ///
  /// [Ok] is returned on completion.
  const DeleteForumTopic({
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
  DeleteForumTopic copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      DeleteForumTopic(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteForumTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
