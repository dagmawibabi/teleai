part of '../tdapi.dart';

/// **GetForumTopicHistory** *(getForumTopicHistory)* - TDLib function
///
/// Returns messages in a topic in a forum supergroup chat or a chat with a bot with topics. The messages are returned in reverse chronological order. (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier.
/// * [fromMessageId]: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message.
/// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages.
/// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// [Messages] is returned on completion.
final class GetForumTopicHistory extends TdFunction {
  /// **GetForumTopicHistory** *(getForumTopicHistory)* - TDLib function
  ///
  /// Returns messages in a topic in a forum supergroup chat or a chat with a bot with topics. The messages are returned in reverse chronological order. (i.e., in order of decreasing message_id). For optimal performance, the number of returned messages is chosen by TDLib.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier.
  /// * [fromMessageId]: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message.
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages.
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [Messages] is returned on completion.
  const GetForumTopicHistory({
    required this.chatId,
    required this.forumTopicId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier
  final int forumTopicId;

  /// Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
  final int fromMessageId;

  /// Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages
  final int offset;

  /// The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: Forum topic identifier
  /// * [from_message_id]: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  GetForumTopicHistory copyWith({
    int? chatId,
    int? forumTopicId,
    int? fromMessageId,
    int? offset,
    int? limit,
  }) =>
      GetForumTopicHistory(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        fromMessageId: fromMessageId ?? this.fromMessageId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getForumTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
