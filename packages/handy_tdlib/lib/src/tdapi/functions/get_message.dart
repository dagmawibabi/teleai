part of '../tdapi.dart';

/// **GetMessage** *(getMessage)* - TDLib function
///
/// Returns information about a message. Returns a 404 error if the message doesn't exist.
///
/// * [chatId]: Identifier of the chat the message belongs to.
/// * [messageId]: Identifier of the message to get.
///
/// [Message] is returned on completion.
final class GetMessage extends TdFunction {
  /// **GetMessage** *(getMessage)* - TDLib function
  ///
  /// Returns information about a message. Returns a 404 error if the message doesn't exist.
  ///
  /// * [chatId]: Identifier of the chat the message belongs to.
  /// * [messageId]: Identifier of the message to get.
  ///
  /// [Message] is returned on completion.
  const GetMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat the message belongs to
  final int chatId;

  /// Identifier of the message to get
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat the message belongs to
  /// * [message_id]: Identifier of the message to get
  GetMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
