part of '../tdapi.dart';

/// **DeleteChatHistory** *(deleteChatHistory)* - TDLib function
///
/// Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat.
///
/// * [chatId]: Chat identifier.
/// * [removeFromChatList]: Pass true to remove the chat from all chat lists.
/// * [revoke]: Pass true to delete chat history for all users.
///
/// [Ok] is returned on completion.
final class DeleteChatHistory extends TdFunction {
  /// **DeleteChatHistory** *(deleteChatHistory)* - TDLib function
  ///
  /// Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [removeFromChatList]: Pass true to remove the chat from all chat lists.
  /// * [revoke]: Pass true to delete chat history for all users.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatHistory({
    required this.chatId,
    required this.removeFromChatList,
    required this.revoke,
  });

  /// Chat identifier
  final int chatId;

  /// Pass true to remove the chat from all chat lists
  final bool removeFromChatList;

  /// Pass true to delete chat history for all users
  final bool revoke;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "remove_from_chat_list": removeFromChatList,
      "revoke": revoke,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [remove_from_chat_list]: Pass true to remove the chat from all chat lists
  /// * [revoke]: Pass true to delete chat history for all users
  DeleteChatHistory copyWith({
    int? chatId,
    bool? removeFromChatList,
    bool? revoke,
  }) =>
      DeleteChatHistory(
        chatId: chatId ?? this.chatId,
        removeFromChatList: removeFromChatList ?? this.removeFromChatList,
        revoke: revoke ?? this.revoke,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatHistory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
