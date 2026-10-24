part of '../tdapi.dart';

/// **InviteVideoChatParticipants** *(inviteVideoChatParticipants)* - TDLib function
///
/// Invites users to an active video chat. Sends a service message of the type messageInviteVideoChatParticipants to the chat bound to the group call.
///
/// * [groupCallId]: Group call identifier.
/// * [userIds]: User identifiers. At most 10 users can be invited simultaneously.
///
/// [Ok] is returned on completion.
final class InviteVideoChatParticipants extends TdFunction {
  /// **InviteVideoChatParticipants** *(inviteVideoChatParticipants)* - TDLib function
  ///
  /// Invites users to an active video chat. Sends a service message of the type messageInviteVideoChatParticipants to the chat bound to the group call.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [userIds]: User identifiers. At most 10 users can be invited simultaneously.
  ///
  /// [Ok] is returned on completion.
  const InviteVideoChatParticipants({
    required this.groupCallId,
    required this.userIds,
  });

  /// Group call identifier
  final int groupCallId;

  /// User identifiers. At most 10 users can be invited simultaneously
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
  /// * [user_ids]: User identifiers. At most 10 users can be invited simultaneously
  InviteVideoChatParticipants copyWith({
    int? groupCallId,
    List<int>? userIds,
  }) =>
      InviteVideoChatParticipants(
        groupCallId: groupCallId ?? this.groupCallId,
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inviteVideoChatParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
