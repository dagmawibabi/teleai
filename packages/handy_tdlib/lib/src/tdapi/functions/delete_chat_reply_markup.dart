part of '../tdapi.dart';

/// **DeleteChatReplyMarkup** *(deleteChatReplyMarkup)* - TDLib function
///
/// Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a replyMarkupForceReply reply markup has been used or dismissed.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: The message identifier of the used keyboard.
///
/// [Ok] is returned on completion.
final class DeleteChatReplyMarkup extends TdFunction {
  /// **DeleteChatReplyMarkup** *(deleteChatReplyMarkup)* - TDLib function
  ///
  /// Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a replyMarkupForceReply reply markup has been used or dismissed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: The message identifier of the used keyboard.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatReplyMarkup({
    required this.chatId,
    required this.messageId,
  });

  /// Chat identifier
  final int chatId;

  /// The message identifier of the used keyboard
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
  /// * [chat_id]: Chat identifier
  /// * [message_id]: The message identifier of the used keyboard
  DeleteChatReplyMarkup copyWith({
    int? chatId,
    int? messageId,
  }) =>
      DeleteChatReplyMarkup(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatReplyMarkup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
