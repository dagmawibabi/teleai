part of '../tdapi.dart';

/// **SetUserPersonalProfilePhoto** *(setUserPersonalProfilePhoto)* - TDLib function
///
/// Changes a personal profile photo of a contact user.
///
/// * [userId]: User identifier.
/// * [photo]: Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function *(optional)*.
///
/// [Ok] is returned on completion.
final class SetUserPersonalProfilePhoto extends TdFunction {
  /// **SetUserPersonalProfilePhoto** *(setUserPersonalProfilePhoto)* - TDLib function
  ///
  /// Changes a personal profile photo of a contact user.
  ///
  /// * [userId]: User identifier.
  /// * [photo]: Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetUserPersonalProfilePhoto({
    required this.userId,
    this.photo,
  });

  /// User identifier
  final int userId;

  /// Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function
  final InputChatPhoto? photo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "photo": photo?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [photo]: Profile photo to set; pass null to delete the photo; inputChatPhotoPrevious isn't supported in this function
  SetUserPersonalProfilePhoto copyWith({
    int? userId,
    InputChatPhoto? photo,
  }) =>
      SetUserPersonalProfilePhoto(
        userId: userId ?? this.userId,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUserPersonalProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
