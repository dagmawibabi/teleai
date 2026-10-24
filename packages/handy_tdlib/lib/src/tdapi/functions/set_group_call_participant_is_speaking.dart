part of '../tdapi.dart';

/// **SetGroupCallParticipantIsSpeaking** *(setGroupCallParticipantIsSpeaking)* - TDLib function
///
/// Informs TDLib that speaking state of a participant of an active group call has changed. Returns identifier of the participant if it is found.
///
/// * [groupCallId]: Group call identifier.
/// * [audioSource]: Group call participant's synchronization audio source identifier, or 0 for the current user.
/// * [isSpeaking]: Pass true if the user is speaking.
///
/// [MessageSender] is returned on completion.
final class SetGroupCallParticipantIsSpeaking extends TdFunction {
  /// **SetGroupCallParticipantIsSpeaking** *(setGroupCallParticipantIsSpeaking)* - TDLib function
  ///
  /// Informs TDLib that speaking state of a participant of an active group call has changed. Returns identifier of the participant if it is found.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [audioSource]: Group call participant's synchronization audio source identifier, or 0 for the current user.
  /// * [isSpeaking]: Pass true if the user is speaking.
  ///
  /// [MessageSender] is returned on completion.
  const SetGroupCallParticipantIsSpeaking({
    required this.groupCallId,
    required this.audioSource,
    required this.isSpeaking,
  });

  /// Group call identifier
  final int groupCallId;

  /// Group call participant's synchronization audio source identifier, or 0 for the current user
  final int audioSource;

  /// Pass true if the user is speaking
  final bool isSpeaking;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "audio_source": audioSource,
      "is_speaking": isSpeaking,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [audio_source]: Group call participant's synchronization audio source identifier, or 0 for the current user
  /// * [is_speaking]: Pass true if the user is speaking
  SetGroupCallParticipantIsSpeaking copyWith({
    int? groupCallId,
    int? audioSource,
    bool? isSpeaking,
  }) =>
      SetGroupCallParticipantIsSpeaking(
        groupCallId: groupCallId ?? this.groupCallId,
        audioSource: audioSource ?? this.audioSource,
        isSpeaking: isSpeaking ?? this.isSpeaking,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setGroupCallParticipantIsSpeaking';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
