part of '../tdapi.dart';

/// **InputCall** *(inputCall)* - parent
///
/// Describes a call.
sealed class InputCall extends TdObject {
  /// **InputCall** *(inputCall)* - parent
  ///
  /// Describes a call.
  const InputCall();

  /// a InputCall return type can be :
  /// * [InputCallDiscarded]
  /// * [InputCallFromMessage]
  factory InputCall.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputCallDiscarded.defaultObjectId:
        return InputCallDiscarded.fromJson(json);
      case InputCallFromMessage.defaultObjectId:
        return InputCallFromMessage.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputCall)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputCall copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputCallDiscarded** *(inputCallDiscarded)* - child of InputCall
///
/// A just ended call.
///
/// * [callId]: Identifier of the call.
final class InputCallDiscarded extends InputCall {
  /// **InputCallDiscarded** *(inputCallDiscarded)* - child of InputCall
  ///
  /// A just ended call.
  ///
  /// * [callId]: Identifier of the call.
  const InputCallDiscarded({
    required this.callId,
  });

  /// Identifier of the call
  final int callId;

  /// Parse from a json
  factory InputCallDiscarded.fromJson(Map<String, dynamic> json) =>
      InputCallDiscarded(
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
  /// * [call_id]: Identifier of the call
  @override
  InputCallDiscarded copyWith({
    int? callId,
  }) =>
      InputCallDiscarded(
        callId: callId ?? this.callId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputCallDiscarded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputCallFromMessage** *(inputCallFromMessage)* - child of InputCall
///
/// A call from a message of the type messageCall with non-zero messageCall.unique_id.
///
/// * [chatId]: Chat identifier of the message.
/// * [messageId]: Message identifier.
final class InputCallFromMessage extends InputCall {
  /// **InputCallFromMessage** *(inputCallFromMessage)* - child of InputCall
  ///
  /// A call from a message of the type messageCall with non-zero messageCall.unique_id.
  ///
  /// * [chatId]: Chat identifier of the message.
  /// * [messageId]: Message identifier.
  const InputCallFromMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Chat identifier of the message
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Parse from a json
  factory InputCallFromMessage.fromJson(Map<String, dynamic> json) =>
      InputCallFromMessage(
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
  /// * [chat_id]: Chat identifier of the message
  /// * [message_id]: Message identifier
  @override
  InputCallFromMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      InputCallFromMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputCallFromMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
