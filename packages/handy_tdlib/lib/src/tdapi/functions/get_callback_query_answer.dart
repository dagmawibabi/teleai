part of '../tdapi.dart';

/// **GetCallbackQueryAnswer** *(getCallbackQueryAnswer)* - TDLib function
///
/// Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message from which the query originated. The message must not be scheduled.
/// * [payload]: Query payload.
///
/// [CallbackQueryAnswer] is returned on completion.
final class GetCallbackQueryAnswer extends TdFunction {
  /// **GetCallbackQueryAnswer** *(getCallbackQueryAnswer)* - TDLib function
  ///
  /// Sends a callback query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message from which the query originated. The message must not be scheduled.
  /// * [payload]: Query payload.
  ///
  /// [CallbackQueryAnswer] is returned on completion.
  const GetCallbackQueryAnswer({
    required this.chatId,
    required this.messageId,
    required this.payload,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message from which the query originated. The message must not be scheduled
  final int messageId;

  /// Query payload
  final CallbackQueryPayload payload;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "payload": payload.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message from which the query originated. The message must not be scheduled
  /// * [payload]: Query payload
  GetCallbackQueryAnswer copyWith({
    int? chatId,
    int? messageId,
    CallbackQueryPayload? payload,
  }) =>
      GetCallbackQueryAnswer(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        payload: payload ?? this.payload,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCallbackQueryAnswer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
