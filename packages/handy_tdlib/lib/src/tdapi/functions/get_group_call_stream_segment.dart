part of '../tdapi.dart';

/// **GetGroupCallStreamSegment** *(getGroupCallStreamSegment)* - TDLib function
///
/// Returns a file with a segment of a video chat or live story in a modified OGG format for audio or MPEG-4 format for video.
///
/// * [groupCallId]: Group call identifier.
/// * [timeOffset]: Point in time when the stream segment begins; Unix timestamp in milliseconds.
/// * [scale]: Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds.
/// * [channelId]: Identifier of an audio/video channel to get as received from tgcalls.
/// * [videoQuality]: Video quality as received from tgcalls; pass null to get the worst available quality *(optional)*.
///
/// [Data] is returned on completion.
final class GetGroupCallStreamSegment extends TdFunction {
  /// **GetGroupCallStreamSegment** *(getGroupCallStreamSegment)* - TDLib function
  ///
  /// Returns a file with a segment of a video chat or live story in a modified OGG format for audio or MPEG-4 format for video.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [timeOffset]: Point in time when the stream segment begins; Unix timestamp in milliseconds.
  /// * [scale]: Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds.
  /// * [channelId]: Identifier of an audio/video channel to get as received from tgcalls.
  /// * [videoQuality]: Video quality as received from tgcalls; pass null to get the worst available quality *(optional)*.
  ///
  /// [Data] is returned on completion.
  const GetGroupCallStreamSegment({
    required this.groupCallId,
    required this.timeOffset,
    required this.scale,
    required this.channelId,
    this.videoQuality,
  });

  /// Group call identifier
  final int groupCallId;

  /// Point in time when the stream segment begins; Unix timestamp in milliseconds
  final int timeOffset;

  /// Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
  final int scale;

  /// Identifier of an audio/video channel to get as received from tgcalls
  final int channelId;

  /// Video quality as received from tgcalls; pass null to get the worst available quality
  final GroupCallVideoQuality? videoQuality;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "time_offset": timeOffset,
      "scale": scale,
      "channel_id": channelId,
      "video_quality": videoQuality?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [time_offset]: Point in time when the stream segment begins; Unix timestamp in milliseconds
  /// * [scale]: Segment duration scale; 0-1. Segment's duration is 1000/(2**scale) milliseconds
  /// * [channel_id]: Identifier of an audio/video channel to get as received from tgcalls
  /// * [video_quality]: Video quality as received from tgcalls; pass null to get the worst available quality
  GetGroupCallStreamSegment copyWith({
    int? groupCallId,
    int? timeOffset,
    int? scale,
    int? channelId,
    GroupCallVideoQuality? videoQuality,
  }) =>
      GetGroupCallStreamSegment(
        groupCallId: groupCallId ?? this.groupCallId,
        timeOffset: timeOffset ?? this.timeOffset,
        scale: scale ?? this.scale,
        channelId: channelId ?? this.channelId,
        videoQuality: videoQuality ?? this.videoQuality,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGroupCallStreamSegment';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
