part of '../tdapi.dart';

/// **ReadChatList** *(readChatList)* - TDLib function
///
/// Traverses all chats in a chat list and marks all messages in the chats as read.
///
/// * [chatList]: Chat list in which to mark all chats as read.
///
/// [Ok] is returned on completion.
final class ReadChatList extends TdFunction {
  /// **ReadChatList** *(readChatList)* - TDLib function
  ///
  /// Traverses all chats in a chat list and marks all messages in the chats as read.
  ///
  /// * [chatList]: Chat list in which to mark all chats as read.
  ///
  /// [Ok] is returned on completion.
  const ReadChatList({
    required this.chatList,
  });

  /// Chat list in which to mark all chats as read
  final ChatList chatList;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: Chat list in which to mark all chats as read
  ReadChatList copyWith({
    ChatList? chatList,
  }) =>
      ReadChatList(
        chatList: chatList ?? this.chatList,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readChatList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
