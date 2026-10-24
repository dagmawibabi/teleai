part of '../tdapi.dart';

/// **GetChatStoryInteractions** *(getChatStoryInteractions)* - TDLib function
///
/// Returns interactions with a story posted in a chat. Can be used only if story is posted on behalf of a chat and the user is an administrator in the chat.
///
/// * [storyPosterChatId]: The identifier of the poster of the story.
/// * [storyId]: Story identifier.
/// * [reactionType]: Pass the default heart reaction or a suggested reaction type to receive only interactions with the specified reaction type; pass null to receive all interactions; reactionTypePaid isn't supported *(optional)*.
/// * [preferForwards]: Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of story interactions to return.
///
/// [StoryInteractions] is returned on completion.
final class GetChatStoryInteractions extends TdFunction {
  /// **GetChatStoryInteractions** *(getChatStoryInteractions)* - TDLib function
  ///
  /// Returns interactions with a story posted in a chat. Can be used only if story is posted on behalf of a chat and the user is an administrator in the chat.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story.
  /// * [storyId]: Story identifier.
  /// * [reactionType]: Pass the default heart reaction or a suggested reaction type to receive only interactions with the specified reaction type; pass null to receive all interactions; reactionTypePaid isn't supported *(optional)*.
  /// * [preferForwards]: Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of story interactions to return.
  ///
  /// [StoryInteractions] is returned on completion.
  const GetChatStoryInteractions({
    required this.storyPosterChatId,
    required this.storyId,
    this.reactionType,
    required this.preferForwards,
    required this.offset,
    required this.limit,
  });

  /// The identifier of the poster of the story
  final int storyPosterChatId;

  /// Story identifier
  final int storyId;

  /// Pass the default heart reaction or a suggested reaction type to receive only interactions with the specified reaction type; pass null to receive all interactions; reactionTypePaid isn't supported
  final ReactionType? reactionType;

  /// Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
  final bool preferForwards;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of story interactions to return
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "reaction_type": reactionType?.toJson(),
      "prefer_forwards": preferForwards,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: The identifier of the poster of the story
  /// * [story_id]: Story identifier
  /// * [reaction_type]: Pass the default heart reaction or a suggested reaction type to receive only interactions with the specified reaction type; pass null to receive all interactions; reactionTypePaid isn't supported
  /// * [prefer_forwards]: Pass true to get forwards and reposts first, then reactions, then other views; pass false to get interactions sorted just by interaction date
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of story interactions to return
  GetChatStoryInteractions copyWith({
    int? storyPosterChatId,
    int? storyId,
    ReactionType? reactionType,
    bool? preferForwards,
    String? offset,
    int? limit,
  }) =>
      GetChatStoryInteractions(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        reactionType: reactionType ?? this.reactionType,
        preferForwards: preferForwards ?? this.preferForwards,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatStoryInteractions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
