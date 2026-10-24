part of '../tdapi.dart';

/// **CommunityMemberStatus** *(communityMemberStatus)* - parent
///
/// Provides information about the status of a member in a community.
sealed class CommunityMemberStatus extends TdObject {
  /// **CommunityMemberStatus** *(communityMemberStatus)* - parent
  ///
  /// Provides information about the status of a member in a community.
  const CommunityMemberStatus();

  /// a CommunityMemberStatus return type can be :
  /// * [CommunityMemberStatusCreator]
  /// * [CommunityMemberStatusAdministrator]
  /// * [CommunityMemberStatusMember]
  /// * [CommunityMemberStatusLeft]
  /// * [CommunityMemberStatusBanned]
  factory CommunityMemberStatus.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case CommunityMemberStatusCreator.defaultObjectId:
        return CommunityMemberStatusCreator.fromJson(json);
      case CommunityMemberStatusAdministrator.defaultObjectId:
        return CommunityMemberStatusAdministrator.fromJson(json);
      case CommunityMemberStatusMember.defaultObjectId:
        return CommunityMemberStatusMember.fromJson(json);
      case CommunityMemberStatusLeft.defaultObjectId:
        return CommunityMemberStatusLeft.fromJson(json);
      case CommunityMemberStatusBanned.defaultObjectId:
        return CommunityMemberStatusBanned.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of CommunityMemberStatus)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  CommunityMemberStatus copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'communityMemberStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CommunityMemberStatusCreator** *(communityMemberStatusCreator)* - child of CommunityMemberStatus
///
/// The user is the owner of the community and has all the administrator privileges.
final class CommunityMemberStatusCreator extends CommunityMemberStatus {
  /// **CommunityMemberStatusCreator** *(communityMemberStatusCreator)* - child of CommunityMemberStatus
  ///
  /// The user is the owner of the community and has all the administrator privileges.
  const CommunityMemberStatusCreator();

  /// Parse from a json
  factory CommunityMemberStatusCreator.fromJson(Map<String, dynamic> json) =>
      const CommunityMemberStatusCreator();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CommunityMemberStatusCreator copyWith() =>
      const CommunityMemberStatusCreator();

  /// TDLib object type
  static const String defaultObjectId = 'communityMemberStatusCreator';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CommunityMemberStatusAdministrator** *(communityMemberStatusAdministrator)* - child of CommunityMemberStatus
///
/// The user is a member of the community and has some additional privileges.
///
/// * [canBeEdited]: True, if the current user can edit the administrator privileges for the called user.
/// * [rights]: Rights of the administrator.
final class CommunityMemberStatusAdministrator extends CommunityMemberStatus {
  /// **CommunityMemberStatusAdministrator** *(communityMemberStatusAdministrator)* - child of CommunityMemberStatus
  ///
  /// The user is a member of the community and has some additional privileges.
  ///
  /// * [canBeEdited]: True, if the current user can edit the administrator privileges for the called user.
  /// * [rights]: Rights of the administrator.
  const CommunityMemberStatusAdministrator({
    required this.canBeEdited,
    required this.rights,
  });

  /// True, if the current user can edit the administrator privileges for the called user
  final bool canBeEdited;

  /// Rights of the administrator
  final CommunityAdministratorRights rights;

  /// Parse from a json
  factory CommunityMemberStatusAdministrator.fromJson(
          Map<String, dynamic> json) =>
      CommunityMemberStatusAdministrator(
        canBeEdited: json['can_be_edited'],
        rights: CommunityAdministratorRights.fromJson(json['rights']),
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
  CommunityMemberStatusAdministrator copyWith({
    bool? canBeEdited,
    CommunityAdministratorRights? rights,
  }) =>
      CommunityMemberStatusAdministrator(
        canBeEdited: canBeEdited ?? this.canBeEdited,
        rights: rights ?? this.rights,
      );

  /// TDLib object type
  static const String defaultObjectId = 'communityMemberStatusAdministrator';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CommunityMemberStatusMember** *(communityMemberStatusMember)* - child of CommunityMemberStatus
///
/// The user is a member of the community, without any additional privileges or restrictions.
final class CommunityMemberStatusMember extends CommunityMemberStatus {
  /// **CommunityMemberStatusMember** *(communityMemberStatusMember)* - child of CommunityMemberStatus
  ///
  /// The user is a member of the community, without any additional privileges or restrictions.
  const CommunityMemberStatusMember();

  /// Parse from a json
  factory CommunityMemberStatusMember.fromJson(Map<String, dynamic> json) =>
      const CommunityMemberStatusMember();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CommunityMemberStatusMember copyWith() => const CommunityMemberStatusMember();

  /// TDLib object type
  static const String defaultObjectId = 'communityMemberStatusMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CommunityMemberStatusLeft** *(communityMemberStatusLeft)* - child of CommunityMemberStatus
///
/// The user or the chat is not a community member.
final class CommunityMemberStatusLeft extends CommunityMemberStatus {
  /// **CommunityMemberStatusLeft** *(communityMemberStatusLeft)* - child of CommunityMemberStatus
  ///
  /// The user or the chat is not a community member.
  const CommunityMemberStatusLeft();

  /// Parse from a json
  factory CommunityMemberStatusLeft.fromJson(Map<String, dynamic> json) =>
      const CommunityMemberStatusLeft();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CommunityMemberStatusLeft copyWith() => const CommunityMemberStatusLeft();

  /// TDLib object type
  static const String defaultObjectId = 'communityMemberStatusLeft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **CommunityMemberStatusBanned** *(communityMemberStatusBanned)* - child of CommunityMemberStatus
///
/// The user or the chat was banned in the community; implies ban in all chats in the community.
final class CommunityMemberStatusBanned extends CommunityMemberStatus {
  /// **CommunityMemberStatusBanned** *(communityMemberStatusBanned)* - child of CommunityMemberStatus
  ///
  /// The user or the chat was banned in the community; implies ban in all chats in the community.
  const CommunityMemberStatusBanned();

  /// Parse from a json
  factory CommunityMemberStatusBanned.fromJson(Map<String, dynamic> json) =>
      const CommunityMemberStatusBanned();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  CommunityMemberStatusBanned copyWith() => const CommunityMemberStatusBanned();

  /// TDLib object type
  static const String defaultObjectId = 'communityMemberStatusBanned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
