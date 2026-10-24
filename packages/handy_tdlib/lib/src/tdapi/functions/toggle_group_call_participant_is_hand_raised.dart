part of '../tdapi.dart';

/// **ToggleGroupCallParticipantIsHandRaised** *(toggleGroupCallParticipantIsHandRaised)* - TDLib function
///
/// Toggles whether a group call participant hand is raised; for video chats only.
///
/// * [groupCallId]: Group call identifier.
/// * [participantId]: Participant identifier.
/// * [isHandRaised]: Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed right to lower other's hand.
///
/// [Ok] is returned on completion.
final class ToggleGroupCallParticipantIsHandRaised extends TdFunction {
  /// **ToggleGroupCallParticipantIsHandRaised** *(toggleGroupCallParticipantIsHandRaised)* - TDLib function
  ///
  /// Toggles whether a group call participant hand is raised; for video chats only.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [participantId]: Participant identifier.
  /// * [isHandRaised]: Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed right to lower other's hand.
  ///
  /// [Ok] is returned on completion.
  const ToggleGroupCallParticipantIsHandRaised({
    required this.groupCallId,
    required this.participantId,
    required this.isHandRaised,
  });

  /// Group call identifier
  final int groupCallId;

  /// Participant identifier
  final MessageSender participantId;

  /// Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed right to lower other's hand
  final bool isHandRaised;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "participant_id": participantId.toJson(),
      "is_hand_raised": isHandRaised,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [participant_id]: Participant identifier
  /// * [is_hand_raised]: Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed right to lower other's hand
  ToggleGroupCallParticipantIsHandRaised copyWith({
    int? groupCallId,
    MessageSender? participantId,
    bool? isHandRaised,
  }) =>
      ToggleGroupCallParticipantIsHandRaised(
        groupCallId: groupCallId ?? this.groupCallId,
        participantId: participantId ?? this.participantId,
        isHandRaised: isHandRaised ?? this.isHandRaised,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'toggleGroupCallParticipantIsHandRaised';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
