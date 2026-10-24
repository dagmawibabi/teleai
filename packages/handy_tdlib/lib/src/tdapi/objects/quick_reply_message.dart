part of '../tdapi.dart';

/// **QuickReplyMessage** *(quickReplyMessage)* - basic class
///
/// Describes a message that can be used for quick reply.
///
/// * [id]: Unique message identifier among all quick replies.
/// * [sendingState]: The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent *(optional)*.
/// * [canBeEdited]: True, if the message can be edited.
/// * [replyToMessageId]: The identifier of the quick reply message to which the message replies; 0 if none.
/// * [viaBotUserId]: If non-zero, the user identifier of the bot through which this message was sent.
/// * [mediaAlbumId]: Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums.
/// * [content]: Content of the message.
/// * [replyMarkup]: Inline keyboard reply markup for the message; may be null if none *(optional)*.
final class QuickReplyMessage extends TdObject {
  /// **QuickReplyMessage** *(quickReplyMessage)* - basic class
  ///
  /// Describes a message that can be used for quick reply.
  ///
  /// * [id]: Unique message identifier among all quick replies.
  /// * [sendingState]: The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent *(optional)*.
  /// * [canBeEdited]: True, if the message can be edited.
  /// * [replyToMessageId]: The identifier of the quick reply message to which the message replies; 0 if none.
  /// * [viaBotUserId]: If non-zero, the user identifier of the bot through which this message was sent.
  /// * [mediaAlbumId]: Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums.
  /// * [content]: Content of the message.
  /// * [replyMarkup]: Inline keyboard reply markup for the message; may be null if none *(optional)*.
  const QuickReplyMessage({
    required this.id,
    this.sendingState,
    required this.canBeEdited,
    required this.replyToMessageId,
    required this.viaBotUserId,
    required this.mediaAlbumId,
    required this.content,
    this.replyMarkup,
    this.extra,
    this.clientId,
  });

  /// Unique message identifier among all quick replies
  final int id;

  /// The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
  final MessageSendingState? sendingState;

  /// True, if the message can be edited
  final bool canBeEdited;

  /// The identifier of the quick reply message to which the message replies; 0 if none
  final int replyToMessageId;

  /// If non-zero, the user identifier of the bot through which this message was sent
  final int viaBotUserId;

  /// Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums
  final int mediaAlbumId;

  /// Content of the message
  final MessageContent content;

  /// Inline keyboard reply markup for the message; may be null if none
  final ReplyMarkup? replyMarkup;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory QuickReplyMessage.fromJson(Map<String, dynamic> json) =>
      QuickReplyMessage(
        id: json['id'],
        sendingState: json['sending_state'] == null
            ? null
            : MessageSendingState.fromJson(json['sending_state']),
        canBeEdited: json['can_be_edited'],
        replyToMessageId: json['reply_to_message_id'] ?? 0,
        viaBotUserId: json['via_bot_user_id'],
        mediaAlbumId: json['media_album_id'] is int
            ? json['media_album_id']
            : int.tryParse(json['media_album_id'] ?? "") ?? 0,
        content: MessageContent.fromJson(json['content']),
        replyMarkup: json['reply_markup'] == null
            ? null
            : ReplyMarkup.fromJson(json['reply_markup']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "sending_state": sendingState?.toJson(),
      "can_be_edited": canBeEdited,
      "reply_to_message_id": replyToMessageId,
      "via_bot_user_id": viaBotUserId,
      "media_album_id": mediaAlbumId,
      "content": content.toJson(),
      "reply_markup": replyMarkup?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique message identifier among all quick replies
  /// * [sending_state]: The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
  /// * [can_be_edited]: True, if the message can be edited
  /// * [reply_to_message_id]: The identifier of the quick reply message to which the message replies; 0 if none
  /// * [via_bot_user_id]: If non-zero, the user identifier of the bot through which this message was sent
  /// * [media_album_id]: Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums
  /// * [content]: Content of the message
  /// * [reply_markup]: Inline keyboard reply markup for the message; may be null if none
  QuickReplyMessage copyWith({
    int? id,
    MessageSendingState? sendingState,
    bool? canBeEdited,
    int? replyToMessageId,
    int? viaBotUserId,
    int? mediaAlbumId,
    MessageContent? content,
    ReplyMarkup? replyMarkup,
    dynamic extra,
    int? clientId,
  }) =>
      QuickReplyMessage(
        id: id ?? this.id,
        sendingState: sendingState ?? this.sendingState,
        canBeEdited: canBeEdited ?? this.canBeEdited,
        replyToMessageId: replyToMessageId ?? this.replyToMessageId,
        viaBotUserId: viaBotUserId ?? this.viaBotUserId,
        mediaAlbumId: mediaAlbumId ?? this.mediaAlbumId,
        content: content ?? this.content,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'quickReplyMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
