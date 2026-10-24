part of '../tdapi.dart';

/// **SetStoryReaction** *(setStoryReaction)* - TDLib function
///
/// Changes chosen reaction on a story that has already been sent; not supported for live stories.
///
/// * [storyPosterChatId]: The identifier of the poster of the story.
/// * [storyId]: The identifier of the story.
/// * [reactionType]: Type of the reaction to set; pass null to remove the reaction. Custom emoji reactions can be used only by Telegram Premium users. Paid reactions can't be set *(optional)*.
/// * [updateRecentReactions]: Pass true if the reaction needs to be added to recent reactions.
///
/// [Ok] is returned on completion.
final class SetStoryReaction extends TdFunction {
  /// **SetStoryReaction** *(setStoryReaction)* - TDLib function
  ///
  /// Changes chosen reaction on a story that has already been sent; not supported for live stories.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story.
  /// * [storyId]: The identifier of the story.
  /// * [reactionType]: Type of the reaction to set; pass null to remove the reaction. Custom emoji reactions can be used only by Telegram Premium users. Paid reactions can't be set *(optional)*.
  /// * [updateRecentReactions]: Pass true if the reaction needs to be added to recent reactions.
  ///
  /// [Ok] is returned on completion.
  const SetStoryReaction({
    required this.storyPosterChatId,
    required this.storyId,
    this.reactionType,
    required this.updateRecentReactions,
  });

  /// The identifier of the poster of the story
  final int storyPosterChatId;

  /// The identifier of the story
  final int storyId;

  /// Type of the reaction to set; pass null to remove the reaction. Custom emoji reactions can be used only by Telegram Premium users. Paid reactions can't be set
  final ReactionType? reactionType;

  /// Pass true if the reaction needs to be added to recent reactions
  final bool updateRecentReactions;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
      "reaction_type": reactionType?.toJson(),
      "update_recent_reactions": updateRecentReactions,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: The identifier of the poster of the story
  /// * [story_id]: The identifier of the story
  /// * [reaction_type]: Type of the reaction to set; pass null to remove the reaction. Custom emoji reactions can be used only by Telegram Premium users. Paid reactions can't be set
  /// * [update_recent_reactions]: Pass true if the reaction needs to be added to recent reactions
  SetStoryReaction copyWith({
    int? storyPosterChatId,
    int? storyId,
    ReactionType? reactionType,
    bool? updateRecentReactions,
  }) =>
      SetStoryReaction(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
        reactionType: reactionType ?? this.reactionType,
        updateRecentReactions:
            updateRecentReactions ?? this.updateRecentReactions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStoryReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
