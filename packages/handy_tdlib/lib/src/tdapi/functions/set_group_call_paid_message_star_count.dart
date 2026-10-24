part of '../tdapi.dart';

/// **SetGroupCallPaidMessageStarCount** *(setGroupCallPaidMessageStarCount)* - TDLib function
///
/// Changes the minimum number of Telegram Stars that must be paid by general participant for each sent message to a live story call. Requires groupCall.can_be_managed right.
///
/// * [groupCallId]: Group call identifier; must be an identifier of a live story call.
/// * [paidMessageStarCount]: The new minimum number of Telegram Stars; 0-getOption("paid_group_call_message_star_count_max").
///
/// [Ok] is returned on completion.
final class SetGroupCallPaidMessageStarCount extends TdFunction {
  /// **SetGroupCallPaidMessageStarCount** *(setGroupCallPaidMessageStarCount)* - TDLib function
  ///
  /// Changes the minimum number of Telegram Stars that must be paid by general participant for each sent message to a live story call. Requires groupCall.can_be_managed right.
  ///
  /// * [groupCallId]: Group call identifier; must be an identifier of a live story call.
  /// * [paidMessageStarCount]: The new minimum number of Telegram Stars; 0-getOption("paid_group_call_message_star_count_max").
  ///
  /// [Ok] is returned on completion.
  const SetGroupCallPaidMessageStarCount({
    required this.groupCallId,
    required this.paidMessageStarCount,
  });

  /// Group call identifier; must be an identifier of a live story call
  final int groupCallId;

  /// The new minimum number of Telegram Stars; 0-getOption("paid_group_call_message_star_count_max")
  final int paidMessageStarCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "paid_message_star_count": paidMessageStarCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier; must be an identifier of a live story call
  /// * [paid_message_star_count]: The new minimum number of Telegram Stars; 0-getOption("paid_group_call_message_star_count_max")
  SetGroupCallPaidMessageStarCount copyWith({
    int? groupCallId,
    int? paidMessageStarCount,
  }) =>
      SetGroupCallPaidMessageStarCount(
        groupCallId: groupCallId ?? this.groupCallId,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setGroupCallPaidMessageStarCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
