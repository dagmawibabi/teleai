part of '../tdapi.dart';

/// **SetBusinessAccountProfilePhoto** *(setBusinessAccountProfilePhoto)* - TDLib function
///
/// Changes a profile photo of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [photo]: Profile photo to set; pass null to remove the photo *(optional)*.
/// * [isPublic]: Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings.
///
/// [Ok] is returned on completion.
final class SetBusinessAccountProfilePhoto extends TdFunction {
  /// **SetBusinessAccountProfilePhoto** *(setBusinessAccountProfilePhoto)* - TDLib function
  ///
  /// Changes a profile photo of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [photo]: Profile photo to set; pass null to remove the photo *(optional)*.
  /// * [isPublic]: Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessAccountProfilePhoto({
    required this.businessConnectionId,
    this.photo,
    required this.isPublic,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// Profile photo to set; pass null to remove the photo
  final InputChatPhoto? photo;

  /// Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings
  final bool isPublic;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "photo": photo?.toJson(),
      "is_public": isPublic,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [photo]: Profile photo to set; pass null to remove the photo
  /// * [is_public]: Pass true to set the public photo, which will be visible even if the main photo is hidden by privacy settings
  SetBusinessAccountProfilePhoto copyWith({
    String? businessConnectionId,
    InputChatPhoto? photo,
    bool? isPublic,
  }) =>
      SetBusinessAccountProfilePhoto(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        photo: photo ?? this.photo,
        isPublic: isPublic ?? this.isPublic,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessAccountProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
