part of '../tdapi.dart';

/// **Chat** *(chat)* - basic class
///
/// A chat. (Can be a private chat, basic group, supergroup, or secret chat).
///
/// * [id]: Chat unique identifier.
/// * [type]: Type of the chat.
/// * [title]: Chat title.
/// * [photo]: Chat photo; may be null *(optional)*.
/// * [accentColorId]: Identifier of the accent color for message sender name, and backgrounds of chat photo, reply header, and link preview.
/// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the reply header and link preview background for messages sent by the chat; 0 if none.
/// * [upgradedGiftColors]: Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none *(optional)*.
/// * [profileAccentColorId]: Identifier of the profile accent color for the chat's profile; -1 if none.
/// * [profileBackgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the background of the chat's profile; 0 if none.
/// * [permissions]: Actions that non-administrator chat members are allowed to take in the chat.
/// * [lastMessage]: Last message in the chat; may be null if none or unknown *(optional)*.
/// * [positions]: Positions of the chat in chat lists.
/// * [chatLists]: Chat lists to which the chat belongs. A chat can have a non-zero position in a chat list even if it doesn't belong to the chat list and have no position in a chat list even if it belongs to the chat list.
/// * [messageSenderId]: Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender *(optional)*.
/// * [blockList]: Block list to which the chat is added; may be null if none *(optional)*.
/// * [hasProtectedContent]: True, if chat content can't be saved locally, forwarded, or copied.
/// * [isTranslatable]: True, if translation of all messages in the chat must be suggested to the user.
/// * [isMarkedAsUnread]: True, if the chat is marked as unread.
/// * [viewAsTopics]: True, if the chat is a forum supergroup that must be shown in the "View as topics" mode, or Saved Messages chat that must be shown in the "View as chats".
/// * [hasScheduledMessages]: True, if the chat has scheduled messages.
/// * [hasWelcomeMessages]: True, if the chat has welcome messages; for chat administrators with can_change_info administrator right only.
/// * [canBeDeletedOnlyForSelf]: True, if the chat messages can be deleted only for the current user while other users will continue to see the messages.
/// * [canBeDeletedForAllUsers]: True, if the chat messages can be deleted for all users.
/// * [canBeReported]: True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto.
/// * [defaultDisableNotification]: Default value of the disable_notification parameter, used when a message is sent to the chat.
/// * [unreadCount]: Number of unread messages in the chat.
/// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
/// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
/// * [unreadMentionCount]: Number of unread messages with a mention/reply in the chat.
/// * [unreadReactionCount]: Number of messages with unread reactions in the chat.
/// * [unreadPollVoteCount]: Number of messages with unread poll votes in the chat.
/// * [notificationSettings]: Notification settings for the chat.
/// * [availableReactions]: Types of reaction, available in the chat.
/// * [messageAutoDeleteTime]: Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled.. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date.
/// * [emojiStatus]: Emoji status to be shown along with chat title; may be null *(optional)*.
/// * [background]: Background set for the chat; may be null if none *(optional)*.
/// * [theme]: Theme set for the chat; may be null if none *(optional)*.
/// * [actionBar]: Information about actions which must be possible to do through the chat action bar; may be null if none *(optional)*.
/// * [businessBotManageBar]: Information about bar for managing a business bot in the chat; may be null if none *(optional)*.
/// * [videoChat]: Information about video chat of the chat.
/// * [pendingJoinRequests]: Information about pending join requests; may be null if none *(optional)*.
/// * [replyMarkupMessageId]: Identifier of the message from which reply markup needs to be used; 0 if there is no reply markup in the chat.
/// * [draftMessage]: A draft of a message in the chat; may be null if none *(optional)*.
/// * [clientData]: Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used.
final class Chat extends TdObject {
  /// **Chat** *(chat)* - basic class
  ///
  /// A chat. (Can be a private chat, basic group, supergroup, or secret chat).
  ///
  /// * [id]: Chat unique identifier.
  /// * [type]: Type of the chat.
  /// * [title]: Chat title.
  /// * [photo]: Chat photo; may be null *(optional)*.
  /// * [accentColorId]: Identifier of the accent color for message sender name, and backgrounds of chat photo, reply header, and link preview.
  /// * [backgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the reply header and link preview background for messages sent by the chat; 0 if none.
  /// * [upgradedGiftColors]: Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none *(optional)*.
  /// * [profileAccentColorId]: Identifier of the profile accent color for the chat's profile; -1 if none.
  /// * [profileBackgroundCustomEmojiId]: Identifier of a custom emoji to be shown on the background of the chat's profile; 0 if none.
  /// * [permissions]: Actions that non-administrator chat members are allowed to take in the chat.
  /// * [lastMessage]: Last message in the chat; may be null if none or unknown *(optional)*.
  /// * [positions]: Positions of the chat in chat lists.
  /// * [chatLists]: Chat lists to which the chat belongs. A chat can have a non-zero position in a chat list even if it doesn't belong to the chat list and have no position in a chat list even if it belongs to the chat list.
  /// * [messageSenderId]: Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender *(optional)*.
  /// * [blockList]: Block list to which the chat is added; may be null if none *(optional)*.
  /// * [hasProtectedContent]: True, if chat content can't be saved locally, forwarded, or copied.
  /// * [isTranslatable]: True, if translation of all messages in the chat must be suggested to the user.
  /// * [isMarkedAsUnread]: True, if the chat is marked as unread.
  /// * [viewAsTopics]: True, if the chat is a forum supergroup that must be shown in the "View as topics" mode, or Saved Messages chat that must be shown in the "View as chats".
  /// * [hasScheduledMessages]: True, if the chat has scheduled messages.
  /// * [hasWelcomeMessages]: True, if the chat has welcome messages; for chat administrators with can_change_info administrator right only.
  /// * [canBeDeletedOnlyForSelf]: True, if the chat messages can be deleted only for the current user while other users will continue to see the messages.
  /// * [canBeDeletedForAllUsers]: True, if the chat messages can be deleted for all users.
  /// * [canBeReported]: True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto.
  /// * [defaultDisableNotification]: Default value of the disable_notification parameter, used when a message is sent to the chat.
  /// * [unreadCount]: Number of unread messages in the chat.
  /// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
  /// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
  /// * [unreadMentionCount]: Number of unread messages with a mention/reply in the chat.
  /// * [unreadReactionCount]: Number of messages with unread reactions in the chat.
  /// * [unreadPollVoteCount]: Number of messages with unread poll votes in the chat.
  /// * [notificationSettings]: Notification settings for the chat.
  /// * [availableReactions]: Types of reaction, available in the chat.
  /// * [messageAutoDeleteTime]: Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled.. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date.
  /// * [emojiStatus]: Emoji status to be shown along with chat title; may be null *(optional)*.
  /// * [background]: Background set for the chat; may be null if none *(optional)*.
  /// * [theme]: Theme set for the chat; may be null if none *(optional)*.
  /// * [actionBar]: Information about actions which must be possible to do through the chat action bar; may be null if none *(optional)*.
  /// * [businessBotManageBar]: Information about bar for managing a business bot in the chat; may be null if none *(optional)*.
  /// * [videoChat]: Information about video chat of the chat.
  /// * [pendingJoinRequests]: Information about pending join requests; may be null if none *(optional)*.
  /// * [replyMarkupMessageId]: Identifier of the message from which reply markup needs to be used; 0 if there is no reply markup in the chat.
  /// * [draftMessage]: A draft of a message in the chat; may be null if none *(optional)*.
  /// * [clientData]: Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used.
  const Chat({
    required this.id,
    required this.type,
    required this.title,
    this.photo,
    required this.accentColorId,
    required this.backgroundCustomEmojiId,
    this.upgradedGiftColors,
    required this.profileAccentColorId,
    required this.profileBackgroundCustomEmojiId,
    required this.permissions,
    this.lastMessage,
    required this.positions,
    required this.chatLists,
    this.messageSenderId,
    this.blockList,
    required this.hasProtectedContent,
    required this.isTranslatable,
    required this.isMarkedAsUnread,
    required this.viewAsTopics,
    required this.hasScheduledMessages,
    required this.hasWelcomeMessages,
    required this.canBeDeletedOnlyForSelf,
    required this.canBeDeletedForAllUsers,
    required this.canBeReported,
    required this.defaultDisableNotification,
    required this.unreadCount,
    required this.lastReadInboxMessageId,
    required this.lastReadOutboxMessageId,
    required this.unreadMentionCount,
    required this.unreadReactionCount,
    required this.unreadPollVoteCount,
    required this.notificationSettings,
    required this.availableReactions,
    required this.messageAutoDeleteTime,
    this.emojiStatus,
    this.background,
    this.theme,
    this.actionBar,
    this.businessBotManageBar,
    required this.videoChat,
    this.pendingJoinRequests,
    required this.replyMarkupMessageId,
    this.draftMessage,
    required this.clientData,
    this.extra,
    this.clientId,
  });

  /// Chat unique identifier
  final int id;

  /// Type of the chat
  final ChatType type;

  /// Chat title
  final String title;

  /// Chat photo; may be null
  final ChatPhotoInfo? photo;

  /// Identifier of the accent color for message sender name, and backgrounds of chat photo, reply header, and link preview
  final int accentColorId;

  /// Identifier of a custom emoji to be shown on the reply header and link preview background for messages sent by the chat; 0 if none
  final int backgroundCustomEmojiId;

  /// Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none
  final UpgradedGiftColors? upgradedGiftColors;

  /// Identifier of the profile accent color for the chat's profile; -1 if none
  final int profileAccentColorId;

  /// Identifier of a custom emoji to be shown on the background of the chat's profile; 0 if none
  final int profileBackgroundCustomEmojiId;

  /// Actions that non-administrator chat members are allowed to take in the chat
  final ChatPermissions permissions;

  /// Last message in the chat; may be null if none or unknown
  final Message? lastMessage;

  /// Positions of the chat in chat lists
  final List<ChatPosition> positions;

  /// Chat lists to which the chat belongs. A chat can have a non-zero position in a chat list even if it doesn't belong to the chat list and have no position in a chat list even if it belongs to the chat list
  final List<ChatList> chatLists;

  /// Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
  final MessageSender? messageSenderId;

  /// Block list to which the chat is added; may be null if none
  final BlockList? blockList;

  /// True, if chat content can't be saved locally, forwarded, or copied
  final bool hasProtectedContent;

  /// True, if translation of all messages in the chat must be suggested to the user
  final bool isTranslatable;

  /// True, if the chat is marked as unread
  final bool isMarkedAsUnread;

  /// True, if the chat is a forum supergroup that must be shown in the "View as topics" mode, or Saved Messages chat that must be shown in the "View as chats"
  final bool viewAsTopics;

  /// True, if the chat has scheduled messages
  final bool hasScheduledMessages;

  /// True, if the chat has welcome messages; for chat administrators with can_change_info administrator right only
  final bool hasWelcomeMessages;

  /// True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
  final bool canBeDeletedOnlyForSelf;

  /// True, if the chat messages can be deleted for all users
  final bool canBeDeletedForAllUsers;

  /// True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
  final bool canBeReported;

  /// Default value of the disable_notification parameter, used when a message is sent to the chat
  final bool defaultDisableNotification;

  /// Number of unread messages in the chat
  final int unreadCount;

  /// Identifier of the last read incoming message
  final int lastReadInboxMessageId;

  /// Identifier of the last read outgoing message
  final int lastReadOutboxMessageId;

  /// Number of unread messages with a mention/reply in the chat
  final int unreadMentionCount;

  /// Number of messages with unread reactions in the chat
  final int unreadReactionCount;

  /// Number of messages with unread poll votes in the chat
  final int unreadPollVoteCount;

  /// Notification settings for the chat
  final ChatNotificationSettings notificationSettings;

  /// Types of reaction, available in the chat
  final ChatAvailableReactions availableReactions;

  /// Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled.. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date
  final int messageAutoDeleteTime;

  /// Emoji status to be shown along with chat title; may be null
  final EmojiStatus? emojiStatus;

  /// Background set for the chat; may be null if none
  final ChatBackground? background;

  /// Theme set for the chat; may be null if none
  final ChatTheme? theme;

  /// Information about actions which must be possible to do through the chat action bar; may be null if none
  final ChatActionBar? actionBar;

  /// Information about bar for managing a business bot in the chat; may be null if none
  final BusinessBotManageBar? businessBotManageBar;

  /// Information about video chat of the chat
  final VideoChat videoChat;

  /// Information about pending join requests; may be null if none
  final ChatJoinRequestsInfo? pendingJoinRequests;

  /// Identifier of the message from which reply markup needs to be used; 0 if there is no reply markup in the chat
  final int replyMarkupMessageId;

  /// A draft of a message in the chat; may be null if none
  final DraftMessage? draftMessage;

  /// Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
  final String clientData;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json['id'],
        type: ChatType.fromJson(json['type']),
        title: json['title'],
        photo: json['photo'] == null
            ? null
            : ChatPhotoInfo.fromJson(json['photo']),
        accentColorId: json['accent_color_id'],
        backgroundCustomEmojiId: json['background_custom_emoji_id'] is int
            ? json['background_custom_emoji_id']
            : int.tryParse(json['background_custom_emoji_id'] ?? "") ?? 0,
        upgradedGiftColors: json['upgraded_gift_colors'] == null
            ? null
            : UpgradedGiftColors.fromJson(json['upgraded_gift_colors']),
        profileAccentColorId: json['profile_accent_color_id'],
        profileBackgroundCustomEmojiId:
            json['profile_background_custom_emoji_id'] is int
                ? json['profile_background_custom_emoji_id']
                : int.tryParse(
                        json['profile_background_custom_emoji_id'] ?? "") ??
                    0,
        permissions: ChatPermissions.fromJson(json['permissions']),
        lastMessage: json['last_message'] == null
            ? null
            : Message.fromJson(json['last_message']),
        positions: List<ChatPosition>.from((json['positions'] ?? [])
            .map((item) => ChatPosition.fromJson(item))
            .toList()),
        chatLists: List<ChatList>.from((json['chat_lists'] ?? [])
            .map((item) => ChatList.fromJson(item))
            .toList()),
        messageSenderId: json['message_sender_id'] == null
            ? null
            : MessageSender.fromJson(json['message_sender_id']),
        blockList: json['block_list'] == null
            ? null
            : BlockList.fromJson(json['block_list']),
        hasProtectedContent: json['has_protected_content'],
        isTranslatable: json['is_translatable'],
        isMarkedAsUnread: json['is_marked_as_unread'],
        viewAsTopics: json['view_as_topics'],
        hasScheduledMessages: json['has_scheduled_messages'],
        hasWelcomeMessages: json['has_welcome_messages'],
        canBeDeletedOnlyForSelf: json['can_be_deleted_only_for_self'],
        canBeDeletedForAllUsers: json['can_be_deleted_for_all_users'],
        canBeReported: json['can_be_reported'],
        defaultDisableNotification: json['default_disable_notification'],
        unreadCount: json['unread_count'],
        lastReadInboxMessageId: json['last_read_inbox_message_id'],
        lastReadOutboxMessageId: json['last_read_outbox_message_id'],
        unreadMentionCount: json['unread_mention_count'],
        unreadReactionCount: json['unread_reaction_count'],
        unreadPollVoteCount: json['unread_poll_vote_count'],
        notificationSettings:
            ChatNotificationSettings.fromJson(json['notification_settings']),
        availableReactions:
            ChatAvailableReactions.fromJson(json['available_reactions']),
        messageAutoDeleteTime: json['message_auto_delete_time'],
        emojiStatus: json['emoji_status'] == null
            ? null
            : EmojiStatus.fromJson(json['emoji_status']),
        background: json['background'] == null
            ? null
            : ChatBackground.fromJson(json['background']),
        theme: json['theme'] == null ? null : ChatTheme.fromJson(json['theme']),
        actionBar: json['action_bar'] == null
            ? null
            : ChatActionBar.fromJson(json['action_bar']),
        businessBotManageBar: json['business_bot_manage_bar'] == null
            ? null
            : BusinessBotManageBar.fromJson(json['business_bot_manage_bar']),
        videoChat: VideoChat.fromJson(json['video_chat']),
        pendingJoinRequests: json['pending_join_requests'] == null
            ? null
            : ChatJoinRequestsInfo.fromJson(json['pending_join_requests']),
        replyMarkupMessageId: json['reply_markup_message_id'],
        draftMessage: json['draft_message'] == null
            ? null
            : DraftMessage.fromJson(json['draft_message']),
        clientData: json['client_data'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "type": type.toJson(),
      "title": title,
      "photo": photo?.toJson(),
      "accent_color_id": accentColorId,
      "background_custom_emoji_id": backgroundCustomEmojiId,
      "upgraded_gift_colors": upgradedGiftColors?.toJson(),
      "profile_accent_color_id": profileAccentColorId,
      "profile_background_custom_emoji_id": profileBackgroundCustomEmojiId,
      "permissions": permissions.toJson(),
      "last_message": lastMessage?.toJson(),
      "positions": positions.map((i) => i.toJson()).toList(),
      "chat_lists": chatLists.map((i) => i.toJson()).toList(),
      "message_sender_id": messageSenderId?.toJson(),
      "block_list": blockList?.toJson(),
      "has_protected_content": hasProtectedContent,
      "is_translatable": isTranslatable,
      "is_marked_as_unread": isMarkedAsUnread,
      "view_as_topics": viewAsTopics,
      "has_scheduled_messages": hasScheduledMessages,
      "has_welcome_messages": hasWelcomeMessages,
      "can_be_deleted_only_for_self": canBeDeletedOnlyForSelf,
      "can_be_deleted_for_all_users": canBeDeletedForAllUsers,
      "can_be_reported": canBeReported,
      "default_disable_notification": defaultDisableNotification,
      "unread_count": unreadCount,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
      "unread_mention_count": unreadMentionCount,
      "unread_reaction_count": unreadReactionCount,
      "unread_poll_vote_count": unreadPollVoteCount,
      "notification_settings": notificationSettings.toJson(),
      "available_reactions": availableReactions.toJson(),
      "message_auto_delete_time": messageAutoDeleteTime,
      "emoji_status": emojiStatus?.toJson(),
      "background": background?.toJson(),
      "theme": theme?.toJson(),
      "action_bar": actionBar?.toJson(),
      "business_bot_manage_bar": businessBotManageBar?.toJson(),
      "video_chat": videoChat.toJson(),
      "pending_join_requests": pendingJoinRequests?.toJson(),
      "reply_markup_message_id": replyMarkupMessageId,
      "draft_message": draftMessage?.toJson(),
      "client_data": clientData,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Chat unique identifier
  /// * [type]: Type of the chat
  /// * [title]: Chat title
  /// * [photo]: Chat photo; may be null
  /// * [accent_color_id]: Identifier of the accent color for message sender name, and backgrounds of chat photo, reply header, and link preview
  /// * [background_custom_emoji_id]: Identifier of a custom emoji to be shown on the reply header and link preview background for messages sent by the chat; 0 if none
  /// * [upgraded_gift_colors]: Color scheme based on an upgraded gift to be used for the chat instead of accent_color_id and background_custom_emoji_id; may be null if none
  /// * [profile_accent_color_id]: Identifier of the profile accent color for the chat's profile; -1 if none
  /// * [profile_background_custom_emoji_id]: Identifier of a custom emoji to be shown on the background of the chat's profile; 0 if none
  /// * [permissions]: Actions that non-administrator chat members are allowed to take in the chat
  /// * [last_message]: Last message in the chat; may be null if none or unknown
  /// * [positions]: Positions of the chat in chat lists
  /// * [chat_lists]: Chat lists to which the chat belongs. A chat can have a non-zero position in a chat list even if it doesn't belong to the chat list and have no position in a chat list even if it belongs to the chat list
  /// * [message_sender_id]: Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
  /// * [block_list]: Block list to which the chat is added; may be null if none
  /// * [has_protected_content]: True, if chat content can't be saved locally, forwarded, or copied
  /// * [is_translatable]: True, if translation of all messages in the chat must be suggested to the user
  /// * [is_marked_as_unread]: True, if the chat is marked as unread
  /// * [view_as_topics]: True, if the chat is a forum supergroup that must be shown in the "View as topics" mode, or Saved Messages chat that must be shown in the "View as chats"
  /// * [has_scheduled_messages]: True, if the chat has scheduled messages
  /// * [has_welcome_messages]: True, if the chat has welcome messages; for chat administrators with can_change_info administrator right only
  /// * [can_be_deleted_only_for_self]: True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
  /// * [can_be_deleted_for_all_users]: True, if the chat messages can be deleted for all users
  /// * [can_be_reported]: True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
  /// * [default_disable_notification]: Default value of the disable_notification parameter, used when a message is sent to the chat
  /// * [unread_count]: Number of unread messages in the chat
  /// * [last_read_inbox_message_id]: Identifier of the last read incoming message
  /// * [last_read_outbox_message_id]: Identifier of the last read outgoing message
  /// * [unread_mention_count]: Number of unread messages with a mention/reply in the chat
  /// * [unread_reaction_count]: Number of messages with unread reactions in the chat
  /// * [unread_poll_vote_count]: Number of messages with unread poll votes in the chat
  /// * [notification_settings]: Notification settings for the chat
  /// * [available_reactions]: Types of reaction, available in the chat
  /// * [message_auto_delete_time]: Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled.. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date
  /// * [emoji_status]: Emoji status to be shown along with chat title; may be null
  /// * [background]: Background set for the chat; may be null if none
  /// * [theme]: Theme set for the chat; may be null if none
  /// * [action_bar]: Information about actions which must be possible to do through the chat action bar; may be null if none
  /// * [business_bot_manage_bar]: Information about bar for managing a business bot in the chat; may be null if none
  /// * [video_chat]: Information about video chat of the chat
  /// * [pending_join_requests]: Information about pending join requests; may be null if none
  /// * [reply_markup_message_id]: Identifier of the message from which reply markup needs to be used; 0 if there is no reply markup in the chat
  /// * [draft_message]: A draft of a message in the chat; may be null if none
  /// * [client_data]: Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
  Chat copyWith({
    int? id,
    ChatType? type,
    String? title,
    ChatPhotoInfo? photo,
    int? accentColorId,
    int? backgroundCustomEmojiId,
    UpgradedGiftColors? upgradedGiftColors,
    int? profileAccentColorId,
    int? profileBackgroundCustomEmojiId,
    ChatPermissions? permissions,
    Message? lastMessage,
    List<ChatPosition>? positions,
    List<ChatList>? chatLists,
    MessageSender? messageSenderId,
    BlockList? blockList,
    bool? hasProtectedContent,
    bool? isTranslatable,
    bool? isMarkedAsUnread,
    bool? viewAsTopics,
    bool? hasScheduledMessages,
    bool? hasWelcomeMessages,
    bool? canBeDeletedOnlyForSelf,
    bool? canBeDeletedForAllUsers,
    bool? canBeReported,
    bool? defaultDisableNotification,
    int? unreadCount,
    int? lastReadInboxMessageId,
    int? lastReadOutboxMessageId,
    int? unreadMentionCount,
    int? unreadReactionCount,
    int? unreadPollVoteCount,
    ChatNotificationSettings? notificationSettings,
    ChatAvailableReactions? availableReactions,
    int? messageAutoDeleteTime,
    EmojiStatus? emojiStatus,
    ChatBackground? background,
    ChatTheme? theme,
    ChatActionBar? actionBar,
    BusinessBotManageBar? businessBotManageBar,
    VideoChat? videoChat,
    ChatJoinRequestsInfo? pendingJoinRequests,
    int? replyMarkupMessageId,
    DraftMessage? draftMessage,
    String? clientData,
    dynamic extra,
    int? clientId,
  }) =>
      Chat(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        photo: photo ?? this.photo,
        accentColorId: accentColorId ?? this.accentColorId,
        backgroundCustomEmojiId:
            backgroundCustomEmojiId ?? this.backgroundCustomEmojiId,
        upgradedGiftColors: upgradedGiftColors ?? this.upgradedGiftColors,
        profileAccentColorId: profileAccentColorId ?? this.profileAccentColorId,
        profileBackgroundCustomEmojiId: profileBackgroundCustomEmojiId ??
            this.profileBackgroundCustomEmojiId,
        permissions: permissions ?? this.permissions,
        lastMessage: lastMessage ?? this.lastMessage,
        positions: positions ?? this.positions,
        chatLists: chatLists ?? this.chatLists,
        messageSenderId: messageSenderId ?? this.messageSenderId,
        blockList: blockList ?? this.blockList,
        hasProtectedContent: hasProtectedContent ?? this.hasProtectedContent,
        isTranslatable: isTranslatable ?? this.isTranslatable,
        isMarkedAsUnread: isMarkedAsUnread ?? this.isMarkedAsUnread,
        viewAsTopics: viewAsTopics ?? this.viewAsTopics,
        hasScheduledMessages: hasScheduledMessages ?? this.hasScheduledMessages,
        hasWelcomeMessages: hasWelcomeMessages ?? this.hasWelcomeMessages,
        canBeDeletedOnlyForSelf:
            canBeDeletedOnlyForSelf ?? this.canBeDeletedOnlyForSelf,
        canBeDeletedForAllUsers:
            canBeDeletedForAllUsers ?? this.canBeDeletedForAllUsers,
        canBeReported: canBeReported ?? this.canBeReported,
        defaultDisableNotification:
            defaultDisableNotification ?? this.defaultDisableNotification,
        unreadCount: unreadCount ?? this.unreadCount,
        lastReadInboxMessageId:
            lastReadInboxMessageId ?? this.lastReadInboxMessageId,
        lastReadOutboxMessageId:
            lastReadOutboxMessageId ?? this.lastReadOutboxMessageId,
        unreadMentionCount: unreadMentionCount ?? this.unreadMentionCount,
        unreadReactionCount: unreadReactionCount ?? this.unreadReactionCount,
        unreadPollVoteCount: unreadPollVoteCount ?? this.unreadPollVoteCount,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        availableReactions: availableReactions ?? this.availableReactions,
        messageAutoDeleteTime:
            messageAutoDeleteTime ?? this.messageAutoDeleteTime,
        emojiStatus: emojiStatus ?? this.emojiStatus,
        background: background ?? this.background,
        theme: theme ?? this.theme,
        actionBar: actionBar ?? this.actionBar,
        businessBotManageBar: businessBotManageBar ?? this.businessBotManageBar,
        videoChat: videoChat ?? this.videoChat,
        pendingJoinRequests: pendingJoinRequests ?? this.pendingJoinRequests,
        replyMarkupMessageId: replyMarkupMessageId ?? this.replyMarkupMessageId,
        draftMessage: draftMessage ?? this.draftMessage,
        clientData: clientData ?? this.clientData,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
