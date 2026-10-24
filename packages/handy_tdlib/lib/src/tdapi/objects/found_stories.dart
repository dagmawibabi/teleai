part of '../tdapi.dart';

/// **FoundStories** *(foundStories)* - basic class
///
/// Contains a list of stories found by a search.
///
/// * [totalCount]: Approximate total number of stories found.
/// * [stories]: List of stories.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class FoundStories extends TdObject {
  /// **FoundStories** *(foundStories)* - basic class
  ///
  /// Contains a list of stories found by a search.
  ///
  /// * [totalCount]: Approximate total number of stories found.
  /// * [stories]: List of stories.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const FoundStories({
    required this.totalCount,
    required this.stories,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of stories found
  final int totalCount;

  /// List of stories
  final List<Story> stories;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundStories.fromJson(Map<String, dynamic> json) => FoundStories(
        totalCount: json['total_count'],
        stories: List<Story>.from((json['stories'] ?? [])
            .map((item) => Story.fromJson(item))
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
      "stories": stories.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of stories found
  /// * [stories]: List of stories
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  FoundStories copyWith({
    int? totalCount,
    List<Story>? stories,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      FoundStories(
        totalCount: totalCount ?? this.totalCount,
        stories: stories ?? this.stories,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
