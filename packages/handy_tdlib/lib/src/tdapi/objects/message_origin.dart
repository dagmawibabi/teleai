part of '../tdapi.dart';

/// **MessageOrigin** *(messageOrigin)* - parent
///
/// Contains information about the origin of a message.
sealed class MessageOrigin extends TdObject {
  /// **MessageOrigin** *(messageOrigin)* - parent
  ///
  /// Contains information about the origin of a message.
  const MessageOrigin();

  /// a MessageOrigin return type can be :
  /// * [MessageOriginUser]
  /// * [MessageOriginHiddenUser]
  /// * [MessageOriginChat]
  /// * [MessageOriginChannel]
  factory MessageOrigin.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageOriginUser.defaultObjectId:
        return MessageOriginUser.fromJson(json);
      case MessageOriginHiddenUser.defaultObjectId:
        return MessageOriginHiddenUser.fromJson(json);
      case MessageOriginChat.defaultObjectId:
        return MessageOriginChat.fromJson(json);
      case MessageOriginChannel.defaultObjectId:
        return MessageOriginChannel.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageOrigin)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageOrigin copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageOrigin';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageOriginUser** *(messageOriginUser)* - child of MessageOrigin
///
/// The message was originally sent by a known user.
///
/// * [senderUserId]: Identifier of the user who originally sent the message.
final class MessageOriginUser extends MessageOrigin {
  /// **MessageOriginUser** *(messageOriginUser)* - child of MessageOrigin
  ///
  /// The message was originally sent by a known user.
  ///
  /// * [senderUserId]: Identifier of the user who originally sent the message.
  const MessageOriginUser({
    required this.senderUserId,
  });

  /// Identifier of the user who originally sent the message
  final int senderUserId;

  /// Parse from a json
  factory MessageOriginUser.fromJson(Map<String, dynamic> json) =>
      MessageOriginUser(
        senderUserId: json['sender_user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_user_id": senderUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_user_id]: Identifier of the user who originally sent the message
  @override
  MessageOriginUser copyWith({
    int? senderUserId,
  }) =>
      MessageOriginUser(
        senderUserId: senderUserId ?? this.senderUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageOriginUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageOriginHiddenUser** *(messageOriginHiddenUser)* - child of MessageOrigin
///
/// The message was originally sent by a user who is hidden by their privacy settings.
///
/// * [senderName]: Name of the sender.
final class MessageOriginHiddenUser extends MessageOrigin {
  /// **MessageOriginHiddenUser** *(messageOriginHiddenUser)* - child of MessageOrigin
  ///
  /// The message was originally sent by a user who is hidden by their privacy settings.
  ///
  /// * [senderName]: Name of the sender.
  const MessageOriginHiddenUser({
    required this.senderName,
  });

  /// Name of the sender
  final String senderName;

  /// Parse from a json
  factory MessageOriginHiddenUser.fromJson(Map<String, dynamic> json) =>
      MessageOriginHiddenUser(
        senderName: json['sender_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_name": senderName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_name]: Name of the sender
  @override
  MessageOriginHiddenUser copyWith({
    String? senderName,
  }) =>
      MessageOriginHiddenUser(
        senderName: senderName ?? this.senderName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageOriginHiddenUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageOriginChat** *(messageOriginChat)* - child of MessageOrigin
///
/// The message was originally sent on behalf of a chat.
///
/// * [senderChatId]: Identifier of the chat that originally sent the message.
/// * [authorSignature]: For messages originally sent by an anonymous chat administrator, original message author signature.
final class MessageOriginChat extends MessageOrigin {
  /// **MessageOriginChat** *(messageOriginChat)* - child of MessageOrigin
  ///
  /// The message was originally sent on behalf of a chat.
  ///
  /// * [senderChatId]: Identifier of the chat that originally sent the message.
  /// * [authorSignature]: For messages originally sent by an anonymous chat administrator, original message author signature.
  const MessageOriginChat({
    required this.senderChatId,
    required this.authorSignature,
  });

  /// Identifier of the chat that originally sent the message
  final int senderChatId;

  /// For messages originally sent by an anonymous chat administrator, original message author signature
  final String authorSignature;

  /// Parse from a json
  factory MessageOriginChat.fromJson(Map<String, dynamic> json) =>
      MessageOriginChat(
        senderChatId: json['sender_chat_id'],
        authorSignature: json['author_signature'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_chat_id": senderChatId,
      "author_signature": authorSignature,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_chat_id]: Identifier of the chat that originally sent the message
  /// * [author_signature]: For messages originally sent by an anonymous chat administrator, original message author signature
  @override
  MessageOriginChat copyWith({
    int? senderChatId,
    String? authorSignature,
  }) =>
      MessageOriginChat(
        senderChatId: senderChatId ?? this.senderChatId,
        authorSignature: authorSignature ?? this.authorSignature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageOriginChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageOriginChannel** *(messageOriginChannel)* - child of MessageOrigin
///
/// The message was originally a post in a channel.
///
/// * [chatId]: Identifier of the channel chat to which the message was originally sent.
/// * [messageId]: Message identifier of the original message.
/// * [authorSignature]: Original post author signature.
final class MessageOriginChannel extends MessageOrigin {
  /// **MessageOriginChannel** *(messageOriginChannel)* - child of MessageOrigin
  ///
  /// The message was originally a post in a channel.
  ///
  /// * [chatId]: Identifier of the channel chat to which the message was originally sent.
  /// * [messageId]: Message identifier of the original message.
  /// * [authorSignature]: Original post author signature.
  const MessageOriginChannel({
    required this.chatId,
    required this.messageId,
    required this.authorSignature,
  });

  /// Identifier of the channel chat to which the message was originally sent
  final int chatId;

  /// Message identifier of the original message
  final int messageId;

  /// Original post author signature
  final String authorSignature;

  /// Parse from a json
  factory MessageOriginChannel.fromJson(Map<String, dynamic> json) =>
      MessageOriginChannel(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        authorSignature: json['author_signature'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "author_signature": authorSignature,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat to which the message was originally sent
  /// * [message_id]: Message identifier of the original message
  /// * [author_signature]: Original post author signature
  @override
  MessageOriginChannel copyWith({
    int? chatId,
    int? messageId,
    String? authorSignature,
  }) =>
      MessageOriginChannel(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        authorSignature: authorSignature ?? this.authorSignature,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageOriginChannel';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
