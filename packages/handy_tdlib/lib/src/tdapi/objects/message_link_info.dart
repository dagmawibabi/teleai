part of '../tdapi.dart';

/// **MessageLinkInfo** *(messageLinkInfo)* - basic class
///
/// Contains information about a link to a message or a forum topic in a chat.
///
/// * [isPublic]: True, if the link is a public link for a message or a forum topic in a chat.
/// * [chatId]: If found, identifier of the chat to which the link points, 0 otherwise.
/// * [topicId]: Identifier of the specific topic in which the message must be opened, or a topic to open if the message is missing; may be null if none *(optional)*.
/// * [message]: If found, the linked message; may be null *(optional)*.
/// * [mediaTimestamp]: Timestamp from which the video/audio/video note/voice note/story playing must start, in seconds; 0 if not specified. The media can be in the message content or in its link preview.
/// * [checklistTaskId]: Identifier of the checklist task that is linked; 0 if none.
/// * [pollOptionId]: Identifier of the poll option that is linked; empty if none.
/// * [forAlbum]: True, if the whole media album to which the message belongs is linked.
final class MessageLinkInfo extends TdObject {
  /// **MessageLinkInfo** *(messageLinkInfo)* - basic class
  ///
  /// Contains information about a link to a message or a forum topic in a chat.
  ///
  /// * [isPublic]: True, if the link is a public link for a message or a forum topic in a chat.
  /// * [chatId]: If found, identifier of the chat to which the link points, 0 otherwise.
  /// * [topicId]: Identifier of the specific topic in which the message must be opened, or a topic to open if the message is missing; may be null if none *(optional)*.
  /// * [message]: If found, the linked message; may be null *(optional)*.
  /// * [mediaTimestamp]: Timestamp from which the video/audio/video note/voice note/story playing must start, in seconds; 0 if not specified. The media can be in the message content or in its link preview.
  /// * [checklistTaskId]: Identifier of the checklist task that is linked; 0 if none.
  /// * [pollOptionId]: Identifier of the poll option that is linked; empty if none.
  /// * [forAlbum]: True, if the whole media album to which the message belongs is linked.
  const MessageLinkInfo({
    required this.isPublic,
    required this.chatId,
    this.topicId,
    this.message,
    required this.mediaTimestamp,
    required this.checklistTaskId,
    required this.pollOptionId,
    required this.forAlbum,
    this.extra,
    this.clientId,
  });

  /// True, if the link is a public link for a message or a forum topic in a chat
  final bool isPublic;

  /// If found, identifier of the chat to which the link points, 0 otherwise
  final int chatId;

  /// Identifier of the specific topic in which the message must be opened, or a topic to open if the message is missing; may be null if none
  final MessageTopic? topicId;

  /// If found, the linked message; may be null
  final Message? message;

  /// Timestamp from which the video/audio/video note/voice note/story playing must start, in seconds; 0 if not specified. The media can be in the message content or in its link preview
  final int mediaTimestamp;

  /// Identifier of the checklist task that is linked; 0 if none
  final int checklistTaskId;

  /// Identifier of the poll option that is linked; empty if none
  final String pollOptionId;

  /// True, if the whole media album to which the message belongs is linked
  final bool forAlbum;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory MessageLinkInfo.fromJson(Map<String, dynamic> json) =>
      MessageLinkInfo(
        isPublic: json['is_public'],
        chatId: json['chat_id'],
        topicId: json['topic_id'] == null
            ? null
            : MessageTopic.fromJson(json['topic_id']),
        message:
            json['message'] == null ? null : Message.fromJson(json['message']),
        mediaTimestamp: json['media_timestamp'],
        checklistTaskId: json['checklist_task_id'] ?? 0,
        pollOptionId: json['poll_option_id'],
        forAlbum: json['for_album'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_public": isPublic,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "message": message?.toJson(),
      "media_timestamp": mediaTimestamp,
      "checklist_task_id": checklistTaskId,
      "poll_option_id": pollOptionId,
      "for_album": forAlbum,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_public]: True, if the link is a public link for a message or a forum topic in a chat
  /// * [chat_id]: If found, identifier of the chat to which the link points, 0 otherwise
  /// * [topic_id]: Identifier of the specific topic in which the message must be opened, or a topic to open if the message is missing; may be null if none
  /// * [message]: If found, the linked message; may be null
  /// * [media_timestamp]: Timestamp from which the video/audio/video note/voice note/story playing must start, in seconds; 0 if not specified. The media can be in the message content or in its link preview
  /// * [checklist_task_id]: Identifier of the checklist task that is linked; 0 if none
  /// * [poll_option_id]: Identifier of the poll option that is linked; empty if none
  /// * [for_album]: True, if the whole media album to which the message belongs is linked
  MessageLinkInfo copyWith({
    bool? isPublic,
    int? chatId,
    MessageTopic? topicId,
    Message? message,
    int? mediaTimestamp,
    int? checklistTaskId,
    String? pollOptionId,
    bool? forAlbum,
    dynamic extra,
    int? clientId,
  }) =>
      MessageLinkInfo(
        isPublic: isPublic ?? this.isPublic,
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        message: message ?? this.message,
        mediaTimestamp: mediaTimestamp ?? this.mediaTimestamp,
        checklistTaskId: checklistTaskId ?? this.checklistTaskId,
        pollOptionId: pollOptionId ?? this.pollOptionId,
        forAlbum: forAlbum ?? this.forAlbum,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
