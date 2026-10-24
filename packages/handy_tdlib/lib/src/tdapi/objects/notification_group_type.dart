part of '../tdapi.dart';

/// **NotificationGroupType** *(notificationGroupType)* - parent
///
/// Describes the type of notifications in a notification group.
sealed class NotificationGroupType extends TdObject {
  /// **NotificationGroupType** *(notificationGroupType)* - parent
  ///
  /// Describes the type of notifications in a notification group.
  const NotificationGroupType();

  /// a NotificationGroupType return type can be :
  /// * [NotificationGroupTypeMessages]
  /// * [NotificationGroupTypeMentions]
  /// * [NotificationGroupTypeSecretChat]
  /// * [NotificationGroupTypeCalls]
  factory NotificationGroupType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case NotificationGroupTypeMessages.defaultObjectId:
        return NotificationGroupTypeMessages.fromJson(json);
      case NotificationGroupTypeMentions.defaultObjectId:
        return NotificationGroupTypeMentions.fromJson(json);
      case NotificationGroupTypeSecretChat.defaultObjectId:
        return NotificationGroupTypeSecretChat.fromJson(json);
      case NotificationGroupTypeCalls.defaultObjectId:
        return NotificationGroupTypeCalls.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of NotificationGroupType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  NotificationGroupType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'notificationGroupType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationGroupTypeMessages** *(notificationGroupTypeMessages)* - child of NotificationGroupType
///
/// A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages.
final class NotificationGroupTypeMessages extends NotificationGroupType {
  /// **NotificationGroupTypeMessages** *(notificationGroupTypeMessages)* - child of NotificationGroupType
  ///
  /// A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with ordinary unread messages.
  const NotificationGroupTypeMessages();

  /// Parse from a json
  factory NotificationGroupTypeMessages.fromJson(Map<String, dynamic> json) =>
      const NotificationGroupTypeMessages();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationGroupTypeMessages copyWith() =>
      const NotificationGroupTypeMessages();

  /// TDLib object type
  static const String defaultObjectId = 'notificationGroupTypeMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationGroupTypeMentions** *(notificationGroupTypeMentions)* - child of NotificationGroupType
///
/// A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message.
final class NotificationGroupTypeMentions extends NotificationGroupType {
  /// **NotificationGroupTypeMentions** *(notificationGroupTypeMentions)* - child of NotificationGroupType
  ///
  /// A group containing notifications of type notificationTypeNewMessage and notificationTypeNewPushMessage with unread mentions of the current user, replies to their messages, or a pinned message.
  const NotificationGroupTypeMentions();

  /// Parse from a json
  factory NotificationGroupTypeMentions.fromJson(Map<String, dynamic> json) =>
      const NotificationGroupTypeMentions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationGroupTypeMentions copyWith() =>
      const NotificationGroupTypeMentions();

  /// TDLib object type
  static const String defaultObjectId = 'notificationGroupTypeMentions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationGroupTypeSecretChat** *(notificationGroupTypeSecretChat)* - child of NotificationGroupType
///
/// A group containing a notification of type notificationTypeNewSecretChat.
final class NotificationGroupTypeSecretChat extends NotificationGroupType {
  /// **NotificationGroupTypeSecretChat** *(notificationGroupTypeSecretChat)* - child of NotificationGroupType
  ///
  /// A group containing a notification of type notificationTypeNewSecretChat.
  const NotificationGroupTypeSecretChat();

  /// Parse from a json
  factory NotificationGroupTypeSecretChat.fromJson(Map<String, dynamic> json) =>
      const NotificationGroupTypeSecretChat();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationGroupTypeSecretChat copyWith() =>
      const NotificationGroupTypeSecretChat();

  /// TDLib object type
  static const String defaultObjectId = 'notificationGroupTypeSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationGroupTypeCalls** *(notificationGroupTypeCalls)* - child of NotificationGroupType
///
/// A group containing notifications of type notificationTypeNewCall.
final class NotificationGroupTypeCalls extends NotificationGroupType {
  /// **NotificationGroupTypeCalls** *(notificationGroupTypeCalls)* - child of NotificationGroupType
  ///
  /// A group containing notifications of type notificationTypeNewCall.
  const NotificationGroupTypeCalls();

  /// Parse from a json
  factory NotificationGroupTypeCalls.fromJson(Map<String, dynamic> json) =>
      const NotificationGroupTypeCalls();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationGroupTypeCalls copyWith() => const NotificationGroupTypeCalls();

  /// TDLib object type
  static const String defaultObjectId = 'notificationGroupTypeCalls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
