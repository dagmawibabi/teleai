part of '../tdapi.dart';

/// **SetGroupCallParticipantVolumeLevel** *(setGroupCallParticipantVolumeLevel)* - TDLib function
///
/// Changes volume level of a participant of an active group call; not supported for live stories. If the current user can manage the group call or is the owner of the group call,. then the participant's volume level will be changed for all users with the default volume level.
///
/// * [groupCallId]: Group call identifier.
/// * [participantId]: Participant identifier.
/// * [volumeLevel]: New participant's volume level; 1-20000 in hundreds of percents.
///
/// [Ok] is returned on completion.
final class SetGroupCallParticipantVolumeLevel extends TdFunction {
  /// **SetGroupCallParticipantVolumeLevel** *(setGroupCallParticipantVolumeLevel)* - TDLib function
  ///
  /// Changes volume level of a participant of an active group call; not supported for live stories. If the current user can manage the group call or is the owner of the group call,. then the participant's volume level will be changed for all users with the default volume level.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [participantId]: Participant identifier.
  /// * [volumeLevel]: New participant's volume level; 1-20000 in hundreds of percents.
  ///
  /// [Ok] is returned on completion.
  const SetGroupCallParticipantVolumeLevel({
    required this.groupCallId,
    required this.participantId,
    required this.volumeLevel,
  });

  /// Group call identifier
  final int groupCallId;

  /// Participant identifier
  final MessageSender participantId;

  /// New participant's volume level; 1-20000 in hundreds of percents
  final int volumeLevel;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant_id": participantId.toJson(),
      "volume_level": volumeLevel,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [participant_id]: Participant identifier
  /// * [volume_level]: New participant's volume level; 1-20000 in hundreds of percents
  SetGroupCallParticipantVolumeLevel copyWith({
    int? groupCallId,
    MessageSender? participantId,
    int? volumeLevel,
  }) =>
      SetGroupCallParticipantVolumeLevel(
        groupCallId: groupCallId ?? this.groupCallId,
        participantId: participantId ?? this.participantId,
        volumeLevel: volumeLevel ?? this.volumeLevel,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setGroupCallParticipantVolumeLevel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
