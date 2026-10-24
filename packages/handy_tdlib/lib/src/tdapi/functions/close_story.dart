part of '../tdapi.dart';

/// **CloseStory** *(closeStory)* - TDLib function
///
/// Informs TDLib that a story is closed by the user.
///
/// * [storyPosterChatId]: The identifier of the poster of the story to close.
/// * [storyId]: The identifier of the story.
///
/// [Ok] is returned on completion.
final class CloseStory extends TdFunction {
  /// **CloseStory** *(closeStory)* - TDLib function
  ///
  /// Informs TDLib that a story is closed by the user.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story to close.
  /// * [storyId]: The identifier of the story.
  ///
  /// [Ok] is returned on completion.
  const CloseStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// The identifier of the poster of the story to close
  final int storyPosterChatId;

  /// The identifier of the story
  final int storyId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: The identifier of the poster of the story to close
  /// * [story_id]: The identifier of the story
  CloseStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      CloseStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closeStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
