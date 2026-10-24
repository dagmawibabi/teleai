part of '../tdapi.dart';

/// **GetDirectMessagesChatTopicMessageByDate** *(getDirectMessagesChatTopicMessageByDate)* - TDLib function
///
/// Returns the last message sent in the topic in a channel direct messages chat administered by the current user no later than the specified date.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [topicId]: Identifier of the topic which messages will be fetched.
/// * [date]: Point in time (Unix timestamp) relative to which to search for messages.
///
/// [Message] is returned on completion.
final class GetDirectMessagesChatTopicMessageByDate extends TdFunction {
  /// **GetDirectMessagesChatTopicMessageByDate** *(getDirectMessagesChatTopicMessageByDate)* - TDLib function
  ///
  /// Returns the last message sent in the topic in a channel direct messages chat administered by the current user no later than the specified date.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [topicId]: Identifier of the topic which messages will be fetched.
  /// * [date]: Point in time (Unix timestamp) relative to which to search for messages.
  ///
  /// [Message] is returned on completion.
  const GetDirectMessagesChatTopicMessageByDate({
    required this.chatId,
    required this.topicId,
    required this.date,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the topic which messages will be fetched
  final int topicId;

  /// Point in time (Unix timestamp) relative to which to search for messages
  final int date;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId,
      "date": date,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [topic_id]: Identifier of the topic which messages will be fetched
  /// * [date]: Point in time (Unix timestamp) relative to which to search for messages
  GetDirectMessagesChatTopicMessageByDate copyWith({
    int? chatId,
    int? topicId,
    int? date,
  }) =>
      GetDirectMessagesChatTopicMessageByDate(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'getDirectMessagesChatTopicMessageByDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
