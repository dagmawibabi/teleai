part of '../tdapi.dart';

/// **DirectMessagesChatTopic** *(directMessagesChatTopic)* - basic class
///
/// Contains information about a topic in a channel direct messages chat administered by the current user.
///
/// * [chatId]: Identifier of the chat to which the topic belongs.
/// * [id]: Unique topic identifier.
/// * [senderId]: Identifier of the user or chat that sends the messages to the topic.
/// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order.
/// * [canSendUnpaidMessages]: True, if the other party can send unpaid messages even if the chat has paid messages enabled.
/// * [isMarkedAsUnread]: True, if the topic is marked as unread.
/// * [unreadCount]: Number of unread messages in the chat.
/// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
/// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
/// * [unreadReactionCount]: Number of messages with unread reactions in the chat.
/// * [lastMessage]: Last message in the topic; may be null if none or unknown *(optional)*.
/// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
final class DirectMessagesChatTopic extends TdObject {
  /// **DirectMessagesChatTopic** *(directMessagesChatTopic)* - basic class
  ///
  /// Contains information about a topic in a channel direct messages chat administered by the current user.
  ///
  /// * [chatId]: Identifier of the chat to which the topic belongs.
  /// * [id]: Unique topic identifier.
  /// * [senderId]: Identifier of the user or chat that sends the messages to the topic.
  /// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order.
  /// * [canSendUnpaidMessages]: True, if the other party can send unpaid messages even if the chat has paid messages enabled.
  /// * [isMarkedAsUnread]: True, if the topic is marked as unread.
  /// * [unreadCount]: Number of unread messages in the chat.
  /// * [lastReadInboxMessageId]: Identifier of the last read incoming message.
  /// * [lastReadOutboxMessageId]: Identifier of the last read outgoing message.
  /// * [unreadReactionCount]: Number of messages with unread reactions in the chat.
  /// * [lastMessage]: Last message in the topic; may be null if none or unknown *(optional)*.
  /// * [draftMessage]: A draft of a message in the topic; may be null if none *(optional)*.
  const DirectMessagesChatTopic({
    required this.chatId,
    required this.id,
    required this.senderId,
    required this.order,
    required this.canSendUnpaidMessages,
    required this.isMarkedAsUnread,
    required this.unreadCount,
    required this.lastReadInboxMessageId,
    required this.lastReadOutboxMessageId,
    required this.unreadReactionCount,
    this.lastMessage,
    this.draftMessage,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat to which the topic belongs
  final int chatId;

  /// Unique topic identifier
  final int id;

  /// Identifier of the user or chat that sends the messages to the topic
  final MessageSender senderId;

  /// A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
  final int order;

  /// True, if the other party can send unpaid messages even if the chat has paid messages enabled
  final bool canSendUnpaidMessages;

  /// True, if the topic is marked as unread
  final bool isMarkedAsUnread;

  /// Number of unread messages in the chat
  final int unreadCount;

  /// Identifier of the last read incoming message
  final int lastReadInboxMessageId;

  /// Identifier of the last read outgoing message
  final int lastReadOutboxMessageId;

  /// Number of messages with unread reactions in the chat
  final int unreadReactionCount;

  /// Last message in the topic; may be null if none or unknown
  final Message? lastMessage;

  /// A draft of a message in the topic; may be null if none
  final DraftMessage? draftMessage;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory DirectMessagesChatTopic.fromJson(Map<String, dynamic> json) =>
      DirectMessagesChatTopic(
        chatId: json['chat_id'],
        id: json['id'],
        senderId: MessageSender.fromJson(json['sender_id']),
        order: json['order'] is int ? json['order'] : int.parse(json['order']),
        canSendUnpaidMessages: json['can_send_unpaid_messages'],
        isMarkedAsUnread: json['is_marked_as_unread'],
        unreadCount: json['unread_count'],
        lastReadInboxMessageId: json['last_read_inbox_message_id'],
        lastReadOutboxMessageId: json['last_read_outbox_message_id'],
        unreadReactionCount: json['unread_reaction_count'],
        lastMessage: json['last_message'] == null
            ? null
            : Message.fromJson(json['last_message']),
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
      "chat_id": chatId,
      "id": id,
      "sender_id": senderId.toJson(),
      "order": order,
      "can_send_unpaid_messages": canSendUnpaidMessages,
      "is_marked_as_unread": isMarkedAsUnread,
      "unread_count": unreadCount,
      "last_read_inbox_message_id": lastReadInboxMessageId,
      "last_read_outbox_message_id": lastReadOutboxMessageId,
      "unread_reaction_count": unreadReactionCount,
      "last_message": lastMessage?.toJson(),
      "draft_message": draftMessage?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the topic belongs
  /// * [id]: Unique topic identifier
  /// * [sender_id]: Identifier of the user or chat that sends the messages to the topic
  /// * [order]: A parameter used to determine order of the topic in the topic list. Topics must be sorted by the order in descending order
  /// * [can_send_unpaid_messages]: True, if the other party can send unpaid messages even if the chat has paid messages enabled
  /// * [is_marked_as_unread]: True, if the topic is marked as unread
  /// * [unread_count]: Number of unread messages in the chat
  /// * [last_read_inbox_message_id]: Identifier of the last read incoming message
  /// * [last_read_outbox_message_id]: Identifier of the last read outgoing message
  /// * [unread_reaction_count]: Number of messages with unread reactions in the chat
  /// * [last_message]: Last message in the topic; may be null if none or unknown
  /// * [draft_message]: A draft of a message in the topic; may be null if none
  DirectMessagesChatTopic copyWith({
    int? chatId,
    int? id,
    MessageSender? senderId,
    int? order,
    bool? canSendUnpaidMessages,
    bool? isMarkedAsUnread,
    int? unreadCount,
    int? lastReadInboxMessageId,
    int? lastReadOutboxMessageId,
    int? unreadReactionCount,
    Message? lastMessage,
    DraftMessage? draftMessage,
    dynamic extra,
    int? clientId,
  }) =>
      DirectMessagesChatTopic(
        chatId: chatId ?? this.chatId,
        id: id ?? this.id,
        senderId: senderId ?? this.senderId,
        order: order ?? this.order,
        canSendUnpaidMessages:
            canSendUnpaidMessages ?? this.canSendUnpaidMessages,
        isMarkedAsUnread: isMarkedAsUnread ?? this.isMarkedAsUnread,
        unreadCount: unreadCount ?? this.unreadCount,
        lastReadInboxMessageId:
            lastReadInboxMessageId ?? this.lastReadInboxMessageId,
        lastReadOutboxMessageId:
            lastReadOutboxMessageId ?? this.lastReadOutboxMessageId,
        unreadReactionCount: unreadReactionCount ?? this.unreadReactionCount,
        lastMessage: lastMessage ?? this.lastMessage,
        draftMessage: draftMessage ?? this.draftMessage,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'directMessagesChatTopic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
