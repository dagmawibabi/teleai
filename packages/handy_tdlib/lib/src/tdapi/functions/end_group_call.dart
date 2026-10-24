part of '../tdapi.dart';

/// **EndGroupCall** *(endGroupCall)* - TDLib function
///
/// Ends a group call. Requires groupCall.can_be_managed right for video chats and live stories or groupCall.is_owned otherwise.
///
/// * [groupCallId]: Group call identifier.
///
/// [Ok] is returned on completion.
final class EndGroupCall extends TdFunction {
  /// **EndGroupCall** *(endGroupCall)* - TDLib function
  ///
  /// Ends a group call. Requires groupCall.can_be_managed right for video chats and live stories or groupCall.is_owned otherwise.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [Ok] is returned on completion.
  const EndGroupCall({
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
  EndGroupCall copyWith({
    int? groupCallId,
  }) =>
      EndGroupCall(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'endGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
