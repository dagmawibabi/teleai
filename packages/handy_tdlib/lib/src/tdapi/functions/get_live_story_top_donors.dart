part of '../tdapi.dart';

/// **GetLiveStoryTopDonors** *(getLiveStoryTopDonors)* - TDLib function
///
/// Returns the list of top live story donors.
///
/// * [groupCallId]: Group call identifier of the live story.
///
/// [LiveStoryDonors] is returned on completion.
final class GetLiveStoryTopDonors extends TdFunction {
  /// **GetLiveStoryTopDonors** *(getLiveStoryTopDonors)* - TDLib function
  ///
  /// Returns the list of top live story donors.
  ///
  /// * [groupCallId]: Group call identifier of the live story.
  ///
  /// [LiveStoryDonors] is returned on completion.
  const GetLiveStoryTopDonors({
    required this.groupCallId,
  });

  /// Group call identifier of the live story
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
  /// * [group_call_id]: Group call identifier of the live story
  GetLiveStoryTopDonors copyWith({
    int? groupCallId,
  }) =>
      GetLiveStoryTopDonors(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLiveStoryTopDonors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
