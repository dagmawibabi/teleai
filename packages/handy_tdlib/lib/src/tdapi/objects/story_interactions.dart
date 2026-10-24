part of '../tdapi.dart';

/// **StoryInteractions** *(storyInteractions)* - basic class
///
/// Represents a list of interactions with a story.
///
/// * [totalCount]: Approximate total number of interactions found.
/// * [totalForwardCount]: Approximate total number of found forwards and reposts; always 0 for chat stories.
/// * [totalReactionCount]: Approximate total number of found reactions; always 0 for chat stories.
/// * [interactions]: List of story interactions.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class StoryInteractions extends TdObject {
  /// **StoryInteractions** *(storyInteractions)* - basic class
  ///
  /// Represents a list of interactions with a story.
  ///
  /// * [totalCount]: Approximate total number of interactions found.
  /// * [totalForwardCount]: Approximate total number of found forwards and reposts; always 0 for chat stories.
  /// * [totalReactionCount]: Approximate total number of found reactions; always 0 for chat stories.
  /// * [interactions]: List of story interactions.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const StoryInteractions({
    required this.totalCount,
    required this.totalForwardCount,
    required this.totalReactionCount,
    required this.interactions,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of interactions found
  final int totalCount;

  /// Approximate total number of found forwards and reposts; always 0 for chat stories
  final int totalForwardCount;

  /// Approximate total number of found reactions; always 0 for chat stories
  final int totalReactionCount;

  /// List of story interactions
  final List<StoryInteraction> interactions;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StoryInteractions.fromJson(Map<String, dynamic> json) =>
      StoryInteractions(
        totalCount: json['total_count'],
        totalForwardCount: json['total_forward_count'],
        totalReactionCount: json['total_reaction_count'],
        interactions: List<StoryInteraction>.from((json['interactions'] ?? [])
            .map((item) => StoryInteraction.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "total_forward_count": totalForwardCount,
      "total_reaction_count": totalReactionCount,
      "interactions": interactions.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of interactions found
  /// * [total_forward_count]: Approximate total number of found forwards and reposts; always 0 for chat stories
  /// * [total_reaction_count]: Approximate total number of found reactions; always 0 for chat stories
  /// * [interactions]: List of story interactions
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  StoryInteractions copyWith({
    int? totalCount,
    int? totalForwardCount,
    int? totalReactionCount,
    List<StoryInteraction>? interactions,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      StoryInteractions(
        totalCount: totalCount ?? this.totalCount,
        totalForwardCount: totalForwardCount ?? this.totalForwardCount,
        totalReactionCount: totalReactionCount ?? this.totalReactionCount,
        interactions: interactions ?? this.interactions,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInteractions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
