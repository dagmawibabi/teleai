part of '../tdapi.dart';

/// **AddChatToList** *(addChatToList)* - TDLib function
///
/// Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed.
///
/// * [chatId]: Chat identifier.
/// * [chatList]: The chat list. Use getChatListsToAddChat to get suitable chat lists.
///
/// [Ok] is returned on completion.
final class AddChatToList extends TdFunction {
  /// **AddChatToList** *(addChatToList)* - TDLib function
  ///
  /// Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed.
  ///
  /// * [chatId]: Chat identifier.
  /// * [chatList]: The chat list. Use getChatListsToAddChat to get suitable chat lists.
  ///
  /// [Ok] is returned on completion.
  const AddChatToList({
    required this.chatId,
    required this.chatList,
  });

  /// Chat identifier
  final int chatId;

  /// The chat list. Use getChatListsToAddChat to get suitable chat lists
  final ChatList chatList;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "chat_list": chatList.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [chat_list]: The chat list. Use getChatListsToAddChat to get suitable chat lists
  AddChatToList copyWith({
    int? chatId,
    ChatList? chatList,
  }) =>
      AddChatToList(
        chatId: chatId ?? this.chatId,
        chatList: chatList ?? this.chatList,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addChatToList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
