part of '../tdapi.dart';

/// **JoinVideoChat** *(joinVideoChat)* - TDLib function
///
/// Joins an active video chat. Returns join response payload for tgcalls.
///
/// * [groupCallId]: Group call identifier.
/// * [participantId]: Identifier of a group call participant, which will be used to join the call; pass null to join as self *(optional)*.
/// * [joinParameters]: Parameters to join the call.
/// * [inviteHash]: Invite hash as received from internalLinkTypeVideoChat.
///
/// [Text] is returned on completion.
final class JoinVideoChat extends TdFunction {
  /// **JoinVideoChat** *(joinVideoChat)* - TDLib function
  ///
  /// Joins an active video chat. Returns join response payload for tgcalls.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [participantId]: Identifier of a group call participant, which will be used to join the call; pass null to join as self *(optional)*.
  /// * [joinParameters]: Parameters to join the call.
  /// * [inviteHash]: Invite hash as received from internalLinkTypeVideoChat.
  ///
  /// [Text] is returned on completion.
  const JoinVideoChat({
    required this.groupCallId,
    this.participantId,
    required this.joinParameters,
    required this.inviteHash,
  });

  /// Group call identifier
  final int groupCallId;

  /// Identifier of a group call participant, which will be used to join the call; pass null to join as self
  final MessageSender? participantId;

  /// Parameters to join the call
  final GroupCallJoinParameters joinParameters;

  /// Invite hash as received from internalLinkTypeVideoChat
  final String inviteHash;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant_id": participantId?.toJson(),
      "join_parameters": joinParameters.toJson(),
      "invite_hash": inviteHash,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [participant_id]: Identifier of a group call participant, which will be used to join the call; pass null to join as self
  /// * [join_parameters]: Parameters to join the call
  /// * [invite_hash]: Invite hash as received from internalLinkTypeVideoChat
  JoinVideoChat copyWith({
    int? groupCallId,
    MessageSender? participantId,
    GroupCallJoinParameters? joinParameters,
    String? inviteHash,
  }) =>
      JoinVideoChat(
        groupCallId: groupCallId ?? this.groupCallId,
        participantId: participantId ?? this.participantId,
        joinParameters: joinParameters ?? this.joinParameters,
        inviteHash: inviteHash ?? this.inviteHash,
      );

  /// TDLib object type
  static const String defaultObjectId = 'joinVideoChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
