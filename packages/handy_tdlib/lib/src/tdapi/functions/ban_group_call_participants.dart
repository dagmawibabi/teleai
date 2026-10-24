part of '../tdapi.dart';

/// **BanGroupCallParticipants** *(banGroupCallParticipants)* - TDLib function
///
/// Bans users from a group call not bound to a chat; requires groupCall.is_owned. Only the owner of the group call can invite the banned users back.
///
/// * [groupCallId]: Group call identifier.
/// * [userIds]: Identifiers of group call participants to ban; identifiers of unknown users from the update updateGroupCallParticipants can be also passed to the method.
///
/// [Ok] is returned on completion.
final class BanGroupCallParticipants extends TdFunction {
  /// **BanGroupCallParticipants** *(banGroupCallParticipants)* - TDLib function
  ///
  /// Bans users from a group call not bound to a chat; requires groupCall.is_owned. Only the owner of the group call can invite the banned users back.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [userIds]: Identifiers of group call participants to ban; identifiers of unknown users from the update updateGroupCallParticipants can be also passed to the method.
  ///
  /// [Ok] is returned on completion.
  const BanGroupCallParticipants({
    required this.groupCallId,
    required this.userIds,
  });

  /// Group call identifier
  final int groupCallId;

  /// Identifiers of group call participants to ban; identifiers of unknown users from the update updateGroupCallParticipants can be also passed to the method
  final List<int> userIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "user_ids": userIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [user_ids]: Identifiers of group call participants to ban; identifiers of unknown users from the update updateGroupCallParticipants can be also passed to the method
  BanGroupCallParticipants copyWith({
    int? groupCallId,
    List<int>? userIds,
  }) =>
      BanGroupCallParticipants(
        groupCallId: groupCallId ?? this.groupCallId,
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'banGroupCallParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
