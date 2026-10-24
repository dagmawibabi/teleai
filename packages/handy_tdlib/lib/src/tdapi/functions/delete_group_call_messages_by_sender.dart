part of '../tdapi.dart';

/// **DeleteGroupCallMessagesBySender** *(deleteGroupCallMessagesBySender)* - TDLib function
///
/// Deletes all messages sent by the specified message sender in a group call; for live story calls only. Requires groupCall.can_delete_messages right.
///
/// * [groupCallId]: Group call identifier.
/// * [senderId]: Identifier of the sender of messages to delete.
/// * [reportSpam]: Pass true to report the messages as spam.
///
/// [Ok] is returned on completion.
final class DeleteGroupCallMessagesBySender extends TdFunction {
  /// **DeleteGroupCallMessagesBySender** *(deleteGroupCallMessagesBySender)* - TDLib function
  ///
  /// Deletes all messages sent by the specified message sender in a group call; for live story calls only. Requires groupCall.can_delete_messages right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [senderId]: Identifier of the sender of messages to delete.
  /// * [reportSpam]: Pass true to report the messages as spam.
  ///
  /// [Ok] is returned on completion.
  const DeleteGroupCallMessagesBySender({
    required this.groupCallId,
    required this.senderId,
    required this.reportSpam,
  });

  /// Group call identifier
  final int groupCallId;

  /// Identifier of the sender of messages to delete
  final MessageSender senderId;

  /// Pass true to report the messages as spam
  final bool reportSpam;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "sender_id": senderId.toJson(),
      "report_spam": reportSpam,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [sender_id]: Identifier of the sender of messages to delete
  /// * [report_spam]: Pass true to report the messages as spam
  DeleteGroupCallMessagesBySender copyWith({
    int? groupCallId,
    MessageSender? senderId,
    bool? reportSpam,
  }) =>
      DeleteGroupCallMessagesBySender(
        groupCallId: groupCallId ?? this.groupCallId,
        senderId: senderId ?? this.senderId,
        reportSpam: reportSpam ?? this.reportSpam,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteGroupCallMessagesBySender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
