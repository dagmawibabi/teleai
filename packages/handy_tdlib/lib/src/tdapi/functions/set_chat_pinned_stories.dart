part of '../tdapi.dart';

/// **SetChatPinnedStories** *(setChatPinnedStories)* - TDLib function
///
/// Changes the list of pinned stories on a chat page; requires can_edit_stories administrator right in the chat.
///
/// * [chatId]: Identifier of the chat that posted the stories.
/// * [storyIds]: New list of pinned stories. All stories must be posted to the chat page first. There can be up to getOption("pinned_story_count_max") pinned stories on a chat page.
///
/// [Ok] is returned on completion.
final class SetChatPinnedStories extends TdFunction {
  /// **SetChatPinnedStories** *(setChatPinnedStories)* - TDLib function
  ///
  /// Changes the list of pinned stories on a chat page; requires can_edit_stories administrator right in the chat.
  ///
  /// * [chatId]: Identifier of the chat that posted the stories.
  /// * [storyIds]: New list of pinned stories. All stories must be posted to the chat page first. There can be up to getOption("pinned_story_count_max") pinned stories on a chat page.
  ///
  /// [Ok] is returned on completion.
  const SetChatPinnedStories({
    required this.chatId,
    required this.storyIds,
  });

  /// Identifier of the chat that posted the stories
  final int chatId;

  /// New list of pinned stories. All stories must be posted to the chat page first. There can be up to getOption("pinned_story_count_max") pinned stories on a chat page
  final List<int> storyIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_ids": storyIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that posted the stories
  /// * [story_ids]: New list of pinned stories. All stories must be posted to the chat page first. There can be up to getOption("pinned_story_count_max") pinned stories on a chat page
  SetChatPinnedStories copyWith({
    int? chatId,
    List<int>? storyIds,
  }) =>
      SetChatPinnedStories(
        chatId: chatId ?? this.chatId,
        storyIds: storyIds ?? this.storyIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatPinnedStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
