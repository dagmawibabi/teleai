part of '../tdapi.dart';

/// **NotificationSettingsScope** *(notificationSettingsScope)* - parent
///
/// Describes the types of chats to which notification settings are relevant.
sealed class NotificationSettingsScope extends TdObject {
  /// **NotificationSettingsScope** *(notificationSettingsScope)* - parent
  ///
  /// Describes the types of chats to which notification settings are relevant.
  const NotificationSettingsScope();

  /// a NotificationSettingsScope return type can be :
  /// * [NotificationSettingsScopePrivateChats]
  /// * [NotificationSettingsScopeGroupChats]
  /// * [NotificationSettingsScopeChannelChats]
  factory NotificationSettingsScope.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case NotificationSettingsScopePrivateChats.defaultObjectId:
        return NotificationSettingsScopePrivateChats.fromJson(json);
      case NotificationSettingsScopeGroupChats.defaultObjectId:
        return NotificationSettingsScopeGroupChats.fromJson(json);
      case NotificationSettingsScopeChannelChats.defaultObjectId:
        return NotificationSettingsScopeChannelChats.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of NotificationSettingsScope)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  NotificationSettingsScope copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'notificationSettingsScope';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationSettingsScopePrivateChats** *(notificationSettingsScopePrivateChats)* - child of NotificationSettingsScope
///
/// Notification settings applied to all private and secret chats when the corresponding chat setting has a default value.
final class NotificationSettingsScopePrivateChats
    extends NotificationSettingsScope {
  /// **NotificationSettingsScopePrivateChats** *(notificationSettingsScopePrivateChats)* - child of NotificationSettingsScope
  ///
  /// Notification settings applied to all private and secret chats when the corresponding chat setting has a default value.
  const NotificationSettingsScopePrivateChats();

  /// Parse from a json
  factory NotificationSettingsScopePrivateChats.fromJson(
          Map<String, dynamic> json) =>
      const NotificationSettingsScopePrivateChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationSettingsScopePrivateChats copyWith() =>
      const NotificationSettingsScopePrivateChats();

  /// TDLib object type
  static const String defaultObjectId = 'notificationSettingsScopePrivateChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationSettingsScopeGroupChats** *(notificationSettingsScopeGroupChats)* - child of NotificationSettingsScope
///
/// Notification settings applied to all basic group and supergroup chats when the corresponding chat setting has a default value.
final class NotificationSettingsScopeGroupChats
    extends NotificationSettingsScope {
  /// **NotificationSettingsScopeGroupChats** *(notificationSettingsScopeGroupChats)* - child of NotificationSettingsScope
  ///
  /// Notification settings applied to all basic group and supergroup chats when the corresponding chat setting has a default value.
  const NotificationSettingsScopeGroupChats();

  /// Parse from a json
  factory NotificationSettingsScopeGroupChats.fromJson(
          Map<String, dynamic> json) =>
      const NotificationSettingsScopeGroupChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationSettingsScopeGroupChats copyWith() =>
      const NotificationSettingsScopeGroupChats();

  /// TDLib object type
  static const String defaultObjectId = 'notificationSettingsScopeGroupChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationSettingsScopeChannelChats** *(notificationSettingsScopeChannelChats)* - child of NotificationSettingsScope
///
/// Notification settings applied to all channel chats when the corresponding chat setting has a default value.
final class NotificationSettingsScopeChannelChats
    extends NotificationSettingsScope {
  /// **NotificationSettingsScopeChannelChats** *(notificationSettingsScopeChannelChats)* - child of NotificationSettingsScope
  ///
  /// Notification settings applied to all channel chats when the corresponding chat setting has a default value.
  const NotificationSettingsScopeChannelChats();

  /// Parse from a json
  factory NotificationSettingsScopeChannelChats.fromJson(
          Map<String, dynamic> json) =>
      const NotificationSettingsScopeChannelChats();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationSettingsScopeChannelChats copyWith() =>
      const NotificationSettingsScopeChannelChats();

  /// TDLib object type
  static const String defaultObjectId = 'notificationSettingsScopeChannelChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
