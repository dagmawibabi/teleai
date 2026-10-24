part of '../tdapi.dart';

/// **ForwardSource** *(forwardSource)* - basic class
///
/// Contains information about the last message from which a new message was forwarded last time.
///
/// * [chatId]: Identifier of the chat to which the message that was forwarded belonged; may be 0 if unknown.
/// * [messageId]: Identifier of the message; may be 0 if unknown.
/// * [senderId]: Identifier of the sender of the message; may be null if unknown or the new message was forwarded not to Saved Messages *(optional)*.
/// * [senderName]: Name of the sender of the message if the sender is hidden by their privacy settings.
/// * [date]: Point in time (Unix timestamp) when the message is sent; 0 if unknown.
/// * [isOutgoing]: True, if the message that was forwarded is outgoing; always false if sender is unknown.
final class ForwardSource extends TdObject {
  /// **ForwardSource** *(forwardSource)* - basic class
  ///
  /// Contains information about the last message from which a new message was forwarded last time.
  ///
  /// * [chatId]: Identifier of the chat to which the message that was forwarded belonged; may be 0 if unknown.
  /// * [messageId]: Identifier of the message; may be 0 if unknown.
  /// * [senderId]: Identifier of the sender of the message; may be null if unknown or the new message was forwarded not to Saved Messages *(optional)*.
  /// * [senderName]: Name of the sender of the message if the sender is hidden by their privacy settings.
  /// * [date]: Point in time (Unix timestamp) when the message is sent; 0 if unknown.
  /// * [isOutgoing]: True, if the message that was forwarded is outgoing; always false if sender is unknown.
  const ForwardSource({
    required this.chatId,
    required this.messageId,
    this.senderId,
    required this.senderName,
    required this.date,
    required this.isOutgoing,
  });

  /// Identifier of the chat to which the message that was forwarded belonged; may be 0 if unknown
  final int chatId;

  /// Identifier of the message; may be 0 if unknown
  final int messageId;

  /// Identifier of the sender of the message; may be null if unknown or the new message was forwarded not to Saved Messages
  final MessageSender? senderId;

  /// Name of the sender of the message if the sender is hidden by their privacy settings
  final String senderName;

  /// Point in time (Unix timestamp) when the message is sent; 0 if unknown
  final int date;

  /// True, if the message that was forwarded is outgoing; always false if sender is unknown
  final bool isOutgoing;

  /// Parse from a json
  factory ForwardSource.fromJson(Map<String, dynamic> json) => ForwardSource(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        senderId: json['sender_id'] == null
            ? null
            : MessageSender.fromJson(json['sender_id']),
        senderName: json['sender_name'],
        date: json['date'],
        isOutgoing: json['is_outgoing'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "sender_id": senderId?.toJson(),
      "sender_name": senderName,
      "date": date,
      "is_outgoing": isOutgoing,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message that was forwarded belonged; may be 0 if unknown
  /// * [message_id]: Identifier of the message; may be 0 if unknown
  /// * [sender_id]: Identifier of the sender of the message; may be null if unknown or the new message was forwarded not to Saved Messages
  /// * [sender_name]: Name of the sender of the message if the sender is hidden by their privacy settings
  /// * [date]: Point in time (Unix timestamp) when the message is sent; 0 if unknown
  /// * [is_outgoing]: True, if the message that was forwarded is outgoing; always false if sender is unknown
  ForwardSource copyWith({
    int? chatId,
    int? messageId,
    MessageSender? senderId,
    String? senderName,
    int? date,
    bool? isOutgoing,
  }) =>
      ForwardSource(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        senderId: senderId ?? this.senderId,
        senderName: senderName ?? this.senderName,
        date: date ?? this.date,
        isOutgoing: isOutgoing ?? this.isOutgoing,
      );

  /// TDLib object type
  static const String defaultObjectId = 'forwardSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
