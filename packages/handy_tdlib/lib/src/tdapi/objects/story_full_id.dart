part of '../tdapi.dart';

/// **StoryFullId** *(storyFullId)* - basic class
///
/// Contains identifier of a story along with identifier of the chat that posted it.
///
/// * [posterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Unique story identifier among stories of the chat.
final class StoryFullId extends TdObject {
  /// **StoryFullId** *(storyFullId)* - basic class
  ///
  /// Contains identifier of a story along with identifier of the chat that posted it.
  ///
  /// * [posterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Unique story identifier among stories of the chat.
  const StoryFullId({
    required this.posterChatId,
    required this.storyId,
  });

  /// Identifier of the chat that posted the story
  final int posterChatId;

  /// Unique story identifier among stories of the chat
  final int storyId;

  /// Parse from a json
  factory StoryFullId.fromJson(Map<String, dynamic> json) => StoryFullId(
        posterChatId: json['poster_chat_id'],
        storyId: json['story_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poster_chat_id": posterChatId,
      "story_id": storyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Unique story identifier among stories of the chat
  StoryFullId copyWith({
    int? posterChatId,
    int? storyId,
  }) =>
      StoryFullId(
        posterChatId: posterChatId ?? this.posterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyFullId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
