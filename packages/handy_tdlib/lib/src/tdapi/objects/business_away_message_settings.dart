part of '../tdapi.dart';

/// **BusinessAwayMessageSettings** *(businessAwayMessageSettings)* - basic class
///
/// Describes settings for messages that are automatically sent by a Telegram Business account when it is away.
///
/// * [shortcutId]: Unique quick reply shortcut identifier for the away messages.
/// * [recipients]: Chosen recipients of the away messages.
/// * [schedule]: Settings used to check whether the current user is away.
/// * [offlineOnly]: True, if the messages must not be sent if the account was online in the last 10 minutes.
final class BusinessAwayMessageSettings extends TdObject {
  /// **BusinessAwayMessageSettings** *(businessAwayMessageSettings)* - basic class
  ///
  /// Describes settings for messages that are automatically sent by a Telegram Business account when it is away.
  ///
  /// * [shortcutId]: Unique quick reply shortcut identifier for the away messages.
  /// * [recipients]: Chosen recipients of the away messages.
  /// * [schedule]: Settings used to check whether the current user is away.
  /// * [offlineOnly]: True, if the messages must not be sent if the account was online in the last 10 minutes.
  const BusinessAwayMessageSettings({
    required this.shortcutId,
    required this.recipients,
    required this.schedule,
    required this.offlineOnly,
  });

  /// Unique quick reply shortcut identifier for the away messages
  final int shortcutId;

  /// Chosen recipients of the away messages
  final BusinessRecipients recipients;

  /// Settings used to check whether the current user is away
  final BusinessAwayMessageSchedule schedule;

  /// True, if the messages must not be sent if the account was online in the last 10 minutes
  final bool offlineOnly;

  /// Parse from a json
  factory BusinessAwayMessageSettings.fromJson(Map<String, dynamic> json) =>
      BusinessAwayMessageSettings(
        shortcutId: json['shortcut_id'],
        recipients: BusinessRecipients.fromJson(json['recipients']),
        schedule: BusinessAwayMessageSchedule.fromJson(json['schedule']),
        offlineOnly: json['offline_only'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "recipients": recipients.toJson(),
      "schedule": schedule.toJson(),
      "offline_only": offlineOnly,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: Unique quick reply shortcut identifier for the away messages
  /// * [recipients]: Chosen recipients of the away messages
  /// * [schedule]: Settings used to check whether the current user is away
  /// * [offline_only]: True, if the messages must not be sent if the account was online in the last 10 minutes
  BusinessAwayMessageSettings copyWith({
    int? shortcutId,
    BusinessRecipients? recipients,
    BusinessAwayMessageSchedule? schedule,
    bool? offlineOnly,
  }) =>
      BusinessAwayMessageSettings(
        shortcutId: shortcutId ?? this.shortcutId,
        recipients: recipients ?? this.recipients,
        schedule: schedule ?? this.schedule,
        offlineOnly: offlineOnly ?? this.offlineOnly,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessAwayMessageSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
