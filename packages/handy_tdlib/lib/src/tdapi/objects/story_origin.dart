part of '../tdapi.dart';

/// **StoryOrigin** *(storyOrigin)* - parent
///
/// Contains information about the origin of a story that was reposted.
sealed class StoryOrigin extends TdObject {
  /// **StoryOrigin** *(storyOrigin)* - parent
  ///
  /// Contains information about the origin of a story that was reposted.
  const StoryOrigin();

  /// a StoryOrigin return type can be :
  /// * [StoryOriginPublicStory]
  /// * [StoryOriginHiddenUser]
  factory StoryOrigin.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryOriginPublicStory.defaultObjectId:
        return StoryOriginPublicStory.fromJson(json);
      case StoryOriginHiddenUser.defaultObjectId:
        return StoryOriginHiddenUser.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryOrigin)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryOrigin copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyOrigin';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryOriginPublicStory** *(storyOriginPublicStory)* - child of StoryOrigin
///
/// The original story was a public story that was posted by a known chat.
///
/// * [chatId]: Identifier of the chat that posted original story.
/// * [storyId]: Story identifier of the original story.
final class StoryOriginPublicStory extends StoryOrigin {
  /// **StoryOriginPublicStory** *(storyOriginPublicStory)* - child of StoryOrigin
  ///
  /// The original story was a public story that was posted by a known chat.
  ///
  /// * [chatId]: Identifier of the chat that posted original story.
  /// * [storyId]: Story identifier of the original story.
  const StoryOriginPublicStory({
    required this.chatId,
    required this.storyId,
  });

  /// Identifier of the chat that posted original story
  final int chatId;

  /// Story identifier of the original story
  final int storyId;

  /// Parse from a json
  factory StoryOriginPublicStory.fromJson(Map<String, dynamic> json) =>
      StoryOriginPublicStory(
        chatId: json['chat_id'],
        storyId: json['story_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "story_id": storyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat that posted original story
  /// * [story_id]: Story identifier of the original story
  @override
  StoryOriginPublicStory copyWith({
    int? chatId,
    int? storyId,
  }) =>
      StoryOriginPublicStory(
        chatId: chatId ?? this.chatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyOriginPublicStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryOriginHiddenUser** *(storyOriginHiddenUser)* - child of StoryOrigin
///
/// The original story was posted by an unknown user.
///
/// * [posterName]: Name of the user or the chat that posted the story.
final class StoryOriginHiddenUser extends StoryOrigin {
  /// **StoryOriginHiddenUser** *(storyOriginHiddenUser)* - child of StoryOrigin
  ///
  /// The original story was posted by an unknown user.
  ///
  /// * [posterName]: Name of the user or the chat that posted the story.
  const StoryOriginHiddenUser({
    required this.posterName,
  });

  /// Name of the user or the chat that posted the story
  final String posterName;

  /// Parse from a json
  factory StoryOriginHiddenUser.fromJson(Map<String, dynamic> json) =>
      StoryOriginHiddenUser(
        posterName: json['poster_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "poster_name": posterName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [poster_name]: Name of the user or the chat that posted the story
  @override
  StoryOriginHiddenUser copyWith({
    String? posterName,
  }) =>
      StoryOriginHiddenUser(
        posterName: posterName ?? this.posterName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyOriginHiddenUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
