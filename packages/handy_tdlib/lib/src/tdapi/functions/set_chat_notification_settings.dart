part of '../tdapi.dart';

/// **SetChatNotificationSettings** *(setChatNotificationSettings)* - TDLib function
///
/// Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed.
///
/// * [chatId]: Chat identifier.
/// * [notificationSettings]: New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever.
///
/// [Ok] is returned on completion.
final class SetChatNotificationSettings extends TdFunction {
  /// **SetChatNotificationSettings** *(setChatNotificationSettings)* - TDLib function
  ///
  /// Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [notificationSettings]: New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever.
  ///
  /// [Ok] is returned on completion.
  const SetChatNotificationSettings({
    required this.chatId,
    required this.notificationSettings,
  });

  /// Chat identifier
  final int chatId;

  /// New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever
  final ChatNotificationSettings notificationSettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "notification_settings": notificationSettings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [notification_settings]: New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever
  SetChatNotificationSettings copyWith({
    int? chatId,
    ChatNotificationSettings? notificationSettings,
  }) =>
      SetChatNotificationSettings(
        chatId: chatId ?? this.chatId,
        notificationSettings: notificationSettings ?? this.notificationSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
