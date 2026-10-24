part of '../tdapi.dart';

/// **DeleteSavedMessagesTopicMessagesByDate** *(deleteSavedMessagesTopicMessagesByDate)* - TDLib function
///
/// Deletes all messages between the specified dates in a Saved Messages topic. Messages sent in the last 30 seconds will not be deleted.
///
/// * [savedMessagesTopicId]: Identifier of Saved Messages topic which messages will be deleted.
/// * [minDate]: The minimum date of the messages to delete.
/// * [maxDate]: The maximum date of the messages to delete.
///
/// [Ok] is returned on completion.
final class DeleteSavedMessagesTopicMessagesByDate extends TdFunction {
  /// **DeleteSavedMessagesTopicMessagesByDate** *(deleteSavedMessagesTopicMessagesByDate)* - TDLib function
  ///
  /// Deletes all messages between the specified dates in a Saved Messages topic. Messages sent in the last 30 seconds will not be deleted.
  ///
  /// * [savedMessagesTopicId]: Identifier of Saved Messages topic which messages will be deleted.
  /// * [minDate]: The minimum date of the messages to delete.
  /// * [maxDate]: The maximum date of the messages to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteSavedMessagesTopicMessagesByDate({
    required this.savedMessagesTopicId,
    required this.minDate,
    required this.maxDate,
  });

  /// Identifier of Saved Messages topic which messages will be deleted
  final int savedMessagesTopicId;

  /// The minimum date of the messages to delete
  final int minDate;

  /// The maximum date of the messages to delete
  final int maxDate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "saved_messages_topic_id": savedMessagesTopicId,
      "min_date": minDate,
      "max_date": maxDate,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [saved_messages_topic_id]: Identifier of Saved Messages topic which messages will be deleted
  /// * [min_date]: The minimum date of the messages to delete
  /// * [max_date]: The maximum date of the messages to delete
  DeleteSavedMessagesTopicMessagesByDate copyWith({
    int? savedMessagesTopicId,
    int? minDate,
    int? maxDate,
  }) =>
      DeleteSavedMessagesTopicMessagesByDate(
        savedMessagesTopicId: savedMessagesTopicId ?? this.savedMessagesTopicId,
        minDate: minDate ?? this.minDate,
        maxDate: maxDate ?? this.maxDate,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'deleteSavedMessagesTopicMessagesByDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
