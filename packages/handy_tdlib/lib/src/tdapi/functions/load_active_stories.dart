part of '../tdapi.dart';

/// **LoadActiveStories** *(loadActiveStories)* - TDLib function
///
/// Loads more active stories from a story list. The loaded stories will be sent through updates. Active stories are sorted by. the pair (active_stories.order, active_stories.story_poster_chat_id) in descending order. Returns a 404 error if all active stories have been loaded.
///
/// * [storyList]: The story list in which to load active stories.
///
/// [Ok] is returned on completion.
final class LoadActiveStories extends TdFunction {
  /// **LoadActiveStories** *(loadActiveStories)* - TDLib function
  ///
  /// Loads more active stories from a story list. The loaded stories will be sent through updates. Active stories are sorted by. the pair (active_stories.order, active_stories.story_poster_chat_id) in descending order. Returns a 404 error if all active stories have been loaded.
  ///
  /// * [storyList]: The story list in which to load active stories.
  ///
  /// [Ok] is returned on completion.
  const LoadActiveStories({
    required this.storyList,
  });

  /// The story list in which to load active stories
  final StoryList storyList;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_list": storyList.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_list]: The story list in which to load active stories
  LoadActiveStories copyWith({
    StoryList? storyList,
  }) =>
      LoadActiveStories(
        storyList: storyList ?? this.storyList,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadActiveStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
