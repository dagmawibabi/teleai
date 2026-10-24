part of '../tdapi.dart';

/// **SupergroupFullInfo** *(supergroupFullInfo)* - basic class
///
/// Contains full information about a supergroup or channel.
///
/// * [photo]: Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo *(optional)*.
/// * [communityId]: Identifier of the community to which the corresponding chat was added.
/// * [description]: Supergroup or channel description.
/// * [memberCount]: Number of members in the supergroup or channel; 0 if unknown.
/// * [administratorCount]: Number of privileged users in the supergroup or channel; 0 if unknown.
/// * [restrictedCount]: Number of restricted users in the supergroup; 0 if unknown.
/// * [bannedCount]: Number of users banned from chat; 0 if unknown.
/// * [linkedChatId]: Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown.
/// * [directMessagesChatId]: Chat identifier of a direct messages group for the channel, or a channel, for which the supergroup is the designated direct messages group; 0 if none.
/// * [slowModeDelay]: Delay between consecutive sent messages for non-administrator supergroup members, in seconds.
/// * [slowModeDelayExpiresIn]: Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero.
/// * [canEnablePaidMessages]: True, if paid messages can be enabled in the supergroup chat; for supergroup only.
/// * [canEnablePaidReaction]: True, if paid reaction can be enabled in the channel chat; for channels only.
/// * [canGetMembers]: True, if members of the chat can be retrieved via getSupergroupMembers or searchChatMembers.
/// * [hasHiddenMembers]: True, if non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers.
/// * [canHideMembers]: True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators.
/// * [canSetStickerSet]: True, if the supergroup sticker set can be changed.
/// * [canSetLocation]: True, if the supergroup location can be changed.
/// * [canGetStatistics]: True, if the supergroup or channel statistics are available.
/// * [canGetRevenueStatistics]: True, if the supergroup or channel revenue statistics are available.
/// * [canGetStarRevenueStatistics]: True, if the supergroup or channel Telegram Star revenue statistics are available.
/// * [canSendGift]: True, if the user can send a gift to the supergroup or channel using sendGift or transferGift.
/// * [canToggleAggressiveAntiSpam]: True, if aggressive anti-spam checks can be enabled or disabled in the supergroup.
/// * [isAllHistoryAvailable]: True, if new chat members will have access to old messages. In public, discussion, or forum groups and all channels, old messages are always available,. so this option affects only private non-forum supergroups without a linked chat. The value of this field is only available to chat administrators.
/// * [canHaveSponsoredMessages]: True, if the chat can have sponsored messages. The value of this field is only available to the owner of the chat.
/// * [hasAggressiveAntiSpamEnabled]: True, if aggressive anti-spam checks are enabled in the supergroup. The value of this field is only available to chat administrators.
/// * [hasPaidMediaAllowed]: True, if paid media can be sent and forwarded to the channel chat; for channels only.
/// * [hasPinnedStories]: True, if the supergroup or channel has pinned stories.
/// * [giftCount]: Number of saved to profile gifts for channels without can_post_messages administrator right, otherwise, the total number of received gifts.
/// * [myBoostCount]: Number of times the current user boosted the supergroup or channel.
/// * [unrestrictBoostCount]: Number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; 0 if unspecified.
/// * [outgoingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the current user for each sent message to the supergroup.
/// * [stickerSetId]: Identifier of the supergroup sticker set that must be shown before user sticker sets; 0 if none.
/// * [customEmojiStickerSetId]: Identifier of the custom emoji sticker set that can be used in the supergroup without Telegram Premium subscription; 0 if none.
/// * [location]: Location to which the supergroup is connected; may be null if none *(optional)*.
/// * [inviteLink]: Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only *(optional)*.
/// * [guardBotUserId]: User identifier of the guard bot in the group; for chat administrators only.
/// * [botCommands]: List of commands of bots in the group.
/// * [botVerification]: Information about verification status of the supergroup or the channel provided by a bot; may be null if none or unknown *(optional)*.
/// * [mainProfileTab]: The main tab chosen by the administrators of the channel; may be null if not chosen manually *(optional)*.
/// * [shareTheme]: Theme of the screen for sharing a link to the supergroup or the channel; may be null if the default theme is used *(optional)*.
/// * [upgradedFromBasicGroupId]: Identifier of the basic group from which supergroup was upgraded; 0 if none.
/// * [upgradedFromMaxMessageId]: Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none.
final class SupergroupFullInfo extends TdObject {
  /// **SupergroupFullInfo** *(supergroupFullInfo)* - basic class
  ///
  /// Contains full information about a supergroup or channel.
  ///
  /// * [photo]: Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo *(optional)*.
  /// * [communityId]: Identifier of the community to which the corresponding chat was added.
  /// * [description]: Supergroup or channel description.
  /// * [memberCount]: Number of members in the supergroup or channel; 0 if unknown.
  /// * [administratorCount]: Number of privileged users in the supergroup or channel; 0 if unknown.
  /// * [restrictedCount]: Number of restricted users in the supergroup; 0 if unknown.
  /// * [bannedCount]: Number of users banned from chat; 0 if unknown.
  /// * [linkedChatId]: Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown.
  /// * [directMessagesChatId]: Chat identifier of a direct messages group for the channel, or a channel, for which the supergroup is the designated direct messages group; 0 if none.
  /// * [slowModeDelay]: Delay between consecutive sent messages for non-administrator supergroup members, in seconds.
  /// * [slowModeDelayExpiresIn]: Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero.
  /// * [canEnablePaidMessages]: True, if paid messages can be enabled in the supergroup chat; for supergroup only.
  /// * [canEnablePaidReaction]: True, if paid reaction can be enabled in the channel chat; for channels only.
  /// * [canGetMembers]: True, if members of the chat can be retrieved via getSupergroupMembers or searchChatMembers.
  /// * [hasHiddenMembers]: True, if non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers.
  /// * [canHideMembers]: True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators.
  /// * [canSetStickerSet]: True, if the supergroup sticker set can be changed.
  /// * [canSetLocation]: True, if the supergroup location can be changed.
  /// * [canGetStatistics]: True, if the supergroup or channel statistics are available.
  /// * [canGetRevenueStatistics]: True, if the supergroup or channel revenue statistics are available.
  /// * [canGetStarRevenueStatistics]: True, if the supergroup or channel Telegram Star revenue statistics are available.
  /// * [canSendGift]: True, if the user can send a gift to the supergroup or channel using sendGift or transferGift.
  /// * [canToggleAggressiveAntiSpam]: True, if aggressive anti-spam checks can be enabled or disabled in the supergroup.
  /// * [isAllHistoryAvailable]: True, if new chat members will have access to old messages. In public, discussion, or forum groups and all channels, old messages are always available,. so this option affects only private non-forum supergroups without a linked chat. The value of this field is only available to chat administrators.
  /// * [canHaveSponsoredMessages]: True, if the chat can have sponsored messages. The value of this field is only available to the owner of the chat.
  /// * [hasAggressiveAntiSpamEnabled]: True, if aggressive anti-spam checks are enabled in the supergroup. The value of this field is only available to chat administrators.
  /// * [hasPaidMediaAllowed]: True, if paid media can be sent and forwarded to the channel chat; for channels only.
  /// * [hasPinnedStories]: True, if the supergroup or channel has pinned stories.
  /// * [giftCount]: Number of saved to profile gifts for channels without can_post_messages administrator right, otherwise, the total number of received gifts.
  /// * [myBoostCount]: Number of times the current user boosted the supergroup or channel.
  /// * [unrestrictBoostCount]: Number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; 0 if unspecified.
  /// * [outgoingPaidMessageStarCount]: Number of Telegram Stars that must be paid by the current user for each sent message to the supergroup.
  /// * [stickerSetId]: Identifier of the supergroup sticker set that must be shown before user sticker sets; 0 if none.
  /// * [customEmojiStickerSetId]: Identifier of the custom emoji sticker set that can be used in the supergroup without Telegram Premium subscription; 0 if none.
  /// * [location]: Location to which the supergroup is connected; may be null if none *(optional)*.
  /// * [inviteLink]: Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only *(optional)*.
  /// * [guardBotUserId]: User identifier of the guard bot in the group; for chat administrators only.
  /// * [botCommands]: List of commands of bots in the group.
  /// * [botVerification]: Information about verification status of the supergroup or the channel provided by a bot; may be null if none or unknown *(optional)*.
  /// * [mainProfileTab]: The main tab chosen by the administrators of the channel; may be null if not chosen manually *(optional)*.
  /// * [shareTheme]: Theme of the screen for sharing a link to the supergroup or the channel; may be null if the default theme is used *(optional)*.
  /// * [upgradedFromBasicGroupId]: Identifier of the basic group from which supergroup was upgraded; 0 if none.
  /// * [upgradedFromMaxMessageId]: Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none.
  const SupergroupFullInfo({
    this.photo,
    required this.communityId,
    required this.description,
    required this.memberCount,
    required this.administratorCount,
    required this.restrictedCount,
    required this.bannedCount,
    required this.linkedChatId,
    required this.directMessagesChatId,
    required this.slowModeDelay,
    required this.slowModeDelayExpiresIn,
    required this.canEnablePaidMessages,
    required this.canEnablePaidReaction,
    required this.canGetMembers,
    required this.hasHiddenMembers,
    required this.canHideMembers,
    required this.canSetStickerSet,
    required this.canSetLocation,
    required this.canGetStatistics,
    required this.canGetRevenueStatistics,
    required this.canGetStarRevenueStatistics,
    required this.canSendGift,
    required this.canToggleAggressiveAntiSpam,
    required this.isAllHistoryAvailable,
    required this.canHaveSponsoredMessages,
    required this.hasAggressiveAntiSpamEnabled,
    required this.hasPaidMediaAllowed,
    required this.hasPinnedStories,
    required this.giftCount,
    required this.myBoostCount,
    required this.unrestrictBoostCount,
    required this.outgoingPaidMessageStarCount,
    required this.stickerSetId,
    required this.customEmojiStickerSetId,
    this.location,
    this.inviteLink,
    required this.guardBotUserId,
    required this.botCommands,
    this.botVerification,
    this.mainProfileTab,
    this.shareTheme,
    required this.upgradedFromBasicGroupId,
    required this.upgradedFromMaxMessageId,
    this.extra,
    this.clientId,
  });

  /// Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
  final ChatPhoto? photo;

  /// Identifier of the community to which the corresponding chat was added
  final int communityId;

  /// Supergroup or channel description
  final String description;

  /// Number of members in the supergroup or channel; 0 if unknown
  final int memberCount;

  /// Number of privileged users in the supergroup or channel; 0 if unknown
  final int administratorCount;

  /// Number of restricted users in the supergroup; 0 if unknown
  final int restrictedCount;

  /// Number of users banned from chat; 0 if unknown
  final int bannedCount;

  /// Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
  final int linkedChatId;

  /// Chat identifier of a direct messages group for the channel, or a channel, for which the supergroup is the designated direct messages group; 0 if none
  final int directMessagesChatId;

  /// Delay between consecutive sent messages for non-administrator supergroup members, in seconds
  final int slowModeDelay;

  /// Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
  final double slowModeDelayExpiresIn;

  /// True, if paid messages can be enabled in the supergroup chat; for supergroup only
  final bool canEnablePaidMessages;

  /// True, if paid reaction can be enabled in the channel chat; for channels only
  final bool canEnablePaidReaction;

  /// True, if members of the chat can be retrieved via getSupergroupMembers or searchChatMembers
  final bool canGetMembers;

  /// True, if non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers
  final bool hasHiddenMembers;

  /// True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators
  final bool canHideMembers;

  /// True, if the supergroup sticker set can be changed
  final bool canSetStickerSet;

  /// True, if the supergroup location can be changed
  final bool canSetLocation;

  /// True, if the supergroup or channel statistics are available
  final bool canGetStatistics;

  /// True, if the supergroup or channel revenue statistics are available
  final bool canGetRevenueStatistics;

  /// True, if the supergroup or channel Telegram Star revenue statistics are available
  final bool canGetStarRevenueStatistics;

  /// True, if the user can send a gift to the supergroup or channel using sendGift or transferGift
  final bool canSendGift;

  /// True, if aggressive anti-spam checks can be enabled or disabled in the supergroup
  final bool canToggleAggressiveAntiSpam;

  /// True, if new chat members will have access to old messages. In public, discussion, or forum groups and all channels, old messages are always available,. so this option affects only private non-forum supergroups without a linked chat. The value of this field is only available to chat administrators
  final bool isAllHistoryAvailable;

  /// True, if the chat can have sponsored messages. The value of this field is only available to the owner of the chat
  final bool canHaveSponsoredMessages;

  /// True, if aggressive anti-spam checks are enabled in the supergroup. The value of this field is only available to chat administrators
  final bool hasAggressiveAntiSpamEnabled;

  /// True, if paid media can be sent and forwarded to the channel chat; for channels only
  final bool hasPaidMediaAllowed;

  /// True, if the supergroup or channel has pinned stories
  final bool hasPinnedStories;

  /// Number of saved to profile gifts for channels without can_post_messages administrator right, otherwise, the total number of received gifts
  final int giftCount;

  /// Number of times the current user boosted the supergroup or channel
  final int myBoostCount;

  /// Number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; 0 if unspecified
  final int unrestrictBoostCount;

  /// Number of Telegram Stars that must be paid by the current user for each sent message to the supergroup
  final int outgoingPaidMessageStarCount;

  /// Identifier of the supergroup sticker set that must be shown before user sticker sets; 0 if none
  final int stickerSetId;

  /// Identifier of the custom emoji sticker set that can be used in the supergroup without Telegram Premium subscription; 0 if none
  final int customEmojiStickerSetId;

  /// Location to which the supergroup is connected; may be null if none
  final ChatLocation? location;

  /// Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only
  final ChatInviteLink? inviteLink;

  /// User identifier of the guard bot in the group; for chat administrators only
  final int guardBotUserId;

  /// List of commands of bots in the group
  final List<BotCommands> botCommands;

  /// Information about verification status of the supergroup or the channel provided by a bot; may be null if none or unknown
  final BotVerification? botVerification;

  /// The main tab chosen by the administrators of the channel; may be null if not chosen manually
  final ProfileTab? mainProfileTab;

  /// Theme of the screen for sharing a link to the supergroup or the channel; may be null if the default theme is used
  final ProfileShareTheme? shareTheme;

  /// Identifier of the basic group from which supergroup was upgraded; 0 if none
  final int upgradedFromBasicGroupId;

  /// Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
  final int upgradedFromMaxMessageId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory SupergroupFullInfo.fromJson(Map<String, dynamic> json) =>
      SupergroupFullInfo(
        photo: json['photo'] == null ? null : ChatPhoto.fromJson(json['photo']),
        communityId: json['community_id'],
        description: json['description'],
        memberCount: json['member_count'],
        administratorCount: json['administrator_count'],
        restrictedCount: json['restricted_count'],
        bannedCount: json['banned_count'],
        linkedChatId: json['linked_chat_id'] ?? 0,
        directMessagesChatId: json['direct_messages_chat_id'] ?? 0,
        slowModeDelay: json['slow_mode_delay'],
        slowModeDelayExpiresIn: json['slow_mode_delay_expires_in'],
        canEnablePaidMessages: json['can_enable_paid_messages'],
        canEnablePaidReaction: json['can_enable_paid_reaction'],
        canGetMembers: json['can_get_members'],
        hasHiddenMembers: json['has_hidden_members'],
        canHideMembers: json['can_hide_members'],
        canSetStickerSet: json['can_set_sticker_set'],
        canSetLocation: json['can_set_location'],
        canGetStatistics: json['can_get_statistics'],
        canGetRevenueStatistics: json['can_get_revenue_statistics'],
        canGetStarRevenueStatistics: json['can_get_star_revenue_statistics'],
        canSendGift: json['can_send_gift'],
        canToggleAggressiveAntiSpam: json['can_toggle_aggressive_anti_spam'],
        isAllHistoryAvailable: json['is_all_history_available'],
        canHaveSponsoredMessages: json['can_have_sponsored_messages'],
        hasAggressiveAntiSpamEnabled: json['has_aggressive_anti_spam_enabled'],
        hasPaidMediaAllowed: json['has_paid_media_allowed'],
        hasPinnedStories: json['has_pinned_stories'],
        giftCount: json['gift_count'],
        myBoostCount: json['my_boost_count'],
        unrestrictBoostCount: json['unrestrict_boost_count'],
        outgoingPaidMessageStarCount: json['outgoing_paid_message_star_count'],
        stickerSetId: json['sticker_set_id'] is int
            ? json['sticker_set_id']
            : int.tryParse(json['sticker_set_id'] ?? "") ?? 0,
        customEmojiStickerSetId: json['custom_emoji_sticker_set_id'] is int
            ? json['custom_emoji_sticker_set_id']
            : int.tryParse(json['custom_emoji_sticker_set_id'] ?? "") ?? 0,
        location: json['location'] == null
            ? null
            : ChatLocation.fromJson(json['location']),
        inviteLink: json['invite_link'] == null
            ? null
            : ChatInviteLink.fromJson(json['invite_link']),
        guardBotUserId: json['guard_bot_user_id'],
        botCommands: List<BotCommands>.from((json['bot_commands'] ?? [])
            .map((item) => BotCommands.fromJson(item))
            .toList()),
        botVerification: json['bot_verification'] == null
            ? null
            : BotVerification.fromJson(json['bot_verification']),
        mainProfileTab: json['main_profile_tab'] == null
            ? null
            : ProfileTab.fromJson(json['main_profile_tab']),
        shareTheme: json['share_theme'] == null
            ? null
            : ProfileShareTheme.fromJson(json['share_theme']),
        upgradedFromBasicGroupId: json['upgraded_from_basic_group_id'] ?? 0,
        upgradedFromMaxMessageId: json['upgraded_from_max_message_id'] ?? 0,
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo?.toJson(),
      "community_id": communityId,
      "description": description,
      "member_count": memberCount,
      "administrator_count": administratorCount,
      "restricted_count": restrictedCount,
      "banned_count": bannedCount,
      "linked_chat_id": linkedChatId,
      "direct_messages_chat_id": directMessagesChatId,
      "slow_mode_delay": slowModeDelay,
      "slow_mode_delay_expires_in": slowModeDelayExpiresIn,
      "can_enable_paid_messages": canEnablePaidMessages,
      "can_enable_paid_reaction": canEnablePaidReaction,
      "can_get_members": canGetMembers,
      "has_hidden_members": hasHiddenMembers,
      "can_hide_members": canHideMembers,
      "can_set_sticker_set": canSetStickerSet,
      "can_set_location": canSetLocation,
      "can_get_statistics": canGetStatistics,
      "can_get_revenue_statistics": canGetRevenueStatistics,
      "can_get_star_revenue_statistics": canGetStarRevenueStatistics,
      "can_send_gift": canSendGift,
      "can_toggle_aggressive_anti_spam": canToggleAggressiveAntiSpam,
      "is_all_history_available": isAllHistoryAvailable,
      "can_have_sponsored_messages": canHaveSponsoredMessages,
      "has_aggressive_anti_spam_enabled": hasAggressiveAntiSpamEnabled,
      "has_paid_media_allowed": hasPaidMediaAllowed,
      "has_pinned_stories": hasPinnedStories,
      "gift_count": giftCount,
      "my_boost_count": myBoostCount,
      "unrestrict_boost_count": unrestrictBoostCount,
      "outgoing_paid_message_star_count": outgoingPaidMessageStarCount,
      "sticker_set_id": stickerSetId,
      "custom_emoji_sticker_set_id": customEmojiStickerSetId,
      "location": location?.toJson(),
      "invite_link": inviteLink?.toJson(),
      "guard_bot_user_id": guardBotUserId,
      "bot_commands": botCommands.map((i) => i.toJson()).toList(),
      "bot_verification": botVerification?.toJson(),
      "main_profile_tab": mainProfileTab?.toJson(),
      "share_theme": shareTheme?.toJson(),
      "upgraded_from_basic_group_id": upgradedFromBasicGroupId,
      "upgraded_from_max_message_id": upgradedFromMaxMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Chat photo; may be null if empty or unknown. If non-null, then it is the same photo as in chat.photo
  /// * [community_id]: Identifier of the community to which the corresponding chat was added
  /// * [description]: Supergroup or channel description
  /// * [member_count]: Number of members in the supergroup or channel; 0 if unknown
  /// * [administrator_count]: Number of privileged users in the supergroup or channel; 0 if unknown
  /// * [restricted_count]: Number of restricted users in the supergroup; 0 if unknown
  /// * [banned_count]: Number of users banned from chat; 0 if unknown
  /// * [linked_chat_id]: Chat identifier of a discussion group for the channel, or a channel, for which the supergroup is the designated discussion group; 0 if none or unknown
  /// * [direct_messages_chat_id]: Chat identifier of a direct messages group for the channel, or a channel, for which the supergroup is the designated direct messages group; 0 if none
  /// * [slow_mode_delay]: Delay between consecutive sent messages for non-administrator supergroup members, in seconds
  /// * [slow_mode_delay_expires_in]: Time left before next message can be sent in the supergroup, in seconds. An updateSupergroupFullInfo update is not triggered when value of this field changes, but both new and old values are non-zero
  /// * [can_enable_paid_messages]: True, if paid messages can be enabled in the supergroup chat; for supergroup only
  /// * [can_enable_paid_reaction]: True, if paid reaction can be enabled in the channel chat; for channels only
  /// * [can_get_members]: True, if members of the chat can be retrieved via getSupergroupMembers or searchChatMembers
  /// * [has_hidden_members]: True, if non-administrators can receive only administrators and bots using getSupergroupMembers or searchChatMembers
  /// * [can_hide_members]: True, if non-administrators and non-bots can be hidden in responses to getSupergroupMembers and searchChatMembers for non-administrators
  /// * [can_set_sticker_set]: True, if the supergroup sticker set can be changed
  /// * [can_set_location]: True, if the supergroup location can be changed
  /// * [can_get_statistics]: True, if the supergroup or channel statistics are available
  /// * [can_get_revenue_statistics]: True, if the supergroup or channel revenue statistics are available
  /// * [can_get_star_revenue_statistics]: True, if the supergroup or channel Telegram Star revenue statistics are available
  /// * [can_send_gift]: True, if the user can send a gift to the supergroup or channel using sendGift or transferGift
  /// * [can_toggle_aggressive_anti_spam]: True, if aggressive anti-spam checks can be enabled or disabled in the supergroup
  /// * [is_all_history_available]: True, if new chat members will have access to old messages. In public, discussion, or forum groups and all channels, old messages are always available,. so this option affects only private non-forum supergroups without a linked chat. The value of this field is only available to chat administrators
  /// * [can_have_sponsored_messages]: True, if the chat can have sponsored messages. The value of this field is only available to the owner of the chat
  /// * [has_aggressive_anti_spam_enabled]: True, if aggressive anti-spam checks are enabled in the supergroup. The value of this field is only available to chat administrators
  /// * [has_paid_media_allowed]: True, if paid media can be sent and forwarded to the channel chat; for channels only
  /// * [has_pinned_stories]: True, if the supergroup or channel has pinned stories
  /// * [gift_count]: Number of saved to profile gifts for channels without can_post_messages administrator right, otherwise, the total number of received gifts
  /// * [my_boost_count]: Number of times the current user boosted the supergroup or channel
  /// * [unrestrict_boost_count]: Number of times the supergroup must be boosted by a user to ignore slow mode and chat permission restrictions; 0 if unspecified
  /// * [outgoing_paid_message_star_count]: Number of Telegram Stars that must be paid by the current user for each sent message to the supergroup
  /// * [sticker_set_id]: Identifier of the supergroup sticker set that must be shown before user sticker sets; 0 if none
  /// * [custom_emoji_sticker_set_id]: Identifier of the custom emoji sticker set that can be used in the supergroup without Telegram Premium subscription; 0 if none
  /// * [location]: Location to which the supergroup is connected; may be null if none
  /// * [invite_link]: Primary invite link for the chat; may be null. For chat administrators with can_invite_users right only
  /// * [guard_bot_user_id]: User identifier of the guard bot in the group; for chat administrators only
  /// * [bot_commands]: List of commands of bots in the group
  /// * [bot_verification]: Information about verification status of the supergroup or the channel provided by a bot; may be null if none or unknown
  /// * [main_profile_tab]: The main tab chosen by the administrators of the channel; may be null if not chosen manually
  /// * [share_theme]: Theme of the screen for sharing a link to the supergroup or the channel; may be null if the default theme is used
  /// * [upgraded_from_basic_group_id]: Identifier of the basic group from which supergroup was upgraded; 0 if none
  /// * [upgraded_from_max_message_id]: Identifier of the last message in the basic group from which supergroup was upgraded; 0 if none
  SupergroupFullInfo copyWith({
    ChatPhoto? photo,
    int? communityId,
    String? description,
    int? memberCount,
    int? administratorCount,
    int? restrictedCount,
    int? bannedCount,
    int? linkedChatId,
    int? directMessagesChatId,
    int? slowModeDelay,
    double? slowModeDelayExpiresIn,
    bool? canEnablePaidMessages,
    bool? canEnablePaidReaction,
    bool? canGetMembers,
    bool? hasHiddenMembers,
    bool? canHideMembers,
    bool? canSetStickerSet,
    bool? canSetLocation,
    bool? canGetStatistics,
    bool? canGetRevenueStatistics,
    bool? canGetStarRevenueStatistics,
    bool? canSendGift,
    bool? canToggleAggressiveAntiSpam,
    bool? isAllHistoryAvailable,
    bool? canHaveSponsoredMessages,
    bool? hasAggressiveAntiSpamEnabled,
    bool? hasPaidMediaAllowed,
    bool? hasPinnedStories,
    int? giftCount,
    int? myBoostCount,
    int? unrestrictBoostCount,
    int? outgoingPaidMessageStarCount,
    int? stickerSetId,
    int? customEmojiStickerSetId,
    ChatLocation? location,
    ChatInviteLink? inviteLink,
    int? guardBotUserId,
    List<BotCommands>? botCommands,
    BotVerification? botVerification,
    ProfileTab? mainProfileTab,
    ProfileShareTheme? shareTheme,
    int? upgradedFromBasicGroupId,
    int? upgradedFromMaxMessageId,
    dynamic extra,
    int? clientId,
  }) =>
      SupergroupFullInfo(
        photo: photo ?? this.photo,
        communityId: communityId ?? this.communityId,
        description: description ?? this.description,
        memberCount: memberCount ?? this.memberCount,
        administratorCount: administratorCount ?? this.administratorCount,
        restrictedCount: restrictedCount ?? this.restrictedCount,
        bannedCount: bannedCount ?? this.bannedCount,
        linkedChatId: linkedChatId ?? this.linkedChatId,
        directMessagesChatId: directMessagesChatId ?? this.directMessagesChatId,
        slowModeDelay: slowModeDelay ?? this.slowModeDelay,
        slowModeDelayExpiresIn:
            slowModeDelayExpiresIn ?? this.slowModeDelayExpiresIn,
        canEnablePaidMessages:
            canEnablePaidMessages ?? this.canEnablePaidMessages,
        canEnablePaidReaction:
            canEnablePaidReaction ?? this.canEnablePaidReaction,
        canGetMembers: canGetMembers ?? this.canGetMembers,
        hasHiddenMembers: hasHiddenMembers ?? this.hasHiddenMembers,
        canHideMembers: canHideMembers ?? this.canHideMembers,
        canSetStickerSet: canSetStickerSet ?? this.canSetStickerSet,
        canSetLocation: canSetLocation ?? this.canSetLocation,
        canGetStatistics: canGetStatistics ?? this.canGetStatistics,
        canGetRevenueStatistics:
            canGetRevenueStatistics ?? this.canGetRevenueStatistics,
        canGetStarRevenueStatistics:
            canGetStarRevenueStatistics ?? this.canGetStarRevenueStatistics,
        canSendGift: canSendGift ?? this.canSendGift,
        canToggleAggressiveAntiSpam:
            canToggleAggressiveAntiSpam ?? this.canToggleAggressiveAntiSpam,
        isAllHistoryAvailable:
            isAllHistoryAvailable ?? this.isAllHistoryAvailable,
        canHaveSponsoredMessages:
            canHaveSponsoredMessages ?? this.canHaveSponsoredMessages,
        hasAggressiveAntiSpamEnabled:
            hasAggressiveAntiSpamEnabled ?? this.hasAggressiveAntiSpamEnabled,
        hasPaidMediaAllowed: hasPaidMediaAllowed ?? this.hasPaidMediaAllowed,
        hasPinnedStories: hasPinnedStories ?? this.hasPinnedStories,
        giftCount: giftCount ?? this.giftCount,
        myBoostCount: myBoostCount ?? this.myBoostCount,
        unrestrictBoostCount: unrestrictBoostCount ?? this.unrestrictBoostCount,
        outgoingPaidMessageStarCount:
            outgoingPaidMessageStarCount ?? this.outgoingPaidMessageStarCount,
        stickerSetId: stickerSetId ?? this.stickerSetId,
        customEmojiStickerSetId:
            customEmojiStickerSetId ?? this.customEmojiStickerSetId,
        location: location ?? this.location,
        inviteLink: inviteLink ?? this.inviteLink,
        guardBotUserId: guardBotUserId ?? this.guardBotUserId,
        botCommands: botCommands ?? this.botCommands,
        botVerification: botVerification ?? this.botVerification,
        mainProfileTab: mainProfileTab ?? this.mainProfileTab,
        shareTheme: shareTheme ?? this.shareTheme,
        upgradedFromBasicGroupId:
            upgradedFromBasicGroupId ?? this.upgradedFromBasicGroupId,
        upgradedFromMaxMessageId:
            upgradedFromMaxMessageId ?? this.upgradedFromMaxMessageId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroupFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
