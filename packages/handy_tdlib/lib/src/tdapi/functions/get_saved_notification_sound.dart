part of '../tdapi.dart';

/// **GetSavedNotificationSound** *(getSavedNotificationSound)* - TDLib function
///
/// Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier.
///
/// * [notificationSoundId]: Identifier of the notification sound.
///
/// [NotificationSound] is returned on completion.
final class GetSavedNotificationSound extends TdFunction {
  /// **GetSavedNotificationSound** *(getSavedNotificationSound)* - TDLib function
  ///
  /// Returns saved notification sound by its identifier. Returns a 404 error if there is no saved notification sound with the specified identifier.
  ///
  /// * [notificationSoundId]: Identifier of the notification sound.
  ///
  /// [NotificationSound] is returned on completion.
  const GetSavedNotificationSound({
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
  GetSavedNotificationSound copyWith({
    int? notificationSoundId,
  }) =>
      GetSavedNotificationSound(
        notificationSoundId: notificationSoundId ?? this.notificationSoundId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSavedNotificationSound';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
