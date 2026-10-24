part of '../tdapi.dart';

/// **RemovePendingLiveStoryReactions** *(removePendingLiveStoryReactions)* - TDLib function
///
/// Removes all pending paid reactions in a live story group call.
///
/// * [groupCallId]: Group call identifier.
///
/// [Ok] is returned on completion.
final class RemovePendingLiveStoryReactions extends TdFunction {
  /// **RemovePendingLiveStoryReactions** *(removePendingLiveStoryReactions)* - TDLib function
  ///
  /// Removes all pending paid reactions in a live story group call.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [Ok] is returned on completion.
  const RemovePendingLiveStoryReactions({
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
  RemovePendingLiveStoryReactions copyWith({
    int? groupCallId,
  }) =>
      RemovePendingLiveStoryReactions(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removePendingLiveStoryReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
