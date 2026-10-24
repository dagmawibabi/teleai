part of '../tdapi.dart';

/// **CommitPendingLiveStoryReactions** *(commitPendingLiveStoryReactions)* - TDLib function
///
/// Applies all pending paid reactions in a live story group call.
///
/// * [groupCallId]: Group call identifier.
///
/// [Ok] is returned on completion.
final class CommitPendingLiveStoryReactions extends TdFunction {
  /// **CommitPendingLiveStoryReactions** *(commitPendingLiveStoryReactions)* - TDLib function
  ///
  /// Applies all pending paid reactions in a live story group call.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [Ok] is returned on completion.
  const CommitPendingLiveStoryReactions({
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
  CommitPendingLiveStoryReactions copyWith({
    int? groupCallId,
  }) =>
      CommitPendingLiveStoryReactions(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'commitPendingLiveStoryReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
