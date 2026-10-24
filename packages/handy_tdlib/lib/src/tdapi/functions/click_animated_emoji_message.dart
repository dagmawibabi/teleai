part of '../tdapi.dart';

/// **ClickAnimatedEmojiMessage** *(clickAnimatedEmojiMessage)* - TDLib function
///
/// Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played.
///
/// * [chatId]: Chat identifier of the message.
/// * [messageId]: Identifier of the clicked message.
///
/// [Sticker] is returned on completion.
final class ClickAnimatedEmojiMessage extends TdFunction {
  /// **ClickAnimatedEmojiMessage** *(clickAnimatedEmojiMessage)* - TDLib function
  ///
  /// Informs TDLib that a message with an animated emoji was clicked by the user. Returns a big animated sticker to be played or a 404 error if usual animation needs to be played.
  ///
  /// * [chatId]: Chat identifier of the message.
  /// * [messageId]: Identifier of the clicked message.
  ///
  /// [Sticker] is returned on completion.
  const ClickAnimatedEmojiMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Chat identifier of the message
  final int chatId;

  /// Identifier of the clicked message
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
  /// * [chat_id]: Chat identifier of the message
  /// * [message_id]: Identifier of the clicked message
  ClickAnimatedEmojiMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      ClickAnimatedEmojiMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'clickAnimatedEmojiMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
