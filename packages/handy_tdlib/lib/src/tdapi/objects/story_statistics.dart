part of '../tdapi.dart';

/// **StoryStatistics** *(storyStatistics)* - basic class
///
/// A detailed statistics about a story.
///
/// * [storyInteractionGraph]: A graph containing number of story views and shares.
/// * [storyReactionGraph]: A graph containing number of story reactions.
final class StoryStatistics extends TdObject {
  /// **StoryStatistics** *(storyStatistics)* - basic class
  ///
  /// A detailed statistics about a story.
  ///
  /// * [storyInteractionGraph]: A graph containing number of story views and shares.
  /// * [storyReactionGraph]: A graph containing number of story reactions.
  const StoryStatistics({
    required this.storyInteractionGraph,
    required this.storyReactionGraph,
    this.extra,
    this.clientId,
  });

  /// A graph containing number of story views and shares
  final StatisticalGraph storyInteractionGraph;

  /// A graph containing number of story reactions
  final StatisticalGraph storyReactionGraph;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StoryStatistics.fromJson(Map<String, dynamic> json) =>
      StoryStatistics(
        storyInteractionGraph:
            StatisticalGraph.fromJson(json['story_interaction_graph']),
        storyReactionGraph:
            StatisticalGraph.fromJson(json['story_reaction_graph']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_interaction_graph": storyInteractionGraph.toJson(),
      "story_reaction_graph": storyReactionGraph.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_interaction_graph]: A graph containing number of story views and shares
  /// * [story_reaction_graph]: A graph containing number of story reactions
  StoryStatistics copyWith({
    StatisticalGraph? storyInteractionGraph,
    StatisticalGraph? storyReactionGraph,
    dynamic extra,
    int? clientId,
  }) =>
      StoryStatistics(
        storyInteractionGraph:
            storyInteractionGraph ?? this.storyInteractionGraph,
        storyReactionGraph: storyReactionGraph ?? this.storyReactionGraph,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
