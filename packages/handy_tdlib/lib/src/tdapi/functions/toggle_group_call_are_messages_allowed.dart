part of '../tdapi.dart';

/// **ToggleGroupCallAreMessagesAllowed** *(toggleGroupCallAreMessagesAllowed)* - TDLib function
///
/// Toggles whether participants of a group call can send messages there. Requires groupCall.can_toggle_are_messages_allowed right.
///
/// * [groupCallId]: Group call identifier.
/// * [areMessagesAllowed]: New value of the are_messages_allowed setting.
///
/// [Ok] is returned on completion.
final class ToggleGroupCallAreMessagesAllowed extends TdFunction {
  /// **ToggleGroupCallAreMessagesAllowed** *(toggleGroupCallAreMessagesAllowed)* - TDLib function
  ///
  /// Toggles whether participants of a group call can send messages there. Requires groupCall.can_toggle_are_messages_allowed right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [areMessagesAllowed]: New value of the are_messages_allowed setting.
  ///
  /// [Ok] is returned on completion.
  const ToggleGroupCallAreMessagesAllowed({
    required this.groupCallId,
    required this.areMessagesAllowed,
  });

  /// Group call identifier
  final int groupCallId;

  /// New value of the are_messages_allowed setting
  final bool areMessagesAllowed;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "are_messages_allowed": areMessagesAllowed,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [are_messages_allowed]: New value of the are_messages_allowed setting
  ToggleGroupCallAreMessagesAllowed copyWith({
    int? groupCallId,
    bool? areMessagesAllowed,
  }) =>
      ToggleGroupCallAreMessagesAllowed(
        groupCallId: groupCallId ?? this.groupCallId,
        areMessagesAllowed: areMessagesAllowed ?? this.areMessagesAllowed,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleGroupCallAreMessagesAllowed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
