part of '../tdapi.dart';

/// **ChatStatisticsObjectType** *(chatStatisticsObjectType)* - parent
///
/// Describes type of object, for which statistics are provided.
sealed class ChatStatisticsObjectType extends TdObject {
  /// **ChatStatisticsObjectType** *(chatStatisticsObjectType)* - parent
  ///
  /// Describes type of object, for which statistics are provided.
  const ChatStatisticsObjectType();

  /// a ChatStatisticsObjectType return type can be :
  /// * [ChatStatisticsObjectTypeMessage]
  /// * [ChatStatisticsObjectTypeStory]
  factory ChatStatisticsObjectType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatStatisticsObjectTypeMessage.defaultObjectId:
        return ChatStatisticsObjectTypeMessage.fromJson(json);
      case ChatStatisticsObjectTypeStory.defaultObjectId:
        return ChatStatisticsObjectTypeStory.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatStatisticsObjectType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatStatisticsObjectType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsObjectType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatStatisticsObjectTypeMessage** *(chatStatisticsObjectTypeMessage)* - child of ChatStatisticsObjectType
///
/// Describes a message sent in the chat.
///
/// * [messageId]: Message identifier.
final class ChatStatisticsObjectTypeMessage extends ChatStatisticsObjectType {
  /// **ChatStatisticsObjectTypeMessage** *(chatStatisticsObjectTypeMessage)* - child of ChatStatisticsObjectType
  ///
  /// Describes a message sent in the chat.
  ///
  /// * [messageId]: Message identifier.
  const ChatStatisticsObjectTypeMessage({
    required this.messageId,
  });

  /// Message identifier
  final int messageId;

  /// Parse from a json
  factory ChatStatisticsObjectTypeMessage.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsObjectTypeMessage(
        messageId: json['message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: Message identifier
  @override
  ChatStatisticsObjectTypeMessage copyWith({
    int? messageId,
  }) =>
      ChatStatisticsObjectTypeMessage(
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsObjectTypeMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatStatisticsObjectTypeStory** *(chatStatisticsObjectTypeStory)* - child of ChatStatisticsObjectType
///
/// Describes a story posted on behalf of the chat.
///
/// * [storyId]: Story identifier.
final class ChatStatisticsObjectTypeStory extends ChatStatisticsObjectType {
  /// **ChatStatisticsObjectTypeStory** *(chatStatisticsObjectTypeStory)* - child of ChatStatisticsObjectType
  ///
  /// Describes a story posted on behalf of the chat.
  ///
  /// * [storyId]: Story identifier.
  const ChatStatisticsObjectTypeStory({
    required this.storyId,
  });

  /// Story identifier
  final int storyId;

  /// Parse from a json
  factory ChatStatisticsObjectTypeStory.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsObjectTypeStory(
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
  /// * [story_id]: Story identifier
  @override
  ChatStatisticsObjectTypeStory copyWith({
    int? storyId,
  }) =>
      ChatStatisticsObjectTypeStory(
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsObjectTypeStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
