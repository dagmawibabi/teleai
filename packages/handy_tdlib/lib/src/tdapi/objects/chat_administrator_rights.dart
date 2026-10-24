part of '../tdapi.dart';

/// **ChatAdministratorRights** *(chatAdministratorRights)* - basic class
///
/// Describes rights of the administrator.
///
/// * [canManageChat]: True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report supergroup spam messages,. ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other privilege; applicable to supergroups and channels only.
/// * [canChangeInfo]: True, if the administrator can change the chat title, photo, and other settings.
/// * [canPostMessages]: True, if the administrator can create channel posts, approve suggested channel posts, or view channel statistics; applicable to channels only.
/// * [canEditMessages]: True, if the administrator can edit messages of other users and pin messages; applicable to channels only.
/// * [canDeleteMessages]: True, if the administrator can delete messages of other users.
/// * [canInviteUsers]: True, if the administrator can invite new users to the chat.
/// * [canRestrictMembers]: True, if the administrator can restrict, ban, or unban chat members or view supergroup statistics.
/// * [canPinMessages]: True, if the administrator can pin messages; applicable to basic groups and supergroups only.
/// * [canManageTopics]: True, if the administrator can create, rename, close, reopen, hide, and unhide forum topics; applicable to forum supergroups only.
/// * [canPromoteMembers]: True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them; applicable to supergroups and channels only.
/// * [canManageVideoChats]: True, if the administrator can manage video chats.
/// * [canPostStories]: True, if the administrator can create new chat stories, or edit and delete posted stories; applicable to supergroups and channels only.
/// * [canEditStories]: True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access story archive; applicable to supergroups and channels only.
/// * [canDeleteStories]: True, if the administrator can delete stories posted by other users; applicable to supergroups and channels only.
/// * [canManageDirectMessages]: True, if the administrator can answer to channel direct messages; applicable to channels only.
/// * [canManageTags]: True, if the administrator can change tags of other users; applicable to basic groups and supergroups only.
/// * [canSendWelcomeMessages]: True, if the administrator can manage and send welcome messages.
/// * [isAnonymous]: True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only.
final class ChatAdministratorRights extends TdObject {
  /// **ChatAdministratorRights** *(chatAdministratorRights)* - basic class
  ///
  /// Describes rights of the administrator.
  ///
  /// * [canManageChat]: True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report supergroup spam messages,. ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other privilege; applicable to supergroups and channels only.
  /// * [canChangeInfo]: True, if the administrator can change the chat title, photo, and other settings.
  /// * [canPostMessages]: True, if the administrator can create channel posts, approve suggested channel posts, or view channel statistics; applicable to channels only.
  /// * [canEditMessages]: True, if the administrator can edit messages of other users and pin messages; applicable to channels only.
  /// * [canDeleteMessages]: True, if the administrator can delete messages of other users.
  /// * [canInviteUsers]: True, if the administrator can invite new users to the chat.
  /// * [canRestrictMembers]: True, if the administrator can restrict, ban, or unban chat members or view supergroup statistics.
  /// * [canPinMessages]: True, if the administrator can pin messages; applicable to basic groups and supergroups only.
  /// * [canManageTopics]: True, if the administrator can create, rename, close, reopen, hide, and unhide forum topics; applicable to forum supergroups only.
  /// * [canPromoteMembers]: True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them; applicable to supergroups and channels only.
  /// * [canManageVideoChats]: True, if the administrator can manage video chats.
  /// * [canPostStories]: True, if the administrator can create new chat stories, or edit and delete posted stories; applicable to supergroups and channels only.
  /// * [canEditStories]: True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access story archive; applicable to supergroups and channels only.
  /// * [canDeleteStories]: True, if the administrator can delete stories posted by other users; applicable to supergroups and channels only.
  /// * [canManageDirectMessages]: True, if the administrator can answer to channel direct messages; applicable to channels only.
  /// * [canManageTags]: True, if the administrator can change tags of other users; applicable to basic groups and supergroups only.
  /// * [canSendWelcomeMessages]: True, if the administrator can manage and send welcome messages.
  /// * [isAnonymous]: True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only.
  const ChatAdministratorRights({
    required this.canManageChat,
    required this.canChangeInfo,
    required this.canPostMessages,
    required this.canEditMessages,
    required this.canDeleteMessages,
    required this.canInviteUsers,
    required this.canRestrictMembers,
    required this.canPinMessages,
    required this.canManageTopics,
    required this.canPromoteMembers,
    required this.canManageVideoChats,
    required this.canPostStories,
    required this.canEditStories,
    required this.canDeleteStories,
    required this.canManageDirectMessages,
    required this.canManageTags,
    required this.canSendWelcomeMessages,
    required this.isAnonymous,
  });

  /// True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report supergroup spam messages,. ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other privilege; applicable to supergroups and channels only
  final bool canManageChat;

  /// True, if the administrator can change the chat title, photo, and other settings
  final bool canChangeInfo;

  /// True, if the administrator can create channel posts, approve suggested channel posts, or view channel statistics; applicable to channels only
  final bool canPostMessages;

  /// True, if the administrator can edit messages of other users and pin messages; applicable to channels only
  final bool canEditMessages;

  /// True, if the administrator can delete messages of other users
  final bool canDeleteMessages;

  /// True, if the administrator can invite new users to the chat
  final bool canInviteUsers;

  /// True, if the administrator can restrict, ban, or unban chat members or view supergroup statistics
  final bool canRestrictMembers;

  /// True, if the administrator can pin messages; applicable to basic groups and supergroups only
  final bool canPinMessages;

  /// True, if the administrator can create, rename, close, reopen, hide, and unhide forum topics; applicable to forum supergroups only
  final bool canManageTopics;

  /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them; applicable to supergroups and channels only
  final bool canPromoteMembers;

  /// True, if the administrator can manage video chats
  final bool canManageVideoChats;

  /// True, if the administrator can create new chat stories, or edit and delete posted stories; applicable to supergroups and channels only
  final bool canPostStories;

  /// True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access story archive; applicable to supergroups and channels only
  final bool canEditStories;

  /// True, if the administrator can delete stories posted by other users; applicable to supergroups and channels only
  final bool canDeleteStories;

  /// True, if the administrator can answer to channel direct messages; applicable to channels only
  final bool canManageDirectMessages;

  /// True, if the administrator can change tags of other users; applicable to basic groups and supergroups only
  final bool canManageTags;

  /// True, if the administrator can manage and send welcome messages
  final bool canSendWelcomeMessages;

  /// True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
  final bool isAnonymous;

  /// Parse from a json
  factory ChatAdministratorRights.fromJson(Map<String, dynamic> json) =>
      ChatAdministratorRights(
        canManageChat: json['can_manage_chat'],
        canChangeInfo: json['can_change_info'],
        canPostMessages: json['can_post_messages'],
        canEditMessages: json['can_edit_messages'],
        canDeleteMessages: json['can_delete_messages'],
        canInviteUsers: json['can_invite_users'],
        canRestrictMembers: json['can_restrict_members'],
        canPinMessages: json['can_pin_messages'],
        canManageTopics: json['can_manage_topics'],
        canPromoteMembers: json['can_promote_members'],
        canManageVideoChats: json['can_manage_video_chats'],
        canPostStories: json['can_post_stories'],
        canEditStories: json['can_edit_stories'],
        canDeleteStories: json['can_delete_stories'],
        canManageDirectMessages: json['can_manage_direct_messages'],
        canManageTags: json['can_manage_tags'],
        canSendWelcomeMessages: json['can_send_welcome_messages'],
        isAnonymous: json['is_anonymous'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_manage_chat": canManageChat,
      "can_change_info": canChangeInfo,
      "can_post_messages": canPostMessages,
      "can_edit_messages": canEditMessages,
      "can_delete_messages": canDeleteMessages,
      "can_invite_users": canInviteUsers,
      "can_restrict_members": canRestrictMembers,
      "can_pin_messages": canPinMessages,
      "can_manage_topics": canManageTopics,
      "can_promote_members": canPromoteMembers,
      "can_manage_video_chats": canManageVideoChats,
      "can_post_stories": canPostStories,
      "can_edit_stories": canEditStories,
      "can_delete_stories": canDeleteStories,
      "can_manage_direct_messages": canManageDirectMessages,
      "can_manage_tags": canManageTags,
      "can_send_welcome_messages": canSendWelcomeMessages,
      "is_anonymous": isAnonymous,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_manage_chat]: True, if the administrator can access the chat event log, get boost list, see hidden supergroup and channel members, report supergroup spam messages,. ignore slow mode, and send messages to the chat without paying Telegram Stars. Implied by any other privilege; applicable to supergroups and channels only
  /// * [can_change_info]: True, if the administrator can change the chat title, photo, and other settings
  /// * [can_post_messages]: True, if the administrator can create channel posts, approve suggested channel posts, or view channel statistics; applicable to channels only
  /// * [can_edit_messages]: True, if the administrator can edit messages of other users and pin messages; applicable to channels only
  /// * [can_delete_messages]: True, if the administrator can delete messages of other users
  /// * [can_invite_users]: True, if the administrator can invite new users to the chat
  /// * [can_restrict_members]: True, if the administrator can restrict, ban, or unban chat members or view supergroup statistics
  /// * [can_pin_messages]: True, if the administrator can pin messages; applicable to basic groups and supergroups only
  /// * [can_manage_topics]: True, if the administrator can create, rename, close, reopen, hide, and unhide forum topics; applicable to forum supergroups only
  /// * [can_promote_members]: True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them; applicable to supergroups and channels only
  /// * [can_manage_video_chats]: True, if the administrator can manage video chats
  /// * [can_post_stories]: True, if the administrator can create new chat stories, or edit and delete posted stories; applicable to supergroups and channels only
  /// * [can_edit_stories]: True, if the administrator can edit stories posted by other users, post stories to the chat page, pin chat stories, and access story archive; applicable to supergroups and channels only
  /// * [can_delete_stories]: True, if the administrator can delete stories posted by other users; applicable to supergroups and channels only
  /// * [can_manage_direct_messages]: True, if the administrator can answer to channel direct messages; applicable to channels only
  /// * [can_manage_tags]: True, if the administrator can change tags of other users; applicable to basic groups and supergroups only
  /// * [can_send_welcome_messages]: True, if the administrator can manage and send welcome messages
  /// * [is_anonymous]: True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
  ChatAdministratorRights copyWith({
    bool? canManageChat,
    bool? canChangeInfo,
    bool? canPostMessages,
    bool? canEditMessages,
    bool? canDeleteMessages,
    bool? canInviteUsers,
    bool? canRestrictMembers,
    bool? canPinMessages,
    bool? canManageTopics,
    bool? canPromoteMembers,
    bool? canManageVideoChats,
    bool? canPostStories,
    bool? canEditStories,
    bool? canDeleteStories,
    bool? canManageDirectMessages,
    bool? canManageTags,
    bool? canSendWelcomeMessages,
    bool? isAnonymous,
  }) =>
      ChatAdministratorRights(
        canManageChat: canManageChat ?? this.canManageChat,
        canChangeInfo: canChangeInfo ?? this.canChangeInfo,
        canPostMessages: canPostMessages ?? this.canPostMessages,
        canEditMessages: canEditMessages ?? this.canEditMessages,
        canDeleteMessages: canDeleteMessages ?? this.canDeleteMessages,
        canInviteUsers: canInviteUsers ?? this.canInviteUsers,
        canRestrictMembers: canRestrictMembers ?? this.canRestrictMembers,
        canPinMessages: canPinMessages ?? this.canPinMessages,
        canManageTopics: canManageTopics ?? this.canManageTopics,
        canPromoteMembers: canPromoteMembers ?? this.canPromoteMembers,
        canManageVideoChats: canManageVideoChats ?? this.canManageVideoChats,
        canPostStories: canPostStories ?? this.canPostStories,
        canEditStories: canEditStories ?? this.canEditStories,
        canDeleteStories: canDeleteStories ?? this.canDeleteStories,
        canManageDirectMessages:
            canManageDirectMessages ?? this.canManageDirectMessages,
        canManageTags: canManageTags ?? this.canManageTags,
        canSendWelcomeMessages:
            canSendWelcomeMessages ?? this.canSendWelcomeMessages,
        isAnonymous: isAnonymous ?? this.isAnonymous,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatAdministratorRights';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
