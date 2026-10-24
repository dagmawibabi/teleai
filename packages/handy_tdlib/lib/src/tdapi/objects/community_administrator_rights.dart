part of '../tdapi.dart';

/// **CommunityAdministratorRights** *(communityAdministratorRights)* - basic class
///
/// Describes rights of the administrator in a community.
///
/// * [canManageCommunity]: True, if the user is an administrator. Implied by any other privilege.
/// * [canChangeInfo]: True, if the administrator can change the community name, photo, and other settings.
/// * [canEditChatList]: True, if the user can change the chats added to the community.
/// * [canPromoteMembers]: True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them.
/// * [canBanMembers]: True, if the administrator can ban, or unban community members.
final class CommunityAdministratorRights extends TdObject {
  /// **CommunityAdministratorRights** *(communityAdministratorRights)* - basic class
  ///
  /// Describes rights of the administrator in a community.
  ///
  /// * [canManageCommunity]: True, if the user is an administrator. Implied by any other privilege.
  /// * [canChangeInfo]: True, if the administrator can change the community name, photo, and other settings.
  /// * [canEditChatList]: True, if the user can change the chats added to the community.
  /// * [canPromoteMembers]: True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them.
  /// * [canBanMembers]: True, if the administrator can ban, or unban community members.
  const CommunityAdministratorRights({
    required this.canManageCommunity,
    required this.canChangeInfo,
    required this.canEditChatList,
    required this.canPromoteMembers,
    required this.canBanMembers,
  });

  /// True, if the user is an administrator. Implied by any other privilege
  final bool canManageCommunity;

  /// True, if the administrator can change the community name, photo, and other settings
  final bool canChangeInfo;

  /// True, if the user can change the chats added to the community
  final bool canEditChatList;

  /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
  final bool canPromoteMembers;

  /// True, if the administrator can ban, or unban community members
  final bool canBanMembers;

  /// Parse from a json
  factory CommunityAdministratorRights.fromJson(Map<String, dynamic> json) =>
      CommunityAdministratorRights(
        canManageCommunity: json['can_manage_community'],
        canChangeInfo: json['can_change_info'],
        canEditChatList: json['can_edit_chat_list'],
        canPromoteMembers: json['can_promote_members'],
        canBanMembers: json['can_ban_members'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_manage_community": canManageCommunity,
      "can_change_info": canChangeInfo,
      "can_edit_chat_list": canEditChatList,
      "can_promote_members": canPromoteMembers,
      "can_ban_members": canBanMembers,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_manage_community]: True, if the user is an administrator. Implied by any other privilege
  /// * [can_change_info]: True, if the administrator can change the community name, photo, and other settings
  /// * [can_edit_chat_list]: True, if the user can change the chats added to the community
  /// * [can_promote_members]: True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
  /// * [can_ban_members]: True, if the administrator can ban, or unban community members
  CommunityAdministratorRights copyWith({
    bool? canManageCommunity,
    bool? canChangeInfo,
    bool? canEditChatList,
    bool? canPromoteMembers,
    bool? canBanMembers,
  }) =>
      CommunityAdministratorRights(
        canManageCommunity: canManageCommunity ?? this.canManageCommunity,
        canChangeInfo: canChangeInfo ?? this.canChangeInfo,
        canEditChatList: canEditChatList ?? this.canEditChatList,
        canPromoteMembers: canPromoteMembers ?? this.canPromoteMembers,
        canBanMembers: canBanMembers ?? this.canBanMembers,
      );

  /// TDLib object type
  static const String defaultObjectId = 'communityAdministratorRights';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
