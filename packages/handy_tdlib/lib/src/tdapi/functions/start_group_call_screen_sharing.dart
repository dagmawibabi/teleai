part of '../tdapi.dart';

/// **StartGroupCallScreenSharing** *(startGroupCallScreenSharing)* - TDLib function
///
/// Starts screen sharing in a joined group call; not supported in live stories. Returns join response payload for tgcalls.
///
/// * [groupCallId]: Group call identifier.
/// * [audioSourceId]: Screen sharing audio channel synchronization source identifier; received from tgcalls.
/// * [payload]: Group call join payload; received from tgcalls.
///
/// [Text] is returned on completion.
final class StartGroupCallScreenSharing extends TdFunction {
  /// **StartGroupCallScreenSharing** *(startGroupCallScreenSharing)* - TDLib function
  ///
  /// Starts screen sharing in a joined group call; not supported in live stories. Returns join response payload for tgcalls.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [audioSourceId]: Screen sharing audio channel synchronization source identifier; received from tgcalls.
  /// * [payload]: Group call join payload; received from tgcalls.
  ///
  /// [Text] is returned on completion.
  const StartGroupCallScreenSharing({
    required this.groupCallId,
    required this.audioSourceId,
    required this.payload,
  });

  /// Group call identifier
  final int groupCallId;

  /// Screen sharing audio channel synchronization source identifier; received from tgcalls
  final int audioSourceId;

  /// Group call join payload; received from tgcalls
  final String payload;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "audio_source_id": audioSourceId,
      "payload": payload,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [audio_source_id]: Screen sharing audio channel synchronization source identifier; received from tgcalls
  /// * [payload]: Group call join payload; received from tgcalls
  StartGroupCallScreenSharing copyWith({
    int? groupCallId,
    int? audioSourceId,
    String? payload,
  }) =>
      StartGroupCallScreenSharing(
        groupCallId: groupCallId ?? this.groupCallId,
        audioSourceId: audioSourceId ?? this.audioSourceId,
        payload: payload ?? this.payload,
      );

  /// TDLib object type
  static const String defaultObjectId = 'startGroupCallScreenSharing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
