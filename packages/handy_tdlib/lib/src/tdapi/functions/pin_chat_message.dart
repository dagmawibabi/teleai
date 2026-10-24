part of '../tdapi.dart';

/// **PinChatMessage** *(pinChatMessage)* - TDLib function
///
/// Pins a message in a chat. A message can be pinned only if messageProperties.can_be_pinned.
///
/// * [chatId]: Identifier of the chat.
/// * [messageId]: Identifier of the new pinned message.
/// * [disableNotification]: Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats.
/// * [onlyForSelf]: Pass true to pin the message only for self; private chats only.
///
/// [Ok] is returned on completion.
final class PinChatMessage extends TdFunction {
  /// **PinChatMessage** *(pinChatMessage)* - TDLib function
  ///
  /// Pins a message in a chat. A message can be pinned only if messageProperties.can_be_pinned.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [messageId]: Identifier of the new pinned message.
  /// * [disableNotification]: Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats.
  /// * [onlyForSelf]: Pass true to pin the message only for self; private chats only.
  ///
  /// [Ok] is returned on completion.
  const PinChatMessage({
    required this.chatId,
    required this.messageId,
    required this.disableNotification,
    required this.onlyForSelf,
  });

  /// Identifier of the chat
  final int chatId;

  /// Identifier of the new pinned message
  final int messageId;

  /// Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats
  final bool disableNotification;

  /// Pass true to pin the message only for self; private chats only
  final bool onlyForSelf;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "disable_notification": disableNotification,
      "only_for_self": onlyForSelf,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [message_id]: Identifier of the new pinned message
  /// * [disable_notification]: Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats
  /// * [only_for_self]: Pass true to pin the message only for self; private chats only
  PinChatMessage copyWith({
    int? chatId,
    int? messageId,
    bool? disableNotification,
    bool? onlyForSelf,
  }) =>
      PinChatMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        disableNotification: disableNotification ?? this.disableNotification,
        onlyForSelf: onlyForSelf ?? this.onlyForSelf,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pinChatMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
