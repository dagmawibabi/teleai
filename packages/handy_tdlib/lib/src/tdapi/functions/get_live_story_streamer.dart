part of '../tdapi.dart';

/// **GetLiveStoryStreamer** *(getLiveStoryStreamer)* - TDLib function
///
/// Returns information about the user or the chat that streams to a live story; for live stories that aren't an RTMP stream only.
///
/// * [groupCallId]: Group call identifier.
///
/// [GroupCallParticipant] is returned on completion.
final class GetLiveStoryStreamer extends TdFunction {
  /// **GetLiveStoryStreamer** *(getLiveStoryStreamer)* - TDLib function
  ///
  /// Returns information about the user or the chat that streams to a live story; for live stories that aren't an RTMP stream only.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [GroupCallParticipant] is returned on completion.
  const GetLiveStoryStreamer({
    required this.groupCallId,
  });

  /// Group call identifier
  final int groupCallId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  GetLiveStoryStreamer copyWith({
    int? groupCallId,
  }) =>
      GetLiveStoryStreamer(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLiveStoryStreamer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
