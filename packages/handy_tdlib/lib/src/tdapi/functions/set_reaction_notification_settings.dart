part of '../tdapi.dart';

/// **SetReactionNotificationSettings** *(setReactionNotificationSettings)* - TDLib function
///
/// Changes notification settings for reactions.
///
/// * [notificationSettings]: The new notification settings for reactions.
///
/// [Ok] is returned on completion.
final class SetReactionNotificationSettings extends TdFunction {
  /// **SetReactionNotificationSettings** *(setReactionNotificationSettings)* - TDLib function
  ///
  /// Changes notification settings for reactions.
  ///
  /// * [notificationSettings]: The new notification settings for reactions.
  ///
  /// [Ok] is returned on completion.
  const SetReactionNotificationSettings({
    required this.notificationSettings,
  });

  /// The new notification settings for reactions
  final ReactionNotificationSettings notificationSettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "notification_settings": notificationSettings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_settings]: The new notification settings for reactions
  SetReactionNotificationSettings copyWith({
    ReactionNotificationSettings? notificationSettings,
  }) =>
      SetReactionNotificationSettings(
        notificationSettings: notificationSettings ?? this.notificationSettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setReactionNotificationSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
