part of '../tdapi.dart';

/// **StoryInteraction** *(storyInteraction)* - basic class
///
/// Represents interaction with a story.
///
/// * [actorId]: Identifier of the user or chat that made the interaction.
/// * [interactionDate]: Approximate point in time (Unix timestamp) when the interaction happened.
/// * [blockList]: Block list to which the actor is added; may be null if none or for chat stories *(optional)*.
/// * [type]: Type of the interaction.
final class StoryInteraction extends TdObject {
  /// **StoryInteraction** *(storyInteraction)* - basic class
  ///
  /// Represents interaction with a story.
  ///
  /// * [actorId]: Identifier of the user or chat that made the interaction.
  /// * [interactionDate]: Approximate point in time (Unix timestamp) when the interaction happened.
  /// * [blockList]: Block list to which the actor is added; may be null if none or for chat stories *(optional)*.
  /// * [type]: Type of the interaction.
  const StoryInteraction({
    required this.actorId,
    required this.interactionDate,
    this.blockList,
    required this.type,
  });

  /// Identifier of the user or chat that made the interaction
  final MessageSender actorId;

  /// Approximate point in time (Unix timestamp) when the interaction happened
  final int interactionDate;

  /// Block list to which the actor is added; may be null if none or for chat stories
  final BlockList? blockList;

  /// Type of the interaction
  final StoryInteractionType type;

  /// Parse from a json
  factory StoryInteraction.fromJson(Map<String, dynamic> json) =>
      StoryInteraction(
        actorId: MessageSender.fromJson(json['actor_id']),
        interactionDate: json['interaction_date'],
        blockList: json['block_list'] == null
            ? null
            : BlockList.fromJson(json['block_list']),
        type: StoryInteractionType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "actor_id": actorId.toJson(),
      "interaction_date": interactionDate,
      "block_list": blockList?.toJson(),
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [actor_id]: Identifier of the user or chat that made the interaction
  /// * [interaction_date]: Approximate point in time (Unix timestamp) when the interaction happened
  /// * [block_list]: Block list to which the actor is added; may be null if none or for chat stories
  /// * [type]: Type of the interaction
  StoryInteraction copyWith({
    MessageSender? actorId,
    int? interactionDate,
    BlockList? blockList,
    StoryInteractionType? type,
  }) =>
      StoryInteraction(
        actorId: actorId ?? this.actorId,
        interactionDate: interactionDate ?? this.interactionDate,
        blockList: blockList ?? this.blockList,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInteraction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
