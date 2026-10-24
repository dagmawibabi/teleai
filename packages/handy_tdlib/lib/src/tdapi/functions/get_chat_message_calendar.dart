part of '../tdapi.dart';

/// **GetChatMessageCalendar** *(getChatMessageCalendar)* - TDLib function
///
/// Returns information about the next messages of the specified type in the chat split by days.. Returns the results in reverse chronological order. Can return partial result for the last returned day.. Behavior of this method depends on the value of the option "utc_time_offset".
///
/// * [chatId]: Identifier of the chat in which to return information about messages.
/// * [topicId]: Pass topic identifier to get the result only in specific topic; pass null to get the result in all topics; forum topics and message threads aren't supported *(optional)*.
/// * [filter]: Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function.
/// * [fromMessageId]: The message identifier from which to return information about messages; use 0 to get results from the last message.
///
/// [MessageCalendar] is returned on completion.
final class GetChatMessageCalendar extends TdFunction {
  /// **GetChatMessageCalendar** *(getChatMessageCalendar)* - TDLib function
  ///
  /// Returns information about the next messages of the specified type in the chat split by days.. Returns the results in reverse chronological order. Can return partial result for the last returned day.. Behavior of this method depends on the value of the option "utc_time_offset".
  ///
  /// * [chatId]: Identifier of the chat in which to return information about messages.
  /// * [topicId]: Pass topic identifier to get the result only in specific topic; pass null to get the result in all topics; forum topics and message threads aren't supported *(optional)*.
  /// * [filter]: Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function.
  /// * [fromMessageId]: The message identifier from which to return information about messages; use 0 to get results from the last message.
  ///
  /// [MessageCalendar] is returned on completion.
  const GetChatMessageCalendar({
    required this.chatId,
    this.topicId,
    required this.filter,
    required this.fromMessageId,
  });

  /// Identifier of the chat in which to return information about messages
  final int chatId;

  /// Pass topic identifier to get the result only in specific topic; pass null to get the result in all topics; forum topics and message threads aren't supported
  final MessageTopic? topicId;

  /// Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function
  final SearchMessagesFilter filter;

  /// The message identifier from which to return information about messages; use 0 to get results from the last message
  final int fromMessageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "filter": filter.toJson(),
      "from_message_id": fromMessageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which to return information about messages
  /// * [topic_id]: Pass topic identifier to get the result only in specific topic; pass null to get the result in all topics; forum topics and message threads aren't supported
  /// * [filter]: Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function
  /// * [from_message_id]: The message identifier from which to return information about messages; use 0 to get results from the last message
  GetChatMessageCalendar copyWith({
    int? chatId,
    MessageTopic? topicId,
    SearchMessagesFilter? filter,
    int? fromMessageId,
  }) =>
      GetChatMessageCalendar(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        filter: filter ?? this.filter,
        fromMessageId: fromMessageId ?? this.fromMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatMessageCalendar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
