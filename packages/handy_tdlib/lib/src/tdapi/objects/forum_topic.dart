part of '../tdapi.dart';

/// **ForumTopic** *(forumTopic)* - basic class
///
/// Describes a forum topic.
///
/// * [info]: Basic information about the topic.
/// * [lastMessage]: Last message in the topic; may be null if unknown *(optional)*.
/// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order.
/// * [isPinned]: True, if the topic is pinned in the topic list.
/// * [unreadCount]: Number of unread messages in the topic.
/// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
/// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
/// * [unreadMentionCount]: Number of unread messages with a mention/reply in the topic.
/// * [unreadReactionCount]: Number of messages with unread reactions in the topic.
/// * [unreadPollVoteCount]: Number of messages with unread poll votes in the topic.
/// * [notificationSettings]: Notification settings for the topic.
/// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
final class ForumTopic extends TdObject {
  /// **ForumTopic** *(forumTopic)* - basic class
  ///
  /// Describes a forum topic.
  ///
  /// * [info]: Basic information about the topic.
  /// * [lastMessage]: Last message in the topic; may be null if unknown *(optional)*.
  /// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order.
  /// * [isPinned]: True, if the topic is pinned in the topic list.
  /// * [unreadCount]: Number of unread messages in the topic.
  /// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
  /// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
  /// * [unreadMentionCount]: Number of unread messages with a mention/reply in the topic.
  /// * [unreadReactionCount]: Number of messages with unread reactions in the topic.
  /// * [unreadPollVoteCount]: Number of messages with unread poll votes in the topic.
  /// * [notificationSettings]: Notification settings for the topic.
  /// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
  const ForumTopic({
    required this.info,
    this.lastMessage,
    required this.order,
    required this.isPinned,
    required this.unreadCount,
    required this.lastReadInboxMessageId,
    required this.lastReadOutboxMessageId,
    required this.unreadMentionCount,
    required this.unreadReactionCount,
    required this.unreadPollVoteCount,
    required this.notificationSettings,
    this.draftMessage,
    this.extra,
    this.clientId,
  });

  /// Basic information about the topic
  final ForumTopicInfo info;

  /// Last message in the topic; may be null if unknown
  final Message? lastMessage;

  /// A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
  final int order;

  /// True, if the topic is pinned in the topic list
  final bool isPinned;

  /// Number of unread messages in the topic
  final int unreadCount;

  /// Identifier of the last read incoming message
  final int lastReadInboxMessageId;

  /// Identifier of the last read outgoing message
  final int lastReadOutboxMessageId;

  /// Number of unread messages with a mention/reply in the topic
  final int unreadMentionCount;

  /// Number of messages with unread reactions in the topic
  final int unreadReactionCount;

  /// Number of messages with unread poll votes in the topic
  final int unreadPollVoteCount;

  /// Notification settings for the topic
  final ChatNotificationSettings notificationSettings;

  /// A draft of a message in the topic; may be null if none
  final DraftMessage? draftMessage;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ForumTopic.fromJson(Map<String, dynamic> json) => ForumTopic(
        info: ForumTopicInfo.fromJson(json['info']),
        lastMessage: json['last_message'] == null
            ? null
            : Message.fromJson(json['last_message']),
        order: json['order'] is int ? json['order'] : int.parse(json['order']),
        isPinned: json['is_pinned'],
        unreadCount: json['unread_count'],
        lastReadInboxMessageId: json['last_read_inbox_message_id'],
        lastReadOutboxMessageId: json['last_read_outbox_message_id'],
        unreadMentionCount: json['unread_mention_count'],
        unreadReactionCount: json['unread_reaction_count'],
        unreadPollVoteCount: json['unread_poll_vote_count'],
        notificationSettings:
            ChatNotificationSettings.fromJson(json['notification_settings']),
        draftMessage: json['draft_message'] == null
            ? null
            : DraftMessage.fromJson(json['draft_message']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "info": info.toJson(),
      "last_message": lastMessage?.toJson(),
      "order": order,
      "is_pinned": isPinned,
      "unread_count": unreadCount,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
      "unread_mention_count": unreadMentionCount,
      "unread_reaction_count": unreadReactionCount,
      "unread_poll_vote_count": unreadPollVoteCount,
      "notification_settings": notificationSettings.toJson(),
      "draft_message": draftMessage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [info]: Basic information about the topic
  /// * [last_message]: Last message in the topic; may be null if unknown
  /// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
  /// * [is_pinned]: True, if the topic is pinned in the topic list
  /// * [unread_count]: Number of unread messages in the topic
  /// * [last_read_inbox_message_id]: Identifier of the last read incoming message
  /// * [last_read_outbox_message_id]: Identifier of the last read outgoing message
  /// * [unread_mention_count]: Number of unread messages with a mention/reply in the topic
  /// * [unread_reaction_count]: Number of messages with unread reactions in the topic
  /// * [unread_poll_vote_count]: Number of messages with unread poll votes in the topic
  /// * [notification_settings]: Notification settings for the topic
  /// * [draft_message]: A draft of a message in the topic; may be null if none
  ForumTopic copyWith({
    ForumTopicInfo? info,
    Message? lastMessage,
    int? order,
    bool? isPinned,
    int? unreadCount,
    int? lastReadInboxMessageId,
    int? lastReadOutboxMessageId,
    int? unreadMentionCount,
    int? unreadReactionCount,
    int? unreadPollVoteCount,
    ChatNotificationSettings? notificationSettings,
    DraftMessage? draftMessage,
    dynamic extra,
    int? clientId,
  }) =>
      ForumTopic(
        info: info ?? this.info,
        lastMessage: lastMessage ?? this.lastMessage,
        order: order ?? this.order,
        isPinned: isPinned ?? this.isPinned,
        unreadCount: unreadCount ?? this.unreadCount,
        lastReadInboxMessageId:
            lastReadInboxMessageId ?? this.lastReadInboxMessageId,
        lastReadOutboxMessageId:
            lastReadOutboxMessageId ?? this.lastReadOutboxMessageId,
        unreadMentionCount: unreadMentionCount ?? this.unreadMentionCount,
        unreadReactionCount: unreadReactionCount ?? this.unreadReactionCount,
        unreadPollVoteCount: unreadPollVoteCount ?? this.unreadPollVoteCount,
        notificationSettings: notificationSettings ?? this.notificationSettings,
        draftMessage: draftMessage ?? this.draftMessage,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'forumTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
