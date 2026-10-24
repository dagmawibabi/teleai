part of '../tdapi.dart';

/// **RemoveNotificationGroup** *(removeNotificationGroup)* - TDLib function
///
/// Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user.
///
/// * [notificationGroupId]: Notification group identifier.
/// * [maxNotificationId]: The maximum identifier of removed notifications.
///
/// [Ok] is returned on completion.
final class RemoveNotificationGroup extends TdFunction {
  /// **RemoveNotificationGroup** *(removeNotificationGroup)* - TDLib function
  ///
  /// Removes a group of active notifications. Needs to be called only if the notification group is removed by the current user.
  ///
  /// * [notificationGroupId]: Notification group identifier.
  /// * [maxNotificationId]: The maximum identifier of removed notifications.
  ///
  /// [Ok] is returned on completion.
  const RemoveNotificationGroup({
    required this.notificationGroupId,
    required this.maxNotificationId,
  });

  /// Notification group identifier
  final int notificationGroupId;

  /// The maximum identifier of removed notifications
  final int maxNotificationId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "notification_group_id": notificationGroupId,
      "max_notification_id": maxNotificationId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_group_id]: Notification group identifier
  /// * [max_notification_id]: The maximum identifier of removed notifications
  RemoveNotificationGroup copyWith({
    int? notificationGroupId,
    int? maxNotificationId,
  }) =>
      RemoveNotificationGroup(
        notificationGroupId: notificationGroupId ?? this.notificationGroupId,
        maxNotificationId: maxNotificationId ?? this.maxNotificationId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeNotificationGroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
