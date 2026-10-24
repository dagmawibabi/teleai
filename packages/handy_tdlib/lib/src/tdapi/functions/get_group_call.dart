part of '../tdapi.dart';

/// **GetGroupCall** *(getGroupCall)* - TDLib function
///
/// Returns information about a group call.
///
/// * [groupCallId]: Group call identifier.
///
/// [GroupCall] is returned on completion.
final class GetGroupCall extends TdFunction {
  /// **GetGroupCall** *(getGroupCall)* - TDLib function
  ///
  /// Returns information about a group call.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [GroupCall] is returned on completion.
  const GetGroupCall({
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
  GetGroupCall copyWith({
    int? groupCallId,
  }) =>
      GetGroupCall(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
