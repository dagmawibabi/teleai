part of '../tdapi.dart';

/// **ReorderStoryAlbums** *(reorderStoryAlbums)* - TDLib function
///
/// Changes order of story albums. If the albums are owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat.
///
/// * [chatId]: Identifier of the chat that owns the stories.
/// * [storyAlbumIds]: New order of story albums.
///
/// [Ok] is returned on completion.
final class ReorderStoryAlbums extends TdFunction {
  /// **ReorderStoryAlbums** *(reorderStoryAlbums)* - TDLib function
  ///
  /// Changes order of story albums. If the albums are owned by a supergroup or a channel chat, then requires can_edit_stories administrator right in the chat.
  ///
  /// * [chatId]: Identifier of the chat that owns the stories.
  /// * [storyAlbumIds]: New order of story albums.
  ///
  /// [Ok] is returned on completion.
  const ReorderStoryAlbums({
    required this.chatId,
    required this.storyAlbumIds,
  });

  /// Identifier of the chat that owns the stories
  final int chatId;

  /// New order of story albums
  final List<int> storyAlbumIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_album_ids": storyAlbumIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that owns the stories
  /// * [story_album_ids]: New order of story albums
  ReorderStoryAlbums copyWith({
    int? chatId,
    List<int>? storyAlbumIds,
  }) =>
      ReorderStoryAlbums(
        chatId: chatId ?? this.chatId,
        storyAlbumIds: storyAlbumIds ?? this.storyAlbumIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reorderStoryAlbums';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
