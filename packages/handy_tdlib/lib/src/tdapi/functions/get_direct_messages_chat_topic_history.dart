part of '../tdapi.dart';

/// **GetDirectMessagesChatTopicHistory** *(getDirectMessagesChatTopicHistory)* - TDLib function
///
/// Returns messages in the topic in a channel direct messages chat administered by the current user. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id).
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [topicId]: Identifier of the topic which messages will be fetched.
/// * [fromMessageId]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message.
/// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages.
/// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// [Messages] is returned on completion.
final class GetDirectMessagesChatTopicHistory extends TdFunction {
  /// **GetDirectMessagesChatTopicHistory** *(getDirectMessagesChatTopicHistory)* - TDLib function
  ///
  /// Returns messages in the topic in a channel direct messages chat administered by the current user. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id).
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [topicId]: Identifier of the topic which messages will be fetched.
  /// * [fromMessageId]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message.
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages.
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [Messages] is returned on completion.
  const GetDirectMessagesChatTopicHistory({
    required this.chatId,
    required this.topicId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the topic which messages will be fetched
  final int topicId;

  /// Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
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
      "topic_id": topicId,
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [topic_id]: Identifier of the topic which messages will be fetched
  /// * [from_message_id]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  GetDirectMessagesChatTopicHistory copyWith({
    int? chatId,
    int? topicId,
    int? fromMessageId,
    int? offset,
    int? limit,
  }) =>
      GetDirectMessagesChatTopicHistory(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        fromMessageId: fromMessageId ?? this.fromMessageId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getDirectMessagesChatTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
