part of '../tdapi.dart';

/// **ToggleGroupCallScreenSharingIsPaused** *(toggleGroupCallScreenSharingIsPaused)* - TDLib function
///
/// Pauses or unpauses screen sharing in a joined group call; not supported in live stories.
///
/// * [groupCallId]: Group call identifier.
/// * [isPaused]: Pass true to pause screen sharing; pass false to unpause it.
///
/// [Ok] is returned on completion.
final class ToggleGroupCallScreenSharingIsPaused extends TdFunction {
  /// **ToggleGroupCallScreenSharingIsPaused** *(toggleGroupCallScreenSharingIsPaused)* - TDLib function
  ///
  /// Pauses or unpauses screen sharing in a joined group call; not supported in live stories.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [isPaused]: Pass true to pause screen sharing; pass false to unpause it.
  ///
  /// [Ok] is returned on completion.
  const ToggleGroupCallScreenSharingIsPaused({
    required this.groupCallId,
    required this.isPaused,
  });

  /// Group call identifier
  final int groupCallId;

  /// Pass true to pause screen sharing; pass false to unpause it
  final bool isPaused;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "is_paused": isPaused,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [is_paused]: Pass true to pause screen sharing; pass false to unpause it
  ToggleGroupCallScreenSharingIsPaused copyWith({
    int? groupCallId,
    bool? isPaused,
  }) =>
      ToggleGroupCallScreenSharingIsPaused(
        groupCallId: groupCallId ?? this.groupCallId,
        isPaused: isPaused ?? this.isPaused,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleGroupCallScreenSharingIsPaused';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
