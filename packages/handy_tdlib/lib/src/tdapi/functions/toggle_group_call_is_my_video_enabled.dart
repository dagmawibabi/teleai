part of '../tdapi.dart';

/// **ToggleGroupCallIsMyVideoEnabled** *(toggleGroupCallIsMyVideoEnabled)* - TDLib function
///
/// Toggles whether current user's video is enabled.
///
/// * [groupCallId]: Group call identifier.
/// * [isMyVideoEnabled]: Pass true if the current user's video is enabled.
///
/// [Ok] is returned on completion.
final class ToggleGroupCallIsMyVideoEnabled extends TdFunction {
  /// **ToggleGroupCallIsMyVideoEnabled** *(toggleGroupCallIsMyVideoEnabled)* - TDLib function
  ///
  /// Toggles whether current user's video is enabled.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [isMyVideoEnabled]: Pass true if the current user's video is enabled.
  ///
  /// [Ok] is returned on completion.
  const ToggleGroupCallIsMyVideoEnabled({
    required this.groupCallId,
    required this.isMyVideoEnabled,
  });

  /// Group call identifier
  final int groupCallId;

  /// Pass true if the current user's video is enabled
  final bool isMyVideoEnabled;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "is_my_video_enabled": isMyVideoEnabled,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [is_my_video_enabled]: Pass true if the current user's video is enabled
  ToggleGroupCallIsMyVideoEnabled copyWith({
    int? groupCallId,
    bool? isMyVideoEnabled,
  }) =>
      ToggleGroupCallIsMyVideoEnabled(
        groupCallId: groupCallId ?? this.groupCallId,
        isMyVideoEnabled: isMyVideoEnabled ?? this.isMyVideoEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleGroupCallIsMyVideoEnabled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
