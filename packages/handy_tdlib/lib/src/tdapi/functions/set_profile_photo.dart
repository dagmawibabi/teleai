part of '../tdapi.dart';

/// **SetProfilePhoto** *(setProfilePhoto)* - TDLib function
///
/// Changes a profile photo for the current user.
///
/// * [photo]: Profile photo to set.
/// * [isPublic]: Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings.
///
/// [Ok] is returned on completion.
final class SetProfilePhoto extends TdFunction {
  /// **SetProfilePhoto** *(setProfilePhoto)* - TDLib function
  ///
  /// Changes a profile photo for the current user.
  ///
  /// * [photo]: Profile photo to set.
  /// * [isPublic]: Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings.
  ///
  /// [Ok] is returned on completion.
  const SetProfilePhoto({
    required this.photo,
    required this.isPublic,
  });

  /// Profile photo to set
  final InputChatPhoto photo;

  /// Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings
  final bool isPublic;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "is_public": isPublic,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Profile photo to set
  /// * [is_public]: Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings
  SetProfilePhoto copyWith({
    InputChatPhoto? photo,
    bool? isPublic,
  }) =>
      SetProfilePhoto(
        photo: photo ?? this.photo,
        isPublic: isPublic ?? this.isPublic,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
