part of '../tdapi.dart';

/// **SearchMessages** *(searchMessages)* - TDLib function
///
/// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// * [chatList]: Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported *(optional)*.
/// * [query]: Query to search for.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
/// * [filter]: Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. searchMessagesFilterUnreadPollVote, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function *(optional)*.
/// * [chatTypeFilter]: Additional filter for type of the chat of the searched messages; pass null to search for messages in all chats *(optional)*.
/// * [minDate]: If not 0, the minimum date of the messages to return.
/// * [maxDate]: If not 0, the maximum date of the messages to return.
///
/// [FoundMessages] is returned on completion.
final class SearchMessages extends TdFunction {
  /// **SearchMessages** *(searchMessages)* - TDLib function
  ///
  /// Searches for messages in all chats except secret chats. Returns the results in reverse chronological order (i.e., in order of decreasing (date, chat_id, message_id)).. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// * [chatList]: Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported *(optional)*.
  /// * [query]: Query to search for.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  /// * [filter]: Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. searchMessagesFilterUnreadPollVote, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function *(optional)*.
  /// * [chatTypeFilter]: Additional filter for type of the chat of the searched messages; pass null to search for messages in all chats *(optional)*.
  /// * [minDate]: If not 0, the minimum date of the messages to return.
  /// * [maxDate]: If not 0, the maximum date of the messages to return.
  ///
  /// [FoundMessages] is returned on completion.
  const SearchMessages({
    this.chatList,
    required this.query,
    required this.offset,
    required this.limit,
    this.filter,
    this.chatTypeFilter,
    required this.minDate,
    required this.maxDate,
  });

  /// Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
  final ChatList? chatList;

  /// Query to search for
  final String query;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. searchMessagesFilterUnreadPollVote, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
  final SearchMessagesFilter? filter;

  /// Additional filter for type of the chat of the searched messages; pass null to search for messages in all chats
  final SearchMessagesChatTypeFilter? chatTypeFilter;

  /// If not 0, the minimum date of the messages to return
  final int minDate;

  /// If not 0, the maximum date of the messages to return
  final int maxDate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList?.toJson(),
      "query": query,
      "offset": offset,
      "limit": limit,
      "filter": filter?.toJson(),
      "chat_type_filter": chatTypeFilter?.toJson(),
      "min_date": minDate,
      "max_date": maxDate,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: Chat list in which to search messages; pass null to search in all chats regardless of their chat list. Only Main and Archive chat lists are supported
  /// * [query]: Query to search for
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  /// * [filter]: Additional filter for messages to search; pass null to search for all messages. Filters searchMessagesFilterMention, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction,. searchMessagesFilterUnreadPollVote, searchMessagesFilterFailedToSend, and searchMessagesFilterPinned are unsupported in this function
  /// * [chat_type_filter]: Additional filter for type of the chat of the searched messages; pass null to search for messages in all chats
  /// * [min_date]: If not 0, the minimum date of the messages to return
  /// * [max_date]: If not 0, the maximum date of the messages to return
  SearchMessages copyWith({
    ChatList? chatList,
    String? query,
    String? offset,
    int? limit,
    SearchMessagesFilter? filter,
    SearchMessagesChatTypeFilter? chatTypeFilter,
    int? minDate,
    int? maxDate,
  }) =>
      SearchMessages(
        chatList: chatList ?? this.chatList,
        query: query ?? this.query,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        filter: filter ?? this.filter,
        chatTypeFilter: chatTypeFilter ?? this.chatTypeFilter,
        minDate: minDate ?? this.minDate,
        maxDate: maxDate ?? this.maxDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
