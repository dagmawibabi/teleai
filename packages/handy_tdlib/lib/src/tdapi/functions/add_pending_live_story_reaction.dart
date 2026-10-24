part of '../tdapi.dart';

/// **AddPendingLiveStoryReaction** *(addPendingLiveStoryReaction)* - TDLib function
///
/// Adds pending paid reaction in a live story group call. Can't be used in live stories posted by the current user.. Call commitPendingLiveStoryReactions or removePendingLiveStoryReactions to actually send all pending reactions when the undo timer is over or abort the sending.
///
/// * [groupCallId]: Group call identifier.
/// * [starCount]: Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_group_call_message_star_count_max").
///
/// [Ok] is returned on completion.
final class AddPendingLiveStoryReaction extends TdFunction {
  /// **AddPendingLiveStoryReaction** *(addPendingLiveStoryReaction)* - TDLib function
  ///
  /// Adds pending paid reaction in a live story group call. Can't be used in live stories posted by the current user.. Call commitPendingLiveStoryReactions or removePendingLiveStoryReactions to actually send all pending reactions when the undo timer is over or abort the sending.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [starCount]: Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_group_call_message_star_count_max").
  ///
  /// [Ok] is returned on completion.
  const AddPendingLiveStoryReaction({
    required this.groupCallId,
    required this.starCount,
  });

  /// Group call identifier
  final int groupCallId;

  /// Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_group_call_message_star_count_max")
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [star_count]: Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_group_call_message_star_count_max")
  AddPendingLiveStoryReaction copyWith({
    int? groupCallId,
    int? starCount,
  }) =>
      AddPendingLiveStoryReaction(
        groupCallId: groupCallId ?? this.groupCallId,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addPendingLiveStoryReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
