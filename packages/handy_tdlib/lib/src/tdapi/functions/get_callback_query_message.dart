part of '../tdapi.dart';

/// **GetCallbackQueryMessage** *(getCallbackQueryMessage)* - TDLib function
///
/// Returns information about a message with the callback button that originated a callback query; for bots only.
///
/// * [chatId]: Identifier of the chat the message belongs to.
/// * [messageId]: Message identifier.
/// * [callbackQueryId]: Identifier of the callback query.
///
/// [Message] is returned on completion.
final class GetCallbackQueryMessage extends TdFunction {
  /// **GetCallbackQueryMessage** *(getCallbackQueryMessage)* - TDLib function
  ///
  /// Returns information about a message with the callback button that originated a callback query; for bots only.
  ///
  /// * [chatId]: Identifier of the chat the message belongs to.
  /// * [messageId]: Message identifier.
  /// * [callbackQueryId]: Identifier of the callback query.
  ///
  /// [Message] is returned on completion.
  const GetCallbackQueryMessage({
    required this.chatId,
    required this.messageId,
    required this.callbackQueryId,
  });

  /// Identifier of the chat the message belongs to
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Identifier of the callback query
  final int callbackQueryId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "callback_query_id": callbackQueryId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat the message belongs to
  /// * [message_id]: Message identifier
  /// * [callback_query_id]: Identifier of the callback query
  GetCallbackQueryMessage copyWith({
    int? chatId,
    int? messageId,
    int? callbackQueryId,
  }) =>
      GetCallbackQueryMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        callbackQueryId: callbackQueryId ?? this.callbackQueryId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getCallbackQueryMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
