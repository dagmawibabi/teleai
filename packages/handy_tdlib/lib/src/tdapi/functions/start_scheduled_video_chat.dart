part of '../tdapi.dart';

/// **StartScheduledVideoChat** *(startScheduledVideoChat)* - TDLib function
///
/// Starts a scheduled video chat.
///
/// * [groupCallId]: Group call identifier of the video chat.
///
/// [Ok] is returned on completion.
final class StartScheduledVideoChat extends TdFunction {
  /// **StartScheduledVideoChat** *(startScheduledVideoChat)* - TDLib function
  ///
  /// Starts a scheduled video chat.
  ///
  /// * [groupCallId]: Group call identifier of the video chat.
  ///
  /// [Ok] is returned on completion.
  const StartScheduledVideoChat({
    required this.groupCallId,
  });

  /// Group call identifier of the video chat
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
  /// * [group_call_id]: Group call identifier of the video chat
  StartScheduledVideoChat copyWith({
    int? groupCallId,
  }) =>
      StartScheduledVideoChat(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'startScheduledVideoChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
