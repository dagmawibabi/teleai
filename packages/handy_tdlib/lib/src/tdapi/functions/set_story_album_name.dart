part of '../tdapi.dart';

/// **SetStoryAlbumName** *(setStoryAlbumName)* - TDLib function
///
/// Changes name of an album of stories. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns the changed album.
///
/// * [chatId]: Identifier of the chat that owns the stories.
/// * [storyAlbumId]: Identifier of the story album.
/// * [name]: New name of the album; 1-12 characters.
///
/// [StoryAlbum] is returned on completion.
final class SetStoryAlbumName extends TdFunction {
  /// **SetStoryAlbumName** *(setStoryAlbumName)* - TDLib function
  ///
  /// Changes name of an album of stories. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat. Returns the changed album.
  ///
  /// * [chatId]: Identifier of the chat that owns the stories.
  /// * [storyAlbumId]: Identifier of the story album.
  /// * [name]: New name of the album; 1-12 characters.
  ///
  /// [StoryAlbum] is returned on completion.
  const SetStoryAlbumName({
    required this.chatId,
    required this.storyAlbumId,
    required this.name,
  });

  /// Identifier of the chat that owns the stories
  final int chatId;

  /// Identifier of the story album
  final int storyAlbumId;

  /// New name of the album; 1-12 characters
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_album_id": storyAlbumId,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that owns the stories
  /// * [story_album_id]: Identifier of the story album
  /// * [name]: New name of the album; 1-12 characters
  SetStoryAlbumName copyWith({
    int? chatId,
    int? storyAlbumId,
    String? name,
  }) =>
      SetStoryAlbumName(
        chatId: chatId ?? this.chatId,
        storyAlbumId: storyAlbumId ?? this.storyAlbumId,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStoryAlbumName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
