part of '../tdapi.dart';

/// **InputMessageReplyTo** *(inputMessageReplyTo)* - parent
///
/// Contains information about the message or the story to be replied.
sealed class InputMessageReplyTo extends TdObject {
  /// **InputMessageReplyTo** *(inputMessageReplyTo)* - parent
  ///
  /// Contains information about the message or the story to be replied.
  const InputMessageReplyTo();

  /// a InputMessageReplyTo return type can be :
  /// * [InputMessageReplyToMessage]
  /// * [InputMessageReplyToExternalMessage]
  /// * [InputMessageReplyToStory]
  /// * [InputMessageReplyToEphemeralMessage]
  factory InputMessageReplyTo.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputMessageReplyToMessage.defaultObjectId:
        return InputMessageReplyToMessage.fromJson(json);
      case InputMessageReplyToExternalMessage.defaultObjectId:
        return InputMessageReplyToExternalMessage.fromJson(json);
      case InputMessageReplyToStory.defaultObjectId:
        return InputMessageReplyToStory.fromJson(json);
      case InputMessageReplyToEphemeralMessage.defaultObjectId:
        return InputMessageReplyToEphemeralMessage.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputMessageReplyTo)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputMessageReplyTo copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageReplyTo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageReplyToMessage** *(inputMessageReplyToMessage)* - child of InputMessageReplyTo
///
/// Describes a message to be replied in the same chat and forum topic.
///
/// * [messageId]: The identifier of the message to be replied in the same chat and forum topic. A message can be replied in the same chat and forum topic only if messageProperties.can_be_replied.
/// * [quote]: Quote from the message to be replied; pass null if none. Must always be null for replies in secret chats *(optional)*.
/// * [checklistTaskId]: Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message.
/// * [pollOptionId]: Identifier of the poll option in the message to be replied; pass an empty string if none.
final class InputMessageReplyToMessage extends InputMessageReplyTo {
  /// **InputMessageReplyToMessage** *(inputMessageReplyToMessage)* - child of InputMessageReplyTo
  ///
  /// Describes a message to be replied in the same chat and forum topic.
  ///
  /// * [messageId]: The identifier of the message to be replied in the same chat and forum topic. A message can be replied in the same chat and forum topic only if messageProperties.can_be_replied.
  /// * [quote]: Quote from the message to be replied; pass null if none. Must always be null for replies in secret chats *(optional)*.
  /// * [checklistTaskId]: Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message.
  /// * [pollOptionId]: Identifier of the poll option in the message to be replied; pass an empty string if none.
  const InputMessageReplyToMessage({
    required this.messageId,
    this.quote,
    required this.checklistTaskId,
    required this.pollOptionId,
  });

  /// The identifier of the message to be replied in the same chat and forum topic. A message can be replied in the same chat and forum topic only if messageProperties.can_be_replied
  final int messageId;

  /// Quote from the message to be replied; pass null if none. Must always be null for replies in secret chats
  final InputTextQuote? quote;

  /// Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message
  final int checklistTaskId;

  /// Identifier of the poll option in the message to be replied; pass an empty string if none
  final String pollOptionId;

  /// Parse from a json
  factory InputMessageReplyToMessage.fromJson(Map<String, dynamic> json) =>
      InputMessageReplyToMessage(
        messageId: json['message_id'],
        quote: json['quote'] == null
            ? null
            : InputTextQuote.fromJson(json['quote']),
        checklistTaskId: json['checklist_task_id'],
        pollOptionId: json['poll_option_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
      "quote": quote?.toJson(),
      "checklist_task_id": checklistTaskId,
      "poll_option_id": pollOptionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: The identifier of the message to be replied in the same chat and forum topic. A message can be replied in the same chat and forum topic only if messageProperties.can_be_replied
  /// * [quote]: Quote from the message to be replied; pass null if none. Must always be null for replies in secret chats
  /// * [checklist_task_id]: Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message
  /// * [poll_option_id]: Identifier of the poll option in the message to be replied; pass an empty string if none
  @override
  InputMessageReplyToMessage copyWith({
    int? messageId,
    InputTextQuote? quote,
    int? checklistTaskId,
    String? pollOptionId,
  }) =>
      InputMessageReplyToMessage(
        messageId: messageId ?? this.messageId,
        quote: quote ?? this.quote,
        checklistTaskId: checklistTaskId ?? this.checklistTaskId,
        pollOptionId: pollOptionId ?? this.pollOptionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageReplyToMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageReplyToExternalMessage** *(inputMessageReplyToExternalMessage)* - child of InputMessageReplyTo
///
/// Describes a message to be replied that is from a different chat or a forum topic; not supported in secret chats.
///
/// * [chatId]: The identifier of the chat to which the message to be replied belongs.
/// * [messageId]: The identifier of the message to be replied in the specified chat. A message can be replied in another chat or forum topic only if messageProperties.can_be_replied_in_another_chat.
/// * [quote]: Quote from the message to be replied; pass null if none *(optional)*.
/// * [checklistTaskId]: Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message.
/// * [pollOptionId]: Identifier of the poll option in the message to be replied; pass an empty string if none.
final class InputMessageReplyToExternalMessage extends InputMessageReplyTo {
  /// **InputMessageReplyToExternalMessage** *(inputMessageReplyToExternalMessage)* - child of InputMessageReplyTo
  ///
  /// Describes a message to be replied that is from a different chat or a forum topic; not supported in secret chats.
  ///
  /// * [chatId]: The identifier of the chat to which the message to be replied belongs.
  /// * [messageId]: The identifier of the message to be replied in the specified chat. A message can be replied in another chat or forum topic only if messageProperties.can_be_replied_in_another_chat.
  /// * [quote]: Quote from the message to be replied; pass null if none *(optional)*.
  /// * [checklistTaskId]: Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message.
  /// * [pollOptionId]: Identifier of the poll option in the message to be replied; pass an empty string if none.
  const InputMessageReplyToExternalMessage({
    required this.chatId,
    required this.messageId,
    this.quote,
    required this.checklistTaskId,
    required this.pollOptionId,
  });

  /// The identifier of the chat to which the message to be replied belongs
  final int chatId;

  /// The identifier of the message to be replied in the specified chat. A message can be replied in another chat or forum topic only if messageProperties.can_be_replied_in_another_chat
  final int messageId;

  /// Quote from the message to be replied; pass null if none
  final InputTextQuote? quote;

  /// Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message
  final int checklistTaskId;

  /// Identifier of the poll option in the message to be replied; pass an empty string if none
  final String pollOptionId;

  /// Parse from a json
  factory InputMessageReplyToExternalMessage.fromJson(
          Map<String, dynamic> json) =>
      InputMessageReplyToExternalMessage(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        quote: json['quote'] == null
            ? null
            : InputTextQuote.fromJson(json['quote']),
        checklistTaskId: json['checklist_task_id'],
        pollOptionId: json['poll_option_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "quote": quote?.toJson(),
      "checklist_task_id": checklistTaskId,
      "poll_option_id": pollOptionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat to which the message to be replied belongs
  /// * [message_id]: The identifier of the message to be replied in the specified chat. A message can be replied in another chat or forum topic only if messageProperties.can_be_replied_in_another_chat
  /// * [quote]: Quote from the message to be replied; pass null if none
  /// * [checklist_task_id]: Identifier of the checklist task in the message to be replied; pass 0 to reply to the whole message
  /// * [poll_option_id]: Identifier of the poll option in the message to be replied; pass an empty string if none
  @override
  InputMessageReplyToExternalMessage copyWith({
    int? chatId,
    int? messageId,
    InputTextQuote? quote,
    int? checklistTaskId,
    String? pollOptionId,
  }) =>
      InputMessageReplyToExternalMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        quote: quote ?? this.quote,
        checklistTaskId: checklistTaskId ?? this.checklistTaskId,
        pollOptionId: pollOptionId ?? this.pollOptionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageReplyToExternalMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageReplyToStory** *(inputMessageReplyToStory)* - child of InputMessageReplyTo
///
/// Describes a story to be replied.
///
/// * [storyPosterChatId]: The identifier of the poster of the story. Currently, stories can be replied only in the chat that posted the story; channel stories can't be replied.
/// * [storyId]: The identifier of the story.
final class InputMessageReplyToStory extends InputMessageReplyTo {
  /// **InputMessageReplyToStory** *(inputMessageReplyToStory)* - child of InputMessageReplyTo
  ///
  /// Describes a story to be replied.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story. Currently, stories can be replied only in the chat that posted the story; channel stories can't be replied.
  /// * [storyId]: The identifier of the story.
  const InputMessageReplyToStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// The identifier of the poster of the story. Currently, stories can be replied only in the chat that posted the story; channel stories can't be replied
  final int storyPosterChatId;

  /// The identifier of the story
  final int storyId;

  /// Parse from a json
  factory InputMessageReplyToStory.fromJson(Map<String, dynamic> json) =>
      InputMessageReplyToStory(
        storyPosterChatId: json['story_poster_chat_id'],
        storyId: json['story_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "story_poster_chat_id": storyPosterChatId,
      "story_id": storyId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [story_poster_chat_id]: The identifier of the poster of the story. Currently, stories can be replied only in the chat that posted the story; channel stories can't be replied
  /// * [story_id]: The identifier of the story
  @override
  InputMessageReplyToStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      InputMessageReplyToStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageReplyToStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputMessageReplyToEphemeralMessage** *(inputMessageReplyToEphemeralMessage)* - child of InputMessageReplyTo
///
/// Describes an ephemeral message to be replied; for bots only.
///
/// * [ephemeralMessageId]: The identifier of the ephemeral message to be replied.
final class InputMessageReplyToEphemeralMessage extends InputMessageReplyTo {
  /// **InputMessageReplyToEphemeralMessage** *(inputMessageReplyToEphemeralMessage)* - child of InputMessageReplyTo
  ///
  /// Describes an ephemeral message to be replied; for bots only.
  ///
  /// * [ephemeralMessageId]: The identifier of the ephemeral message to be replied.
  const InputMessageReplyToEphemeralMessage({
    required this.ephemeralMessageId,
  });

  /// The identifier of the ephemeral message to be replied
  final int ephemeralMessageId;

  /// Parse from a json
  factory InputMessageReplyToEphemeralMessage.fromJson(
          Map<String, dynamic> json) =>
      InputMessageReplyToEphemeralMessage(
        ephemeralMessageId: json['ephemeral_message_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "ephemeral_message_id": ephemeralMessageId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [ephemeral_message_id]: The identifier of the ephemeral message to be replied
  @override
  InputMessageReplyToEphemeralMessage copyWith({
    int? ephemeralMessageId,
  }) =>
      InputMessageReplyToEphemeralMessage(
        ephemeralMessageId: ephemeralMessageId ?? this.ephemeralMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputMessageReplyToEphemeralMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
