part of '../tdapi.dart';

/// **ReadDatePrivacySettings** *(readDatePrivacySettings)* - basic class
///
/// Contains privacy settings for message read date in private chats. Read dates are always shown to the users that can see online status of the current user regardless of this setting.
///
/// * [showReadDate]: True, if message read date is shown to other users in private chats. If false and the current user isn't a Telegram Premium user, then they will not be able to see others' message read date.
final class ReadDatePrivacySettings extends TdObject {
  /// **ReadDatePrivacySettings** *(readDatePrivacySettings)* - basic class
  ///
  /// Contains privacy settings for message read date in private chats. Read dates are always shown to the users that can see online status of the current user regardless of this setting.
  ///
  /// * [showReadDate]: True, if message read date is shown to other users in private chats. If false and the current user isn't a Telegram Premium user, then they will not be able to see others' message read date.
  const ReadDatePrivacySettings({
    required this.showReadDate,
    this.extra,
    this.clientId,
  });

  /// True, if message read date is shown to other users in private chats. If false and the current user isn't a Telegram Premium user, then they will not be able to see others' message read date
  final bool showReadDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ReadDatePrivacySettings.fromJson(Map<String, dynamic> json) =>
      ReadDatePrivacySettings(
        showReadDate: json['show_read_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "show_read_date": showReadDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [show_read_date]: True, if message read date is shown to other users in private chats. If false and the current user isn't a Telegram Premium user, then they will not be able to see others' message read date
  ReadDatePrivacySettings copyWith({
    bool? showReadDate,
    dynamic extra,
    int? clientId,
  }) =>
      ReadDatePrivacySettings(
        showReadDate: showReadDate ?? this.showReadDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readDatePrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
