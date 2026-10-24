part of '../tdapi.dart';

/// **Stories** *(stories)* - basic class
///
/// Represents a list of stories.
///
/// * [totalCount]: Approximate total number of stories found.
/// * [stories]: The list of stories.
/// * [pinnedStoryIds]: Identifiers of the pinned stories; returned only in getChatPostedToChatPageStories with from_story_id == 0.
final class Stories extends TdObject {
  /// **Stories** *(stories)* - basic class
  ///
  /// Represents a list of stories.
  ///
  /// * [totalCount]: Approximate total number of stories found.
  /// * [stories]: The list of stories.
  /// * [pinnedStoryIds]: Identifiers of the pinned stories; returned only in getChatPostedToChatPageStories with from_story_id == 0.
  const Stories({
    required this.totalCount,
    required this.stories,
    required this.pinnedStoryIds,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of stories found
  final int totalCount;

  /// The list of stories
  final List<Story> stories;

  /// Identifiers of the pinned stories; returned only in getChatPostedToChatPageStories with from_story_id == 0
  final List<int> pinnedStoryIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        totalCount: json['total_count'],
        stories: List<Story>.from((json['stories'] ?? [])
            .map((item) => Story.fromJson(item))
            .toList()),
        pinnedStoryIds: List<int>.from(
            (json['pinned_story_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "stories": stories.map((i) => i.toJson()).toList(),
      "pinned_story_ids": pinnedStoryIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of stories found
  /// * [stories]: The list of stories
  /// * [pinned_story_ids]: Identifiers of the pinned stories; returned only in getChatPostedToChatPageStories with from_story_id == 0
  Stories copyWith({
    int? totalCount,
    List<Story>? stories,
    List<int>? pinnedStoryIds,
    dynamic extra,
    int? clientId,
  }) =>
      Stories(
        totalCount: totalCount ?? this.totalCount,
        stories: stories ?? this.stories,
        pinnedStoryIds: pinnedStoryIds ?? this.pinnedStoryIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
