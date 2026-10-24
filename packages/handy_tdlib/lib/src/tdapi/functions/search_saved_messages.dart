part of '../tdapi.dart';

/// **SearchSavedMessages** *(searchSavedMessages)* - TDLib function
///
/// Searches for messages tagged by the given reaction and with the given words in the Saved Messages chat; for Telegram Premium users only.. Returns the results in reverse chronological order, i.e. in order of decreasing message_id.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// * [savedMessagesTopicId]: If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages.
/// * [tag]: Tag to search for; pass null to return all suitable messages *(optional)*.
/// * [query]: Query to search for.
/// * [fromMessageId]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message.
/// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages.
/// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// [FoundChatMessages] is returned on completion.
final class SearchSavedMessages extends TdFunction {
  /// **SearchSavedMessages** *(searchSavedMessages)* - TDLib function
  ///
  /// Searches for messages tagged by the given reaction and with the given words in the Saved Messages chat; for Telegram Premium users only.. Returns the results in reverse chronological order, i.e. in order of decreasing message_id.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// * [savedMessagesTopicId]: If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages.
  /// * [tag]: Tag to search for; pass null to return all suitable messages *(optional)*.
  /// * [query]: Query to search for.
  /// * [fromMessageId]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message.
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages.
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [FoundChatMessages] is returned on completion.
  const SearchSavedMessages({
    required this.savedMessagesTopicId,
    this.tag,
    required this.query,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  /// If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages
  final int savedMessagesTopicId;

  /// Tag to search for; pass null to return all suitable messages
  final ReactionType? tag;

  /// Query to search for
  final String query;

  /// Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
  final int fromMessageId;

  /// Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages
  final int offset;

  /// The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
      "tag": tag?.toJson(),
      "query": query,
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages
  /// * [tag]: Tag to search for; pass null to return all suitable messages
  /// * [query]: Query to search for
  /// * [from_message_id]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number to get the specified message and some newer messages
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  SearchSavedMessages copyWith({
    int? savedMessagesTopicId,
    ReactionType? tag,
    String? query,
    int? fromMessageId,
    int? offset,
    int? limit,
  }) =>
      SearchSavedMessages(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
        tag: tag ?? this.tag,
        query: query ?? this.query,
        fromMessageId: fromMessageId ?? this.fromMessageId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchSavedMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
