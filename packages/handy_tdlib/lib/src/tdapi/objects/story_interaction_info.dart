part of '../tdapi.dart';

/// **StoryInteractionInfo** *(storyInteractionInfo)* - basic class
///
/// Contains information about interactions with a story.
///
/// * [viewCount]: Number of times the story was viewed.
/// * [forwardCount]: Number of times the story was forwarded; 0 if none or unknown.
/// * [reactionCount]: Number of reactions added to the story; 0 if none or unknown.
/// * [recentViewerUserIds]: Identifiers of at most 3 recent viewers of the story.
final class StoryInteractionInfo extends TdObject {
  /// **StoryInteractionInfo** *(storyInteractionInfo)* - basic class
  ///
  /// Contains information about interactions with a story.
  ///
  /// * [viewCount]: Number of times the story was viewed.
  /// * [forwardCount]: Number of times the story was forwarded; 0 if none or unknown.
  /// * [reactionCount]: Number of reactions added to the story; 0 if none or unknown.
  /// * [recentViewerUserIds]: Identifiers of at most 3 recent viewers of the story.
  const StoryInteractionInfo({
    required this.viewCount,
    required this.forwardCount,
    required this.reactionCount,
    required this.recentViewerUserIds,
  });

  /// Number of times the story was viewed
  final int viewCount;

  /// Number of times the story was forwarded; 0 if none or unknown
  final int forwardCount;

  /// Number of reactions added to the story; 0 if none or unknown
  final int reactionCount;

  /// Identifiers of at most 3 recent viewers of the story
  final List<int> recentViewerUserIds;

  /// Parse from a json
  factory StoryInteractionInfo.fromJson(Map<String, dynamic> json) =>
      StoryInteractionInfo(
        viewCount: json['view_count'],
        forwardCount: json['forward_count'] ?? 0,
        reactionCount: json['reaction_count'] ?? 0,
        recentViewerUserIds: List<int>.from(
            (json['recent_viewer_user_ids'] ?? [])
                .map((item) => item)
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "view_count": viewCount,
      "forward_count": forwardCount,
      "reaction_count": reactionCount,
      "recent_viewer_user_ids": recentViewerUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [view_count]: Number of times the story was viewed
  /// * [forward_count]: Number of times the story was forwarded; 0 if none or unknown
  /// * [reaction_count]: Number of reactions added to the story; 0 if none or unknown
  /// * [recent_viewer_user_ids]: Identifiers of at most 3 recent viewers of the story
  StoryInteractionInfo copyWith({
    int? viewCount,
    int? forwardCount,
    int? reactionCount,
    List<int>? recentViewerUserIds,
  }) =>
      StoryInteractionInfo(
        viewCount: viewCount ?? this.viewCount,
        forwardCount: forwardCount ?? this.forwardCount,
        reactionCount: reactionCount ?? this.reactionCount,
        recentViewerUserIds: recentViewerUserIds ?? this.recentViewerUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInteractionInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
