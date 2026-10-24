part of '../tdapi.dart';

/// **EndGroupCallRecording** *(endGroupCallRecording)* - TDLib function
///
/// Ends recording of an active group call; for video chats only. Requires groupCall.can_be_managed right.
///
/// * [groupCallId]: Group call identifier.
///
/// [Ok] is returned on completion.
final class EndGroupCallRecording extends TdFunction {
  /// **EndGroupCallRecording** *(endGroupCallRecording)* - TDLib function
  ///
  /// Ends recording of an active group call; for video chats only. Requires groupCall.can_be_managed right.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [Ok] is returned on completion.
  const EndGroupCallRecording({
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
  EndGroupCallRecording copyWith({
    int? groupCallId,
  }) =>
      EndGroupCallRecording(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'endGroupCallRecording';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
