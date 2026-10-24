part of '../tdapi.dart';

/// **ChatActiveStories** *(chatActiveStories)* - basic class
///
/// Describes active stories posted by a chat.
///
/// * [chatId]: Identifier of the chat that posted the stories.
/// * [list]: Identifier of the story list in which the stories are shown; may be null if the stories aren't shown in a story list *(optional)*.
/// * [order]: A parameter used to determine order of the stories in the story list; 0 if the stories don't need to be shown in the story list. Stories must be sorted by the pair (order, story_poster_chat_id) in descending order.
/// * [canBeArchived]: True, if the stories are shown in the main story list and can be archived; otherwise, the stories can be hidden from the main story list. only by calling removeTopChat with topChatCategoryUsers and the chat_id. Stories of the current user can't be archived nor hidden using removeTopChat.
/// * [maxReadStoryId]: Identifier of the last read active story.
/// * [stories]: Basic information about the stories; use getStory to get full information about the stories. The stories are in chronological order (i.e., in order of increasing story identifiers).
final class ChatActiveStories extends TdObject {
  /// **ChatActiveStories** *(chatActiveStories)* - basic class
  ///
  /// Describes active stories posted by a chat.
  ///
  /// * [chatId]: Identifier of the chat that posted the stories.
  /// * [list]: Identifier of the story list in which the stories are shown; may be null if the stories aren't shown in a story list *(optional)*.
  /// * [order]: A parameter used to determine order of the stories in the story list; 0 if the stories don't need to be shown in the story list. Stories must be sorted by the pair (order, story_poster_chat_id) in descending order.
  /// * [canBeArchived]: True, if the stories are shown in the main story list and can be archived; otherwise, the stories can be hidden from the main story list. only by calling removeTopChat with topChatCategoryUsers and the chat_id. Stories of the current user can't be archived nor hidden using removeTopChat.
  /// * [maxReadStoryId]: Identifier of the last read active story.
  /// * [stories]: Basic information about the stories; use getStory to get full information about the stories. The stories are in chronological order (i.e., in order of increasing story identifiers).
  const ChatActiveStories({
    required this.chatId,
    this.list,
    required this.order,
    required this.canBeArchived,
    required this.maxReadStoryId,
    required this.stories,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat that posted the stories
  final int chatId;

  /// Identifier of the story list in which the stories are shown; may be null if the stories aren't shown in a story list
  final StoryList? list;

  /// A parameter used to determine order of the stories in the story list; 0 if the stories don't need to be shown in the story list. Stories must be sorted by the pair (order, story_poster_chat_id) in descending order
  final int order;

  /// True, if the stories are shown in the main story list and can be archived; otherwise, the stories can be hidden from the main story list. only by calling removeTopChat with topChatCategoryUsers and the chat_id. Stories of the current user can't be archived nor hidden using removeTopChat
  final bool canBeArchived;

  /// Identifier of the last read active story
  final int maxReadStoryId;

  /// Basic information about the stories; use getStory to get full information about the stories. The stories are in chronological order (i.e., in order of increasing story identifiers)
  final List<StoryInfo> stories;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatActiveStories.fromJson(Map<String, dynamic> json) =>
      ChatActiveStories(
        chatId: json['chat_id'],
        list: json['list'] == null ? null : StoryList.fromJson(json['list']),
        order: json['order'],
        canBeArchived: json['can_be_archived'],
        maxReadStoryId: json['max_read_story_id'],
        stories: List<StoryInfo>.from((json['stories'] ?? [])
            .map((item) => StoryInfo.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "list": list?.toJson(),
      "order": order,
      "can_be_archived": canBeArchived,
      "max_read_story_id": maxReadStoryId,
      "stories": stories.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that posted the stories
  /// * [list]: Identifier of the story list in which the stories are shown; may be null if the stories aren't shown in a story list
  /// * [order]: A parameter used to determine order of the stories in the story list; 0 if the stories don't need to be shown in the story list. Stories must be sorted by the pair (order, story_poster_chat_id) in descending order
  /// * [can_be_archived]: True, if the stories are shown in the main story list and can be archived; otherwise, the stories can be hidden from the main story list. only by calling removeTopChat with topChatCategoryUsers and the chat_id. Stories of the current user can't be archived nor hidden using removeTopChat
  /// * [max_read_story_id]: Identifier of the last read active story
  /// * [stories]: Basic information about the stories; use getStory to get full information about the stories. The stories are in chronological order (i.e., in order of increasing story identifiers)
  ChatActiveStories copyWith({
    int? chatId,
    StoryList? list,
    int? order,
    bool? canBeArchived,
    int? maxReadStoryId,
    List<StoryInfo>? stories,
    dynamic extra,
    int? clientId,
  }) =>
      ChatActiveStories(
        chatId: chatId ?? this.chatId,
        list: list ?? this.list,
        order: order ?? this.order,
        canBeArchived: canBeArchived ?? this.canBeArchived,
        maxReadStoryId: maxReadStoryId ?? this.maxReadStoryId,
        stories: stories ?? this.stories,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatActiveStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
