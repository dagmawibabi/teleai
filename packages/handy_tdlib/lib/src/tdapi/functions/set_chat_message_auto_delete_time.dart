part of '../tdapi.dart';

/// **SetChatMessageAutoDeleteTime** *(setChatMessageAutoDeleteTime)* - TDLib function
///
/// Changes the message auto-delete or self-destruct (for secret chats) time in a chat. Requires can_change_info administrator right in basic groups, supergroups and channels.. Message auto-delete time can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
///
/// * [chatId]: Chat identifier.
/// * [messageAutoDeleteTime]: New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically.
///
/// [Ok] is returned on completion.
final class SetChatMessageAutoDeleteTime extends TdFunction {
  /// **SetChatMessageAutoDeleteTime** *(setChatMessageAutoDeleteTime)* - TDLib function
  ///
  /// Changes the message auto-delete or self-destruct (for secret chats) time in a chat. Requires can_change_info administrator right in basic groups, supergroups and channels.. Message auto-delete time can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageAutoDeleteTime]: New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically.
  ///
  /// [Ok] is returned on completion.
  const SetChatMessageAutoDeleteTime({
    required this.chatId,
    required this.messageAutoDeleteTime,
  });

  /// Chat identifier
  final int chatId;

  /// New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
  final int messageAutoDeleteTime;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_auto_delete_time": messageAutoDeleteTime,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_auto_delete_time]: New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
  SetChatMessageAutoDeleteTime copyWith({
    int? chatId,
    int? messageAutoDeleteTime,
  }) =>
      SetChatMessageAutoDeleteTime(
        chatId: chatId ?? this.chatId,
        messageAutoDeleteTime:
            messageAutoDeleteTime ?? this.messageAutoDeleteTime,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatMessageAutoDeleteTime';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
