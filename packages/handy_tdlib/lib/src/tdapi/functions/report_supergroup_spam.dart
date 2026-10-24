part of '../tdapi.dart';

/// **ReportSupergroupSpam** *(reportSupergroupSpam)* - TDLib function
///
/// Reports messages in a supergroup as spam; requires administrator rights in the supergroup.
///
/// * [supergroupId]: Supergroup identifier.
/// * [messageIds]: Identifiers of messages to report. Use messageProperties.can_report_supergroup_spam to check whether the message can be reported.
///
/// [Ok] is returned on completion.
final class ReportSupergroupSpam extends TdFunction {
  /// **ReportSupergroupSpam** *(reportSupergroupSpam)* - TDLib function
  ///
  /// Reports messages in a supergroup as spam; requires administrator rights in the supergroup.
  ///
  /// * [supergroupId]: Supergroup identifier.
  /// * [messageIds]: Identifiers of messages to report. Use messageProperties.can_report_supergroup_spam to check whether the message can be reported.
  ///
  /// [Ok] is returned on completion.
  const ReportSupergroupSpam({
    required this.supergroupId,
    required this.messageIds,
  });

  /// Supergroup identifier
  final int supergroupId;

  /// Identifiers of messages to report. Use messageProperties.can_report_supergroup_spam to check whether the message can be reported
  final List<int> messageIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "message_ids": messageIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Supergroup identifier
  /// * [message_ids]: Identifiers of messages to report. Use messageProperties.can_report_supergroup_spam to check whether the message can be reported
  ReportSupergroupSpam copyWith({
    int? supergroupId,
    List<int>? messageIds,
  }) =>
      ReportSupergroupSpam(
        supergroupId: supergroupId ?? this.supergroupId,
        messageIds: messageIds ?? this.messageIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportSupergroupSpam';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
