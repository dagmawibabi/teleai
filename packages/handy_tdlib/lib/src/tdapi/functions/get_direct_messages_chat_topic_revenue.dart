part of '../tdapi.dart';

/// **GetDirectMessagesChatTopicRevenue** *(getDirectMessagesChatTopicRevenue)* - TDLib function
///
/// Returns the total number of Telegram Stars received by the channel chat for direct messages from the given topic.
///
/// * [chatId]: Chat identifier of the channel direct messages chat administered by the current user.
/// * [topicId]: Identifier of the topic.
///
/// [StarCount] is returned on completion.
final class GetDirectMessagesChatTopicRevenue extends TdFunction {
  /// **GetDirectMessagesChatTopicRevenue** *(getDirectMessagesChatTopicRevenue)* - TDLib function
  ///
  /// Returns the total number of Telegram Stars received by the channel chat for direct messages from the given topic.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat administered by the current user.
  /// * [topicId]: Identifier of the topic.
  ///
  /// [StarCount] is returned on completion.
  const GetDirectMessagesChatTopicRevenue({
    required this.chatId,
    required this.topicId,
  });

  /// Chat identifier of the channel direct messages chat administered by the current user
  final int chatId;

  /// Identifier of the topic
  final int topicId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat administered by the current user
  /// * [topic_id]: Identifier of the topic
  GetDirectMessagesChatTopicRevenue copyWith({
    int? chatId,
    int? topicId,
  }) =>
      GetDirectMessagesChatTopicRevenue(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getDirectMessagesChatTopicRevenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
