part of '../tdapi.dart';

/// **ToggleChatGiftNotifications** *(toggleChatGiftNotifications)* - TDLib function
///
/// Toggles whether notifications for new gifts received by a channel chat are sent to the current user; requires can_post_messages administrator right in the chat.
///
/// * [chatId]: Identifier of the channel chat.
/// * [areEnabled]: Pass true to enable notifications about new gifts owned by the channel chat; pass false to disable the notifications.
///
/// [Ok] is returned on completion.
final class ToggleChatGiftNotifications extends TdFunction {
  /// **ToggleChatGiftNotifications** *(toggleChatGiftNotifications)* - TDLib function
  ///
  /// Toggles whether notifications for new gifts received by a channel chat are sent to the current user; requires can_post_messages administrator right in the chat.
  ///
  /// * [chatId]: Identifier of the channel chat.
  /// * [areEnabled]: Pass true to enable notifications about new gifts owned by the channel chat; pass false to disable the notifications.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatGiftNotifications({
    required this.chatId,
    required this.areEnabled,
  });

  /// Identifier of the channel chat
  final int chatId;

  /// Pass true to enable notifications about new gifts owned by the channel chat; pass false to disable the notifications
  final bool areEnabled;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "are_enabled": areEnabled,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the channel chat
  /// * [are_enabled]: Pass true to enable notifications about new gifts owned by the channel chat; pass false to disable the notifications
  ToggleChatGiftNotifications copyWith({
    int? chatId,
    bool? areEnabled,
  }) =>
      ToggleChatGiftNotifications(
        chatId: chatId ?? this.chatId,
        areEnabled: areEnabled ?? this.areEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatGiftNotifications';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
