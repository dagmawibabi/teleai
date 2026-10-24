part of '../tdapi.dart';

/// **ReportSupergroupAntiSpamFalsePositive** *(reportSupergroupAntiSpamFalsePositive)* - TDLib function
///
/// Reports a false deletion of a message by aggressive anti-spam checks; requires administrator rights in the supergroup. Can be called only for messages from chatEventMessageDeleted with can_report_anti_spam_false_positive == true.
///
/// * [supergroupId]: Supergroup identifier.
/// * [messageId]: Identifier of the erroneously deleted message from chatEventMessageDeleted.
///
/// [Ok] is returned on completion.
final class ReportSupergroupAntiSpamFalsePositive extends TdFunction {
  /// **ReportSupergroupAntiSpamFalsePositive** *(reportSupergroupAntiSpamFalsePositive)* - TDLib function
  ///
  /// Reports a false deletion of a message by aggressive anti-spam checks; requires administrator rights in the supergroup. Can be called only for messages from chatEventMessageDeleted with can_report_anti_spam_false_positive == true.
  ///
  /// * [supergroupId]: Supergroup identifier.
  /// * [messageId]: Identifier of the erroneously deleted message from chatEventMessageDeleted.
  ///
  /// [Ok] is returned on completion.
  const ReportSupergroupAntiSpamFalsePositive({
    required this.supergroupId,
    required this.messageId,
  });

  /// Supergroup identifier
  final int supergroupId;

  /// Identifier of the erroneously deleted message from chatEventMessageDeleted
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Supergroup identifier
  /// * [message_id]: Identifier of the erroneously deleted message from chatEventMessageDeleted
  ReportSupergroupAntiSpamFalsePositive copyWith({
    int? supergroupId,
    int? messageId,
  }) =>
      ReportSupergroupAntiSpamFalsePositive(
        supergroupId: supergroupId ?? this.supergroupId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSupergroupAntiSpamFalsePositive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
