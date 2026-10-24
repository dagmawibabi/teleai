part of '../tdapi.dart';

/// **GetGroupCallStreams** *(getGroupCallStreams)* - TDLib function
///
/// Returns information about available streams in a video chat or a live story.
///
/// * [groupCallId]: Group call identifier.
///
/// [GroupCallStreams] is returned on completion.
final class GetGroupCallStreams extends TdFunction {
  /// **GetGroupCallStreams** *(getGroupCallStreams)* - TDLib function
  ///
  /// Returns information about available streams in a video chat or a live story.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [GroupCallStreams] is returned on completion.
  const GetGroupCallStreams({
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
  GetGroupCallStreams copyWith({
    int? groupCallId,
  }) =>
      GetGroupCallStreams(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGroupCallStreams';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
