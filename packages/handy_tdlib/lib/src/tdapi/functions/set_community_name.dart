part of '../tdapi.dart';

/// **SetCommunityName** *(setCommunityName)* - TDLib function
///
/// Changes name of the given community; requires can_change_info administrator right in the community.
///
/// * [communityId]: Identifier of the community.
/// * [name]: New name of the community.
///
/// [Ok] is returned on completion.
final class SetCommunityName extends TdFunction {
  /// **SetCommunityName** *(setCommunityName)* - TDLib function
  ///
  /// Changes name of the given community; requires can_change_info administrator right in the community.
  ///
  /// * [communityId]: Identifier of the community.
  /// * [name]: New name of the community.
  ///
  /// [Ok] is returned on completion.
  const SetCommunityName({
    required this.communityId,
    required this.name,
  });

  /// Identifier of the community
  final int communityId;

  /// New name of the community
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Identifier of the community
  /// * [name]: New name of the community
  SetCommunityName copyWith({
    int? communityId,
    String? name,
  }) =>
      SetCommunityName(
        communityId: communityId ?? this.communityId,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCommunityName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
