part of '../tdapi.dart';

/// **ActiveStoryState** *(activeStoryState)* - parent
///
/// Describes state of active stories posted by a chat.
sealed class ActiveStoryState extends TdObject {
  /// **ActiveStoryState** *(activeStoryState)* - parent
  ///
  /// Describes state of active stories posted by a chat.
  const ActiveStoryState();

  /// a ActiveStoryState return type can be :
  /// * [ActiveStoryStateLive]
  /// * [ActiveStoryStateUnread]
  /// * [ActiveStoryStateRead]
  factory ActiveStoryState.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ActiveStoryStateLive.defaultObjectId:
        return ActiveStoryStateLive.fromJson(json);
      case ActiveStoryStateUnread.defaultObjectId:
        return ActiveStoryStateUnread.fromJson(json);
      case ActiveStoryStateRead.defaultObjectId:
        return ActiveStoryStateRead.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ActiveStoryState)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ActiveStoryState copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'activeStoryState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ActiveStoryStateLive** *(activeStoryStateLive)* - child of ActiveStoryState
///
/// The chat has an active live story.
///
/// * [storyId]: Identifier of the active live story.
final class ActiveStoryStateLive extends ActiveStoryState {
  /// **ActiveStoryStateLive** *(activeStoryStateLive)* - child of ActiveStoryState
  ///
  /// The chat has an active live story.
  ///
  /// * [storyId]: Identifier of the active live story.
  const ActiveStoryStateLive({
    required this.storyId,
  });

  /// Identifier of the active live story
  final int storyId;

  /// Parse from a json
  factory ActiveStoryStateLive.fromJson(Map<String, dynamic> json) =>
      ActiveStoryStateLive(
        storyId: json['story_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_id": storyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_id]: Identifier of the active live story
  @override
  ActiveStoryStateLive copyWith({
    int? storyId,
  }) =>
      ActiveStoryStateLive(
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'activeStoryStateLive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ActiveStoryStateUnread** *(activeStoryStateUnread)* - child of ActiveStoryState
///
/// The chat has some unread active stories.
final class ActiveStoryStateUnread extends ActiveStoryState {
  /// **ActiveStoryStateUnread** *(activeStoryStateUnread)* - child of ActiveStoryState
  ///
  /// The chat has some unread active stories.
  const ActiveStoryStateUnread();

  /// Parse from a json
  factory ActiveStoryStateUnread.fromJson(Map<String, dynamic> json) =>
      const ActiveStoryStateUnread();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ActiveStoryStateUnread copyWith() => const ActiveStoryStateUnread();

  /// TDLib object type
  static const String defaultObjectId = 'activeStoryStateUnread';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ActiveStoryStateRead** *(activeStoryStateRead)* - child of ActiveStoryState
///
/// The chat has active stories, all of which were read.
final class ActiveStoryStateRead extends ActiveStoryState {
  /// **ActiveStoryStateRead** *(activeStoryStateRead)* - child of ActiveStoryState
  ///
  /// The chat has active stories, all of which were read.
  const ActiveStoryStateRead();

  /// Parse from a json
  factory ActiveStoryStateRead.fromJson(Map<String, dynamic> json) =>
      const ActiveStoryStateRead();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ActiveStoryStateRead copyWith() => const ActiveStoryStateRead();

  /// TDLib object type
  static const String defaultObjectId = 'activeStoryStateRead';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
