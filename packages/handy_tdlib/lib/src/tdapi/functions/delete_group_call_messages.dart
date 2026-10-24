part of '../tdapi.dart';

/// **DeleteGroupCallMessages** *(deleteGroupCallMessages)* - TDLib function
///
/// Deletes messages in a group call; for live story calls only. Requires groupCallMessage.can_be_deleted right.
///
/// * [groupCallId]: Group call identifier.
/// * [messageIds]: Identifiers of the messages to be deleted.
/// * [reportSpam]: Pass true to report the messages as spam.
///
/// [Ok] is returned on completion.
final class DeleteGroupCallMessages extends TdFunction {
  /// **DeleteGroupCallMessages** *(deleteGroupCallMessages)* - TDLib function
  ///
  /// Deletes messages in a group call; for live story calls only. Requires groupCallMessage.can_be_deleted right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [messageIds]: Identifiers of the messages to be deleted.
  /// * [reportSpam]: Pass true to report the messages as spam.
  ///
  /// [Ok] is returned on completion.
  const DeleteGroupCallMessages({
    required this.groupCallId,
    required this.messageIds,
    required this.reportSpam,
  });

  /// Group call identifier
  final int groupCallId;

  /// Identifiers of the messages to be deleted
  final List<int> messageIds;

  /// Pass true to report the messages as spam
  final bool reportSpam;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "message_ids": messageIds.map((i) => i).toList(),
      "report_spam": reportSpam,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [message_ids]: Identifiers of the messages to be deleted
  /// * [report_spam]: Pass true to report the messages as spam
  DeleteGroupCallMessages copyWith({
    int? groupCallId,
    List<int>? messageIds,
    bool? reportSpam,
  }) =>
      DeleteGroupCallMessages(
        groupCallId: groupCallId ?? this.groupCallId,
        messageIds: messageIds ?? this.messageIds,
        reportSpam: reportSpam ?? this.reportSpam,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteGroupCallMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
