part of '../tdapi.dart';

/// **ToggleForumTopicIsPinned** *(toggleForumTopicIsPinned)* - TDLib function
///
/// Changes the pinned state of a topic in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator right in the supergroup.. There can be up to getOption("pinned_forum_topic_count_max") pinned forum topics.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier.
/// * [isPinned]: Pass true to pin the topic; pass false to unpin it.
///
/// [Ok] is returned on completion.
final class ToggleForumTopicIsPinned extends TdFunction {
  /// **ToggleForumTopicIsPinned** *(toggleForumTopicIsPinned)* - TDLib function
  ///
  /// Changes the pinned state of a topic in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator right in the supergroup.. There can be up to getOption("pinned_forum_topic_count_max") pinned forum topics.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier.
  /// * [isPinned]: Pass true to pin the topic; pass false to unpin it.
  ///
  /// [Ok] is returned on completion.
  const ToggleForumTopicIsPinned({
    required this.chatId,
    required this.forumTopicId,
    required this.isPinned,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier
  final int forumTopicId;

  /// Pass true to pin the topic; pass false to unpin it
  final bool isPinned;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "is_pinned": isPinned,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: Forum topic identifier
  /// * [is_pinned]: Pass true to pin the topic; pass false to unpin it
  ToggleForumTopicIsPinned copyWith({
    int? chatId,
    int? forumTopicId,
    bool? isPinned,
  }) =>
      ToggleForumTopicIsPinned(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleForumTopicIsPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
