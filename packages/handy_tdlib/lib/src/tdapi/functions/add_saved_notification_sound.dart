part of '../tdapi.dart';

/// **AddSavedNotificationSound** *(addSavedNotificationSound)* - TDLib function
///
/// Adds a new notification sound to the list of saved notification sounds. The new notification sound is added to the top of the list. If it is already in the list, its position isn't changed.
///
/// * [sound]: Notification sound file to add.
///
/// [NotificationSound] is returned on completion.
final class AddSavedNotificationSound extends TdFunction {
  /// **AddSavedNotificationSound** *(addSavedNotificationSound)* - TDLib function
  ///
  /// Adds a new notification sound to the list of saved notification sounds. The new notification sound is added to the top of the list. If it is already in the list, its position isn't changed.
  ///
  /// * [sound]: Notification sound file to add.
  ///
  /// [NotificationSound] is returned on completion.
  const AddSavedNotificationSound({
    required this.sound,
  });

  /// Notification sound file to add
  final InputFile sound;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sound": sound.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sound]: Notification sound file to add
  AddSavedNotificationSound copyWith({
    InputFile? sound,
  }) =>
      AddSavedNotificationSound(
        sound: sound ?? this.sound,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addSavedNotificationSound';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
