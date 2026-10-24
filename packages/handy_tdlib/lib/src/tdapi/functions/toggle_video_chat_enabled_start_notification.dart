part of '../tdapi.dart';

/// **ToggleVideoChatEnabledStartNotification** *(toggleVideoChatEnabledStartNotification)* - TDLib function
///
/// Toggles whether the current user will receive a notification when the video chat starts; for scheduled video chats only.
///
/// * [groupCallId]: Group call identifier.
/// * [enabledStartNotification]: New value of the enabled_start_notification setting.
///
/// [Ok] is returned on completion.
final class ToggleVideoChatEnabledStartNotification extends TdFunction {
  /// **ToggleVideoChatEnabledStartNotification** *(toggleVideoChatEnabledStartNotification)* - TDLib function
  ///
  /// Toggles whether the current user will receive a notification when the video chat starts; for scheduled video chats only.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [enabledStartNotification]: New value of the enabled_start_notification setting.
  ///
  /// [Ok] is returned on completion.
  const ToggleVideoChatEnabledStartNotification({
    required this.groupCallId,
    required this.enabledStartNotification,
  });

  /// Group call identifier
  final int groupCallId;

  /// New value of the enabled_start_notification setting
  final bool enabledStartNotification;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "enabled_start_notification": enabledStartNotification,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [enabled_start_notification]: New value of the enabled_start_notification setting
  ToggleVideoChatEnabledStartNotification copyWith({
    int? groupCallId,
    bool? enabledStartNotification,
  }) =>
      ToggleVideoChatEnabledStartNotification(
        groupCallId: groupCallId ?? this.groupCallId,
        enabledStartNotification:
            enabledStartNotification ?? this.enabledStartNotification,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'toggleVideoChatEnabledStartNotification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
