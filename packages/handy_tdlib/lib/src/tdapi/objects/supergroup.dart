part of '../tdapi.dart';

/// **Supergroup** *(supergroup)* - basic class
///
/// Represents a supergroup or channel with zero or more members (subscribers in the case of channels).
///
/// * [id]: Supergroup or channel identifier.
/// * [usernames]: Usernames of the supergroup or channel; may be null *(optional)*.
/// * [date]: Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member.
/// * [status]: Status of the current user in the supergroup or channel.
/// * [memberCount]: Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received through. getChatSimilarChats, getChatsToPostStories, getCreatedPublicChats, getGroupsInCommon, getInactiveSupergroupChats, getRecommendedChats, getSuitableDiscussionChats,. getUserPrivacySettingRules, getVideoChatAvailableParticipants, searchPublicChats, or in chatFolderInviteLinkInfo.missing_chat_ids, or in userFullInfo.personal_chat_id,. or for chats with messages or stories from publicForwards and foundStories.
/// * [boostLevel]: Approximate boost level for the chat.
/// * [hasAutomaticTranslation]: True, if automatic translation of messages is enabled in the channel.
/// * [hasLinkedChat]: True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel.
/// * [hasLocation]: True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup.
/// * [signMessages]: True, if messages sent to the channel contains name of the sender. This field is only applicable to channels.
/// * [showMessageSender]: True, if messages sent to the channel have information about the sender user. This field is only applicable to channels.
/// * [joinToSendMessages]: True, if users need to join the supergroup before they can send messages. May be false only for discussion supergroups and channel direct messages groups.
/// * [joinByRequest]: True, if all users directly joining the supergroup need to be approved by supergroup administrators.
/// * [isSlowModeEnabled]: True, if the slow mode is enabled in the supergroup.
/// * [isChannel]: True, if the supergroup is a channel, which can have an unlimited number of subscribers, but only administrators can post there and see the list of subscribers.
/// * [isBroadcastGroup]: True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members.
/// * [isForum]: True, if the supergroup is a forum with topics.
/// * [isDirectMessagesGroup]: True, if the supergroup is a direct message group for a channel chat.
/// * [isAdministeredDirectMessagesGroup]: True, if the supergroup is a direct messages group for a channel chat that is administered by the current user.
/// * [verificationStatus]: Information about verification status of the supergroup or channel; may be null if none *(optional)*.
/// * [hasDirectMessagesGroup]: True, if the channel has direct messages group.
/// * [hasForumTabs]: True, if the supergroup is a forum, which topics are shown in the same way as in channel direct messages groups.
/// * [restrictionInfo]: Information about the restrictions that must be applied to the corresponding supergroup or channel chat; may be null if none *(optional)*.
/// * [paidMessageStarCount]: Number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message.
/// * [activeStoryState]: State of active stories of the supergroup or channel; may be null if there are no active stories *(optional)*.
final class Supergroup extends TdObject {
  /// **Supergroup** *(supergroup)* - basic class
  ///
  /// Represents a supergroup or channel with zero or more members (subscribers in the case of channels).
  ///
  /// * [id]: Supergroup or channel identifier.
  /// * [usernames]: Usernames of the supergroup or channel; may be null *(optional)*.
  /// * [date]: Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member.
  /// * [status]: Status of the current user in the supergroup or channel.
  /// * [memberCount]: Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received through. getChatSimilarChats, getChatsToPostStories, getCreatedPublicChats, getGroupsInCommon, getInactiveSupergroupChats, getRecommendedChats, getSuitableDiscussionChats,. getUserPrivacySettingRules, getVideoChatAvailableParticipants, searchPublicChats, or in chatFolderInviteLinkInfo.missing_chat_ids, or in userFullInfo.personal_chat_id,. or for chats with messages or stories from publicForwards and foundStories.
  /// * [boostLevel]: Approximate boost level for the chat.
  /// * [hasAutomaticTranslation]: True, if automatic translation of messages is enabled in the channel.
  /// * [hasLinkedChat]: True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel.
  /// * [hasLocation]: True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup.
  /// * [signMessages]: True, if messages sent to the channel contains name of the sender. This field is only applicable to channels.
  /// * [showMessageSender]: True, if messages sent to the channel have information about the sender user. This field is only applicable to channels.
  /// * [joinToSendMessages]: True, if users need to join the supergroup before they can send messages. May be false only for discussion supergroups and channel direct messages groups.
  /// * [joinByRequest]: True, if all users directly joining the supergroup need to be approved by supergroup administrators.
  /// * [isSlowModeEnabled]: True, if the slow mode is enabled in the supergroup.
  /// * [isChannel]: True, if the supergroup is a channel, which can have an unlimited number of subscribers, but only administrators can post there and see the list of subscribers.
  /// * [isBroadcastGroup]: True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members.
  /// * [isForum]: True, if the supergroup is a forum with topics.
  /// * [isDirectMessagesGroup]: True, if the supergroup is a direct message group for a channel chat.
  /// * [isAdministeredDirectMessagesGroup]: True, if the supergroup is a direct messages group for a channel chat that is administered by the current user.
  /// * [verificationStatus]: Information about verification status of the supergroup or channel; may be null if none *(optional)*.
  /// * [hasDirectMessagesGroup]: True, if the channel has direct messages group.
  /// * [hasForumTabs]: True, if the supergroup is a forum, which topics are shown in the same way as in channel direct messages groups.
  /// * [restrictionInfo]: Information about the restrictions that must be applied to the corresponding supergroup or channel chat; may be null if none *(optional)*.
  /// * [paidMessageStarCount]: Number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message.
  /// * [activeStoryState]: State of active stories of the supergroup or channel; may be null if there are no active stories *(optional)*.
  const Supergroup({
    required this.id,
    this.usernames,
    required this.date,
    required this.status,
    required this.memberCount,
    required this.boostLevel,
    required this.hasAutomaticTranslation,
    required this.hasLinkedChat,
    required this.hasLocation,
    required this.signMessages,
    required this.showMessageSender,
    required this.joinToSendMessages,
    required this.joinByRequest,
    required this.isSlowModeEnabled,
    required this.isChannel,
    required this.isBroadcastGroup,
    required this.isForum,
    required this.isDirectMessagesGroup,
    required this.isAdministeredDirectMessagesGroup,
    this.verificationStatus,
    required this.hasDirectMessagesGroup,
    required this.hasForumTabs,
    this.restrictionInfo,
    required this.paidMessageStarCount,
    this.activeStoryState,
    this.extra,
    this.clientId,
  });

  /// Supergroup or channel identifier
  final int id;

  /// Usernames of the supergroup or channel; may be null
  final Usernames? usernames;

  /// Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
  final int date;

  /// Status of the current user in the supergroup or channel
  final ChatMemberStatus status;

  /// Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received through. getChatSimilarChats, getChatsToPostStories, getCreatedPublicChats, getGroupsInCommon, getInactiveSupergroupChats, getRecommendedChats, getSuitableDiscussionChats,. getUserPrivacySettingRules, getVideoChatAvailableParticipants, searchPublicChats, or in chatFolderInviteLinkInfo.missing_chat_ids, or in userFullInfo.personal_chat_id,. or for chats with messages or stories from publicForwards and foundStories
  final int memberCount;

  /// Approximate boost level for the chat
  final int boostLevel;

  /// True, if automatic translation of messages is enabled in the channel
  final bool hasAutomaticTranslation;

  /// True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
  final bool hasLinkedChat;

  /// True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
  final bool hasLocation;

  /// True, if messages sent to the channel contains name of the sender. This field is only applicable to channels
  final bool signMessages;

  /// True, if messages sent to the channel have information about the sender user. This field is only applicable to channels
  final bool showMessageSender;

  /// True, if users need to join the supergroup before they can send messages. May be false only for discussion supergroups and channel direct messages groups
  final bool joinToSendMessages;

  /// True, if all users directly joining the supergroup need to be approved by supergroup administrators
  final bool joinByRequest;

  /// True, if the slow mode is enabled in the supergroup
  final bool isSlowModeEnabled;

  /// True, if the supergroup is a channel, which can have an unlimited number of subscribers, but only administrators can post there and see the list of subscribers
  final bool isChannel;

  /// True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members
  final bool isBroadcastGroup;

  /// True, if the supergroup is a forum with topics
  final bool isForum;

  /// True, if the supergroup is a direct message group for a channel chat
  final bool isDirectMessagesGroup;

  /// True, if the supergroup is a direct messages group for a channel chat that is administered by the current user
  final bool isAdministeredDirectMessagesGroup;

  /// Information about verification status of the supergroup or channel; may be null if none
  final VerificationStatus? verificationStatus;

  /// True, if the channel has direct messages group
  final bool hasDirectMessagesGroup;

  /// True, if the supergroup is a forum, which topics are shown in the same way as in channel direct messages groups
  final bool hasForumTabs;

  /// Information about the restrictions that must be applied to the corresponding supergroup or channel chat; may be null if none
  final RestrictionInfo? restrictionInfo;

  /// Number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
  final int paidMessageStarCount;

  /// State of active stories of the supergroup or channel; may be null if there are no active stories
  final ActiveStoryState? activeStoryState;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Supergroup.fromJson(Map<String, dynamic> json) => Supergroup(
        id: json['id'],
        usernames: json['usernames'] == null
            ? null
            : Usernames.fromJson(json['usernames']),
        date: json['date'],
        status: ChatMemberStatus.fromJson(json['status']),
        memberCount: json['member_count'],
        boostLevel: json['boost_level'],
        hasAutomaticTranslation: json['has_automatic_translation'],
        hasLinkedChat: json['has_linked_chat'],
        hasLocation: json['has_location'],
        signMessages: json['sign_messages'],
        showMessageSender: json['show_message_sender'],
        joinToSendMessages: json['join_to_send_messages'],
        joinByRequest: json['join_by_request'],
        isSlowModeEnabled: json['is_slow_mode_enabled'],
        isChannel: json['is_channel'],
        isBroadcastGroup: json['is_broadcast_group'],
        isForum: json['is_forum'],
        isDirectMessagesGroup: json['is_direct_messages_group'],
        isAdministeredDirectMessagesGroup:
            json['is_administered_direct_messages_group'],
        verificationStatus: json['verification_status'] == null
            ? null
            : VerificationStatus.fromJson(json['verification_status']),
        hasDirectMessagesGroup: json['has_direct_messages_group'],
        hasForumTabs: json['has_forum_tabs'],
        restrictionInfo: json['restriction_info'] == null
            ? null
            : RestrictionInfo.fromJson(json['restriction_info']),
        paidMessageStarCount: json['paid_message_star_count'],
        activeStoryState: json['active_story_state'] == null
            ? null
            : ActiveStoryState.fromJson(json['active_story_state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "usernames": usernames?.toJson(),
      "date": date,
      "status": status.toJson(),
      "member_count": memberCount,
      "boost_level": boostLevel,
      "has_automatic_translation": hasAutomaticTranslation,
      "has_linked_chat": hasLinkedChat,
      "has_location": hasLocation,
      "sign_messages": signMessages,
      "show_message_sender": showMessageSender,
      "join_to_send_messages": joinToSendMessages,
      "join_by_request": joinByRequest,
      "is_slow_mode_enabled": isSlowModeEnabled,
      "is_channel": isChannel,
      "is_broadcast_group": isBroadcastGroup,
      "is_forum": isForum,
      "is_direct_messages_group": isDirectMessagesGroup,
      "is_administered_direct_messages_group":
          isAdministeredDirectMessagesGroup,
      "verification_status": verificationStatus?.toJson(),
      "has_direct_messages_group": hasDirectMessagesGroup,
      "has_forum_tabs": hasForumTabs,
      "restriction_info": restrictionInfo?.toJson(),
      "paid_message_star_count": paidMessageStarCount,
      "active_story_state": activeStoryState?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Supergroup or channel identifier
  /// * [usernames]: Usernames of the supergroup or channel; may be null
  /// * [date]: Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created, in case the user is not a member
  /// * [status]: Status of the current user in the supergroup or channel
  /// * [member_count]: Number of members in the supergroup or channel; 0 if unknown. Currently, it is guaranteed to be known only if the supergroup or channel was received through. getChatSimilarChats, getChatsToPostStories, getCreatedPublicChats, getGroupsInCommon, getInactiveSupergroupChats, getRecommendedChats, getSuitableDiscussionChats,. getUserPrivacySettingRules, getVideoChatAvailableParticipants, searchPublicChats, or in chatFolderInviteLinkInfo.missing_chat_ids, or in userFullInfo.personal_chat_id,. or for chats with messages or stories from publicForwards and foundStories
  /// * [boost_level]: Approximate boost level for the chat
  /// * [has_automatic_translation]: True, if automatic translation of messages is enabled in the channel
  /// * [has_linked_chat]: True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
  /// * [has_location]: True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
  /// * [sign_messages]: True, if messages sent to the channel contains name of the sender. This field is only applicable to channels
  /// * [show_message_sender]: True, if messages sent to the channel have information about the sender user. This field is only applicable to channels
  /// * [join_to_send_messages]: True, if users need to join the supergroup before they can send messages. May be false only for discussion supergroups and channel direct messages groups
  /// * [join_by_request]: True, if all users directly joining the supergroup need to be approved by supergroup administrators
  /// * [is_slow_mode_enabled]: True, if the slow mode is enabled in the supergroup
  /// * [is_channel]: True, if the supergroup is a channel, which can have an unlimited number of subscribers, but only administrators can post there and see the list of subscribers
  /// * [is_broadcast_group]: True, if the supergroup is a broadcast group, i.e. only administrators can send messages and there is no limit on the number of members
  /// * [is_forum]: True, if the supergroup is a forum with topics
  /// * [is_direct_messages_group]: True, if the supergroup is a direct message group for a channel chat
  /// * [is_administered_direct_messages_group]: True, if the supergroup is a direct messages group for a channel chat that is administered by the current user
  /// * [verification_status]: Information about verification status of the supergroup or channel; may be null if none
  /// * [has_direct_messages_group]: True, if the channel has direct messages group
  /// * [has_forum_tabs]: True, if the supergroup is a forum, which topics are shown in the same way as in channel direct messages groups
  /// * [restriction_info]: Information about the restrictions that must be applied to the corresponding supergroup or channel chat; may be null if none
  /// * [paid_message_star_count]: Number of Telegram Stars that must be paid by non-administrator users of the supergroup chat for each sent message
  /// * [active_story_state]: State of active stories of the supergroup or channel; may be null if there are no active stories
  Supergroup copyWith({
    int? id,
    Usernames? usernames,
    int? date,
    ChatMemberStatus? status,
    int? memberCount,
    int? boostLevel,
    bool? hasAutomaticTranslation,
    bool? hasLinkedChat,
    bool? hasLocation,
    bool? signMessages,
    bool? showMessageSender,
    bool? joinToSendMessages,
    bool? joinByRequest,
    bool? isSlowModeEnabled,
    bool? isChannel,
    bool? isBroadcastGroup,
    bool? isForum,
    bool? isDirectMessagesGroup,
    bool? isAdministeredDirectMessagesGroup,
    VerificationStatus? verificationStatus,
    bool? hasDirectMessagesGroup,
    bool? hasForumTabs,
    RestrictionInfo? restrictionInfo,
    int? paidMessageStarCount,
    ActiveStoryState? activeStoryState,
    dynamic extra,
    int? clientId,
  }) =>
      Supergroup(
        id: id ?? this.id,
        usernames: usernames ?? this.usernames,
        date: date ?? this.date,
        status: status ?? this.status,
        memberCount: memberCount ?? this.memberCount,
        boostLevel: boostLevel ?? this.boostLevel,
        hasAutomaticTranslation:
            hasAutomaticTranslation ?? this.hasAutomaticTranslation,
        hasLinkedChat: hasLinkedChat ?? this.hasLinkedChat,
        hasLocation: hasLocation ?? this.hasLocation,
        signMessages: signMessages ?? this.signMessages,
        showMessageSender: showMessageSender ?? this.showMessageSender,
        joinToSendMessages: joinToSendMessages ?? this.joinToSendMessages,
        joinByRequest: joinByRequest ?? this.joinByRequest,
        isSlowModeEnabled: isSlowModeEnabled ?? this.isSlowModeEnabled,
        isChannel: isChannel ?? this.isChannel,
        isBroadcastGroup: isBroadcastGroup ?? this.isBroadcastGroup,
        isForum: isForum ?? this.isForum,
        isDirectMessagesGroup:
            isDirectMessagesGroup ?? this.isDirectMessagesGroup,
        isAdministeredDirectMessagesGroup: isAdministeredDirectMessagesGroup ??
            this.isAdministeredDirectMessagesGroup,
        verificationStatus: verificationStatus ?? this.verificationStatus,
        hasDirectMessagesGroup:
            hasDirectMessagesGroup ?? this.hasDirectMessagesGroup,
        hasForumTabs: hasForumTabs ?? this.hasForumTabs,
        restrictionInfo: restrictionInfo ?? this.restrictionInfo,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
        activeStoryState: activeStoryState ?? this.activeStoryState,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'supergroup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
