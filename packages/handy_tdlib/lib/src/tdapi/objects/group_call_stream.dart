part of '../tdapi.dart';

/// **GroupCallStream** *(groupCallStream)* - basic class
///
/// Describes an available stream in a video chat or a live story.
///
/// * [channelId]: Identifier of an audio/video channel.
/// * [scale]: Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds.
/// * [timeOffset]: Point in time when the stream currently ends; Unix timestamp in milliseconds.
final class GroupCallStream extends TdObject {
  /// **GroupCallStream** *(groupCallStream)* - basic class
  ///
  /// Describes an available stream in a video chat or a live story.
  ///
  /// * [channelId]: Identifier of an audio/video channel.
  /// * [scale]: Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds.
  /// * [timeOffset]: Point in time when the stream currently ends; Unix timestamp in milliseconds.
  const GroupCallStream({
    required this.channelId,
    required this.scale,
    required this.timeOffset,
  });

  /// Identifier of an audio/video channel
  final int channelId;

  /// Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
  final int scale;

  /// Point in time when the stream currently ends; Unix timestamp in milliseconds
  final int timeOffset;

  /// Parse from a json
  factory GroupCallStream.fromJson(Map<String, dynamic> json) =>
      GroupCallStream(
        channelId: json['channel_id'],
        scale: json['scale'],
        timeOffset: json['time_offset'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "channel_id": channelId,
      "scale": scale,
      "time_offset": timeOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [channel_id]: Identifier of an audio/video channel
  /// * [scale]: Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
  /// * [time_offset]: Point in time when the stream currently ends; Unix timestamp in milliseconds
  GroupCallStream copyWith({
    int? channelId,
    int? scale,
    int? timeOffset,
  }) =>
      GroupCallStream(
        channelId: channelId ?? this.channelId,
        scale: scale ?? this.scale,
        timeOffset: timeOffset ?? this.timeOffset,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallStream';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
