part of '../tdapi.dart';

/// **ToggleVideoChatMuteNewParticipants** *(toggleVideoChatMuteNewParticipants)* - TDLib function
///
/// Toggles whether new participants of a video chat can be unmuted only by administrators of the video chat. Requires groupCall.can_toggle_mute_new_participants right.
///
/// * [groupCallId]: Group call identifier.
/// * [muteNewParticipants]: New value of the mute_new_participants setting.
///
/// [Ok] is returned on completion.
final class ToggleVideoChatMuteNewParticipants extends TdFunction {
  /// **ToggleVideoChatMuteNewParticipants** *(toggleVideoChatMuteNewParticipants)* - TDLib function
  ///
  /// Toggles whether new participants of a video chat can be unmuted only by administrators of the video chat. Requires groupCall.can_toggle_mute_new_participants right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [muteNewParticipants]: New value of the mute_new_participants setting.
  ///
  /// [Ok] is returned on completion.
  const ToggleVideoChatMuteNewParticipants({
    required this.groupCallId,
    required this.muteNewParticipants,
  });

  /// Group call identifier
  final int groupCallId;

  /// New value of the mute_new_participants setting
  final bool muteNewParticipants;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "mute_new_participants": muteNewParticipants,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [mute_new_participants]: New value of the mute_new_participants setting
  ToggleVideoChatMuteNewParticipants copyWith({
    int? groupCallId,
    bool? muteNewParticipants,
  }) =>
      ToggleVideoChatMuteNewParticipants(
        groupCallId: groupCallId ?? this.groupCallId,
        muteNewParticipants: muteNewParticipants ?? this.muteNewParticipants,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleVideoChatMuteNewParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
