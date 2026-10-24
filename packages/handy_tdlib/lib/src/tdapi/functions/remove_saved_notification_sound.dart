part of '../tdapi.dart';

/// **RemoveSavedNotificationSound** *(removeSavedNotificationSound)* - TDLib function
///
/// Removes a notification sound from the list of saved notification sounds.
///
/// * [notificationSoundId]: Identifier of the notification sound.
///
/// [Ok] is returned on completion.
final class RemoveSavedNotificationSound extends TdFunction {
  /// **RemoveSavedNotificationSound** *(removeSavedNotificationSound)* - TDLib function
  ///
  /// Removes a notification sound from the list of saved notification sounds.
  ///
  /// * [notificationSoundId]: Identifier of the notification sound.
  ///
  /// [Ok] is returned on completion.
  const RemoveSavedNotificationSound({
    required this.notificationSoundId,
  });

  /// Identifier of the notification sound
  final int notificationSoundId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "notification_sound_id": notificationSoundId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [notification_sound_id]: Identifier of the notification sound
  RemoveSavedNotificationSound copyWith({
    int? notificationSoundId,
  }) =>
      RemoveSavedNotificationSound(
        notificationSoundId: notificationSoundId ?? this.notificationSoundId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeSavedNotificationSound';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
