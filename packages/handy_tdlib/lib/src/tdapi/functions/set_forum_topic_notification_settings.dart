part of '../tdapi.dart';

/// **SetForumTopicNotificationSettings** *(setForumTopicNotificationSettings)* - TDLib function
///
/// Changes the notification settings of a forum topic in a forum supergroup chat or a chat with a bot with topics.
///
/// * [chatId]: Chat identifier.
/// * [forumTopicId]: Forum topic identifier.
/// * [notificationSettings]: New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever.
///
/// [Ok] is returned on completion.
final class SetForumTopicNotificationSettings extends TdFunction {
  /// **SetForumTopicNotificationSettings** *(setForumTopicNotificationSettings)* - TDLib function
  ///
  /// Changes the notification settings of a forum topic in a forum supergroup chat or a chat with a bot with topics.
  ///
  /// * [chatId]: Chat identifier.
  /// * [forumTopicId]: Forum topic identifier.
  /// * [notificationSettings]: New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever.
  ///
  /// [Ok] is returned on completion.
  const SetForumTopicNotificationSettings({
    required this.chatId,
    required this.forumTopicId,
    required this.notificationSettings,
  });

  /// Chat identifier
  final int chatId;

  /// Forum topic identifier
  final int forumTopicId;

  /// New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever
  final ChatNotificationSettings notificationSettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "forum_topic_id": forumTopicId,
      "notification_settings": notificationSettings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [forum_topic_id]: Forum topic identifier
  /// * [notification_settings]: New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever
  SetForumTopicNotificationSettings copyWith({
    int? chatId,
    int? forumTopicId,
    ChatNotificationSettings? notificationSettings,
  }) =>
      SetForumTopicNotificationSettings(
        chatId: chatId ?? this.chatId,
        forumTopicId: forumTopicId ?? this.forumTopicId,
        notificationSettings: notificationSettings ?? this.notificationSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setForumTopicNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
