part of '../tdapi.dart';

/// **ReadBusinessMessage** *(readBusinessMessage)* - TDLib function
///
/// Reads a message on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection through which the message was received.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
///
/// [Ok] is returned on completion.
final class ReadBusinessMessage extends TdFunction {
  /// **ReadBusinessMessage** *(readBusinessMessage)* - TDLib function
  ///
  /// Reads a message on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection through which the message was received.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  ///
  /// [Ok] is returned on completion.
  const ReadBusinessMessage({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
  });

  /// Unique identifier of business connection through which the message was received
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection through which the message was received
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  ReadBusinessMessage copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
  }) =>
      ReadBusinessMessage(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readBusinessMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
