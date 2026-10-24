part of '../tdapi.dart';

/// **EditBusinessStory** *(editBusinessStory)* - TDLib function
///
/// Changes a story posted by the bot on behalf of a business account; for bots only.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Identifier of the story to edit.
/// * [content]: New content of the story.
/// * [areas]: New clickable rectangle areas to be shown on the story media.
/// * [caption]: New story caption.
/// * [privacySettings]: The new privacy settings for the story.
///
/// [Story] is returned on completion.
final class EditBusinessStory extends TdFunction {
  /// **EditBusinessStory** *(editBusinessStory)* - TDLib function
  ///
  /// Changes a story posted by the bot on behalf of a business account; for bots only.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Identifier of the story to edit.
  /// * [content]: New content of the story.
  /// * [areas]: New clickable rectangle areas to be shown on the story media.
  /// * [caption]: New story caption.
  /// * [privacySettings]: The new privacy settings for the story.
  ///
  /// [Story] is returned on completion.
  const EditBusinessStory({
    required this.storyPosterChatId,
    required this.storyId,
    required this.content,
    required this.areas,
    required this.caption,
    required this.privacySettings,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Identifier of the story to edit
  final int storyId;

  /// New content of the story
  final InputStoryContent content;

  /// New clickable rectangle areas to be shown on the story media
  final InputStoryAreas areas;

  /// New story caption
  final FormattedText caption;

  /// The new privacy settings for the story
  final StoryPrivacySettings privacySettings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "content": content.toJson(),
      "areas": areas.toJson(),
      "caption": caption.toJson(),
      "privacy_settings": privacySettings.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Identifier of the story to edit
  /// * [content]: New content of the story
  /// * [areas]: New clickable rectangle areas to be shown on the story media
  /// * [caption]: New story caption
  /// * [privacy_settings]: The new privacy settings for the story
  EditBusinessStory copyWith({
    int? storyPosterChatId,
    int? storyId,
    InputStoryContent? content,
    InputStoryAreas? areas,
    FormattedText? caption,
    StoryPrivacySettings? privacySettings,
  }) =>
      EditBusinessStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        content: content ?? this.content,
        areas: areas ?? this.areas,
        caption: caption ?? this.caption,
        privacySettings: privacySettings ?? this.privacySettings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBusinessStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
