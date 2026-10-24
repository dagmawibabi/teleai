part of '../tdapi.dart';

/// **CheckChatUsername** *(checkChatUsername)* - TDLib function
///
/// Checks whether a username can be set for a chat.
///
/// * [chatId]: Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or 0 if the chat is being created.
/// * [username]: Username to be checked.
///
/// [CheckChatUsernameResult] is returned on completion.
final class CheckChatUsername extends TdFunction {
  /// **CheckChatUsername** *(checkChatUsername)* - TDLib function
  ///
  /// Checks whether a username can be set for a chat.
  ///
  /// * [chatId]: Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or 0 if the chat is being created.
  /// * [username]: Username to be checked.
  ///
  /// [CheckChatUsernameResult] is returned on completion.
  const CheckChatUsername({
    required this.chatId,
    required this.username,
  });

  /// Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or 0 if the chat is being created
  final int chatId;

  /// Username to be checked
  final String username;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "username": username,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier; must be identifier of a supergroup chat, or a channel chat, or a private chat with self, or 0 if the chat is being created
  /// * [username]: Username to be checked
  CheckChatUsername copyWith({
    int? chatId,
    String? username,
  }) =>
      CheckChatUsername(
        chatId: chatId ?? this.chatId,
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkChatUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
