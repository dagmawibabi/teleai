part of '../tdapi.dart';

/// **StoryInteractionType** *(storyInteractionType)* - parent
///
/// Describes type of interaction with a story.
sealed class StoryInteractionType extends TdObject {
  /// **StoryInteractionType** *(storyInteractionType)* - parent
  ///
  /// Describes type of interaction with a story.
  const StoryInteractionType();

  /// a StoryInteractionType return type can be :
  /// * [StoryInteractionTypeView]
  /// * [StoryInteractionTypeForward]
  /// * [StoryInteractionTypeRepost]
  factory StoryInteractionType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryInteractionTypeView.defaultObjectId:
        return StoryInteractionTypeView.fromJson(json);
      case StoryInteractionTypeForward.defaultObjectId:
        return StoryInteractionTypeForward.fromJson(json);
      case StoryInteractionTypeRepost.defaultObjectId:
        return StoryInteractionTypeRepost.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryInteractionType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryInteractionType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyInteractionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryInteractionTypeView** *(storyInteractionTypeView)* - child of StoryInteractionType
///
/// A view of the story.
///
/// * [chosenReactionType]: Type of the reaction that was chosen by the viewer; may be null if none *(optional)*.
final class StoryInteractionTypeView extends StoryInteractionType {
  /// **StoryInteractionTypeView** *(storyInteractionTypeView)* - child of StoryInteractionType
  ///
  /// A view of the story.
  ///
  /// * [chosenReactionType]: Type of the reaction that was chosen by the viewer; may be null if none *(optional)*.
  const StoryInteractionTypeView({
    this.chosenReactionType,
  });

  /// Type of the reaction that was chosen by the viewer; may be null if none
  final ReactionType? chosenReactionType;

  /// Parse from a json
  factory StoryInteractionTypeView.fromJson(Map<String, dynamic> json) =>
      StoryInteractionTypeView(
        chosenReactionType: json['chosen_reaction_type'] == null
            ? null
            : ReactionType.fromJson(json['chosen_reaction_type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chosen_reaction_type": chosenReactionType?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chosen_reaction_type]: Type of the reaction that was chosen by the viewer; may be null if none
  @override
  StoryInteractionTypeView copyWith({
    ReactionType? chosenReactionType,
  }) =>
      StoryInteractionTypeView(
        chosenReactionType: chosenReactionType ?? this.chosenReactionType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInteractionTypeView';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryInteractionTypeForward** *(storyInteractionTypeForward)* - child of StoryInteractionType
///
/// A forward of the story as a message.
///
/// * [message]: The message with story forward.
final class StoryInteractionTypeForward extends StoryInteractionType {
  /// **StoryInteractionTypeForward** *(storyInteractionTypeForward)* - child of StoryInteractionType
  ///
  /// A forward of the story as a message.
  ///
  /// * [message]: The message with story forward.
  const StoryInteractionTypeForward({
    required this.message,
  });

  /// The message with story forward
  final Message message;

  /// Parse from a json
  factory StoryInteractionTypeForward.fromJson(Map<String, dynamic> json) =>
      StoryInteractionTypeForward(
        message: Message.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The message with story forward
  @override
  StoryInteractionTypeForward copyWith({
    Message? message,
  }) =>
      StoryInteractionTypeForward(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInteractionTypeForward';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryInteractionTypeRepost** *(storyInteractionTypeRepost)* - child of StoryInteractionType
///
/// A repost of the story as a story.
///
/// * [story]: The reposted story.
final class StoryInteractionTypeRepost extends StoryInteractionType {
  /// **StoryInteractionTypeRepost** *(storyInteractionTypeRepost)* - child of StoryInteractionType
  ///
  /// A repost of the story as a story.
  ///
  /// * [story]: The reposted story.
  const StoryInteractionTypeRepost({
    required this.story,
  });

  /// The reposted story
  final Story story;

  /// Parse from a json
  factory StoryInteractionTypeRepost.fromJson(Map<String, dynamic> json) =>
      StoryInteractionTypeRepost(
        story: Story.fromJson(json['story']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story": story.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story]: The reposted story
  @override
  StoryInteractionTypeRepost copyWith({
    Story? story,
  }) =>
      StoryInteractionTypeRepost(
        story: story ?? this.story,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyInteractionTypeRepost';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
