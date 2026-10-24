part of '../tdapi.dart';

/// **UserType** *(userType)* - parent
///
/// Represents the type of user. The following types are possible: regular users, deleted users and bots.
sealed class UserType extends TdObject {
  /// **UserType** *(userType)* - parent
  ///
  /// Represents the type of user. The following types are possible: regular users, deleted users and bots.
  const UserType();

  /// a UserType return type can be :
  /// * [UserTypeRegular]
  /// * [UserTypeDeleted]
  /// * [UserTypeBot]
  /// * [UserTypeUnknown]
  factory UserType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case UserTypeRegular.defaultObjectId:
        return UserTypeRegular.fromJson(json);
      case UserTypeDeleted.defaultObjectId:
        return UserTypeDeleted.fromJson(json);
      case UserTypeBot.defaultObjectId:
        return UserTypeBot.fromJson(json);
      case UserTypeUnknown.defaultObjectId:
        return UserTypeUnknown.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of UserType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  UserType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'userType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserTypeRegular** *(userTypeRegular)* - child of UserType
///
/// A regular user.
final class UserTypeRegular extends UserType {
  /// **UserTypeRegular** *(userTypeRegular)* - child of UserType
  ///
  /// A regular user.
  const UserTypeRegular();

  /// Parse from a json
  factory UserTypeRegular.fromJson(Map<String, dynamic> json) =>
      const UserTypeRegular();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserTypeRegular copyWith() => const UserTypeRegular();

  /// TDLib object type
  static const String defaultObjectId = 'userTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserTypeDeleted** *(userTypeDeleted)* - child of UserType
///
/// A deleted user or deleted bot. No information on the user besides the user identifier is available. It is not possible to perform any active actions on this type of user.
final class UserTypeDeleted extends UserType {
  /// **UserTypeDeleted** *(userTypeDeleted)* - child of UserType
  ///
  /// A deleted user or deleted bot. No information on the user besides the user identifier is available. It is not possible to perform any active actions on this type of user.
  const UserTypeDeleted();

  /// Parse from a json
  factory UserTypeDeleted.fromJson(Map<String, dynamic> json) =>
      const UserTypeDeleted();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserTypeDeleted copyWith() => const UserTypeDeleted();

  /// TDLib object type
  static const String defaultObjectId = 'userTypeDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserTypeBot** *(userTypeBot)* - child of UserType
///
/// A bot (see https://core.telegram.org/bots).
///
/// * [canBeEdited]: True, if the bot is owned by the current user and can be edited using the methods toggleBotUsernameIsActive, reorderBotActiveUsernames, setBotProfilePhoto, setBotName, setBotInfoDescription, and setBotInfoShortDescription.
/// * [canJoinGroups]: True, if the bot can be invited to basic group and supergroup chats.
/// * [canReadAllGroupMessages]: True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages.
/// * [hasMainWebApp]: True, if the bot has the main Web App.
/// * [hasTopics]: True, if the bot has topics.
/// * [allowsUsersToCreateTopics]: True, if users can create and delete topics in the chat with the bot.
/// * [canManageBots]: True, if the bot can manage other bots.
/// * [isInline]: True, if the bot supports inline queries.
/// * [inlineQueryPlaceholder]: Placeholder for inline queries (displayed on the application input field).
/// * [supportsGuestQueries]: True, if the bot can be queried by username from any non-secret chat.
/// * [isGuard]: True, if the bot can be set as a guard bot in supergroup chats.
/// * [needLocation]: True, if the location of the user is expected to be sent with every inline query to this bot.
/// * [canConnectToBusiness]: True, if the bot supports connection to user accounts for chat automation.
/// * [canBeAddedToAttachmentMenu]: True, if the bot can be added to attachment or side menu.
/// * [activeUserCount]: The number of recently active users of the bot.
final class UserTypeBot extends UserType {
  /// **UserTypeBot** *(userTypeBot)* - child of UserType
  ///
  /// A bot (see https://core.telegram.org/bots).
  ///
  /// * [canBeEdited]: True, if the bot is owned by the current user and can be edited using the methods toggleBotUsernameIsActive, reorderBotActiveUsernames, setBotProfilePhoto, setBotName, setBotInfoDescription, and setBotInfoShortDescription.
  /// * [canJoinGroups]: True, if the bot can be invited to basic group and supergroup chats.
  /// * [canReadAllGroupMessages]: True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages.
  /// * [hasMainWebApp]: True, if the bot has the main Web App.
  /// * [hasTopics]: True, if the bot has topics.
  /// * [allowsUsersToCreateTopics]: True, if users can create and delete topics in the chat with the bot.
  /// * [canManageBots]: True, if the bot can manage other bots.
  /// * [isInline]: True, if the bot supports inline queries.
  /// * [inlineQueryPlaceholder]: Placeholder for inline queries (displayed on the application input field).
  /// * [supportsGuestQueries]: True, if the bot can be queried by username from any non-secret chat.
  /// * [isGuard]: True, if the bot can be set as a guard bot in supergroup chats.
  /// * [needLocation]: True, if the location of the user is expected to be sent with every inline query to this bot.
  /// * [canConnectToBusiness]: True, if the bot supports connection to user accounts for chat automation.
  /// * [canBeAddedToAttachmentMenu]: True, if the bot can be added to attachment or side menu.
  /// * [activeUserCount]: The number of recently active users of the bot.
  const UserTypeBot({
    required this.canBeEdited,
    required this.canJoinGroups,
    required this.canReadAllGroupMessages,
    required this.hasMainWebApp,
    required this.hasTopics,
    required this.allowsUsersToCreateTopics,
    required this.canManageBots,
    required this.isInline,
    required this.inlineQueryPlaceholder,
    required this.supportsGuestQueries,
    required this.isGuard,
    required this.needLocation,
    required this.canConnectToBusiness,
    required this.canBeAddedToAttachmentMenu,
    required this.activeUserCount,
  });

  /// True, if the bot is owned by the current user and can be edited using the methods toggleBotUsernameIsActive, reorderBotActiveUsernames, setBotProfilePhoto, setBotName, setBotInfoDescription, and setBotInfoShortDescription
  final bool canBeEdited;

  /// True, if the bot can be invited to basic group and supergroup chats
  final bool canJoinGroups;

  /// True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
  final bool canReadAllGroupMessages;

  /// True, if the bot has the main Web App
  final bool hasMainWebApp;

  /// True, if the bot has topics
  final bool hasTopics;

  /// True, if users can create and delete topics in the chat with the bot
  final bool allowsUsersToCreateTopics;

  /// True, if the bot can manage other bots
  final bool canManageBots;

  /// True, if the bot supports inline queries
  final bool isInline;

  /// Placeholder for inline queries (displayed on the application input field)
  final String inlineQueryPlaceholder;

  /// True, if the bot can be queried by username from any non-secret chat
  final bool supportsGuestQueries;

  /// True, if the bot can be set as a guard bot in supergroup chats
  final bool isGuard;

  /// True, if the location of the user is expected to be sent with every inline query to this bot
  final bool needLocation;

  /// True, if the bot supports connection to user accounts for chat automation
  final bool canConnectToBusiness;

  /// True, if the bot can be added to attachment or side menu
  final bool canBeAddedToAttachmentMenu;

  /// The number of recently active users of the bot
  final int activeUserCount;

  /// Parse from a json
  factory UserTypeBot.fromJson(Map<String, dynamic> json) => UserTypeBot(
        canBeEdited: json['can_be_edited'],
        canJoinGroups: json['can_join_groups'],
        canReadAllGroupMessages: json['can_read_all_group_messages'],
        hasMainWebApp: json['has_main_web_app'],
        hasTopics: json['has_topics'],
        allowsUsersToCreateTopics: json['allows_users_to_create_topics'],
        canManageBots: json['can_manage_bots'],
        isInline: json['is_inline'],
        inlineQueryPlaceholder: json['inline_query_placeholder'],
        supportsGuestQueries: json['supports_guest_queries'],
        isGuard: json['is_guard'],
        needLocation: json['need_location'],
        canConnectToBusiness: json['can_connect_to_business'],
        canBeAddedToAttachmentMenu: json['can_be_added_to_attachment_menu'],
        activeUserCount: json['active_user_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_be_edited": canBeEdited,
      "can_join_groups": canJoinGroups,
      "can_read_all_group_messages": canReadAllGroupMessages,
      "has_main_web_app": hasMainWebApp,
      "has_topics": hasTopics,
      "allows_users_to_create_topics": allowsUsersToCreateTopics,
      "can_manage_bots": canManageBots,
      "is_inline": isInline,
      "inline_query_placeholder": inlineQueryPlaceholder,
      "supports_guest_queries": supportsGuestQueries,
      "is_guard": isGuard,
      "need_location": needLocation,
      "can_connect_to_business": canConnectToBusiness,
      "can_be_added_to_attachment_menu": canBeAddedToAttachmentMenu,
      "active_user_count": activeUserCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_be_edited]: True, if the bot is owned by the current user and can be edited using the methods toggleBotUsernameIsActive, reorderBotActiveUsernames, setBotProfilePhoto, setBotName, setBotInfoDescription, and setBotInfoShortDescription
  /// * [can_join_groups]: True, if the bot can be invited to basic group and supergroup chats
  /// * [can_read_all_group_messages]: True, if the bot can read all messages in basic group or supergroup chats and not just those addressed to the bot. In private and channel chats a bot can always read all messages
  /// * [has_main_web_app]: True, if the bot has the main Web App
  /// * [has_topics]: True, if the bot has topics
  /// * [allows_users_to_create_topics]: True, if users can create and delete topics in the chat with the bot
  /// * [can_manage_bots]: True, if the bot can manage other bots
  /// * [is_inline]: True, if the bot supports inline queries
  /// * [inline_query_placeholder]: Placeholder for inline queries (displayed on the application input field)
  /// * [supports_guest_queries]: True, if the bot can be queried by username from any non-secret chat
  /// * [is_guard]: True, if the bot can be set as a guard bot in supergroup chats
  /// * [need_location]: True, if the location of the user is expected to be sent with every inline query to this bot
  /// * [can_connect_to_business]: True, if the bot supports connection to user accounts for chat automation
  /// * [can_be_added_to_attachment_menu]: True, if the bot can be added to attachment or side menu
  /// * [active_user_count]: The number of recently active users of the bot
  @override
  UserTypeBot copyWith({
    bool? canBeEdited,
    bool? canJoinGroups,
    bool? canReadAllGroupMessages,
    bool? hasMainWebApp,
    bool? hasTopics,
    bool? allowsUsersToCreateTopics,
    bool? canManageBots,
    bool? isInline,
    String? inlineQueryPlaceholder,
    bool? supportsGuestQueries,
    bool? isGuard,
    bool? needLocation,
    bool? canConnectToBusiness,
    bool? canBeAddedToAttachmentMenu,
    int? activeUserCount,
  }) =>
      UserTypeBot(
        canBeEdited: canBeEdited ?? this.canBeEdited,
        canJoinGroups: canJoinGroups ?? this.canJoinGroups,
        canReadAllGroupMessages:
            canReadAllGroupMessages ?? this.canReadAllGroupMessages,
        hasMainWebApp: hasMainWebApp ?? this.hasMainWebApp,
        hasTopics: hasTopics ?? this.hasTopics,
        allowsUsersToCreateTopics:
            allowsUsersToCreateTopics ?? this.allowsUsersToCreateTopics,
        canManageBots: canManageBots ?? this.canManageBots,
        isInline: isInline ?? this.isInline,
        inlineQueryPlaceholder:
            inlineQueryPlaceholder ?? this.inlineQueryPlaceholder,
        supportsGuestQueries: supportsGuestQueries ?? this.supportsGuestQueries,
        isGuard: isGuard ?? this.isGuard,
        needLocation: needLocation ?? this.needLocation,
        canConnectToBusiness: canConnectToBusiness ?? this.canConnectToBusiness,
        canBeAddedToAttachmentMenu:
            canBeAddedToAttachmentMenu ?? this.canBeAddedToAttachmentMenu,
        activeUserCount: activeUserCount ?? this.activeUserCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'userTypeBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **UserTypeUnknown** *(userTypeUnknown)* - child of UserType
///
/// No information on the user besides the user identifier is available, yet this user has not been deleted.. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type.
final class UserTypeUnknown extends UserType {
  /// **UserTypeUnknown** *(userTypeUnknown)* - child of UserType
  ///
  /// No information on the user besides the user identifier is available, yet this user has not been deleted.. This object is extremely rare and must be handled like a deleted user. It is not possible to perform any actions on users of this type.
  const UserTypeUnknown();

  /// Parse from a json
  factory UserTypeUnknown.fromJson(Map<String, dynamic> json) =>
      const UserTypeUnknown();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  UserTypeUnknown copyWith() => const UserTypeUnknown();

  /// TDLib object type
  static const String defaultObjectId = 'userTypeUnknown';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
