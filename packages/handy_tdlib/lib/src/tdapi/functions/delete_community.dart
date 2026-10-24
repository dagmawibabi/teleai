part of '../tdapi.dart';

/// **DeleteCommunity** *(deleteCommunity)* - TDLib function
///
/// Deletes a community; requires owner privileges.
///
/// * [communityId]: Identifier of the community.
///
/// [Ok] is returned on completion.
final class DeleteCommunity extends TdFunction {
  /// **DeleteCommunity** *(deleteCommunity)* - TDLib function
  ///
  /// Deletes a community; requires owner privileges.
  ///
  /// * [communityId]: Identifier of the community.
  ///
  /// [Ok] is returned on completion.
  const DeleteCommunity({
    required this.communityId,
  });

  /// Identifier of the community
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
  /// * [community_id]: Identifier of the community
  DeleteCommunity copyWith({
    int? communityId,
  }) =>
      DeleteCommunity(
        communityId: communityId ?? this.communityId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteCommunity';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
