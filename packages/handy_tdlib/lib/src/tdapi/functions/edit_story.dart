part of '../tdapi.dart';

/// **EditStory** *(editStory)* - TDLib function
///
/// Changes content and caption of a story. Can be called only if story.can_be_edited == true.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Identifier of the story to edit.
/// * [content]: New content of the story; pass null to keep the current content *(optional)*.
/// * [areas]: New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed *(optional)*.
/// * [caption]: New story caption; pass null to keep the current caption *(optional)*.
///
/// [Ok] is returned on completion.
final class EditStory extends TdFunction {
  /// **EditStory** *(editStory)* - TDLib function
  ///
  /// Changes content and caption of a story. Can be called only if story.can_be_edited == true.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Identifier of the story to edit.
  /// * [content]: New content of the story; pass null to keep the current content *(optional)*.
  /// * [areas]: New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed *(optional)*.
  /// * [caption]: New story caption; pass null to keep the current caption *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const EditStory({
    required this.storyPosterChatId,
    required this.storyId,
    this.content,
    this.areas,
    this.caption,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Identifier of the story to edit
  final int storyId;

  /// New content of the story; pass null to keep the current content
  final InputStoryContent? content;

  /// New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed
  final InputStoryAreas? areas;

  /// New story caption; pass null to keep the current caption
  final FormattedText? caption;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "content": content?.toJson(),
      "areas": areas?.toJson(),
      "caption": caption?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Identifier of the story to edit
  /// * [content]: New content of the story; pass null to keep the current content
  /// * [areas]: New clickable rectangle areas to be shown on the story media; pass null to keep the current areas. Areas can't be edited if story content isn't changed
  /// * [caption]: New story caption; pass null to keep the current caption
  EditStory copyWith({
    int? storyPosterChatId,
    int? storyId,
    InputStoryContent? content,
    InputStoryAreas? areas,
    FormattedText? caption,
  }) =>
      EditStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        content: content ?? this.content,
        areas: areas ?? this.areas,
        caption: caption ?? this.caption,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
