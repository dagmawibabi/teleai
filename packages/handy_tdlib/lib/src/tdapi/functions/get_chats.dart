part of '../tdapi.dart';

/// **GetChats** *(getChats)* - TDLib function
///
/// Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state.
///
/// * [chatList]: The chat list in which to return chats; pass null to get chats from the main chat list *(optional)*.
/// * [limit]: The maximum number of chats to be returned.
///
/// [Chats] is returned on completion.
final class GetChats extends TdFunction {
  /// **GetChats** *(getChats)* - TDLib function
  ///
  /// Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state.
  ///
  /// * [chatList]: The chat list in which to return chats; pass null to get chats from the main chat list *(optional)*.
  /// * [limit]: The maximum number of chats to be returned.
  ///
  /// [Chats] is returned on completion.
  const GetChats({
    this.chatList,
    required this.limit,
  });

  /// The chat list in which to return chats; pass null to get chats from the main chat list
  final ChatList? chatList;

  /// The maximum number of chats to be returned
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
  /// * [chat_list]: The chat list in which to return chats; pass null to get chats from the main chat list
  /// * [limit]: The maximum number of chats to be returned
  GetChats copyWith({
    ChatList? chatList,
    int? limit,
  }) =>
      GetChats(
        chatList: chatList ?? this.chatList,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
