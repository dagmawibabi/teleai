part of '../tdapi.dart';

/// **LoadChats** *(loadChats)* - TDLib function
///
/// Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates.. Chats are sorted by the pair (chatPosition.order, chat.id) in descending order. Returns a 404 error if all chats have been loaded.
///
/// * [chatList]: The chat list in which to load chats; pass null to load chats from the main chat list *(optional)*.
/// * [limit]: The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached.
///
/// [Ok] is returned on completion.
final class LoadChats extends TdFunction {
  /// **LoadChats** *(loadChats)* - TDLib function
  ///
  /// Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates.. Chats are sorted by the pair (chatPosition.order, chat.id) in descending order. Returns a 404 error if all chats have been loaded.
  ///
  /// * [chatList]: The chat list in which to load chats; pass null to load chats from the main chat list *(optional)*.
  /// * [limit]: The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached.
  ///
  /// [Ok] is returned on completion.
  const LoadChats({
    this.chatList,
    required this.limit,
  });

  /// The chat list in which to load chats; pass null to load chats from the main chat list
  final ChatList? chatList;

  /// The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: The chat list in which to load chats; pass null to load chats from the main chat list
  /// * [limit]: The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  LoadChats copyWith({
    ChatList? chatList,
    int? limit,
  }) =>
      LoadChats(
        chatList: chatList ?? this.chatList,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
