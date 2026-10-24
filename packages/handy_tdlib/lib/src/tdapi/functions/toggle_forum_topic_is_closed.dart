part of '../tdapi.dart';

/// **ToggleForumTopicIsClosed** *(toggleForumTopicIsClosed)* - TDLib function
///
/// Toggles whether a topic is closed in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup unless the user is creator of the topic.
///
/// * [chatId]: Identifier of the chat.
/// * [forumTopicId]: Forum topic identifier.
/// * [isClosed]: Pass true to close the topic; pass false to reopen it.
///
/// [Ok] is returned on completion.
final class ToggleForumTopicIsClosed extends TdFunction {
  /// **ToggleForumTopicIsClosed** *(toggleForumTopicIsClosed)* - TDLib function
  ///
  /// Toggles whether a topic is closed in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup unless the user is creator of the topic.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [forumTopicId]: Forum topic identifier.
  /// * [isClosed]: Pass true to close the topic; pass false to reopen it.
  ///
  /// [Ok] is returned on completion.
  const ToggleForumTopicIsClosed({
    required this.chatId,
    required this.forumTopicId,
    required this.isClosed,
  });

  /// Identifier of the chat
  final int chatId;

  /// Forum topic identifier
  final int forumTopicId;

  /// Pass true to close the topic; pass false to reopen it
  final bool isClosed;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "is_closed": isClosed,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [forum_topic_id]: Forum topic identifier
  /// * [is_closed]: Pass true to close the topic; pass false to reopen it
  ToggleForumTopicIsClosed copyWith({
    int? chatId,
    int? forumTopicId,
    bool? isClosed,
  }) =>
      ToggleForumTopicIsClosed(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        isClosed: isClosed ?? this.isClosed,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleForumTopicIsClosed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
