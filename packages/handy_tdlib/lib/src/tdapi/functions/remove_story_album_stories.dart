part of '../tdapi.dart';

/// **RemoveStoryAlbumStories** *(removeStoryAlbumStories)* - TDLib function
///
/// Removes stories from an album. If the album is owned by a supergroup or a channel chat, then. requires can_edit_stories administrator right in the chat. Returns the changed album.
///
/// * [chatId]: Identifier of the chat that owns the stories.
/// * [storyAlbumId]: Identifier of the story album.
/// * [storyIds]: Identifier of the stories to remove from the album.
///
/// [StoryAlbum] is returned on completion.
final class RemoveStoryAlbumStories extends TdFunction {
  /// **RemoveStoryAlbumStories** *(removeStoryAlbumStories)* - TDLib function
  ///
  /// Removes stories from an album. If the album is owned by a supergroup or a channel chat, then. requires can_edit_stories administrator right in the chat. Returns the changed album.
  ///
  /// * [chatId]: Identifier of the chat that owns the stories.
  /// * [storyAlbumId]: Identifier of the story album.
  /// * [storyIds]: Identifier of the stories to remove from the album.
  ///
  /// [StoryAlbum] is returned on completion.
  const RemoveStoryAlbumStories({
    required this.chatId,
    required this.storyAlbumId,
    required this.storyIds,
  });

  /// Identifier of the chat that owns the stories
  final int chatId;

  /// Identifier of the story album
  final int storyAlbumId;

  /// Identifier of the stories to remove from the album
  final List<int> storyIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_album_id": storyAlbumId,
      "story_ids": storyIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that owns the stories
  /// * [story_album_id]: Identifier of the story album
  /// * [story_ids]: Identifier of the stories to remove from the album
  RemoveStoryAlbumStories copyWith({
    int? chatId,
    int? storyAlbumId,
    List<int>? storyIds,
  }) =>
      RemoveStoryAlbumStories(
        chatId: chatId ?? this.chatId,
        storyAlbumId: storyAlbumId ?? this.storyAlbumId,
        storyIds: storyIds ?? this.storyIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeStoryAlbumStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
