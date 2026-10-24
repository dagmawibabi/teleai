part of '../tdapi.dart';

/// **InputGroupCall** *(inputGroupCall)* - parent
///
/// Describes a non-joined group call that isn't bound to a chat.
sealed class InputGroupCall extends TdObject {
  /// **InputGroupCall** *(inputGroupCall)* - parent
  ///
  /// Describes a non-joined group call that isn't bound to a chat.
  const InputGroupCall();

  /// a InputGroupCall return type can be :
  /// * [InputGroupCallLink]
  /// * [InputGroupCallMessage]
  factory InputGroupCall.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputGroupCallLink.defaultObjectId:
        return InputGroupCallLink.fromJson(json);
      case InputGroupCallMessage.defaultObjectId:
        return InputGroupCallMessage.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputGroupCall)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputGroupCall copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputGroupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputGroupCallLink** *(inputGroupCallLink)* - child of InputGroupCall
///
/// The group call is accessible through a link.
///
/// * [link]: The link for the group call.
final class InputGroupCallLink extends InputGroupCall {
  /// **InputGroupCallLink** *(inputGroupCallLink)* - child of InputGroupCall
  ///
  /// The group call is accessible through a link.
  ///
  /// * [link]: The link for the group call.
  const InputGroupCallLink({
    required this.link,
  });

  /// The link for the group call
  final String link;

  /// Parse from a json
  factory InputGroupCallLink.fromJson(Map<String, dynamic> json) =>
      InputGroupCallLink(
        link: json['link'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "link": link,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [link]: The link for the group call
  @override
  InputGroupCallLink copyWith({
    String? link,
  }) =>
      InputGroupCallLink(
        link: link ?? this.link,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputGroupCallLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputGroupCallMessage** *(inputGroupCallMessage)* - child of InputGroupCall
///
/// The group call is accessible through a message of the type messageGroupCall.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message of the type messageGroupCall.
final class InputGroupCallMessage extends InputGroupCall {
  /// **InputGroupCallMessage** *(inputGroupCallMessage)* - child of InputGroupCall
  ///
  /// The group call is accessible through a message of the type messageGroupCall.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message of the type messageGroupCall.
  const InputGroupCallMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message of the type messageGroupCall
  final int messageId;

  /// Parse from a json
  factory InputGroupCallMessage.fromJson(Map<String, dynamic> json) =>
      InputGroupCallMessage(
        chatId: json['chat_id'],
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message of the type messageGroupCall
  @override
  InputGroupCallMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      InputGroupCallMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputGroupCallMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
