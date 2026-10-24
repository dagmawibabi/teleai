part of '../tdapi.dart';

/// **GetScopeNotificationSettings** *(getScopeNotificationSettings)* - TDLib function
///
/// Returns the notification settings for chats of a given type.
///
/// * [scope]: Types of chats for which to return the notification settings information.
///
/// [ScopeNotificationSettings] is returned on completion.
final class GetScopeNotificationSettings extends TdFunction {
  /// **GetScopeNotificationSettings** *(getScopeNotificationSettings)* - TDLib function
  ///
  /// Returns the notification settings for chats of a given type.
  ///
  /// * [scope]: Types of chats for which to return the notification settings information.
  ///
  /// [ScopeNotificationSettings] is returned on completion.
  const GetScopeNotificationSettings({
    required this.scope,
  });

  /// Types of chats for which to return the notification settings information
  final NotificationSettingsScope scope;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "scope": scope.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: Types of chats for which to return the notification settings information
  GetScopeNotificationSettings copyWith({
    NotificationSettingsScope? scope,
  }) =>
      GetScopeNotificationSettings(
        scope: scope ?? this.scope,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getScopeNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
