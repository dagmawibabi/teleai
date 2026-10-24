part of '../tdapi.dart';

/// **UserPrivacySettingRule** *(userPrivacySettingRule)* - parent
///
/// Represents a single rule for managing user privacy settings.
sealed class UserPrivacySettingRule extends TdObject {
  /// **UserPrivacySettingRule** *(userPrivacySettingRule)* - parent
  ///
  /// Represents a single rule for managing user privacy settings.
  const UserPrivacySettingRule();

  /// a UserPrivacySettingRule return type can be :
  /// * [UserPrivacySettingRuleAllowAll]
  /// * [UserPrivacySettingRuleAllowContacts]
  /// * [UserPrivacySettingRuleAllowBots]
  /// * [UserPrivacySettingRuleAllowPremiumUsers]
  /// * [UserPrivacySettingRuleAllowUsers]
  /// * [UserPrivacySettingRuleAllowChatMembers]
  /// * [UserPrivacySettingRuleRestrictAll]
  /// * [UserPrivacySettingRuleRestrictContacts]
  /// * [UserPrivacySettingRuleRestrictBots]
  /// * [UserPrivacySettingRuleRestrictUsers]
  /// * [UserPrivacySettingRuleRestrictChatMembers]
  factory UserPrivacySettingRule.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UserPrivacySettingRuleAllowAll.defaultObjectId:
        return UserPrivacySettingRuleAllowAll.fromJson(json);
      case UserPrivacySettingRuleAllowContacts.defaultObjectId:
        return UserPrivacySettingRuleAllowContacts.fromJson(json);
      case UserPrivacySettingRuleAllowBots.defaultObjectId:
        return UserPrivacySettingRuleAllowBots.fromJson(json);
      case UserPrivacySettingRuleAllowPremiumUsers.defaultObjectId:
        return UserPrivacySettingRuleAllowPremiumUsers.fromJson(json);
      case UserPrivacySettingRuleAllowUsers.defaultObjectId:
        return UserPrivacySettingRuleAllowUsers.fromJson(json);
      case UserPrivacySettingRuleAllowChatMembers.defaultObjectId:
        return UserPrivacySettingRuleAllowChatMembers.fromJson(json);
      case UserPrivacySettingRuleRestrictAll.defaultObjectId:
        return UserPrivacySettingRuleRestrictAll.fromJson(json);
      case UserPrivacySettingRuleRestrictContacts.defaultObjectId:
        return UserPrivacySettingRuleRestrictContacts.fromJson(json);
      case UserPrivacySettingRuleRestrictBots.defaultObjectId:
        return UserPrivacySettingRuleRestrictBots.fromJson(json);
      case UserPrivacySettingRuleRestrictUsers.defaultObjectId:
        return UserPrivacySettingRuleRestrictUsers.fromJson(json);
      case UserPrivacySettingRuleRestrictChatMembers.defaultObjectId:
        return UserPrivacySettingRuleRestrictChatMembers.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UserPrivacySettingRule)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UserPrivacySettingRule copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRule';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleAllowAll** *(userPrivacySettingRuleAllowAll)* - child of UserPrivacySettingRule
///
/// A rule to allow all users to do something.
final class UserPrivacySettingRuleAllowAll extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleAllowAll** *(userPrivacySettingRuleAllowAll)* - child of UserPrivacySettingRule
  ///
  /// A rule to allow all users to do something.
  const UserPrivacySettingRuleAllowAll();

  /// Parse from a json
  factory UserPrivacySettingRuleAllowAll.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingRuleAllowAll();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleAllowAll copyWith() =>
      const UserPrivacySettingRuleAllowAll();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleAllowAll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleAllowContacts** *(userPrivacySettingRuleAllowContacts)* - child of UserPrivacySettingRule
///
/// A rule to allow all contacts of the user to do something.
final class UserPrivacySettingRuleAllowContacts extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleAllowContacts** *(userPrivacySettingRuleAllowContacts)* - child of UserPrivacySettingRule
  ///
  /// A rule to allow all contacts of the user to do something.
  const UserPrivacySettingRuleAllowContacts();

  /// Parse from a json
  factory UserPrivacySettingRuleAllowContacts.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingRuleAllowContacts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleAllowContacts copyWith() =>
      const UserPrivacySettingRuleAllowContacts();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleAllowContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleAllowBots** *(userPrivacySettingRuleAllowBots)* - child of UserPrivacySettingRule
///
/// A rule to allow all bots to do something.
final class UserPrivacySettingRuleAllowBots extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleAllowBots** *(userPrivacySettingRuleAllowBots)* - child of UserPrivacySettingRule
  ///
  /// A rule to allow all bots to do something.
  const UserPrivacySettingRuleAllowBots();

  /// Parse from a json
  factory UserPrivacySettingRuleAllowBots.fromJson(Map<String, dynamic> json) =>
      const UserPrivacySettingRuleAllowBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleAllowBots copyWith() =>
      const UserPrivacySettingRuleAllowBots();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleAllowBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleAllowPremiumUsers** *(userPrivacySettingRuleAllowPremiumUsers)* - child of UserPrivacySettingRule
///
/// A rule to allow all Premium Users to do something; currently, allowed only for userPrivacySettingAllowChatInvites.
final class UserPrivacySettingRuleAllowPremiumUsers
    extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleAllowPremiumUsers** *(userPrivacySettingRuleAllowPremiumUsers)* - child of UserPrivacySettingRule
  ///
  /// A rule to allow all Premium Users to do something; currently, allowed only for userPrivacySettingAllowChatInvites.
  const UserPrivacySettingRuleAllowPremiumUsers();

  /// Parse from a json
  factory UserPrivacySettingRuleAllowPremiumUsers.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingRuleAllowPremiumUsers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleAllowPremiumUsers copyWith() =>
      const UserPrivacySettingRuleAllowPremiumUsers();

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingRuleAllowPremiumUsers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleAllowUsers** *(userPrivacySettingRuleAllowUsers)* - child of UserPrivacySettingRule
///
/// A rule to allow certain specified users to do something.
///
/// * [userIds]: The user identifiers, total number of users in all rules must not exceed 1000.
final class UserPrivacySettingRuleAllowUsers extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleAllowUsers** *(userPrivacySettingRuleAllowUsers)* - child of UserPrivacySettingRule
  ///
  /// A rule to allow certain specified users to do something.
  ///
  /// * [userIds]: The user identifiers, total number of users in all rules must not exceed 1000.
  const UserPrivacySettingRuleAllowUsers({
    required this.userIds,
  });

  /// The user identifiers, total number of users in all rules must not exceed 1000
  final List<int> userIds;

  /// Parse from a json
  factory UserPrivacySettingRuleAllowUsers.fromJson(
          Map<String, dynamic> json) =>
      UserPrivacySettingRuleAllowUsers(
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
  /// * [user_ids]: The user identifiers, total number of users in all rules must not exceed 1000
  @override
  UserPrivacySettingRuleAllowUsers copyWith({
    List<int>? userIds,
  }) =>
      UserPrivacySettingRuleAllowUsers(
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleAllowUsers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleAllowChatMembers** *(userPrivacySettingRuleAllowChatMembers)* - child of UserPrivacySettingRule
///
/// A rule to allow all members of certain specified basic groups and supergroups to do something.
///
/// * [chatIds]: The chat identifiers, total number of chats in all rules must not exceed 20.
final class UserPrivacySettingRuleAllowChatMembers
    extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleAllowChatMembers** *(userPrivacySettingRuleAllowChatMembers)* - child of UserPrivacySettingRule
  ///
  /// A rule to allow all members of certain specified basic groups and supergroups to do something.
  ///
  /// * [chatIds]: The chat identifiers, total number of chats in all rules must not exceed 20.
  const UserPrivacySettingRuleAllowChatMembers({
    required this.chatIds,
  });

  /// The chat identifiers, total number of chats in all rules must not exceed 20
  final List<int> chatIds;

  /// Parse from a json
  factory UserPrivacySettingRuleAllowChatMembers.fromJson(
          Map<String, dynamic> json) =>
      UserPrivacySettingRuleAllowChatMembers(
        chatIds: List<int>.from(
            (json['chat_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_ids": chatIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_ids]: The chat identifiers, total number of chats in all rules must not exceed 20
  @override
  UserPrivacySettingRuleAllowChatMembers copyWith({
    List<int>? chatIds,
  }) =>
      UserPrivacySettingRuleAllowChatMembers(
        chatIds: chatIds ?? this.chatIds,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingRuleAllowChatMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleRestrictAll** *(userPrivacySettingRuleRestrictAll)* - child of UserPrivacySettingRule
///
/// A rule to restrict all users from doing something.
final class UserPrivacySettingRuleRestrictAll extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleRestrictAll** *(userPrivacySettingRuleRestrictAll)* - child of UserPrivacySettingRule
  ///
  /// A rule to restrict all users from doing something.
  const UserPrivacySettingRuleRestrictAll();

  /// Parse from a json
  factory UserPrivacySettingRuleRestrictAll.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingRuleRestrictAll();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleRestrictAll copyWith() =>
      const UserPrivacySettingRuleRestrictAll();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleRestrictAll';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleRestrictContacts** *(userPrivacySettingRuleRestrictContacts)* - child of UserPrivacySettingRule
///
/// A rule to restrict all contacts of the user from doing something.
final class UserPrivacySettingRuleRestrictContacts
    extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleRestrictContacts** *(userPrivacySettingRuleRestrictContacts)* - child of UserPrivacySettingRule
  ///
  /// A rule to restrict all contacts of the user from doing something.
  const UserPrivacySettingRuleRestrictContacts();

  /// Parse from a json
  factory UserPrivacySettingRuleRestrictContacts.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingRuleRestrictContacts();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleRestrictContacts copyWith() =>
      const UserPrivacySettingRuleRestrictContacts();

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingRuleRestrictContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleRestrictBots** *(userPrivacySettingRuleRestrictBots)* - child of UserPrivacySettingRule
///
/// A rule to restrict all bots from doing something.
final class UserPrivacySettingRuleRestrictBots extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleRestrictBots** *(userPrivacySettingRuleRestrictBots)* - child of UserPrivacySettingRule
  ///
  /// A rule to restrict all bots from doing something.
  const UserPrivacySettingRuleRestrictBots();

  /// Parse from a json
  factory UserPrivacySettingRuleRestrictBots.fromJson(
          Map<String, dynamic> json) =>
      const UserPrivacySettingRuleRestrictBots();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserPrivacySettingRuleRestrictBots copyWith() =>
      const UserPrivacySettingRuleRestrictBots();

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleRestrictBots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleRestrictUsers** *(userPrivacySettingRuleRestrictUsers)* - child of UserPrivacySettingRule
///
/// A rule to restrict all specified users from doing something.
///
/// * [userIds]: The user identifiers, total number of users in all rules must not exceed 1000.
final class UserPrivacySettingRuleRestrictUsers extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleRestrictUsers** *(userPrivacySettingRuleRestrictUsers)* - child of UserPrivacySettingRule
  ///
  /// A rule to restrict all specified users from doing something.
  ///
  /// * [userIds]: The user identifiers, total number of users in all rules must not exceed 1000.
  const UserPrivacySettingRuleRestrictUsers({
    required this.userIds,
  });

  /// The user identifiers, total number of users in all rules must not exceed 1000
  final List<int> userIds;

  /// Parse from a json
  factory UserPrivacySettingRuleRestrictUsers.fromJson(
          Map<String, dynamic> json) =>
      UserPrivacySettingRuleRestrictUsers(
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
  /// * [user_ids]: The user identifiers, total number of users in all rules must not exceed 1000
  @override
  UserPrivacySettingRuleRestrictUsers copyWith({
    List<int>? userIds,
  }) =>
      UserPrivacySettingRuleRestrictUsers(
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userPrivacySettingRuleRestrictUsers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserPrivacySettingRuleRestrictChatMembers** *(userPrivacySettingRuleRestrictChatMembers)* - child of UserPrivacySettingRule
///
/// A rule to restrict all members of specified basic groups and supergroups from doing something.
///
/// * [chatIds]: The chat identifiers, total number of chats in all rules must not exceed 20.
final class UserPrivacySettingRuleRestrictChatMembers
    extends UserPrivacySettingRule {
  /// **UserPrivacySettingRuleRestrictChatMembers** *(userPrivacySettingRuleRestrictChatMembers)* - child of UserPrivacySettingRule
  ///
  /// A rule to restrict all members of specified basic groups and supergroups from doing something.
  ///
  /// * [chatIds]: The chat identifiers, total number of chats in all rules must not exceed 20.
  const UserPrivacySettingRuleRestrictChatMembers({
    required this.chatIds,
  });

  /// The chat identifiers, total number of chats in all rules must not exceed 20
  final List<int> chatIds;

  /// Parse from a json
  factory UserPrivacySettingRuleRestrictChatMembers.fromJson(
          Map<String, dynamic> json) =>
      UserPrivacySettingRuleRestrictChatMembers(
        chatIds: List<int>.from(
            (json['chat_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_ids": chatIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_ids]: The chat identifiers, total number of chats in all rules must not exceed 20
  @override
  UserPrivacySettingRuleRestrictChatMembers copyWith({
    List<int>? chatIds,
  }) =>
      UserPrivacySettingRuleRestrictChatMembers(
        chatIds: chatIds ?? this.chatIds,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'userPrivacySettingRuleRestrictChatMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
