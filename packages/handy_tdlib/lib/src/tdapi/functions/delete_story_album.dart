part of '../tdapi.dart';

/// **DeleteStoryAlbum** *(deleteStoryAlbum)* - TDLib function
///
/// Deletes a story album. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat.
///
/// * [chatId]: Identifier of the chat that owns the stories.
/// * [storyAlbumId]: Identifier of the story album.
///
/// [Ok] is returned on completion.
final class DeleteStoryAlbum extends TdFunction {
  /// **DeleteStoryAlbum** *(deleteStoryAlbum)* - TDLib function
  ///
  /// Deletes a story album. If the album is owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat.
  ///
  /// * [chatId]: Identifier of the chat that owns the stories.
  /// * [storyAlbumId]: Identifier of the story album.
  ///
  /// [Ok] is returned on completion.
  const DeleteStoryAlbum({
    required this.chatId,
    required this.storyAlbumId,
  });

  /// Identifier of the chat that owns the stories
  final int chatId;

  /// Identifier of the story album
  final int storyAlbumId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_album_id": storyAlbumId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that owns the stories
  /// * [story_album_id]: Identifier of the story album
  DeleteStoryAlbum copyWith({
    int? chatId,
    int? storyAlbumId,
  }) =>
      DeleteStoryAlbum(
        chatId: chatId ?? this.chatId,
        storyAlbumId: storyAlbumId ?? this.storyAlbumId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteStoryAlbum';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
