part of '../tdapi.dart';

/// **SetLiveStoryMessageSender** *(setLiveStoryMessageSender)* - TDLib function
///
/// Selects a message sender to send messages in a live story call.
///
/// * [groupCallId]: Group call identifier.
/// * [messageSenderId]: New message sender for the group call.
///
/// [Ok] is returned on completion.
final class SetLiveStoryMessageSender extends TdFunction {
  /// **SetLiveStoryMessageSender** *(setLiveStoryMessageSender)* - TDLib function
  ///
  /// Selects a message sender to send messages in a live story call.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [messageSenderId]: New message sender for the group call.
  ///
  /// [Ok] is returned on completion.
  const SetLiveStoryMessageSender({
    required this.groupCallId,
    required this.messageSenderId,
  });

  /// Group call identifier
  final int groupCallId;

  /// New message sender for the group call
  final MessageSender messageSenderId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "message_sender_id": messageSenderId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [message_sender_id]: New message sender for the group call
  SetLiveStoryMessageSender copyWith({
    int? groupCallId,
    MessageSender? messageSenderId,
  }) =>
      SetLiveStoryMessageSender(
        groupCallId: groupCallId ?? this.groupCallId,
        messageSenderId: messageSenderId ?? this.messageSenderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setLiveStoryMessageSender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
