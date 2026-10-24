part of '../tdapi.dart';

/// **DeleteChatBackground** *(deleteChatBackground)* - TDLib function
///
/// Deletes background in a specific chat.
///
/// * [chatId]: Chat identifier.
/// * [restorePrevious]: Pass true to restore previously set background. Can be used only in private and secret chats with non-deleted users if userFullInfo.set_chat_background == true.. Supposed to be used from messageChatSetBackground messages with the currently set background that was set for both sides by the other user.
///
/// [Ok] is returned on completion.
final class DeleteChatBackground extends TdFunction {
  /// **DeleteChatBackground** *(deleteChatBackground)* - TDLib function
  ///
  /// Deletes background in a specific chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [restorePrevious]: Pass true to restore previously set background. Can be used only in private and secret chats with non-deleted users if userFullInfo.set_chat_background == true.. Supposed to be used from messageChatSetBackground messages with the currently set background that was set for both sides by the other user.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatBackground({
    required this.chatId,
    required this.restorePrevious,
  });

  /// Chat identifier
  final int chatId;

  /// Pass true to restore previously set background. Can be used only in private and secret chats with non-deleted users if userFullInfo.set_chat_background == true.. Supposed to be used from messageChatSetBackground messages with the currently set background that was set for both sides by the other user
  final bool restorePrevious;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "restore_previous": restorePrevious,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [restore_previous]: Pass true to restore previously set background. Can be used only in private and secret chats with non-deleted users if userFullInfo.set_chat_background == true.. Supposed to be used from messageChatSetBackground messages with the currently set background that was set for both sides by the other user
  DeleteChatBackground copyWith({
    int? chatId,
    bool? restorePrevious,
  }) =>
      DeleteChatBackground(
        chatId: chatId ?? this.chatId,
        restorePrevious: restorePrevious ?? this.restorePrevious,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatBackground';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
