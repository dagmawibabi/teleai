part of '../tdapi.dart';

/// **SetChatActiveStoriesList** *(setChatActiveStoriesList)* - TDLib function
///
/// Changes story list in which stories from the chat are shown.
///
/// * [chatId]: Identifier of the chat that posted stories.
/// * [storyList]: New list for active stories posted by the chat.
///
/// [Ok] is returned on completion.
final class SetChatActiveStoriesList extends TdFunction {
  /// **SetChatActiveStoriesList** *(setChatActiveStoriesList)* - TDLib function
  ///
  /// Changes story list in which stories from the chat are shown.
  ///
  /// * [chatId]: Identifier of the chat that posted stories.
  /// * [storyList]: New list for active stories posted by the chat.
  ///
  /// [Ok] is returned on completion.
  const SetChatActiveStoriesList({
    required this.chatId,
    required this.storyList,
  });

  /// Identifier of the chat that posted stories
  final int chatId;

  /// New list for active stories posted by the chat
  final StoryList storyList;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_list": storyList.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that posted stories
  /// * [story_list]: New list for active stories posted by the chat
  SetChatActiveStoriesList copyWith({
    int? chatId,
    StoryList? storyList,
  }) =>
      SetChatActiveStoriesList(
        chatId: chatId ?? this.chatId,
        storyList: storyList ?? this.storyList,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatActiveStoriesList';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
