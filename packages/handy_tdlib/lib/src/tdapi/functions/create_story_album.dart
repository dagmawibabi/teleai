part of '../tdapi.dart';

/// **CreateStoryAlbum** *(createStoryAlbum)* - TDLib function
///
/// Creates an album of stories; requires can_edit_stories administrator right for supergroup and channel chats.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the stories.
/// * [name]: Name of the album; 1-12 characters.
/// * [storyIds]: Identifiers of stories to add to the album; 0-getOption("story_album_size_max") identifiers.
///
/// [StoryAlbum] is returned on completion.
final class CreateStoryAlbum extends TdFunction {
  /// **CreateStoryAlbum** *(createStoryAlbum)* - TDLib function
  ///
  /// Creates an album of stories; requires can_edit_stories administrator right for supergroup and channel chats.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the stories.
  /// * [name]: Name of the album; 1-12 characters.
  /// * [storyIds]: Identifiers of stories to add to the album; 0-getOption("story_album_size_max") identifiers.
  ///
  /// [StoryAlbum] is returned on completion.
  const CreateStoryAlbum({
    required this.storyPosterChatId,
    required this.name,
    required this.storyIds,
  });

  /// Identifier of the chat that posted the stories
  final int storyPosterChatId;

  /// Name of the album; 1-12 characters
  final String name;

  /// Identifiers of stories to add to the album; 0-getOption("story_album_size_max") identifiers
  final List<int> storyIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "name": name,
      "story_ids": storyIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the stories
  /// * [name]: Name of the album; 1-12 characters
  /// * [story_ids]: Identifiers of stories to add to the album; 0-getOption("story_album_size_max") identifiers
  CreateStoryAlbum copyWith({
    int? storyPosterChatId,
    String? name,
    List<int>? storyIds,
  }) =>
      CreateStoryAlbum(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        name: name ?? this.name,
        storyIds: storyIds ?? this.storyIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createStoryAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
