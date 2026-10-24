part of '../tdapi.dart';

/// **SetScopeNotificationSettings** *(setScopeNotificationSettings)* - TDLib function
///
/// Changes notification settings for chats of a given type.
///
/// * [scope]: Types of chats for which to change the notification settings.
/// * [notificationSettings]: The new notification settings for the given scope.
///
/// [Ok] is returned on completion.
final class SetScopeNotificationSettings extends TdFunction {
  /// **SetScopeNotificationSettings** *(setScopeNotificationSettings)* - TDLib function
  ///
  /// Changes notification settings for chats of a given type.
  ///
  /// * [scope]: Types of chats for which to change the notification settings.
  /// * [notificationSettings]: The new notification settings for the given scope.
  ///
  /// [Ok] is returned on completion.
  const SetScopeNotificationSettings({
    required this.scope,
    required this.notificationSettings,
  });

  /// Types of chats for which to change the notification settings
  final NotificationSettingsScope scope;

  /// The new notification settings for the given scope
  final ScopeNotificationSettings notificationSettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "scope": scope.toJson(),
      "notification_settings": notificationSettings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: Types of chats for which to change the notification settings
  /// * [notification_settings]: The new notification settings for the given scope
  SetScopeNotificationSettings copyWith({
    NotificationSettingsScope? scope,
    ScopeNotificationSettings? notificationSettings,
  }) =>
      SetScopeNotificationSettings(
        scope: scope ?? this.scope,
        notificationSettings: notificationSettings ?? this.notificationSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setScopeNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
