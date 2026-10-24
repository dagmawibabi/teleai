part of '../tdapi.dart';

/// **GetStoryPublicForwards** *(getStoryPublicForwards)* - TDLib function
///
/// Returns forwards of a story as a message to public chats and reposts by public channels. Can be used only if the story is posted on behalf of the current user or story.can_get_statistics == true.. For optimal performance, the number of returned messages and stories is chosen by TDLib.
///
/// * [storyPosterChatId]: The identifier of the poster of the story.
/// * [storyId]: The identifier of the story.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
///
/// [PublicForwards] is returned on completion.
final class GetStoryPublicForwards extends TdFunction {
  /// **GetStoryPublicForwards** *(getStoryPublicForwards)* - TDLib function
  ///
  /// Returns forwards of a story as a message to public chats and reposts by public channels. Can be used only if the story is posted on behalf of the current user or story.can_get_statistics == true.. For optimal performance, the number of returned messages and stories is chosen by TDLib.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story.
  /// * [storyId]: The identifier of the story.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [PublicForwards] is returned on completion.
  const GetStoryPublicForwards({
    required this.storyPosterChatId,
    required this.storyId,
    required this.offset,
    required this.limit,
  });

  /// The identifier of the poster of the story
  final int storyPosterChatId;

  /// The identifier of the story
  final int storyId;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: The identifier of the poster of the story
  /// * [story_id]: The identifier of the story
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of messages and stories to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
  GetStoryPublicForwards copyWith({
    int? storyPosterChatId,
    int? storyId,
    String? offset,
    int? limit,
  }) =>
      GetStoryPublicForwards(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStoryPublicForwards';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
