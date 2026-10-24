part of '../tdapi.dart';

/// **NotificationType** *(notificationType)* - parent
///
/// Contains detailed information about a notification.
sealed class NotificationType extends TdObject {
  /// **NotificationType** *(notificationType)* - parent
  ///
  /// Contains detailed information about a notification.
  const NotificationType();

  /// a NotificationType return type can be :
  /// * [NotificationTypeNewMessage]
  /// * [NotificationTypeNewSecretChat]
  /// * [NotificationTypeNewCall]
  /// * [NotificationTypeNewPushMessage]
  factory NotificationType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case NotificationTypeNewMessage.defaultObjectId:
        return NotificationTypeNewMessage.fromJson(json);
      case NotificationTypeNewSecretChat.defaultObjectId:
        return NotificationTypeNewSecretChat.fromJson(json);
      case NotificationTypeNewCall.defaultObjectId:
        return NotificationTypeNewCall.fromJson(json);
      case NotificationTypeNewPushMessage.defaultObjectId:
        return NotificationTypeNewPushMessage.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of NotificationType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  NotificationType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'notificationType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationTypeNewMessage** *(notificationTypeNewMessage)* - child of NotificationType
///
/// New message was received.
///
/// * [message]: The message.
/// * [showPreview]: True, if message content must be displayed in notifications.
final class NotificationTypeNewMessage extends NotificationType {
  /// **NotificationTypeNewMessage** *(notificationTypeNewMessage)* - child of NotificationType
  ///
  /// New message was received.
  ///
  /// * [message]: The message.
  /// * [showPreview]: True, if message content must be displayed in notifications.
  const NotificationTypeNewMessage({
    required this.message,
    required this.showPreview,
  });

  /// The message
  final Message message;

  /// True, if message content must be displayed in notifications
  final bool showPreview;

  /// Parse from a json
  factory NotificationTypeNewMessage.fromJson(Map<String, dynamic> json) =>
      NotificationTypeNewMessage(
        message: Message.fromJson(json['message']),
        showPreview: json['show_preview'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "show_preview": showPreview,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The message
  /// * [show_preview]: True, if message content must be displayed in notifications
  @override
  NotificationTypeNewMessage copyWith({
    Message? message,
    bool? showPreview,
  }) =>
      NotificationTypeNewMessage(
        message: message ?? this.message,
        showPreview: showPreview ?? this.showPreview,
      );

  /// TDLib object type
  static const String defaultObjectId = 'notificationTypeNewMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationTypeNewSecretChat** *(notificationTypeNewSecretChat)* - child of NotificationType
///
/// New secret chat was created.
final class NotificationTypeNewSecretChat extends NotificationType {
  /// **NotificationTypeNewSecretChat** *(notificationTypeNewSecretChat)* - child of NotificationType
  ///
  /// New secret chat was created.
  const NotificationTypeNewSecretChat();

  /// Parse from a json
  factory NotificationTypeNewSecretChat.fromJson(Map<String, dynamic> json) =>
      const NotificationTypeNewSecretChat();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  NotificationTypeNewSecretChat copyWith() =>
      const NotificationTypeNewSecretChat();

  /// TDLib object type
  static const String defaultObjectId = 'notificationTypeNewSecretChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationTypeNewCall** *(notificationTypeNewCall)* - child of NotificationType
///
/// New call was received.
///
/// * [callId]: Call identifier.
final class NotificationTypeNewCall extends NotificationType {
  /// **NotificationTypeNewCall** *(notificationTypeNewCall)* - child of NotificationType
  ///
  /// New call was received.
  ///
  /// * [callId]: Call identifier.
  const NotificationTypeNewCall({
    required this.callId,
  });

  /// Call identifier
  final int callId;

  /// Parse from a json
  factory NotificationTypeNewCall.fromJson(Map<String, dynamic> json) =>
      NotificationTypeNewCall(
        callId: json['call_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "call_id": callId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call_id]: Call identifier
  @override
  NotificationTypeNewCall copyWith({
    int? callId,
  }) =>
      NotificationTypeNewCall(
        callId: callId ?? this.callId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'notificationTypeNewCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **NotificationTypeNewPushMessage** *(notificationTypeNewPushMessage)* - child of NotificationType
///
/// New message was received through a push notification.
///
/// * [messageId]: The message identifier. The message will not be available in the chat history, but the identifier can be used in viewMessages, or as a message to be replied in the same chat.
/// * [senderId]: Identifier of the sender of the message. Corresponding user or chat may be inaccessible.
/// * [senderName]: Name of the sender.
/// * [isOutgoing]: True, if the message is outgoing.
/// * [content]: Push message content.
final class NotificationTypeNewPushMessage extends NotificationType {
  /// **NotificationTypeNewPushMessage** *(notificationTypeNewPushMessage)* - child of NotificationType
  ///
  /// New message was received through a push notification.
  ///
  /// * [messageId]: The message identifier. The message will not be available in the chat history, but the identifier can be used in viewMessages, or as a message to be replied in the same chat.
  /// * [senderId]: Identifier of the sender of the message. Corresponding user or chat may be inaccessible.
  /// * [senderName]: Name of the sender.
  /// * [isOutgoing]: True, if the message is outgoing.
  /// * [content]: Push message content.
  const NotificationTypeNewPushMessage({
    required this.messageId,
    required this.senderId,
    required this.senderName,
    required this.isOutgoing,
    required this.content,
  });

  /// The message identifier. The message will not be available in the chat history, but the identifier can be used in viewMessages, or as a message to be replied in the same chat
  final int messageId;

  /// Identifier of the sender of the message. Corresponding user or chat may be inaccessible
  final MessageSender senderId;

  /// Name of the sender
  final String senderName;

  /// True, if the message is outgoing
  final bool isOutgoing;

  /// Push message content
  final PushMessageContent content;

  /// Parse from a json
  factory NotificationTypeNewPushMessage.fromJson(Map<String, dynamic> json) =>
      NotificationTypeNewPushMessage(
        messageId: json['message_id'],
        senderId: MessageSender.fromJson(json['sender_id']),
        senderName: json['sender_name'],
        isOutgoing: json['is_outgoing'],
        content: PushMessageContent.fromJson(json['content']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
      "sender_id": senderId.toJson(),
      "sender_name": senderName,
      "is_outgoing": isOutgoing,
      "content": content.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: The message identifier. The message will not be available in the chat history, but the identifier can be used in viewMessages, or as a message to be replied in the same chat
  /// * [sender_id]: Identifier of the sender of the message. Corresponding user or chat may be inaccessible
  /// * [sender_name]: Name of the sender
  /// * [is_outgoing]: True, if the message is outgoing
  /// * [content]: Push message content
  @override
  NotificationTypeNewPushMessage copyWith({
    int? messageId,
    MessageSender? senderId,
    String? senderName,
    bool? isOutgoing,
    PushMessageContent? content,
  }) =>
      NotificationTypeNewPushMessage(
        messageId: messageId ?? this.messageId,
        senderId: senderId ?? this.senderId,
        senderName: senderName ?? this.senderName,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        content: content ?? this.content,
      );

  /// TDLib object type
  static const String defaultObjectId = 'notificationTypeNewPushMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
