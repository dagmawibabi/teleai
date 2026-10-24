part of '../tdapi.dart';

/// **DeleteDirectMessagesChatTopicHistory** *(deleteDirectMessagesChatTopicHistory)* - TDLib function
///
/// Deletes all messages in the topic in a channel direct messages chat administered by the current user.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [topicId]: Identifier of the topic which messages will be deleted.
///
/// [Ok] is returned on completion.
final class DeleteDirectMessagesChatTopicHistory extends TdFunction {
  /// **DeleteDirectMessagesChatTopicHistory** *(deleteDirectMessagesChatTopicHistory)* - TDLib function
  ///
  /// Deletes all messages in the topic in a channel direct messages chat administered by the current user.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [topicId]: Identifier of the topic which messages will be deleted.
  ///
  /// [Ok] is returned on completion.
  const DeleteDirectMessagesChatTopicHistory({
    required this.chatId,
    required this.topicId,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Identifier of the topic which messages will be deleted
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
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [topic_id]: Identifier of the topic which messages will be deleted
  DeleteDirectMessagesChatTopicHistory copyWith({
    int? chatId,
    int? topicId,
  }) =>
      DeleteDirectMessagesChatTopicHistory(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteDirectMessagesChatTopicHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
