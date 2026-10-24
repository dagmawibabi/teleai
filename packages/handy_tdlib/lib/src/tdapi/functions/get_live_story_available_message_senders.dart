part of '../tdapi.dart';

/// **GetLiveStoryAvailableMessageSenders** *(getLiveStoryAvailableMessageSenders)* - TDLib function
///
/// Returns the list of message sender identifiers, on whose behalf messages can be sent to a live story.
///
/// * [groupCallId]: Group call identifier.
///
/// [ChatMessageSenders] is returned on completion.
final class GetLiveStoryAvailableMessageSenders extends TdFunction {
  /// **GetLiveStoryAvailableMessageSenders** *(getLiveStoryAvailableMessageSenders)* - TDLib function
  ///
  /// Returns the list of message sender identifiers, on whose behalf messages can be sent to a live story.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [ChatMessageSenders] is returned on completion.
  const GetLiveStoryAvailableMessageSenders({
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
  GetLiveStoryAvailableMessageSenders copyWith({
    int? groupCallId,
  }) =>
      GetLiveStoryAvailableMessageSenders(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLiveStoryAvailableMessageSenders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
