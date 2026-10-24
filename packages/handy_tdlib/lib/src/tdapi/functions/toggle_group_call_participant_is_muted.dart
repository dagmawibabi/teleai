part of '../tdapi.dart';

/// **ToggleGroupCallParticipantIsMuted** *(toggleGroupCallParticipantIsMuted)* - TDLib function
///
/// Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves; not supported for live stories.
///
/// * [groupCallId]: Group call identifier.
/// * [participantId]: Participant identifier.
/// * [isMuted]: Pass true to mute the user; pass false to unmute them.
///
/// [Ok] is returned on completion.
final class ToggleGroupCallParticipantIsMuted extends TdFunction {
  /// **ToggleGroupCallParticipantIsMuted** *(toggleGroupCallParticipantIsMuted)* - TDLib function
  ///
  /// Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves; not supported for live stories.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [participantId]: Participant identifier.
  /// * [isMuted]: Pass true to mute the user; pass false to unmute them.
  ///
  /// [Ok] is returned on completion.
  const ToggleGroupCallParticipantIsMuted({
    required this.groupCallId,
    required this.participantId,
    required this.isMuted,
  });

  /// Group call identifier
  final int groupCallId;

  /// Participant identifier
  final MessageSender participantId;

  /// Pass true to mute the user; pass false to unmute them
  final bool isMuted;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant_id": participantId.toJson(),
      "is_muted": isMuted,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [participant_id]: Participant identifier
  /// * [is_muted]: Pass true to mute the user; pass false to unmute them
  ToggleGroupCallParticipantIsMuted copyWith({
    int? groupCallId,
    MessageSender? participantId,
    bool? isMuted,
  }) =>
      ToggleGroupCallParticipantIsMuted(
        groupCallId: groupCallId ?? this.groupCallId,
        participantId: participantId ?? this.participantId,
        isMuted: isMuted ?? this.isMuted,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleGroupCallParticipantIsMuted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
