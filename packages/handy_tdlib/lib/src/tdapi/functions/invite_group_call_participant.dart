part of '../tdapi.dart';

/// **InviteGroupCallParticipant** *(inviteGroupCallParticipant)* - TDLib function
///
/// Invites a user to an active group call; for group calls not bound to a chat only. Sends a service message of the type messageGroupCall.. The group call can have at most getOption("group_call_participant_count_max") participants.
///
/// * [groupCallId]: Group call identifier.
/// * [userId]: User identifier.
/// * [isVideo]: Pass true if the group call is a video call.
///
/// [InviteGroupCallParticipantResult] is returned on completion.
final class InviteGroupCallParticipant extends TdFunction {
  /// **InviteGroupCallParticipant** *(inviteGroupCallParticipant)* - TDLib function
  ///
  /// Invites a user to an active group call; for group calls not bound to a chat only. Sends a service message of the type messageGroupCall.. The group call can have at most getOption("group_call_participant_count_max") participants.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [userId]: User identifier.
  /// * [isVideo]: Pass true if the group call is a video call.
  ///
  /// [InviteGroupCallParticipantResult] is returned on completion.
  const InviteGroupCallParticipant({
    required this.groupCallId,
    required this.userId,
    required this.isVideo,
  });

  /// Group call identifier
  final int groupCallId;

  /// User identifier
  final int userId;

  /// Pass true if the group call is a video call
  final bool isVideo;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "user_id": userId,
      "is_video": isVideo,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [user_id]: User identifier
  /// * [is_video]: Pass true if the group call is a video call
  InviteGroupCallParticipant copyWith({
    int? groupCallId,
    int? userId,
    bool? isVideo,
  }) =>
      InviteGroupCallParticipant(
        groupCallId: groupCallId ?? this.groupCallId,
        userId: userId ?? this.userId,
        isVideo: isVideo ?? this.isVideo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inviteGroupCallParticipant';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
