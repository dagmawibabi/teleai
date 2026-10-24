part of '../tdapi.dart';

/// **ToggleChatIsPinned** *(toggleChatIsPinned)* - TDLib function
///
/// Changes the pinned state of a chat. There can be up to getOption("pinned_chat_count_max")/getOption("pinned_archived_chat_count_max"). pinned non-secret chats and the same number of secret chats in the main/archive chat list. The limit can be increased with Telegram Premium.
///
/// * [chatList]: Chat list in which to change the pinned state of the chat.
/// * [chatId]: Chat identifier.
/// * [isPinned]: Pass true to pin the chat; pass false to unpin it.
///
/// [Ok] is returned on completion.
final class ToggleChatIsPinned extends TdFunction {
  /// **ToggleChatIsPinned** *(toggleChatIsPinned)* - TDLib function
  ///
  /// Changes the pinned state of a chat. There can be up to getOption("pinned_chat_count_max")/getOption("pinned_archived_chat_count_max"). pinned non-secret chats and the same number of secret chats in the main/archive chat list. The limit can be increased with Telegram Premium.
  ///
  /// * [chatList]: Chat list in which to change the pinned state of the chat.
  /// * [chatId]: Chat identifier.
  /// * [isPinned]: Pass true to pin the chat; pass false to unpin it.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatIsPinned({
    required this.chatList,
    required this.chatId,
    required this.isPinned,
  });

  /// Chat list in which to change the pinned state of the chat
  final ChatList chatList;

  /// Chat identifier
  final int chatId;

  /// Pass true to pin the chat; pass false to unpin it
  final bool isPinned;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList.toJson(),
      "chat_id": chatId,
      "is_pinned": isPinned,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: Chat list in which to change the pinned state of the chat
  /// * [chat_id]: Chat identifier
  /// * [is_pinned]: Pass true to pin the chat; pass false to unpin it
  ToggleChatIsPinned copyWith({
    ChatList? chatList,
    int? chatId,
    bool? isPinned,
  }) =>
      ToggleChatIsPinned(
        chatList: chatList ?? this.chatList,
        chatId: chatId ?? this.chatId,
        isPinned: isPinned ?? this.isPinned,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatIsPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
