part of '../tdapi.dart';

/// **GetSavedNotificationSounds** *(getSavedNotificationSounds)* - TDLib function
///
/// Returns the list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used.
///
/// [NotificationSounds] is returned on completion.
final class GetSavedNotificationSounds extends TdFunction {
  /// **GetSavedNotificationSounds** *(getSavedNotificationSounds)* - TDLib function
  ///
  /// Returns the list of saved notification sounds. If a sound isn't in the list, then default sound needs to be used.
  ///
  /// [NotificationSounds] is returned on completion.
  const GetSavedNotificationSounds();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSavedNotificationSounds copyWith() => const GetSavedNotificationSounds();

  /// TDLib object type
  static const String defaultObjectId = 'getSavedNotificationSounds';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
