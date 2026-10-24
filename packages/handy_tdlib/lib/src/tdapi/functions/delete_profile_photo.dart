part of '../tdapi.dart';

/// **DeleteProfilePhoto** *(deleteProfilePhoto)* - TDLib function
///
/// Deletes a profile photo.
///
/// * [profilePhotoId]: Identifier of the profile photo to delete.
///
/// [Ok] is returned on completion.
final class DeleteProfilePhoto extends TdFunction {
  /// **DeleteProfilePhoto** *(deleteProfilePhoto)* - TDLib function
  ///
  /// Deletes a profile photo.
  ///
  /// * [profilePhotoId]: Identifier of the profile photo to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteProfilePhoto({
    required this.profilePhotoId,
  });

  /// Identifier of the profile photo to delete
  final int profilePhotoId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "profile_photo_id": profilePhotoId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [profile_photo_id]: Identifier of the profile photo to delete
  DeleteProfilePhoto copyWith({
    int? profilePhotoId,
  }) =>
      DeleteProfilePhoto(
        profilePhotoId: profilePhotoId ?? this.profilePhotoId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
