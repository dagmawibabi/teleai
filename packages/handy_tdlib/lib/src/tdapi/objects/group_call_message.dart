part of '../tdapi.dart';

/// **GroupCallMessage** *(groupCallMessage)* - basic class
///
/// Represents a message sent in a group call.
///
/// * [messageId]: Unique message identifier within the group call.
/// * [senderId]: Identifier of the sender of the message.
/// * [date]: Point in time (Unix timestamp) when the message was sent.
/// * [text]: Text of the message. If empty, then the message is a paid reaction in a live story.
/// * [paidMessageStarCount]: The number of Telegram Stars that were paid to send the message; for live stories only.
/// * [isFromOwner]: True, if the message is sent by the owner of the call and must be treated as a message of the maximum level; for live stories only.
/// * [canBeDeleted]: True, if the message can be deleted by the current user; for live stories only.
final class GroupCallMessage extends TdObject {
  /// **GroupCallMessage** *(groupCallMessage)* - basic class
  ///
  /// Represents a message sent in a group call.
  ///
  /// * [messageId]: Unique message identifier within the group call.
  /// * [senderId]: Identifier of the sender of the message.
  /// * [date]: Point in time (Unix timestamp) when the message was sent.
  /// * [text]: Text of the message. If empty, then the message is a paid reaction in a live story.
  /// * [paidMessageStarCount]: The number of Telegram Stars that were paid to send the message; for live stories only.
  /// * [isFromOwner]: True, if the message is sent by the owner of the call and must be treated as a message of the maximum level; for live stories only.
  /// * [canBeDeleted]: True, if the message can be deleted by the current user; for live stories only.
  const GroupCallMessage({
    required this.messageId,
    required this.senderId,
    required this.date,
    required this.text,
    required this.paidMessageStarCount,
    required this.isFromOwner,
    required this.canBeDeleted,
  });

  /// Unique message identifier within the group call
  final int messageId;

  /// Identifier of the sender of the message
  final MessageSender senderId;

  /// Point in time (Unix timestamp) when the message was sent
  final int date;

  /// Text of the message. If empty, then the message is a paid reaction in a live story
  final FormattedText text;

  /// The number of Telegram Stars that were paid to send the message; for live stories only
  final int paidMessageStarCount;

  /// True, if the message is sent by the owner of the call and must be treated as a message of the maximum level; for live stories only
  final bool isFromOwner;

  /// True, if the message can be deleted by the current user; for live stories only
  final bool canBeDeleted;

  /// Parse from a json
  factory GroupCallMessage.fromJson(Map<String, dynamic> json) =>
      GroupCallMessage(
        messageId: json['message_id'],
        senderId: MessageSender.fromJson(json['sender_id']),
        date: json['date'],
        text: FormattedText.fromJson(json['text']),
        paidMessageStarCount: json['paid_message_star_count'],
        isFromOwner: json['is_from_owner'],
        canBeDeleted: json['can_be_deleted'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
      "sender_id": senderId.toJson(),
      "date": date,
      "text": text.toJson(),
      "paid_message_star_count": paidMessageStarCount,
      "is_from_owner": isFromOwner,
      "can_be_deleted": canBeDeleted,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: Unique message identifier within the group call
  /// * [sender_id]: Identifier of the sender of the message
  /// * [date]: Point in time (Unix timestamp) when the message was sent
  /// * [text]: Text of the message. If empty, then the message is a paid reaction in a live story
  /// * [paid_message_star_count]: The number of Telegram Stars that were paid to send the message; for live stories only
  /// * [is_from_owner]: True, if the message is sent by the owner of the call and must be treated as a message of the maximum level; for live stories only
  /// * [can_be_deleted]: True, if the message can be deleted by the current user; for live stories only
  GroupCallMessage copyWith({
    int? messageId,
    MessageSender? senderId,
    int? date,
    FormattedText? text,
    int? paidMessageStarCount,
    bool? isFromOwner,
    bool? canBeDeleted,
  }) =>
      GroupCallMessage(
        messageId: messageId ?? this.messageId,
        senderId: senderId ?? this.senderId,
        date: date ?? this.date,
        text: text ?? this.text,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
        isFromOwner: isFromOwner ?? this.isFromOwner,
        canBeDeleted: canBeDeleted ?? this.canBeDeleted,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
