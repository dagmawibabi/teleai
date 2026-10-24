part of '../tdapi.dart';

/// **SetPinnedChats** *(setPinnedChats)* - TDLib function
///
/// Changes the order of pinned chats.
///
/// * [chatList]: Chat list in which to change the order of pinned chats.
/// * [chatIds]: The new list of pinned chats.
///
/// [Ok] is returned on completion.
final class SetPinnedChats extends TdFunction {
  /// **SetPinnedChats** *(setPinnedChats)* - TDLib function
  ///
  /// Changes the order of pinned chats.
  ///
  /// * [chatList]: Chat list in which to change the order of pinned chats.
  /// * [chatIds]: The new list of pinned chats.
  ///
  /// [Ok] is returned on completion.
  const SetPinnedChats({
    required this.chatList,
    required this.chatIds,
  });

  /// Chat list in which to change the order of pinned chats
  final ChatList chatList;

  /// The new list of pinned chats
  final List<int> chatIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_list": chatList.toJson(),
      "chat_ids": chatIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_list]: Chat list in which to change the order of pinned chats
  /// * [chat_ids]: The new list of pinned chats
  SetPinnedChats copyWith({
    ChatList? chatList,
    List<int>? chatIds,
  }) =>
      SetPinnedChats(
        chatList: chatList ?? this.chatList,
        chatIds: chatIds ?? this.chatIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPinnedChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
