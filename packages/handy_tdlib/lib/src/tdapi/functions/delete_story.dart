part of '../tdapi.dart';

/// **DeleteStory** *(deleteStory)* - TDLib function
///
/// Deletes a previously posted story. Can be called only if story.can_be_deleted == true.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Identifier of the story to delete.
///
/// [Ok] is returned on completion.
final class DeleteStory extends TdFunction {
  /// **DeleteStory** *(deleteStory)* - TDLib function
  ///
  /// Deletes a previously posted story. Can be called only if story.can_be_deleted == true.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Identifier of the story to delete.
  ///
  /// [Ok] is returned on completion.
  const DeleteStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Identifier of the story to delete
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
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Identifier of the story to delete
  DeleteStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      DeleteStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
