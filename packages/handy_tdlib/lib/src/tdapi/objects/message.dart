part of '../tdapi.dart';

/// **Message** *(message)* - basic class
///
/// Describes a message.
///
/// * [id]: Message identifier; unique for the chat to which the message belongs.
/// * [senderId]: Identifier of the sender of the message.
/// * [receiverId]: Identifier of the user or the chat which received the ephemeral message; may be null. Always null for non-ephemeral messages *(optional)*.
/// * [chatId]: Chat identifier.
/// * [sendingState]: The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent *(optional)*.
/// * [schedulingState]: The scheduling state of the message; may be null if the message isn't scheduled *(optional)*.
/// * [isOutgoing]: True, if the message is outgoing.
/// * [isPinned]: True, if the message is pinned.
/// * [isFromOffline]: True, if the message was sent because of a scheduled action by the message sender, for example, as away, or greeting service message.
/// * [canBeSaved]: True, if content of the message can be saved locally.
/// * [hasTimestampedMedia]: True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message.
/// * [isChannelPost]: True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts.
/// * [isPaidStarSuggestedPost]: True, if the message is a suggested channel post which was paid in Telegram Stars; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending.
/// * [isPaidGramSuggestedPost]: True, if the message is a suggested channel post which was paid in TON Grams; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending.
/// * [containsUnreadMention]: True, if the message contains an unread mention for the current user.
/// * [containsUnreadPollVotes]: True, if the message is a poll message with unread votes.
/// * [date]: Point in time (Unix timestamp) when the message was sent; 0 for scheduled messages.
/// * [editDate]: Point in time (Unix timestamp) when the message was last edited; 0 for scheduled messages. If getOption("show_message_edit_date_by_default") is true,. then the date must be shown along with the message instead of the date when the message was sent.
/// * [forwardInfo]: Information about the initial message sender; may be null if none or unknown *(optional)*.
/// * [importInfo]: Information about the initial message for messages created with importMessages; may be null if the message isn't imported *(optional)*.
/// * [interactionInfo]: Information about interactions with the message; may be null if none *(optional)*.
/// * [unreadReactions]: Information about unread reactions added to the message.
/// * [factCheck]: Information about fact-check added to the message; may be null if none *(optional)*.
/// * [suggestedPostInfo]: Information about the suggested post; may be null if the message isn't a suggested post *(optional)*.
/// * [replyTo]: Information about the message or the story this message is replying to; may be null if none *(optional)*.
/// * [topicId]: Identifier of the topic within the chat to which the message belongs; may be null if none; may change when the chat is converted to a forum or back *(optional)*.
/// * [selfDestructType]: The message's self-destruct type; may be null if none *(optional)*.
/// * [selfDestructIn]: Time left before the message self-destruct timer expires, in seconds; 0 if self-destruction isn't scheduled yet.
/// * [autoDeleteIn]: Time left before the message will be automatically deleted by message_auto_delete_time setting of the chat, in seconds; 0 if never.
/// * [viaBotUserId]: If non-zero, the user identifier of the inline bot through which this message was sent.
/// * [guestBotCallerId]: The identifier of the user or chat which used a guest bot to send the message; may be null if none *(optional)*.
/// * [senderBusinessBotUserId]: If non-zero, the user identifier of the business bot that sent this message.
/// * [senderBoostCount]: Number of times the sender of the message boosted the supergroup at the time the message was sent; 0 if none or unknown. For messages sent by the current user, supergroupFullInfo.my_boost_count must be used instead.
/// * [senderTag]: Tag of the sender of the message in the supergroup at the time the message was sent; may be empty if none or unknown.. For messages sent in basic groups or by supergroup administrators, the current custom title or tag must be used instead.
/// * [paidMessageStarCount]: The number of Telegram Stars the sender paid to send the message.
/// * [authorSignature]: For channel posts and anonymous group messages, optional author signature.
/// * [mediaAlbumId]: Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums.
/// * [effectId]: Unique identifier of the effect added to the message; 0 if none.
/// * [restrictionInfo]: Information about the restrictions that must be applied to the message content; may be null if none *(optional)*.
/// * [summaryLanguageCode]: IETF language tag of the message language on which it can be summarized; empty if summary isn't available for the message.
/// * [content]: Content of the message.
/// * [ephemeralContent]: Content of the message, which is visible only to the current user and must be shown instead of the regular content; may be null if none *(optional)*.
/// * [replyMarkup]: Reply markup for the message; may be null if none *(optional)*.
/// * [ephemeralMessageId]: Unique identifier of the ephemeral message if the message is ephemeral; for bots only.
/// * [chatInstance]: Identifier that uniquely corresponds to the chat to which the message was sent; for bots only.
final class Message extends TdObject {
  /// **Message** *(message)* - basic class
  ///
  /// Describes a message.
  ///
  /// * [id]: Message identifier; unique for the chat to which the message belongs.
  /// * [senderId]: Identifier of the sender of the message.
  /// * [receiverId]: Identifier of the user or the chat which received the ephemeral message; may be null. Always null for non-ephemeral messages *(optional)*.
  /// * [chatId]: Chat identifier.
  /// * [sendingState]: The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent *(optional)*.
  /// * [schedulingState]: The scheduling state of the message; may be null if the message isn't scheduled *(optional)*.
  /// * [isOutgoing]: True, if the message is outgoing.
  /// * [isPinned]: True, if the message is pinned.
  /// * [isFromOffline]: True, if the message was sent because of a scheduled action by the message sender, for example, as away, or greeting service message.
  /// * [canBeSaved]: True, if content of the message can be saved locally.
  /// * [hasTimestampedMedia]: True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message.
  /// * [isChannelPost]: True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts.
  /// * [isPaidStarSuggestedPost]: True, if the message is a suggested channel post which was paid in Telegram Stars; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending.
  /// * [isPaidGramSuggestedPost]: True, if the message is a suggested channel post which was paid in TON Grams; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending.
  /// * [containsUnreadMention]: True, if the message contains an unread mention for the current user.
  /// * [containsUnreadPollVotes]: True, if the message is a poll message with unread votes.
  /// * [date]: Point in time (Unix timestamp) when the message was sent; 0 for scheduled messages.
  /// * [editDate]: Point in time (Unix timestamp) when the message was last edited; 0 for scheduled messages. If getOption("show_message_edit_date_by_default") is true,. then the date must be shown along with the message instead of the date when the message was sent.
  /// * [forwardInfo]: Information about the initial message sender; may be null if none or unknown *(optional)*.
  /// * [importInfo]: Information about the initial message for messages created with importMessages; may be null if the message isn't imported *(optional)*.
  /// * [interactionInfo]: Information about interactions with the message; may be null if none *(optional)*.
  /// * [unreadReactions]: Information about unread reactions added to the message.
  /// * [factCheck]: Information about fact-check added to the message; may be null if none *(optional)*.
  /// * [suggestedPostInfo]: Information about the suggested post; may be null if the message isn't a suggested post *(optional)*.
  /// * [replyTo]: Information about the message or the story this message is replying to; may be null if none *(optional)*.
  /// * [topicId]: Identifier of the topic within the chat to which the message belongs; may be null if none; may change when the chat is converted to a forum or back *(optional)*.
  /// * [selfDestructType]: The message's self-destruct type; may be null if none *(optional)*.
  /// * [selfDestructIn]: Time left before the message self-destruct timer expires, in seconds; 0 if self-destruction isn't scheduled yet.
  /// * [autoDeleteIn]: Time left before the message will be automatically deleted by message_auto_delete_time setting of the chat, in seconds; 0 if never.
  /// * [viaBotUserId]: If non-zero, the user identifier of the inline bot through which this message was sent.
  /// * [guestBotCallerId]: The identifier of the user or chat which used a guest bot to send the message; may be null if none *(optional)*.
  /// * [senderBusinessBotUserId]: If non-zero, the user identifier of the business bot that sent this message.
  /// * [senderBoostCount]: Number of times the sender of the message boosted the supergroup at the time the message was sent; 0 if none or unknown. For messages sent by the current user, supergroupFullInfo.my_boost_count must be used instead.
  /// * [senderTag]: Tag of the sender of the message in the supergroup at the time the message was sent; may be empty if none or unknown.. For messages sent in basic groups or by supergroup administrators, the current custom title or tag must be used instead.
  /// * [paidMessageStarCount]: The number of Telegram Stars the sender paid to send the message.
  /// * [authorSignature]: For channel posts and anonymous group messages, optional author signature.
  /// * [mediaAlbumId]: Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums.
  /// * [effectId]: Unique identifier of the effect added to the message; 0 if none.
  /// * [restrictionInfo]: Information about the restrictions that must be applied to the message content; may be null if none *(optional)*.
  /// * [summaryLanguageCode]: IETF language tag of the message language on which it can be summarized; empty if summary isn't available for the message.
  /// * [content]: Content of the message.
  /// * [ephemeralContent]: Content of the message, which is visible only to the current user and must be shown instead of the regular content; may be null if none *(optional)*.
  /// * [replyMarkup]: Reply markup for the message; may be null if none *(optional)*.
  /// * [ephemeralMessageId]: Unique identifier of the ephemeral message if the message is ephemeral; for bots only.
  /// * [chatInstance]: Identifier that uniquely corresponds to the chat to which the message was sent; for bots only.
  const Message({
    required this.id,
    required this.senderId,
    this.receiverId,
    required this.chatId,
    this.sendingState,
    this.schedulingState,
    required this.isOutgoing,
    required this.isPinned,
    required this.isFromOffline,
    required this.canBeSaved,
    required this.hasTimestampedMedia,
    required this.isChannelPost,
    required this.isPaidStarSuggestedPost,
    required this.isPaidGramSuggestedPost,
    required this.containsUnreadMention,
    required this.containsUnreadPollVotes,
    required this.date,
    required this.editDate,
    this.forwardInfo,
    this.importInfo,
    this.interactionInfo,
    required this.unreadReactions,
    this.factCheck,
    this.suggestedPostInfo,
    this.replyTo,
    this.topicId,
    this.selfDestructType,
    required this.selfDestructIn,
    required this.autoDeleteIn,
    required this.viaBotUserId,
    this.guestBotCallerId,
    required this.senderBusinessBotUserId,
    required this.senderBoostCount,
    required this.senderTag,
    required this.paidMessageStarCount,
    required this.authorSignature,
    required this.mediaAlbumId,
    required this.effectId,
    this.restrictionInfo,
    required this.summaryLanguageCode,
    required this.content,
    this.ephemeralContent,
    this.replyMarkup,
    required this.ephemeralMessageId,
    required this.chatInstance,
    this.extra,
    this.clientId,
  });

  /// Message identifier; unique for the chat to which the message belongs
  final int id;

  /// Identifier of the sender of the message
  final MessageSender senderId;

  /// Identifier of the user or the chat which received the ephemeral message; may be null. Always null for non-ephemeral messages
  final MessageSender? receiverId;

  /// Chat identifier
  final int chatId;

  /// The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
  final MessageSendingState? sendingState;

  /// The scheduling state of the message; may be null if the message isn't scheduled
  final MessageSchedulingState? schedulingState;

  /// True, if the message is outgoing
  final bool isOutgoing;

  /// True, if the message is pinned
  final bool isPinned;

  /// True, if the message was sent because of a scheduled action by the message sender, for example, as away, or greeting service message
  final bool isFromOffline;

  /// True, if content of the message can be saved locally
  final bool canBeSaved;

  /// True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
  final bool hasTimestampedMedia;

  /// True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
  final bool isChannelPost;

  /// True, if the message is a suggested channel post which was paid in Telegram Stars; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending
  final bool isPaidStarSuggestedPost;

  /// True, if the message is a suggested channel post which was paid in TON Grams; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending
  final bool isPaidGramSuggestedPost;

  /// True, if the message contains an unread mention for the current user
  final bool containsUnreadMention;

  /// True, if the message is a poll message with unread votes
  final bool containsUnreadPollVotes;

  /// Point in time (Unix timestamp) when the message was sent; 0 for scheduled messages
  final int date;

  /// Point in time (Unix timestamp) when the message was last edited; 0 for scheduled messages. If getOption("show_message_edit_date_by_default") is true,. then the date must be shown along with the message instead of the date when the message was sent
  final int editDate;

  /// Information about the initial message sender; may be null if none or unknown
  final MessageForwardInfo? forwardInfo;

  /// Information about the initial message for messages created with importMessages; may be null if the message isn't imported
  final MessageImportInfo? importInfo;

  /// Information about interactions with the message; may be null if none
  final MessageInteractionInfo? interactionInfo;

  /// Information about unread reactions added to the message
  final List<UnreadReaction> unreadReactions;

  /// Information about fact-check added to the message; may be null if none
  final FactCheck? factCheck;

  /// Information about the suggested post; may be null if the message isn't a suggested post
  final SuggestedPostInfo? suggestedPostInfo;

  /// Information about the message or the story this message is replying to; may be null if none
  final MessageReplyTo? replyTo;

  /// Identifier of the topic within the chat to which the message belongs; may be null if none; may change when the chat is converted to a forum or back
  final MessageTopic? topicId;

  /// The message's self-destruct type; may be null if none
  final MessageSelfDestructType? selfDestructType;

  /// Time left before the message self-destruct timer expires, in seconds; 0 if self-destruction isn't scheduled yet
  final double selfDestructIn;

  /// Time left before the message will be automatically deleted by message_auto_delete_time setting of the chat, in seconds; 0 if never
  final double autoDeleteIn;

  /// If non-zero, the user identifier of the inline bot through which this message was sent
  final int viaBotUserId;

  /// The identifier of the user or chat which used a guest bot to send the message; may be null if none
  final MessageSender? guestBotCallerId;

  /// If non-zero, the user identifier of the business bot that sent this message
  final int senderBusinessBotUserId;

  /// Number of times the sender of the message boosted the supergroup at the time the message was sent; 0 if none or unknown. For messages sent by the current user, supergroupFullInfo.my_boost_count must be used instead
  final int senderBoostCount;

  /// Tag of the sender of the message in the supergroup at the time the message was sent; may be empty if none or unknown.. For messages sent in basic groups or by supergroup administrators, the current custom title or tag must be used instead
  final String senderTag;

  /// The number of Telegram Stars the sender paid to send the message
  final int paidMessageStarCount;

  /// For channel posts and anonymous group messages, optional author signature
  final String authorSignature;

  /// Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums
  final int mediaAlbumId;

  /// Unique identifier of the effect added to the message; 0 if none
  final int effectId;

  /// Information about the restrictions that must be applied to the message content; may be null if none
  final RestrictionInfo? restrictionInfo;

  /// IETF language tag of the message language on which it can be summarized; empty if summary isn't available for the message
  final String summaryLanguageCode;

  /// Content of the message
  final MessageContent content;

  /// Content of the message, which is visible only to the current user and must be shown instead of the regular content; may be null if none
  final EphemeralMessageContent? ephemeralContent;

  /// Reply markup for the message; may be null if none
  final ReplyMarkup? replyMarkup;

  /// Unique identifier of the ephemeral message if the message is ephemeral; for bots only
  final int ephemeralMessageId;

  /// Identifier that uniquely corresponds to the chat to which the message was sent; for bots only
  final int chatInstance;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        senderId: MessageSender.fromJson(json['sender_id']),
        receiverId: json['receiver_id'] == null
            ? null
            : MessageSender.fromJson(json['receiver_id']),
        chatId: json['chat_id'],
        sendingState: json['sending_state'] == null
            ? null
            : MessageSendingState.fromJson(json['sending_state']),
        schedulingState: json['scheduling_state'] == null
            ? null
            : MessageSchedulingState.fromJson(json['scheduling_state']),
        isOutgoing: json['is_outgoing'],
        isPinned: json['is_pinned'],
        isFromOffline: json['is_from_offline'],
        canBeSaved: json['can_be_saved'],
        hasTimestampedMedia: json['has_timestamped_media'],
        isChannelPost: json['is_channel_post'],
        isPaidStarSuggestedPost: json['is_paid_star_suggested_post'],
        isPaidGramSuggestedPost: json['is_paid_gram_suggested_post'],
        containsUnreadMention: json['contains_unread_mention'],
        containsUnreadPollVotes: json['contains_unread_poll_votes'],
        date: json['date'],
        editDate: json['edit_date'],
        forwardInfo: json['forward_info'] == null
            ? null
            : MessageForwardInfo.fromJson(json['forward_info']),
        importInfo: json['import_info'] == null
            ? null
            : MessageImportInfo.fromJson(json['import_info']),
        interactionInfo: json['interaction_info'] == null
            ? null
            : MessageInteractionInfo.fromJson(json['interaction_info']),
        unreadReactions: List<UnreadReaction>.from(
            (json['unread_reactions'] ?? [])
                .map((item) => UnreadReaction.fromJson(item))
                .toList()),
        factCheck: json['fact_check'] == null
            ? null
            : FactCheck.fromJson(json['fact_check']),
        suggestedPostInfo: json['suggested_post_info'] == null
            ? null
            : SuggestedPostInfo.fromJson(json['suggested_post_info']),
        replyTo: json['reply_to'] == null
            ? null
            : MessageReplyTo.fromJson(json['reply_to']),
        topicId: json['topic_id'] == null
            ? null
            : MessageTopic.fromJson(json['topic_id']),
        selfDestructType: json['self_destruct_type'] == null
            ? null
            : MessageSelfDestructType.fromJson(json['self_destruct_type']),
        selfDestructIn: json['self_destruct_in'],
        autoDeleteIn: json['auto_delete_in'],
        viaBotUserId: json['via_bot_user_id'],
        guestBotCallerId: json['guest_bot_caller_id'] == null
            ? null
            : MessageSender.fromJson(json['guest_bot_caller_id']),
        senderBusinessBotUserId: json['sender_business_bot_user_id'],
        senderBoostCount: json['sender_boost_count'] ?? 0,
        senderTag: json['sender_tag'],
        paidMessageStarCount: json['paid_message_star_count'],
        authorSignature: json['author_signature'],
        mediaAlbumId: json['media_album_id'] is int
            ? json['media_album_id']
            : int.tryParse(json['media_album_id'] ?? "") ?? 0,
        effectId: json['effect_id'] is int
            ? json['effect_id']
            : int.tryParse(json['effect_id'] ?? "") ?? 0,
        restrictionInfo: json['restriction_info'] == null
            ? null
            : RestrictionInfo.fromJson(json['restriction_info']),
        summaryLanguageCode: json['summary_language_code'],
        content: MessageContent.fromJson(json['content']),
        ephemeralContent: json['ephemeral_content'] == null
            ? null
            : EphemeralMessageContent.fromJson(json['ephemeral_content']),
        replyMarkup: json['reply_markup'] == null
            ? null
            : ReplyMarkup.fromJson(json['reply_markup']),
        ephemeralMessageId: json['ephemeral_message_id'],
        chatInstance: json['chat_instance'] is int
            ? json['chat_instance']
            : int.parse(json['chat_instance']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sender_id": senderId.toJson(),
      "receiver_id": receiverId?.toJson(),
      "chat_id": chatId,
      "sending_state": sendingState?.toJson(),
      "scheduling_state": schedulingState?.toJson(),
      "is_outgoing": isOutgoing,
      "is_pinned": isPinned,
      "is_from_offline": isFromOffline,
      "can_be_saved": canBeSaved,
      "has_timestamped_media": hasTimestampedMedia,
      "is_channel_post": isChannelPost,
      "is_paid_star_suggested_post": isPaidStarSuggestedPost,
      "is_paid_gram_suggested_post": isPaidGramSuggestedPost,
      "contains_unread_mention": containsUnreadMention,
      "contains_unread_poll_votes": containsUnreadPollVotes,
      "date": date,
      "edit_date": editDate,
      "forward_info": forwardInfo?.toJson(),
      "import_info": importInfo?.toJson(),
      "interaction_info": interactionInfo?.toJson(),
      "unread_reactions": unreadReactions.map((i) => i.toJson()).toList(),
      "fact_check": factCheck?.toJson(),
      "suggested_post_info": suggestedPostInfo?.toJson(),
      "reply_to": replyTo?.toJson(),
      "topic_id": topicId?.toJson(),
      "self_destruct_type": selfDestructType?.toJson(),
      "self_destruct_in": selfDestructIn,
      "auto_delete_in": autoDeleteIn,
      "via_bot_user_id": viaBotUserId,
      "guest_bot_caller_id": guestBotCallerId?.toJson(),
      "sender_business_bot_user_id": senderBusinessBotUserId,
      "sender_boost_count": senderBoostCount,
      "sender_tag": senderTag,
      "paid_message_star_count": paidMessageStarCount,
      "author_signature": authorSignature,
      "media_album_id": mediaAlbumId,
      "effect_id": effectId,
      "restriction_info": restrictionInfo?.toJson(),
      "summary_language_code": summaryLanguageCode,
      "content": content.toJson(),
      "ephemeral_content": ephemeralContent?.toJson(),
      "reply_markup": replyMarkup?.toJson(),
      "ephemeral_message_id": ephemeralMessageId,
      "chat_instance": chatInstance,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Message identifier; unique for the chat to which the message belongs
  /// * [sender_id]: Identifier of the sender of the message
  /// * [receiver_id]: Identifier of the user or the chat which received the ephemeral message; may be null. Always null for non-ephemeral messages
  /// * [chat_id]: Chat identifier
  /// * [sending_state]: The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
  /// * [scheduling_state]: The scheduling state of the message; may be null if the message isn't scheduled
  /// * [is_outgoing]: True, if the message is outgoing
  /// * [is_pinned]: True, if the message is pinned
  /// * [is_from_offline]: True, if the message was sent because of a scheduled action by the message sender, for example, as away, or greeting service message
  /// * [can_be_saved]: True, if content of the message can be saved locally
  /// * [has_timestamped_media]: True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
  /// * [is_channel_post]: True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
  /// * [is_paid_star_suggested_post]: True, if the message is a suggested channel post which was paid in Telegram Stars; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending
  /// * [is_paid_gram_suggested_post]: True, if the message is a suggested channel post which was paid in TON Grams; a warning must be shown if the message is deleted in less than getOption("suggested_post_lifetime_min") seconds after sending
  /// * [contains_unread_mention]: True, if the message contains an unread mention for the current user
  /// * [contains_unread_poll_votes]: True, if the message is a poll message with unread votes
  /// * [date]: Point in time (Unix timestamp) when the message was sent; 0 for scheduled messages
  /// * [edit_date]: Point in time (Unix timestamp) when the message was last edited; 0 for scheduled messages. If getOption("show_message_edit_date_by_default") is true,. then the date must be shown along with the message instead of the date when the message was sent
  /// * [forward_info]: Information about the initial message sender; may be null if none or unknown
  /// * [import_info]: Information about the initial message for messages created with importMessages; may be null if the message isn't imported
  /// * [interaction_info]: Information about interactions with the message; may be null if none
  /// * [unread_reactions]: Information about unread reactions added to the message
  /// * [fact_check]: Information about fact-check added to the message; may be null if none
  /// * [suggested_post_info]: Information about the suggested post; may be null if the message isn't a suggested post
  /// * [reply_to]: Information about the message or the story this message is replying to; may be null if none
  /// * [topic_id]: Identifier of the topic within the chat to which the message belongs; may be null if none; may change when the chat is converted to a forum or back
  /// * [self_destruct_type]: The message's self-destruct type; may be null if none
  /// * [self_destruct_in]: Time left before the message self-destruct timer expires, in seconds; 0 if self-destruction isn't scheduled yet
  /// * [auto_delete_in]: Time left before the message will be automatically deleted by message_auto_delete_time setting of the chat, in seconds; 0 if never
  /// * [via_bot_user_id]: If non-zero, the user identifier of the inline bot through which this message was sent
  /// * [guest_bot_caller_id]: The identifier of the user or chat which used a guest bot to send the message; may be null if none
  /// * [sender_business_bot_user_id]: If non-zero, the user identifier of the business bot that sent this message
  /// * [sender_boost_count]: Number of times the sender of the message boosted the supergroup at the time the message was sent; 0 if none or unknown. For messages sent by the current user, supergroupFullInfo.my_boost_count must be used instead
  /// * [sender_tag]: Tag of the sender of the message in the supergroup at the time the message was sent; may be empty if none or unknown.. For messages sent in basic groups or by supergroup administrators, the current custom title or tag must be used instead
  /// * [paid_message_star_count]: The number of Telegram Stars the sender paid to send the message
  /// * [author_signature]: For channel posts and anonymous group messages, optional author signature
  /// * [media_album_id]: Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums
  /// * [effect_id]: Unique identifier of the effect added to the message; 0 if none
  /// * [restriction_info]: Information about the restrictions that must be applied to the message content; may be null if none
  /// * [summary_language_code]: IETF language tag of the message language on which it can be summarized; empty if summary isn't available for the message
  /// * [content]: Content of the message
  /// * [ephemeral_content]: Content of the message, which is visible only to the current user and must be shown instead of the regular content; may be null if none
  /// * [reply_markup]: Reply markup for the message; may be null if none
  /// * [ephemeral_message_id]: Unique identifier of the ephemeral message if the message is ephemeral; for bots only
  /// * [chat_instance]: Identifier that uniquely corresponds to the chat to which the message was sent; for bots only
  Message copyWith({
    int? id,
    MessageSender? senderId,
    MessageSender? receiverId,
    int? chatId,
    MessageSendingState? sendingState,
    MessageSchedulingState? schedulingState,
    bool? isOutgoing,
    bool? isPinned,
    bool? isFromOffline,
    bool? canBeSaved,
    bool? hasTimestampedMedia,
    bool? isChannelPost,
    bool? isPaidStarSuggestedPost,
    bool? isPaidGramSuggestedPost,
    bool? containsUnreadMention,
    bool? containsUnreadPollVotes,
    int? date,
    int? editDate,
    MessageForwardInfo? forwardInfo,
    MessageImportInfo? importInfo,
    MessageInteractionInfo? interactionInfo,
    List<UnreadReaction>? unreadReactions,
    FactCheck? factCheck,
    SuggestedPostInfo? suggestedPostInfo,
    MessageReplyTo? replyTo,
    MessageTopic? topicId,
    MessageSelfDestructType? selfDestructType,
    double? selfDestructIn,
    double? autoDeleteIn,
    int? viaBotUserId,
    MessageSender? guestBotCallerId,
    int? senderBusinessBotUserId,
    int? senderBoostCount,
    String? senderTag,
    int? paidMessageStarCount,
    String? authorSignature,
    int? mediaAlbumId,
    int? effectId,
    RestrictionInfo? restrictionInfo,
    String? summaryLanguageCode,
    MessageContent? content,
    EphemeralMessageContent? ephemeralContent,
    ReplyMarkup? replyMarkup,
    int? ephemeralMessageId,
    int? chatInstance,
    dynamic extra,
    int? clientId,
  }) =>
      Message(
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        chatId: chatId ?? this.chatId,
        sendingState: sendingState ?? this.sendingState,
        schedulingState: schedulingState ?? this.schedulingState,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        isPinned: isPinned ?? this.isPinned,
        isFromOffline: isFromOffline ?? this.isFromOffline,
        canBeSaved: canBeSaved ?? this.canBeSaved,
        hasTimestampedMedia: hasTimestampedMedia ?? this.hasTimestampedMedia,
        isChannelPost: isChannelPost ?? this.isChannelPost,
        isPaidStarSuggestedPost:
            isPaidStarSuggestedPost ?? this.isPaidStarSuggestedPost,
        isPaidGramSuggestedPost:
            isPaidGramSuggestedPost ?? this.isPaidGramSuggestedPost,
        containsUnreadMention:
            containsUnreadMention ?? this.containsUnreadMention,
        containsUnreadPollVotes:
            containsUnreadPollVotes ?? this.containsUnreadPollVotes,
        date: date ?? this.date,
        editDate: editDate ?? this.editDate,
        forwardInfo: forwardInfo ?? this.forwardInfo,
        importInfo: importInfo ?? this.importInfo,
        interactionInfo: interactionInfo ?? this.interactionInfo,
        unreadReactions: unreadReactions ?? this.unreadReactions,
        factCheck: factCheck ?? this.factCheck,
        suggestedPostInfo: suggestedPostInfo ?? this.suggestedPostInfo,
        replyTo: replyTo ?? this.replyTo,
        topicId: topicId ?? this.topicId,
        selfDestructType: selfDestructType ?? this.selfDestructType,
        selfDestructIn: selfDestructIn ?? this.selfDestructIn,
        autoDeleteIn: autoDeleteIn ?? this.autoDeleteIn,
        viaBotUserId: viaBotUserId ?? this.viaBotUserId,
        guestBotCallerId: guestBotCallerId ?? this.guestBotCallerId,
        senderBusinessBotUserId:
            senderBusinessBotUserId ?? this.senderBusinessBotUserId,
        senderBoostCount: senderBoostCount ?? this.senderBoostCount,
        senderTag: senderTag ?? this.senderTag,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
        authorSignature: authorSignature ?? this.authorSignature,
        mediaAlbumId: mediaAlbumId ?? this.mediaAlbumId,
        effectId: effectId ?? this.effectId,
        restrictionInfo: restrictionInfo ?? this.restrictionInfo,
        summaryLanguageCode: summaryLanguageCode ?? this.summaryLanguageCode,
        content: content ?? this.content,
        ephemeralContent: ephemeralContent ?? this.ephemeralContent,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        ephemeralMessageId: ephemeralMessageId ?? this.ephemeralMessageId,
        chatInstance: chatInstance ?? this.chatInstance,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'message';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
