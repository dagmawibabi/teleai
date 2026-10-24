part of '../tdapi.dart';

/// **EditMessageSchedulingState** *(editMessageSchedulingState)* - TDLib function
///
/// Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed.
///
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message. Use messageProperties.can_edit_scheduling_state to check whether the message is suitable.
/// * [schedulingState]: The new message scheduling state; pass null to send the message immediately. Must be null for messages in the state messageSchedulingStateSendWhenVideoProcessed *(optional)*.
///
/// [Ok] is returned on completion.
final class EditMessageSchedulingState extends TdFunction {
  /// **EditMessageSchedulingState** *(editMessageSchedulingState)* - TDLib function
  ///
  /// Edits the time when a scheduled message will be sent. Scheduling state of all messages in the same album or forwarded together with the message will be also changed.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message. Use messageProperties.can_edit_scheduling_state to check whether the message is suitable.
  /// * [schedulingState]: The new message scheduling state; pass null to send the message immediately. Must be null for messages in the state messageSchedulingStateSendWhenVideoProcessed *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const EditMessageSchedulingState({
    required this.chatId,
    required this.messageId,
    this.schedulingState,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message. Use messageProperties.can_edit_scheduling_state to check whether the message is suitable
  final int messageId;

  /// The new message scheduling state; pass null to send the message immediately. Must be null for messages in the state messageSchedulingStateSendWhenVideoProcessed
  final MessageSchedulingState? schedulingState;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "scheduling_state": schedulingState?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message. Use messageProperties.can_edit_scheduling_state to check whether the message is suitable
  /// * [scheduling_state]: The new message scheduling state; pass null to send the message immediately. Must be null for messages in the state messageSchedulingStateSendWhenVideoProcessed
  EditMessageSchedulingState copyWith({
    int? chatId,
    int? messageId,
    MessageSchedulingState? schedulingState,
  }) =>
      EditMessageSchedulingState(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        schedulingState: schedulingState ?? this.schedulingState,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editMessageSchedulingState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
