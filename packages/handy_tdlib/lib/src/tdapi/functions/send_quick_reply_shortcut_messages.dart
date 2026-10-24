part of '../tdapi.dart';

/// **SendQuickReplyShortcutMessages** *(sendQuickReplyShortcutMessages)* - TDLib function
///
/// Sends messages from a quick reply shortcut. Requires Telegram Business subscription. Can't be used to send paid messages.
///
/// * [chatId]: Identifier of the chat to which to send messages. The chat must be a private chat with a regular user.
/// * [shortcutId]: Unique identifier of the quick reply shortcut.
/// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
///
/// [Messages] is returned on completion.
final class SendQuickReplyShortcutMessages extends TdFunction {
  /// **SendQuickReplyShortcutMessages** *(sendQuickReplyShortcutMessages)* - TDLib function
  ///
  /// Sends messages from a quick reply shortcut. Requires Telegram Business subscription. Can't be used to send paid messages.
  ///
  /// * [chatId]: Identifier of the chat to which to send messages. The chat must be a private chat with a regular user.
  /// * [shortcutId]: Unique identifier of the quick reply shortcut.
  /// * [sendingId]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates.
  ///
  /// [Messages] is returned on completion.
  const SendQuickReplyShortcutMessages({
    required this.chatId,
    required this.shortcutId,
    required this.sendingId,
  });

  /// Identifier of the chat to which to send messages. The chat must be a private chat with a regular user
  final int chatId;

  /// Unique identifier of the quick reply shortcut
  final int shortcutId;

  /// Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  final int sendingId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "shortcut_id": shortcutId,
      "sending_id": sendingId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which to send messages. The chat must be a private chat with a regular user
  /// * [shortcut_id]: Unique identifier of the quick reply shortcut
  /// * [sending_id]: Non-persistent identifier, which will be returned back in messageSendingStatePending object and can be used to match sent messages and corresponding updateNewMessage updates
  SendQuickReplyShortcutMessages copyWith({
    int? chatId,
    int? shortcutId,
    int? sendingId,
  }) =>
      SendQuickReplyShortcutMessages(
        chatId: chatId ?? this.chatId,
        shortcutId: shortcutId ?? this.shortcutId,
        sendingId: sendingId ?? this.sendingId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendQuickReplyShortcutMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
