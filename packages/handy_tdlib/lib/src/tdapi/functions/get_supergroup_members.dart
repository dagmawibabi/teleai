part of '../tdapi.dart';

/// **GetSupergroupMembers** *(getSupergroupMembers)* - TDLib function
///
/// Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters.
///
/// * [supergroupId]: Identifier of the supergroup or channel.
/// * [filter]: The type of users to return; pass null to use supergroupMembersFilterRecent *(optional)*.
/// * [offset]: Number of users to skip.
/// * [limit]: The maximum number of users to be returned; up to 200.
///
/// [ChatMembers] is returned on completion.
final class GetSupergroupMembers extends TdFunction {
  /// **GetSupergroupMembers** *(getSupergroupMembers)* - TDLib function
  ///
  /// Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters.
  ///
  /// * [supergroupId]: Identifier of the supergroup or channel.
  /// * [filter]: The type of users to return; pass null to use supergroupMembersFilterRecent *(optional)*.
  /// * [offset]: Number of users to skip.
  /// * [limit]: The maximum number of users to be returned; up to 200.
  ///
  /// [ChatMembers] is returned on completion.
  const GetSupergroupMembers({
    required this.supergroupId,
    this.filter,
    required this.offset,
    required this.limit,
  });

  /// Identifier of the supergroup or channel
  final int supergroupId;

  /// The type of users to return; pass null to use supergroupMembersFilterRecent
  final SupergroupMembersFilter? filter;

  /// Number of users to skip
  final int offset;

  /// The maximum number of users to be returned; up to 200
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "filter": filter?.toJson(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup or channel
  /// * [filter]: The type of users to return; pass null to use supergroupMembersFilterRecent
  /// * [offset]: Number of users to skip
  /// * [limit]: The maximum number of users to be returned; up to 200
  GetSupergroupMembers copyWith({
    int? supergroupId,
    SupergroupMembersFilter? filter,
    int? offset,
    int? limit,
  }) =>
      GetSupergroupMembers(
        supergroupId: supergroupId ?? this.supergroupId,
        filter: filter ?? this.filter,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSupergroupMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
