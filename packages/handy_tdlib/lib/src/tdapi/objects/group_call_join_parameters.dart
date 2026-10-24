part of '../tdapi.dart';

/// **GroupCallJoinParameters** *(groupCallJoinParameters)* - basic class
///
/// Describes parameters used to join a group call.
///
/// * [audioSourceId]: Audio channel synchronization source identifier; received from tgcalls.
/// * [payload]: Group call join payload; received from tgcalls.
/// * [isMuted]: Pass true to join the call with muted microphone.
/// * [isMyVideoEnabled]: Pass true if the user's video is enabled.
final class GroupCallJoinParameters extends TdObject {
  /// **GroupCallJoinParameters** *(groupCallJoinParameters)* - basic class
  ///
  /// Describes parameters used to join a group call.
  ///
  /// * [audioSourceId]: Audio channel synchronization source identifier; received from tgcalls.
  /// * [payload]: Group call join payload; received from tgcalls.
  /// * [isMuted]: Pass true to join the call with muted microphone.
  /// * [isMyVideoEnabled]: Pass true if the user's video is enabled.
  const GroupCallJoinParameters({
    required this.audioSourceId,
    required this.payload,
    required this.isMuted,
    required this.isMyVideoEnabled,
  });

  /// Audio channel synchronization source identifier; received from tgcalls
  final int audioSourceId;

  /// Group call join payload; received from tgcalls
  final String payload;

  /// Pass true to join the call with muted microphone
  final bool isMuted;

  /// Pass true if the user's video is enabled
  final bool isMyVideoEnabled;

  /// Parse from a json
  factory GroupCallJoinParameters.fromJson(Map<String, dynamic> json) =>
      GroupCallJoinParameters(
        audioSourceId: json['audio_source_id'],
        payload: json['payload'],
        isMuted: json['is_muted'],
        isMyVideoEnabled: json['is_my_video_enabled'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "audio_source_id": audioSourceId,
      "payload": payload,
      "is_muted": isMuted,
      "is_my_video_enabled": isMyVideoEnabled,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [audio_source_id]: Audio channel synchronization source identifier; received from tgcalls
  /// * [payload]: Group call join payload; received from tgcalls
  /// * [is_muted]: Pass true to join the call with muted microphone
  /// * [is_my_video_enabled]: Pass true if the user's video is enabled
  GroupCallJoinParameters copyWith({
    int? audioSourceId,
    String? payload,
    bool? isMuted,
    bool? isMyVideoEnabled,
  }) =>
      GroupCallJoinParameters(
        audioSourceId: audioSourceId ?? this.audioSourceId,
        payload: payload ?? this.payload,
        isMuted: isMuted ?? this.isMuted,
        isMyVideoEnabled: isMyVideoEnabled ?? this.isMyVideoEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallJoinParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
