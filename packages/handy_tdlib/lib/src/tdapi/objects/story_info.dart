part of '../tdapi.dart';

/// **StoryInfo** *(storyInfo)* - basic class
///
/// Contains basic information about a story.
///
/// * [storyId]: Unique story identifier among stories of the chat.
/// * [date]: Point in time (Unix timestamp) when the story was published.
/// * [isForCloseFriends]: True, if the story is available only to close friends.
/// * [isLive]: True, if the story is a live story.
final class StoryInfo extends TdObject {
  /// **StoryInfo** *(storyInfo)* - basic class
  ///
  /// Contains basic information about a story.
  ///
  /// * [storyId]: Unique story identifier among stories of the chat.
  /// * [date]: Point in time (Unix timestamp) when the story was published.
  /// * [isForCloseFriends]: True, if the story is available only to close friends.
  /// * [isLive]: True, if the story is a live story.
  const StoryInfo({
    required this.storyId,
    required this.date,
    required this.isForCloseFriends,
    required this.isLive,
  });

  /// Unique story identifier among stories of the chat
  final int storyId;

  /// Point in time (Unix timestamp) when the story was published
  final int date;

  /// True, if the story is available only to close friends
  final bool isForCloseFriends;

  /// True, if the story is a live story
  final bool isLive;

  /// Parse from a json
  factory StoryInfo.fromJson(Map<String, dynamic> json) => StoryInfo(
        storyId: json['story_id'],
        date: json['date'],
        isForCloseFriends: json['is_for_close_friends'],
        isLive: json['is_live'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_id": storyId,
      "date": date,
      "is_for_close_friends": isForCloseFriends,
      "is_live": isLive,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_id]: Unique story identifier among stories of the chat
  /// * [date]: Point in time (Unix timestamp) when the story was published
  /// * [is_for_close_friends]: True, if the story is available only to close friends
  /// * [is_live]: True, if the story is a live story
  StoryInfo copyWith({
    int? storyId,
    int? date,
    bool? isForCloseFriends,
    bool? isLive,
  }) =>
      StoryInfo(
        storyId: storyId ?? this.storyId,
        date: date ?? this.date,
        isForCloseFriends: isForCloseFriends ?? this.isForCloseFriends,
        isLive: isLive ?? this.isLive,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
