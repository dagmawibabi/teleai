part of '../tdapi.dart';

/// **GetCommunityFullInfo** *(getCommunityFullInfo)* - TDLib function
///
/// Returns full information about a community.
///
/// * [communityId]: Community identifier.
///
/// [CommunityFullInfo] is returned on completion.
final class GetCommunityFullInfo extends TdFunction {
  /// **GetCommunityFullInfo** *(getCommunityFullInfo)* - TDLib function
  ///
  /// Returns full information about a community.
  ///
  /// * [communityId]: Community identifier.
  ///
  /// [CommunityFullInfo] is returned on completion.
  const GetCommunityFullInfo({
    required this.communityId,
  });

  /// Community identifier
  final int communityId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "community_id": communityId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [community_id]: Community identifier
  GetCommunityFullInfo copyWith({
    int? communityId,
  }) =>
      GetCommunityFullInfo(
        communityId: communityId ?? this.communityId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCommunityFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
