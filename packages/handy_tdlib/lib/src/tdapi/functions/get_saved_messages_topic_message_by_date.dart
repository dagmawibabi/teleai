part of '../tdapi.dart';

/// **GetSavedMessagesTopicMessageByDate** *(getSavedMessagesTopicMessageByDate)* - TDLib function
///
/// Returns the last message sent in a Saved Messages topic no later than the specified date.
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic which message will be returned.
/// * [date]: Point in time (Unix timestamp) relative to which to search for messages.
///
/// [Message] is returned on completion.
final class GetSavedMessagesTopicMessageByDate extends TdFunction {
  /// **GetSavedMessagesTopicMessageByDate** *(getSavedMessagesTopicMessageByDate)* - TDLib function
  ///
  /// Returns the last message sent in a Saved Messages topic no later than the specified date.
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic which message will be returned.
  /// * [date]: Point in time (Unix timestamp) relative to which to search for messages.
  ///
  /// [Message] is returned on completion.
  const GetSavedMessagesTopicMessageByDate({
    required this.savedMessagesTopicId,
    required this.date,
  });

  /// Identifier of Saved Messages topic which message will be returned
  final int savedMessagesTopicId;

  /// Point in time (Unix timestamp) relative to which to search for messages
  final int date;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
      "date": date,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic which message will be returned
  /// * [date]: Point in time (Unix timestamp) relative to which to search for messages
  GetSavedMessagesTopicMessageByDate copyWith({
    int? savedMessagesTopicId,
    int? date,
  }) =>
      GetSavedMessagesTopicMessageByDate(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSavedMessagesTopicMessageByDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
