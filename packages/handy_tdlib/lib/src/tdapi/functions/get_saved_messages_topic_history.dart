part of '../tdapi.dart';

/// **GetSavedMessagesTopicHistory** *(getSavedMessagesTopicHistory)* - TDLib function
///
/// Returns messages in a Saved Messages topic. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id).
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic which messages will be fetched.
/// * [fromMessageId]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message.
/// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages.
/// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// [Messages] is returned on completion.
final class GetSavedMessagesTopicHistory extends TdFunction {
  /// **GetSavedMessagesTopicHistory** *(getSavedMessagesTopicHistory)* - TDLib function
  ///
  /// Returns messages in a Saved Messages topic. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id).
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic which messages will be fetched.
  /// * [fromMessageId]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message.
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages.
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [Messages] is returned on completion.
  const GetSavedMessagesTopicHistory({
    required this.savedMessagesTopicId,
    required this.fromMessageId,
    required this.offset,
    required this.limit,
  });

  /// Identifier of Saved Messages topic which messages will be fetched
  final int savedMessagesTopicId;

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
      "saved_messages_topic_id": savedMessagesTopicId,
      "from_message_id": fromMessageId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic which messages will be fetched
  /// * [from_message_id]: Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
  /// * [offset]: Specify 0 to get results from exactly the message from_message_id or a negative number from -99 to -1 to get additionally -offset newer messages
  /// * [limit]: The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, then the limit must be greater than or equal to -offset.. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  GetSavedMessagesTopicHistory copyWith({
    int? savedMessagesTopicId,
    int? fromMessageId,
    int? offset,
    int? limit,
  }) =>
      GetSavedMessagesTopicHistory(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
        fromMessageId: fromMessageId ?? this.fromMessageId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSavedMessagesTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
