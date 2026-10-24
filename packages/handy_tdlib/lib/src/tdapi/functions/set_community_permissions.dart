part of '../tdapi.dart';

/// **SetCommunityPermissions** *(setCommunityPermissions)* - TDLib function
///
/// Changes permissions of regular members in the given community; requires can_ban_members administrator right in the community.
///
/// * [communityId]: Identifier of the community.
/// * [permissions]: New permissions of the community.
///
/// [Ok] is returned on completion.
final class SetCommunityPermissions extends TdFunction {
  /// **SetCommunityPermissions** *(setCommunityPermissions)* - TDLib function
  ///
  /// Changes permissions of regular members in the given community; requires can_ban_members administrator right in the community.
  ///
  /// * [communityId]: Identifier of the community.
  /// * [permissions]: New permissions of the community.
  ///
  /// [Ok] is returned on completion.
  const SetCommunityPermissions({
    required this.communityId,
    required this.permissions,
  });

  /// Identifier of the community
  final int communityId;

  /// New permissions of the community
  final CommunityPermissions permissions;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
      "permissions": permissions.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community
  /// * [permissions]: New permissions of the community
  SetCommunityPermissions copyWith({
    int? communityId,
    CommunityPermissions? permissions,
  }) =>
      SetCommunityPermissions(
        communityId: communityId ?? this.communityId,
        permissions: permissions ?? this.permissions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCommunityPermissions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
