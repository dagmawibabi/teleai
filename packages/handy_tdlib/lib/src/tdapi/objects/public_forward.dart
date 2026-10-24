part of '../tdapi.dart';

/// **PublicForward** *(publicForward)* - parent
///
/// Describes a public forward or repost of a story.
sealed class PublicForward extends TdObject {
  /// **PublicForward** *(publicForward)* - parent
  ///
  /// Describes a public forward or repost of a story.
  const PublicForward();

  /// a PublicForward return type can be :
  /// * [PublicForwardMessage]
  /// * [PublicForwardStory]
  factory PublicForward.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PublicForwardMessage.defaultObjectId:
        return PublicForwardMessage.fromJson(json);
      case PublicForwardStory.defaultObjectId:
        return PublicForwardStory.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PublicForward)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PublicForward copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'publicForward';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PublicForwardMessage** *(publicForwardMessage)* - child of PublicForward
///
/// Contains a public forward as a message.
///
/// * [message]: Information about the message.
final class PublicForwardMessage extends PublicForward {
  /// **PublicForwardMessage** *(publicForwardMessage)* - child of PublicForward
  ///
  /// Contains a public forward as a message.
  ///
  /// * [message]: Information about the message.
  const PublicForwardMessage({
    required this.message,
  });

  /// Information about the message
  final Message message;

  /// Parse from a json
  factory PublicForwardMessage.fromJson(Map<String, dynamic> json) =>
      PublicForwardMessage(
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
  /// * [message]: Information about the message
  @override
  PublicForwardMessage copyWith({
    Message? message,
  }) =>
      PublicForwardMessage(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'publicForwardMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PublicForwardStory** *(publicForwardStory)* - child of PublicForward
///
/// Contains a public repost to a story.
///
/// * [story]: Information about the story.
final class PublicForwardStory extends PublicForward {
  /// **PublicForwardStory** *(publicForwardStory)* - child of PublicForward
  ///
  /// Contains a public repost to a story.
  ///
  /// * [story]: Information about the story.
  const PublicForwardStory({
    required this.story,
  });

  /// Information about the story
  final Story story;

  /// Parse from a json
  factory PublicForwardStory.fromJson(Map<String, dynamic> json) =>
      PublicForwardStory(
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
  /// * [story]: Information about the story
  @override
  PublicForwardStory copyWith({
    Story? story,
  }) =>
      PublicForwardStory(
        story: story ?? this.story,
      );

  /// TDLib object type
  static const String defaultObjectId = 'publicForwardStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
