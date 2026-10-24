part of '../tdapi.dart';

/// **SetChatMessageSender** *(setChatMessageSender)* - TDLib function
///
/// Selects a message sender to send messages in a chat.
///
/// * [chatId]: Chat identifier.
/// * [messageSenderId]: New message sender for the chat.
///
/// [Ok] is returned on completion.
final class SetChatMessageSender extends TdFunction {
  /// **SetChatMessageSender** *(setChatMessageSender)* - TDLib function
  ///
  /// Selects a message sender to send messages in a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageSenderId]: New message sender for the chat.
  ///
  /// [Ok] is returned on completion.
  const SetChatMessageSender({
    required this.chatId,
    required this.messageSenderId,
  });

  /// Chat identifier
  final int chatId;

  /// New message sender for the chat
  final MessageSender messageSenderId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_sender_id": messageSenderId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_sender_id]: New message sender for the chat
  SetChatMessageSender copyWith({
    int? chatId,
    MessageSender? messageSenderId,
  }) =>
      SetChatMessageSender(
        chatId: chatId ?? this.chatId,
        messageSenderId: messageSenderId ?? this.messageSenderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatMessageSender';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
