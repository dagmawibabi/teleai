part of '../tdapi.dart';

/// **StoryPrivacySettings** *(storyPrivacySettings)* - parent
///
/// Describes privacy settings of a story.
sealed class StoryPrivacySettings extends TdObject {
  /// **StoryPrivacySettings** *(storyPrivacySettings)* - parent
  ///
  /// Describes privacy settings of a story.
  const StoryPrivacySettings();

  /// a StoryPrivacySettings return type can be :
  /// * [StoryPrivacySettingsEveryone]
  /// * [StoryPrivacySettingsContacts]
  /// * [StoryPrivacySettingsCloseFriends]
  /// * [StoryPrivacySettingsSelectedUsers]
  factory StoryPrivacySettings.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryPrivacySettingsEveryone.defaultObjectId:
        return StoryPrivacySettingsEveryone.fromJson(json);
      case StoryPrivacySettingsContacts.defaultObjectId:
        return StoryPrivacySettingsContacts.fromJson(json);
      case StoryPrivacySettingsCloseFriends.defaultObjectId:
        return StoryPrivacySettingsCloseFriends.fromJson(json);
      case StoryPrivacySettingsSelectedUsers.defaultObjectId:
        return StoryPrivacySettingsSelectedUsers.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryPrivacySettings)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryPrivacySettings copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyPrivacySettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryPrivacySettingsEveryone** *(storyPrivacySettingsEveryone)* - child of StoryPrivacySettings
///
/// The story can be viewed by everyone.
///
/// * [exceptUserIds]: Identifiers of the users that can't see the story; always unknown and empty for non-owned stories.
final class StoryPrivacySettingsEveryone extends StoryPrivacySettings {
  /// **StoryPrivacySettingsEveryone** *(storyPrivacySettingsEveryone)* - child of StoryPrivacySettings
  ///
  /// The story can be viewed by everyone.
  ///
  /// * [exceptUserIds]: Identifiers of the users that can't see the story; always unknown and empty for non-owned stories.
  const StoryPrivacySettingsEveryone({
    required this.exceptUserIds,
  });

  /// Identifiers of the users that can't see the story; always unknown and empty for non-owned stories
  final List<int> exceptUserIds;

  /// Parse from a json
  factory StoryPrivacySettingsEveryone.fromJson(Map<String, dynamic> json) =>
      StoryPrivacySettingsEveryone(
        exceptUserIds: List<int>.from(
            (json['except_user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "except_user_ids": exceptUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [except_user_ids]: Identifiers of the users that can't see the story; always unknown and empty for non-owned stories
  @override
  StoryPrivacySettingsEveryone copyWith({
    List<int>? exceptUserIds,
  }) =>
      StoryPrivacySettingsEveryone(
        exceptUserIds: exceptUserIds ?? this.exceptUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyPrivacySettingsEveryone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryPrivacySettingsContacts** *(storyPrivacySettingsContacts)* - child of StoryPrivacySettings
///
/// The story can be viewed by all contacts except chosen users.
///
/// * [exceptUserIds]: User identifiers of the contacts that can't see the story; always unknown and empty for non-owned stories.
final class StoryPrivacySettingsContacts extends StoryPrivacySettings {
  /// **StoryPrivacySettingsContacts** *(storyPrivacySettingsContacts)* - child of StoryPrivacySettings
  ///
  /// The story can be viewed by all contacts except chosen users.
  ///
  /// * [exceptUserIds]: User identifiers of the contacts that can't see the story; always unknown and empty for non-owned stories.
  const StoryPrivacySettingsContacts({
    required this.exceptUserIds,
  });

  /// User identifiers of the contacts that can't see the story; always unknown and empty for non-owned stories
  final List<int> exceptUserIds;

  /// Parse from a json
  factory StoryPrivacySettingsContacts.fromJson(Map<String, dynamic> json) =>
      StoryPrivacySettingsContacts(
        exceptUserIds: List<int>.from(
            (json['except_user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "except_user_ids": exceptUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [except_user_ids]: User identifiers of the contacts that can't see the story; always unknown and empty for non-owned stories
  @override
  StoryPrivacySettingsContacts copyWith({
    List<int>? exceptUserIds,
  }) =>
      StoryPrivacySettingsContacts(
        exceptUserIds: exceptUserIds ?? this.exceptUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyPrivacySettingsContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryPrivacySettingsCloseFriends** *(storyPrivacySettingsCloseFriends)* - child of StoryPrivacySettings
///
/// The story can be viewed by all close friends.
final class StoryPrivacySettingsCloseFriends extends StoryPrivacySettings {
  /// **StoryPrivacySettingsCloseFriends** *(storyPrivacySettingsCloseFriends)* - child of StoryPrivacySettings
  ///
  /// The story can be viewed by all close friends.
  const StoryPrivacySettingsCloseFriends();

  /// Parse from a json
  factory StoryPrivacySettingsCloseFriends.fromJson(
          Map<String, dynamic> json) =>
      const StoryPrivacySettingsCloseFriends();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryPrivacySettingsCloseFriends copyWith() =>
      const StoryPrivacySettingsCloseFriends();

  /// TDLib object type
  static const String defaultObjectId = 'storyPrivacySettingsCloseFriends';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryPrivacySettingsSelectedUsers** *(storyPrivacySettingsSelectedUsers)* - child of StoryPrivacySettings
///
/// The story can be viewed by certain specified users.
///
/// * [userIds]: Identifiers of the users; always unknown and empty for non-owned stories.
final class StoryPrivacySettingsSelectedUsers extends StoryPrivacySettings {
  /// **StoryPrivacySettingsSelectedUsers** *(storyPrivacySettingsSelectedUsers)* - child of StoryPrivacySettings
  ///
  /// The story can be viewed by certain specified users.
  ///
  /// * [userIds]: Identifiers of the users; always unknown and empty for non-owned stories.
  const StoryPrivacySettingsSelectedUsers({
    required this.userIds,
  });

  /// Identifiers of the users; always unknown and empty for non-owned stories
  final List<int> userIds;

  /// Parse from a json
  factory StoryPrivacySettingsSelectedUsers.fromJson(
          Map<String, dynamic> json) =>
      StoryPrivacySettingsSelectedUsers(
        userIds: List<int>.from(
            (json['user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_ids": userIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_ids]: Identifiers of the users; always unknown and empty for non-owned stories
  @override
  StoryPrivacySettingsSelectedUsers copyWith({
    List<int>? userIds,
  }) =>
      StoryPrivacySettingsSelectedUsers(
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyPrivacySettingsSelectedUsers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
