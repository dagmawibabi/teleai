part of '../tdapi.dart';

/// **LoadGroupCallParticipants** *(loadGroupCallParticipants)* - TDLib function
///
/// Loads more participants of a group call; not supported in live stories. The loaded participants will be received through updates.. Use the field groupCall.loaded_all_participants to check whether all participants have already been loaded.
///
/// * [groupCallId]: Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined.
/// * [limit]: The maximum number of participants to load; up to 100.
///
/// [Ok] is returned on completion.
final class LoadGroupCallParticipants extends TdFunction {
  /// **LoadGroupCallParticipants** *(loadGroupCallParticipants)* - TDLib function
  ///
  /// Loads more participants of a group call; not supported in live stories. The loaded participants will be received through updates.. Use the field groupCall.loaded_all_participants to check whether all participants have already been loaded.
  ///
  /// * [groupCallId]: Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined.
  /// * [limit]: The maximum number of participants to load; up to 100.
  ///
  /// [Ok] is returned on completion.
  const LoadGroupCallParticipants({
    required this.groupCallId,
    required this.limit,
  });

  /// Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
  final int groupCallId;

  /// The maximum number of participants to load; up to 100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier. The group call must be previously received through getGroupCall and must be joined or being joined
  /// * [limit]: The maximum number of participants to load; up to 100
  LoadGroupCallParticipants copyWith({
    int? groupCallId,
    int? limit,
  }) =>
      LoadGroupCallParticipants(
        groupCallId: groupCallId ?? this.groupCallId,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadGroupCallParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
