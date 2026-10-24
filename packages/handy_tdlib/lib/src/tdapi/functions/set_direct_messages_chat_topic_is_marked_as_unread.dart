part of '../tdapi.dart';

/// **SetDirectMessagesChatTopicIsMarkedAsUnread** *(setDirectMessagesChatTopicIsMarkedAsUnread)* - TDLib function
///
/// Changes the marked as unread state of the topic in a channel direct messages chat administered by the current user.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [topicId]: Topic identifier.
/// * [isMarkedAsUnread]: New value of is_marked_as_unread.
///
/// [Ok] is returned on completion.
final class SetDirectMessagesChatTopicIsMarkedAsUnread extends TdFunction {
  /// **SetDirectMessagesChatTopicIsMarkedAsUnread** *(setDirectMessagesChatTopicIsMarkedAsUnread)* - TDLib function
  ///
  /// Changes the marked as unread state of the topic in a channel direct messages chat administered by the current user.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [topicId]: Topic identifier.
  /// * [isMarkedAsUnread]: New value of is_marked_as_unread.
  ///
  /// [Ok] is returned on completion.
  const SetDirectMessagesChatTopicIsMarkedAsUnread({
    required this.chatId,
    required this.topicId,
    required this.isMarkedAsUnread,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// Topic identifier
  final int topicId;

  /// New value of is_marked_as_unread
  final bool isMarkedAsUnread;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId,
      "is_marked_as_unread": isMarkedAsUnread,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [topic_id]: Topic identifier
  /// * [is_marked_as_unread]: New value of is_marked_as_unread
  SetDirectMessagesChatTopicIsMarkedAsUnread copyWith({
    int? chatId,
    int? topicId,
    bool? isMarkedAsUnread,
  }) =>
      SetDirectMessagesChatTopicIsMarkedAsUnread(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        isMarkedAsUnread: isMarkedAsUnread ?? this.isMarkedAsUnread,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'setDirectMessagesChatTopicIsMarkedAsUnread';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
