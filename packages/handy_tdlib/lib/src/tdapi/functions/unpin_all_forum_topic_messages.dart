part of '../tdapi.dart';

/// **UnpinAllForumTopicMessages** *(unpinAllForumTopicMessages)* - TDLib function
///
/// Removes all pinned messages from a topic in a forum supergroup chat or a chat with a bot with topics; requires can_pin_messages member right in the supergroup.
///
/// * [chatId]: Identifier of the chat.
/// * [forumTopicId]: Forum topic identifier in which messages will be unpinned.
///
/// [Ok] is returned on completion.
final class UnpinAllForumTopicMessages extends TdFunction {
  /// **UnpinAllForumTopicMessages** *(unpinAllForumTopicMessages)* - TDLib function
  ///
  /// Removes all pinned messages from a topic in a forum supergroup chat or a chat with a bot with topics; requires can_pin_messages member right in the supergroup.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [forumTopicId]: Forum topic identifier in which messages will be unpinned.
  ///
  /// [Ok] is returned on completion.
  const UnpinAllForumTopicMessages({
    required this.chatId,
    required this.forumTopicId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Forum topic identifier in which messages will be unpinned
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
  /// * [forum_topic_id]: Forum topic identifier in which messages will be unpinned
  UnpinAllForumTopicMessages copyWith({
    int? chatId,
    int? forumTopicId,
  }) =>
      UnpinAllForumTopicMessages(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'unpinAllForumTopicMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
