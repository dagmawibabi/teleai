part of '../tdapi.dart';

/// **BusinessGreetingMessageSettings** *(businessGreetingMessageSettings)* - basic class
///
/// Describes settings for greeting messages that are automatically sent by a Telegram Business account as response to incoming messages in an inactive private chat.
///
/// * [shortcutId]: Unique quick reply shortcut identifier for the greeting messages.
/// * [recipients]: Chosen recipients of the greeting messages.
/// * [inactivityDays]: The number of days after which a chat will be considered as inactive; currently, must be one of 7, 14, 21, or 28.
final class BusinessGreetingMessageSettings extends TdObject {
  /// **BusinessGreetingMessageSettings** *(businessGreetingMessageSettings)* - basic class
  ///
  /// Describes settings for greeting messages that are automatically sent by a Telegram Business account as response to incoming messages in an inactive private chat.
  ///
  /// * [shortcutId]: Unique quick reply shortcut identifier for the greeting messages.
  /// * [recipients]: Chosen recipients of the greeting messages.
  /// * [inactivityDays]: The number of days after which a chat will be considered as inactive; currently, must be one of 7, 14, 21, or 28.
  const BusinessGreetingMessageSettings({
    required this.shortcutId,
    required this.recipients,
    required this.inactivityDays,
  });

  /// Unique quick reply shortcut identifier for the greeting messages
  final int shortcutId;

  /// Chosen recipients of the greeting messages
  final BusinessRecipients recipients;

  /// The number of days after which a chat will be considered as inactive; currently, must be one of 7, 14, 21, or 28
  final int inactivityDays;

  /// Parse from a json
  factory BusinessGreetingMessageSettings.fromJson(Map<String, dynamic> json) =>
      BusinessGreetingMessageSettings(
        shortcutId: json['shortcut_id'],
        recipients: BusinessRecipients.fromJson(json['recipients']),
        inactivityDays: json['inactivity_days'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "recipients": recipients.toJson(),
      "inactivity_days": inactivityDays,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: Unique quick reply shortcut identifier for the greeting messages
  /// * [recipients]: Chosen recipients of the greeting messages
  /// * [inactivity_days]: The number of days after which a chat will be considered as inactive; currently, must be one of 7, 14, 21, or 28
  BusinessGreetingMessageSettings copyWith({
    int? shortcutId,
    BusinessRecipients? recipients,
    int? inactivityDays,
  }) =>
      BusinessGreetingMessageSettings(
        shortcutId: shortcutId ?? this.shortcutId,
        recipients: recipients ?? this.recipients,
        inactivityDays: inactivityDays ?? this.inactivityDays,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessGreetingMessageSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
