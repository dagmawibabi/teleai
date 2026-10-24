part of '../tdapi.dart';

/// **GetStory** *(getStory)* - TDLib function
///
/// Returns a story.
///
/// * [storyPosterChatId]: Identifier of the chat that posted the story.
/// * [storyId]: Story identifier.
/// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
///
/// [Story] is returned on completion.
final class GetStory extends TdFunction {
  /// **GetStory** *(getStory)* - TDLib function
  ///
  /// Returns a story.
  ///
  /// * [storyPosterChatId]: Identifier of the chat that posted the story.
  /// * [storyId]: Story identifier.
  /// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
  ///
  /// [Story] is returned on completion.
  const GetStory({
    required this.storyPosterChatId,
    required this.storyId,
    required this.onlyLocal,
  });

  /// Identifier of the chat that posted the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// Pass true to get only locally available information without sending network requests
  final bool onlyLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "only_local": onlyLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: Identifier of the chat that posted the story
  /// * [story_id]: Story identifier
  /// * [only_local]: Pass true to get only locally available information without sending network requests
  GetStory copyWith({
    int? storyPosterChatId,
    int? storyId,
    bool? onlyLocal,
  }) =>
      GetStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        onlyLocal: onlyLocal ?? this.onlyLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
