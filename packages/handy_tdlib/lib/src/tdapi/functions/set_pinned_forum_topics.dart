part of '../tdapi.dart';

/// **SetPinnedForumTopics** *(setPinnedForumTopics)* - TDLib function
///
/// Changes the order of pinned topics in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator right in the supergroup.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicIds]: The new list of identifiers of the pinned forum topics.
///
/// [Ok] is returned on completion.
final class SetPinnedForumTopics extends TdFunction {
  /// **SetPinnedForumTopics** *(setPinnedForumTopics)* - TDLib function
  ///
  /// Changes the order of pinned topics in a forum supergroup chat or a chat with a bot with topics; requires can_manage_topics administrator right in the supergroup.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicIds]: The new list of identifiers of the pinned forum topics.
  ///
  /// [Ok] is returned on completion.
  const SetPinnedForumTopics({
    required this.chatId,
    required this.forumTopicIds,
  });

  /// Chat identifier
  final int chatId;

  /// The new list of identifiers of the pinned forum topics
  final List<int> forumTopicIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_ids": forumTopicIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_ids]: The new list of identifiers of the pinned forum topics
  SetPinnedForumTopics copyWith({
    int? chatId,
    List<int>? forumTopicIds,
  }) =>
      SetPinnedForumTopics(
        chatId: chatId ?? this.chatId,
        forumTopicIds: forumTopicIds ?? this.forumTopicIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPinnedForumTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
