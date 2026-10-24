part of '../tdapi.dart';

/// **ReactionNotificationSource** *(reactionNotificationSource)* - parent
///
/// Describes sources of reactions for which notifications will be shown.
sealed class ReactionNotificationSource extends TdObject {
  /// **ReactionNotificationSource** *(reactionNotificationSource)* - parent
  ///
  /// Describes sources of reactions for which notifications will be shown.
  const ReactionNotificationSource();

  /// a ReactionNotificationSource return type can be :
  /// * [ReactionNotificationSourceNone]
  /// * [ReactionNotificationSourceContacts]
  /// * [ReactionNotificationSourceAll]
  factory ReactionNotificationSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ReactionNotificationSourceNone.defaultObjectId:
        return ReactionNotificationSourceNone.fromJson(json);
      case ReactionNotificationSourceContacts.defaultObjectId:
        return ReactionNotificationSourceContacts.fromJson(json);
      case ReactionNotificationSourceAll.defaultObjectId:
        return ReactionNotificationSourceAll.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ReactionNotificationSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ReactionNotificationSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'reactionNotificationSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReactionNotificationSourceNone** *(reactionNotificationSourceNone)* - child of ReactionNotificationSource
///
/// Notifications for reactions are disabled.
final class ReactionNotificationSourceNone extends ReactionNotificationSource {
  /// **ReactionNotificationSourceNone** *(reactionNotificationSourceNone)* - child of ReactionNotificationSource
  ///
  /// Notifications for reactions are disabled.
  const ReactionNotificationSourceNone();

  /// Parse from a json
  factory ReactionNotificationSourceNone.fromJson(Map<String, dynamic> json) =>
      const ReactionNotificationSourceNone();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReactionNotificationSourceNone copyWith() =>
      const ReactionNotificationSourceNone();

  /// TDLib object type
  static const String defaultObjectId = 'reactionNotificationSourceNone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReactionNotificationSourceContacts** *(reactionNotificationSourceContacts)* - child of ReactionNotificationSource
///
/// Notifications for reactions are shown only for reactions from contacts.
final class ReactionNotificationSourceContacts
    extends ReactionNotificationSource {
  /// **ReactionNotificationSourceContacts** *(reactionNotificationSourceContacts)* - child of ReactionNotificationSource
  ///
  /// Notifications for reactions are shown only for reactions from contacts.
  const ReactionNotificationSourceContacts();

  /// Parse from a json
  factory ReactionNotificationSourceContacts.fromJson(
          Map<String, dynamic> json) =>
      const ReactionNotificationSourceContacts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReactionNotificationSourceContacts copyWith() =>
      const ReactionNotificationSourceContacts();

  /// TDLib object type
  static const String defaultObjectId = 'reactionNotificationSourceContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ReactionNotificationSourceAll** *(reactionNotificationSourceAll)* - child of ReactionNotificationSource
///
/// Notifications for reactions are shown for all reactions.
final class ReactionNotificationSourceAll extends ReactionNotificationSource {
  /// **ReactionNotificationSourceAll** *(reactionNotificationSourceAll)* - child of ReactionNotificationSource
  ///
  /// Notifications for reactions are shown for all reactions.
  const ReactionNotificationSourceAll();

  /// Parse from a json
  factory ReactionNotificationSourceAll.fromJson(Map<String, dynamic> json) =>
      const ReactionNotificationSourceAll();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ReactionNotificationSourceAll copyWith() =>
      const ReactionNotificationSourceAll();

  /// TDLib object type
  static const String defaultObjectId = 'reactionNotificationSourceAll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
