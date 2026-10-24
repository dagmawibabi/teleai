part of '../tdapi.dart';

/// **SetCommunityPhoto** *(setCommunityPhoto)* - TDLib function
///
/// Changes the photo of a community; requires can_change_info administrator right in the community.
///
/// * [communityId]: Identifier of the community.
/// * [photo]: New community photo; pass null to delete the community photo *(optional)*.
///
/// [Ok] is returned on completion.
final class SetCommunityPhoto extends TdFunction {
  /// **SetCommunityPhoto** *(setCommunityPhoto)* - TDLib function
  ///
  /// Changes the photo of a community; requires can_change_info administrator right in the community.
  ///
  /// * [communityId]: Identifier of the community.
  /// * [photo]: New community photo; pass null to delete the community photo *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetCommunityPhoto({
    required this.communityId,
    this.photo,
  });

  /// Identifier of the community
  final int communityId;

  /// New community photo; pass null to delete the community photo
  final InputChatPhoto? photo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
      "photo": photo?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community
  /// * [photo]: New community photo; pass null to delete the community photo
  SetCommunityPhoto copyWith({
    int? communityId,
    InputChatPhoto? photo,
  }) =>
      SetCommunityPhoto(
        communityId: communityId ?? this.communityId,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCommunityPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
