part of '../tdapi.dart';

/// **GetStoryAlbumStories** *(getStoryAlbumStories)* - TDLib function
///
/// Returns the list of stories added to the given story album. For optimal performance, the number of returned stories is chosen by TDLib.
///
/// * [chatId]: Chat identifier.
/// * [storyAlbumId]: Story album identifier.
/// * [offset]: Offset of the first entry to return; use 0 to get results from the first album story.
/// * [limit]: The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
///
/// [Stories] is returned on completion.
final class GetStoryAlbumStories extends TdFunction {
  /// **GetStoryAlbumStories** *(getStoryAlbumStories)* - TDLib function
  ///
  /// Returns the list of stories added to the given story album. For optimal performance, the number of returned stories is chosen by TDLib.
  ///
  /// * [chatId]: Chat identifier.
  /// * [storyAlbumId]: Story album identifier.
  /// * [offset]: Offset of the first entry to return; use 0 to get results from the first album story.
  /// * [limit]: The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [Stories] is returned on completion.
  const GetStoryAlbumStories({
    required this.chatId,
    required this.storyAlbumId,
    required this.offset,
    required this.limit,
  });

  /// Chat identifier
  final int chatId;

  /// Story album identifier
  final int storyAlbumId;

  /// Offset of the first entry to return; use 0 to get results from the first album story
  final int offset;

  /// The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_album_id": storyAlbumId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [story_album_id]: Story album identifier
  /// * [offset]: Offset of the first entry to return; use 0 to get results from the first album story
  /// * [limit]: The maximum number of stories to be returned. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
  GetStoryAlbumStories copyWith({
    int? chatId,
    int? storyAlbumId,
    int? offset,
    int? limit,
  }) =>
      GetStoryAlbumStories(
        chatId: chatId ?? this.chatId,
        storyAlbumId: storyAlbumId ?? this.storyAlbumId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStoryAlbumStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
