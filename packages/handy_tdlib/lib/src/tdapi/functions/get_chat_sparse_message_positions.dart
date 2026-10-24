part of '../tdapi.dart';

/// **GetChatSparseMessagePositions** *(getChatSparseMessagePositions)* - TDLib function
///
/// Returns sparse positions of messages of the specified type in the chat to be used for Shared Media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).. Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database.
///
/// * [chatId]: Identifier of the chat in which to return information about message positions.
/// * [filter]: Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function.
/// * [fromMessageId]: The message identifier from which to return information about message positions.
/// * [limit]: The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages.
/// * [savedMessagesTopicId]: If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages.
///
/// [MessagePositions] is returned on completion.
final class GetChatSparseMessagePositions extends TdFunction {
  /// **GetChatSparseMessagePositions** *(getChatSparseMessagePositions)* - TDLib function
  ///
  /// Returns sparse positions of messages of the specified type in the chat to be used for Shared Media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).. Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database.
  ///
  /// * [chatId]: Identifier of the chat in which to return information about message positions.
  /// * [filter]: Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function.
  /// * [fromMessageId]: The message identifier from which to return information about message positions.
  /// * [limit]: The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages.
  /// * [savedMessagesTopicId]: If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages.
  ///
  /// [MessagePositions] is returned on completion.
  const GetChatSparseMessagePositions({
    required this.chatId,
    required this.filter,
    required this.fromMessageId,
    required this.limit,
    required this.savedMessagesTopicId,
  });

  /// Identifier of the chat in which to return information about message positions
  final int chatId;

  /// Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function
  final SearchMessagesFilter filter;

  /// The message identifier from which to return information about message positions
  final int fromMessageId;

  /// The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
  final int limit;

  /// If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages
  final int savedMessagesTopicId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "filter": filter.toJson(),
      "from_message_id": fromMessageId,
      "limit": limit,
      "saved_messages_topic_id": savedMessagesTopicId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which to return information about message positions
  /// * [filter]: Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. and searchMessagesFilterUnreadPollVote are unsupported in this function
  /// * [from_message_id]: The message identifier from which to return information about message positions
  /// * [limit]: The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
  /// * [saved_messages_topic_id]: If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages, or for chats other than Saved Messages
  GetChatSparseMessagePositions copyWith({
    int? chatId,
    SearchMessagesFilter? filter,
    int? fromMessageId,
    int? limit,
    int? savedMessagesTopicId,
  }) =>
      GetChatSparseMessagePositions(
        chatId: chatId ?? this.chatId,
        filter: filter ?? this.filter,
        fromMessageId: fromMessageId ?? this.fromMessageId,
        limit: limit ?? this.limit,
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatSparseMessagePositions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
