part of '../tdapi.dart';

/// **ChatMemberStatus** *(chatMemberStatus)* - parent
///
/// Provides information about the status of a member in a chat.
sealed class ChatMemberStatus extends TdObject {
  /// **ChatMemberStatus** *(chatMemberStatus)* - parent
  ///
  /// Provides information about the status of a member in a chat.
  const ChatMemberStatus();

  /// a ChatMemberStatus return type can be :
  /// * [ChatMemberStatusCreator]
  /// * [ChatMemberStatusAdministrator]
  /// * [ChatMemberStatusMember]
  /// * [ChatMemberStatusRestricted]
  /// * [ChatMemberStatusLeft]
  /// * [ChatMemberStatusBanned]
  factory ChatMemberStatus.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatMemberStatusCreator.defaultObjectId:
        return ChatMemberStatusCreator.fromJson(json);
      case ChatMemberStatusAdministrator.defaultObjectId:
        return ChatMemberStatusAdministrator.fromJson(json);
      case ChatMemberStatusMember.defaultObjectId:
        return ChatMemberStatusMember.fromJson(json);
      case ChatMemberStatusRestricted.defaultObjectId:
        return ChatMemberStatusRestricted.fromJson(json);
      case ChatMemberStatusLeft.defaultObjectId:
        return ChatMemberStatusLeft.fromJson(json);
      case ChatMemberStatusBanned.defaultObjectId:
        return ChatMemberStatusBanned.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatMemberStatus)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatMemberStatus copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMemberStatusCreator** *(chatMemberStatusCreator)* - child of ChatMemberStatus
///
/// The user is the owner of the chat and has all the administrator privileges.
///
/// * [isAnonymous]: True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only.
/// * [isMember]: True, if the user is a member of the chat.
final class ChatMemberStatusCreator extends ChatMemberStatus {
  /// **ChatMemberStatusCreator** *(chatMemberStatusCreator)* - child of ChatMemberStatus
  ///
  /// The user is the owner of the chat and has all the administrator privileges.
  ///
  /// * [isAnonymous]: True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only.
  /// * [isMember]: True, if the user is a member of the chat.
  const ChatMemberStatusCreator({
    required this.isAnonymous,
    required this.isMember,
  });

  /// True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
  final bool isAnonymous;

  /// True, if the user is a member of the chat
  final bool isMember;

  /// Parse from a json
  factory ChatMemberStatusCreator.fromJson(Map<String, dynamic> json) =>
      ChatMemberStatusCreator(
        isAnonymous: json['is_anonymous'],
        isMember: json['is_member'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_anonymous": isAnonymous,
      "is_member": isMember,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_anonymous]: True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
  /// * [is_member]: True, if the user is a member of the chat
  @override
  ChatMemberStatusCreator copyWith({
    bool? isAnonymous,
    bool? isMember,
  }) =>
      ChatMemberStatusCreator(
        isAnonymous: isAnonymous ?? this.isAnonymous,
        isMember: isMember ?? this.isMember,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatusCreator';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMemberStatusAdministrator** *(chatMemberStatusAdministrator)* - child of ChatMemberStatus
///
/// The user is a member of the chat and has some additional privileges. In basic groups, administrators have all applicable rights.. In supergroups and channels, any subset of the rights can be chosen for an administrator.
///
/// * [canBeEdited]: True, if the current user can edit the administrator privileges for the called user.
/// * [rights]: Rights of the administrator.
final class ChatMemberStatusAdministrator extends ChatMemberStatus {
  /// **ChatMemberStatusAdministrator** *(chatMemberStatusAdministrator)* - child of ChatMemberStatus
  ///
  /// The user is a member of the chat and has some additional privileges. In basic groups, administrators have all applicable rights.. In supergroups and channels, any subset of the rights can be chosen for an administrator.
  ///
  /// * [canBeEdited]: True, if the current user can edit the administrator privileges for the called user.
  /// * [rights]: Rights of the administrator.
  const ChatMemberStatusAdministrator({
    required this.canBeEdited,
    required this.rights,
  });

  /// True, if the current user can edit the administrator privileges for the called user
  final bool canBeEdited;

  /// Rights of the administrator
  final ChatAdministratorRights rights;

  /// Parse from a json
  factory ChatMemberStatusAdministrator.fromJson(Map<String, dynamic> json) =>
      ChatMemberStatusAdministrator(
        canBeEdited: json['can_be_edited'],
        rights: ChatAdministratorRights.fromJson(json['rights']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_be_edited": canBeEdited,
      "rights": rights.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_be_edited]: True, if the current user can edit the administrator privileges for the called user
  /// * [rights]: Rights of the administrator
  @override
  ChatMemberStatusAdministrator copyWith({
    bool? canBeEdited,
    ChatAdministratorRights? rights,
  }) =>
      ChatMemberStatusAdministrator(
        canBeEdited: canBeEdited ?? this.canBeEdited,
        rights: rights ?? this.rights,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatusAdministrator';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMemberStatusMember** *(chatMemberStatusMember)* - child of ChatMemberStatus
///
/// The user is a member of the chat, without any additional privileges or restrictions.
///
/// * [memberUntilDate]: Point in time (Unix timestamp) when the user will be removed from the chat because of the expired subscription; 0 if never. Ignored in setChatMemberStatus.
final class ChatMemberStatusMember extends ChatMemberStatus {
  /// **ChatMemberStatusMember** *(chatMemberStatusMember)* - child of ChatMemberStatus
  ///
  /// The user is a member of the chat, without any additional privileges or restrictions.
  ///
  /// * [memberUntilDate]: Point in time (Unix timestamp) when the user will be removed from the chat because of the expired subscription; 0 if never. Ignored in setChatMemberStatus.
  const ChatMemberStatusMember({
    required this.memberUntilDate,
  });

  /// Point in time (Unix timestamp) when the user will be removed from the chat because of the expired subscription; 0 if never. Ignored in setChatMemberStatus
  final int memberUntilDate;

  /// Parse from a json
  factory ChatMemberStatusMember.fromJson(Map<String, dynamic> json) =>
      ChatMemberStatusMember(
        memberUntilDate: json['member_until_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "member_until_date": memberUntilDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [member_until_date]: Point in time (Unix timestamp) when the user will be removed from the chat because of the expired subscription; 0 if never. Ignored in setChatMemberStatus
  @override
  ChatMemberStatusMember copyWith({
    int? memberUntilDate,
  }) =>
      ChatMemberStatusMember(
        memberUntilDate: memberUntilDate ?? this.memberUntilDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatusMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMemberStatusRestricted** *(chatMemberStatusRestricted)* - child of ChatMemberStatus
///
/// The user is under certain restrictions in the chat. Not supported in basic groups and channels.
///
/// * [isMember]: True, if the user is a member of the chat.
/// * [restrictedUntilDate]: Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never.. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever.
/// * [permissions]: User permissions in the chat.
final class ChatMemberStatusRestricted extends ChatMemberStatus {
  /// **ChatMemberStatusRestricted** *(chatMemberStatusRestricted)* - child of ChatMemberStatus
  ///
  /// The user is under certain restrictions in the chat. Not supported in basic groups and channels.
  ///
  /// * [isMember]: True, if the user is a member of the chat.
  /// * [restrictedUntilDate]: Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never.. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever.
  /// * [permissions]: User permissions in the chat.
  const ChatMemberStatusRestricted({
    required this.isMember,
    required this.restrictedUntilDate,
    required this.permissions,
  });

  /// True, if the user is a member of the chat
  final bool isMember;

  /// Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never.. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
  final int restrictedUntilDate;

  /// User permissions in the chat
  final ChatPermissions permissions;

  /// Parse from a json
  factory ChatMemberStatusRestricted.fromJson(Map<String, dynamic> json) =>
      ChatMemberStatusRestricted(
        isMember: json['is_member'],
        restrictedUntilDate: json['restricted_until_date'],
        permissions: ChatPermissions.fromJson(json['permissions']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_member": isMember,
      "restricted_until_date": restrictedUntilDate,
      "permissions": permissions.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_member]: True, if the user is a member of the chat
  /// * [restricted_until_date]: Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never.. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
  /// * [permissions]: User permissions in the chat
  @override
  ChatMemberStatusRestricted copyWith({
    bool? isMember,
    int? restrictedUntilDate,
    ChatPermissions? permissions,
  }) =>
      ChatMemberStatusRestricted(
        isMember: isMember ?? this.isMember,
        restrictedUntilDate: restrictedUntilDate ?? this.restrictedUntilDate,
        permissions: permissions ?? this.permissions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatusRestricted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMemberStatusLeft** *(chatMemberStatusLeft)* - child of ChatMemberStatus
///
/// The user or the chat is not a chat member.
final class ChatMemberStatusLeft extends ChatMemberStatus {
  /// **ChatMemberStatusLeft** *(chatMemberStatusLeft)* - child of ChatMemberStatus
  ///
  /// The user or the chat is not a chat member.
  const ChatMemberStatusLeft();

  /// Parse from a json
  factory ChatMemberStatusLeft.fromJson(Map<String, dynamic> json) =>
      const ChatMemberStatusLeft();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatMemberStatusLeft copyWith() => const ChatMemberStatusLeft();

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatusLeft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatMemberStatusBanned** *(chatMemberStatusBanned)* - child of ChatMemberStatus
///
/// The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat.
///
/// * [bannedUntilDate]: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups.
final class ChatMemberStatusBanned extends ChatMemberStatus {
  /// **ChatMemberStatusBanned** *(chatMemberStatusBanned)* - child of ChatMemberStatus
  ///
  /// The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat.
  ///
  /// * [bannedUntilDate]: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups.
  const ChatMemberStatusBanned({
    required this.bannedUntilDate,
  });

  /// Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
  final int bannedUntilDate;

  /// Parse from a json
  factory ChatMemberStatusBanned.fromJson(Map<String, dynamic> json) =>
      ChatMemberStatusBanned(
        bannedUntilDate: json['banned_until_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "banned_until_date": bannedUntilDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [banned_until_date]: Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days. or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
  @override
  ChatMemberStatusBanned copyWith({
    int? bannedUntilDate,
  }) =>
      ChatMemberStatusBanned(
        bannedUntilDate: bannedUntilDate ?? this.bannedUntilDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMemberStatusBanned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
