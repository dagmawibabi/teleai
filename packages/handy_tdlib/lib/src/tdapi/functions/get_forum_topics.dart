part of '../tdapi.dart';

/// **GetForumTopics** *(getForumTopics)* - TDLib function
///
/// Returns found forum topics in a forum supergroup chat or a chat with a bot with topics. This is a temporary method for getting information about topic list from the server.
///
/// * [chatId]: Identifier of the chat.
/// * [query]: Query to search for in the forum topic's name.
/// * [offsetDate]: The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic.
/// * [offsetMessageId]: The message identifier of the last message in the last found topic, or 0 for the first request.
/// * [offsetForumTopicId]: The forum topic identifier of the last found topic, or 0 for the first request.
/// * [limit]: The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit.
///
/// [ForumTopics] is returned on completion.
final class GetForumTopics extends TdFunction {
  /// **GetForumTopics** *(getForumTopics)* - TDLib function
  ///
  /// Returns found forum topics in a forum supergroup chat or a chat with a bot with topics. This is a temporary method for getting information about topic list from the server.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [query]: Query to search for in the forum topic's name.
  /// * [offsetDate]: The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic.
  /// * [offsetMessageId]: The message identifier of the last message in the last found topic, or 0 for the first request.
  /// * [offsetForumTopicId]: The forum topic identifier of the last found topic, or 0 for the first request.
  /// * [limit]: The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [ForumTopics] is returned on completion.
  const GetForumTopics({
    required this.chatId,
    required this.query,
    required this.offsetDate,
    required this.offsetMessageId,
    required this.offsetForumTopicId,
    required this.limit,
  });

  /// Identifier of the chat
  final int chatId;

  /// Query to search for in the forum topic's name
  final String query;

  /// The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic
  final int offsetDate;

  /// The message identifier of the last message in the last found topic, or 0 for the first request
  final int offsetMessageId;

  /// The forum topic identifier of the last found topic, or 0 for the first request
  final int offsetForumTopicId;

  /// The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "query": query,
      "offset_date": offsetDate,
      "offset_message_id": offsetMessageId,
      "offset_forum_topic_id": offsetForumTopicId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [query]: Query to search for in the forum topic's name
  /// * [offset_date]: The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic
  /// * [offset_message_id]: The message identifier of the last message in the last found topic, or 0 for the first request
  /// * [offset_forum_topic_id]: The forum topic identifier of the last found topic, or 0 for the first request
  /// * [limit]: The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit
  GetForumTopics copyWith({
    int? chatId,
    String? query,
    int? offsetDate,
    int? offsetMessageId,
    int? offsetForumTopicId,
    int? limit,
  }) =>
      GetForumTopics(
        chatId: chatId ?? this.chatId,
        query: query ?? this.query,
        offsetDate: offsetDate ?? this.offsetDate,
        offsetMessageId: offsetMessageId ?? this.offsetMessageId,
        offsetForumTopicId: offsetForumTopicId ?? this.offsetForumTopicId,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getForumTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
