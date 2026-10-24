part of '../tdapi.dart';

/// **DeleteDirectMessagesChatTopicMessagesByDate** *(deleteDirectMessagesChatTopicMessagesByDate)* - TDLib function
///
/// Deletes all messages between the specified dates in the topic in a channel direct messages chat administered by the current user. Messages sent in the last 30 seconds will not be deleted.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [topicId]: Identifier of the topic which messages will be deleted.
/// * [minDate]: The minimum date of the messages to delete.
/// * [maxDate]: The maximum date of the messages to delete.
///
/// [Ok] is returned on completion.
final class DeleteDirectMessagesChatTopicMessagesByDate extends TdFunction {
  /// **DeleteDirectMessagesChatTopicMessagesByDate** *(deleteDirectMessagesChatTopicMessagesByDate)* - TDLib function
  ///
  /// Deletes all messages between the specified dates in the topic in a channel direct messages chat administered by the current user. Messages sent in the last 30 seconds will not be deleted.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [topicId]: Identifier of the topic which messages will be deleted.
  /// * [minDate]: The minimum date of the messages to delete.
  /// * [maxDate]: The maximum date of the messages to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteDirectMessagesChatTopicMessagesByDate({
    required this.chatId,
    required this.topicId,
    required this.minDate,
    required this.maxDate,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the topic which messages will be deleted
  final int topicId;

  /// The minimum date of the messages to delete
  final int minDate;

  /// The maximum date of the messages to delete
  final int maxDate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId,
      "min_date": minDate,
      "max_date": maxDate,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [topic_id]: Identifier of the topic which messages will be deleted
  /// * [min_date]: The minimum date of the messages to delete
  /// * [max_date]: The maximum date of the messages to delete
  DeleteDirectMessagesChatTopicMessagesByDate copyWith({
    int? chatId,
    int? topicId,
    int? minDate,
    int? maxDate,
  }) =>
      DeleteDirectMessagesChatTopicMessagesByDate(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        minDate: minDate ?? this.minDate,
        maxDate: maxDate ?? this.maxDate,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'deleteDirectMessagesChatTopicMessagesByDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
