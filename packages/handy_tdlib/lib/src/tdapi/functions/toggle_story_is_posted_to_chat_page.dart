part of '../tdapi.dart';

/// **ToggleStoryIsPostedToChatPage** *(toggleStoryIsPostedToChatPage)* - TDLib function
///
/// Toggles whether a story is accessible after expiration. Can be called only if story.can_toggle_is_posted_to_chat_page == true.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Identifier of the story.
/// * [isPostedToChatPage]: Pass true to make the story accessible after expiration; pass false to make it private.
///
/// [Ok] is returned on completion.
final class ToggleStoryIsPostedToChatPage extends TdFunction {
  /// **ToggleStoryIsPostedToChatPage** *(toggleStoryIsPostedToChatPage)* - TDLib function
  ///
  /// Toggles whether a story is accessible after expiration. Can be called only if story.can_toggle_is_posted_to_chat_page == true.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Identifier of the story.
  /// * [isPostedToChatPage]: Pass true to make the story accessible after expiration; pass false to make it private.
  ///
  /// [Ok] is returned on completion.
  const ToggleStoryIsPostedToChatPage({
    required this.storyPosterChatId,
    required this.storyId,
    required this.isPostedToChatPage,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Identifier of the story
  final int storyId;

  /// Pass true to make the story accessible after expiration; pass false to make it private
  final bool isPostedToChatPage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "is_posted_to_chat_page": isPostedToChatPage,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Identifier of the story
  /// * [is_posted_to_chat_page]: Pass true to make the story accessible after expiration; pass false to make it private
  ToggleStoryIsPostedToChatPage copyWith({
    int? storyPosterChatId,
    int? storyId,
    bool? isPostedToChatPage,
  }) =>
      ToggleStoryIsPostedToChatPage(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        isPostedToChatPage: isPostedToChatPage ?? this.isPostedToChatPage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleStoryIsPostedToChatPage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
