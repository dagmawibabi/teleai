part of '../tdapi.dart';

/// **EndGroupCallScreenSharing** *(endGroupCallScreenSharing)* - TDLib function
///
/// Ends screen sharing in a joined group call; not supported in live stories.
///
/// * [groupCallId]: Group call identifier.
///
/// [Ok] is returned on completion.
final class EndGroupCallScreenSharing extends TdFunction {
  /// **EndGroupCallScreenSharing** *(endGroupCallScreenSharing)* - TDLib function
  ///
  /// Ends screen sharing in a joined group call; not supported in live stories.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [Ok] is returned on completion.
  const EndGroupCallScreenSharing({
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
  EndGroupCallScreenSharing copyWith({
    int? groupCallId,
  }) =>
      EndGroupCallScreenSharing(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'endGroupCallScreenSharing';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
