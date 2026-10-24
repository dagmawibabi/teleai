part of '../tdapi.dart';

/// **StoryRepostInfo** *(storyRepostInfo)* - basic class
///
/// Contains information about original story that was reposted.
///
/// * [origin]: Origin of the story that was reposted.
/// * [isContentModified]: True, if story content was modified during reposting; otherwise, story wasn't modified.
final class StoryRepostInfo extends TdObject {
  /// **StoryRepostInfo** *(storyRepostInfo)* - basic class
  ///
  /// Contains information about original story that was reposted.
  ///
  /// * [origin]: Origin of the story that was reposted.
  /// * [isContentModified]: True, if story content was modified during reposting; otherwise, story wasn't modified.
  const StoryRepostInfo({
    required this.origin,
    required this.isContentModified,
  });

  /// Origin of the story that was reposted
  final StoryOrigin origin;

  /// True, if story content was modified during reposting; otherwise, story wasn't modified
  final bool isContentModified;

  /// Parse from a json
  factory StoryRepostInfo.fromJson(Map<String, dynamic> json) =>
      StoryRepostInfo(
        origin: StoryOrigin.fromJson(json['origin']),
        isContentModified: json['is_content_modified'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "origin": origin.toJson(),
      "is_content_modified": isContentModified,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [origin]: Origin of the story that was reposted
  /// * [is_content_modified]: True, if story content was modified during reposting; otherwise, story wasn't modified
  StoryRepostInfo copyWith({
    StoryOrigin? origin,
    bool? isContentModified,
  }) =>
      StoryRepostInfo(
        origin: origin ?? this.origin,
        isContentModified: isContentModified ?? this.isContentModified,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyRepostInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
