part of '../tdapi.dart';

/// **SearchChatMessages** *(searchChatMessages)* - TDLib function
///
/// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query. (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.. A combination of query, sender_id, filter and topic_id search criteria is expected to be supported, only if it is required for Telegram official application implementation.
///
/// * [chatId]: Identifier of the chat in which to search messages.
/// * [topicId]: Pass topic identifier to search messages only in specific topic; pass null to search for messages in all topics *(optional)*.
/// * [query]: Query to search for.
/// * [senderId]: Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats *(optional)*.
/// * [fromMessageId]: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message.
/// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages.
/// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
/// * [filter]: Additional filter for messages to search; pass null to search for all messages *(optional)*.
///
/// [FoundChatMessages] is returned on completion.
final class SearchChatMessages extends TdFunction {
  /// **SearchChatMessages** *(searchChatMessages)* - TDLib function
  ///
  /// Searches for messages with given words in the chat. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. Cannot be used in secret chats with a non-empty query. (searchSecretMessages must be used instead), or without an enabled message database. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.. A combination of query, sender_id, filter and topic_id search criteria is expected to be supported, only if it is required for Telegram official application implementation.
  ///
  /// * [chatId]: Identifier of the chat in which to search messages.
  /// * [topicId]: Pass topic identifier to search messages only in specific topic; pass null to search for messages in all topics *(optional)*.
  /// * [query]: Query to search for.
  /// * [senderId]: Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats *(optional)*.
  /// * [fromMessageId]: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message.
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages.
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  /// * [filter]: Additional filter for messages to search; pass null to search for all messages *(optional)*.
  ///
  /// [FoundChatMessages] is returned on completion.
  const SearchChatMessages({
    required this.chatId,
    this.topicId,
    required this.query,
    this.senderId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
    this.filter,
  });

  /// Identifier of the chat in which to search messages
  final int chatId;

  /// Pass topic identifier to search messages only in specific topic; pass null to search for messages in all topics
  final MessageTopic? topicId;

  /// Query to search for
  final String query;

  /// Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
  final MessageSender? senderId;

  /// Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
  final int fromMessageId;

  /// Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages
  final int offset;

  /// The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Additional filter for messages to search; pass null to search for all messages
  final SearchMessagesFilter? filter;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "query": query,
      "sender_id": senderId?.toJson(),
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "filter": filter?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which to search messages
  /// * [topic_id]: Pass topic identifier to search messages only in specific topic; pass null to search for messages in all topics
  /// * [query]: Query to search for
  /// * [sender_id]: Identifier of the sender of messages to search for; pass null to search for messages from any sender. Not supported in secret chats
  /// * [from_message_id]: Identifier of the message starting from which history must be fetched; use 0 to get results from the last message
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  /// * [filter]: Additional filter for messages to search; pass null to search for all messages
  SearchChatMessages copyWith({
    int? chatId,
    MessageTopic? topicId,
    String? query,
    MessageSender? senderId,
    int? fromMessageId,
    int? offset,
    int? limit,
    SearchMessagesFilter? filter,
  }) =>
      SearchChatMessages(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        query: query ?? this.query,
        senderId: senderId ?? this.senderId,
        fromMessageId: fromMessageId ?? this.fromMessageId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        filter: filter ?? this.filter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchChatMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
