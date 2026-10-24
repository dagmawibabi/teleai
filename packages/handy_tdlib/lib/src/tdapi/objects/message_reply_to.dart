part of '../tdapi.dart';

/// **MessageReplyTo** *(messageReplyTo)* - parent
///
/// Contains information about the message or the story a message is replying to.
sealed class MessageReplyTo extends TdObject {
  /// **MessageReplyTo** *(messageReplyTo)* - parent
  ///
  /// Contains information about the message or the story a message is replying to.
  const MessageReplyTo();

  /// a MessageReplyTo return type can be :
  /// * [MessageReplyToMessage]
  /// * [MessageReplyToStory]
  factory MessageReplyTo.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case MessageReplyToMessage.defaultObjectId:
        return MessageReplyToMessage.fromJson(json);
      case MessageReplyToStory.defaultObjectId:
        return MessageReplyToStory.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of MessageReplyTo)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  MessageReplyTo copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'messageReplyTo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageReplyToMessage** *(messageReplyToMessage)* - child of MessageReplyTo
///
/// Describes a message replied by a given message.
///
/// * [chatId]: The identifier of the chat to which the message belongs; may be 0 if the replied message is in unknown chat.
/// * [messageId]: The identifier of the message; may be 0 if the replied message is in unknown chat.
/// * [quote]: Chosen quote from the replied message; may be null if none *(optional)*.
/// * [checklistTaskId]: Identifier of the checklist task in the original message that was replied; 0 if none.
/// * [pollOptionId]: Identifier of the poll option in the original message that was replied; empty if none.
/// * [origin]: Information about origin of the message if the message was from another chat or topic; may be null for messages from the same chat *(optional)*.
/// * [originSendDate]: Point in time (Unix timestamp) when the message was sent if the message was from another chat or topic; 0 for messages from the same chat.
/// * [content]: Media content of the message if the message was from another chat or topic; may be null for messages from the same chat and messages without media.. Can be only one of the following types: messageAnimation, messageAudio, messageChecklist, messageContact, messageDice, messageDocument, messageGame,. messageGiveaway, messageGiveawayWinners, messageInvoice, messageLocation, messagePaidMedia, messagePhoto, messagePoll, messageStakeDice,. messageSticker, messageStory, messageText (for link preview), messageVenue, messageVideo, messageVideoNote, or messageVoiceNote *(optional)*.
final class MessageReplyToMessage extends MessageReplyTo {
  /// **MessageReplyToMessage** *(messageReplyToMessage)* - child of MessageReplyTo
  ///
  /// Describes a message replied by a given message.
  ///
  /// * [chatId]: The identifier of the chat to which the message belongs; may be 0 if the replied message is in unknown chat.
  /// * [messageId]: The identifier of the message; may be 0 if the replied message is in unknown chat.
  /// * [quote]: Chosen quote from the replied message; may be null if none *(optional)*.
  /// * [checklistTaskId]: Identifier of the checklist task in the original message that was replied; 0 if none.
  /// * [pollOptionId]: Identifier of the poll option in the original message that was replied; empty if none.
  /// * [origin]: Information about origin of the message if the message was from another chat or topic; may be null for messages from the same chat *(optional)*.
  /// * [originSendDate]: Point in time (Unix timestamp) when the message was sent if the message was from another chat or topic; 0 for messages from the same chat.
  /// * [content]: Media content of the message if the message was from another chat or topic; may be null for messages from the same chat and messages without media.. Can be only one of the following types: messageAnimation, messageAudio, messageChecklist, messageContact, messageDice, messageDocument, messageGame,. messageGiveaway, messageGiveawayWinners, messageInvoice, messageLocation, messagePaidMedia, messagePhoto, messagePoll, messageStakeDice,. messageSticker, messageStory, messageText (for link preview), messageVenue, messageVideo, messageVideoNote, or messageVoiceNote *(optional)*.
  const MessageReplyToMessage({
    required this.chatId,
    required this.messageId,
    this.quote,
    required this.checklistTaskId,
    required this.pollOptionId,
    this.origin,
    required this.originSendDate,
    this.content,
  });

  /// The identifier of the chat to which the message belongs; may be 0 if the replied message is in unknown chat
  final int chatId;

  /// The identifier of the message; may be 0 if the replied message is in unknown chat
  final int messageId;

  /// Chosen quote from the replied message; may be null if none
  final TextQuote? quote;

  /// Identifier of the checklist task in the original message that was replied; 0 if none
  final int checklistTaskId;

  /// Identifier of the poll option in the original message that was replied; empty if none
  final String pollOptionId;

  /// Information about origin of the message if the message was from another chat or topic; may be null for messages from the same chat
  final MessageOrigin? origin;

  /// Point in time (Unix timestamp) when the message was sent if the message was from another chat or topic; 0 for messages from the same chat
  final int originSendDate;

  /// Media content of the message if the message was from another chat or topic; may be null for messages from the same chat and messages without media.. Can be only one of the following types: messageAnimation, messageAudio, messageChecklist, messageContact, messageDice, messageDocument, messageGame,. messageGiveaway, messageGiveawayWinners, messageInvoice, messageLocation, messagePaidMedia, messagePhoto, messagePoll, messageStakeDice,. messageSticker, messageStory, messageText (for link preview), messageVenue, messageVideo, messageVideoNote, or messageVoiceNote
  final MessageContent? content;

  /// Parse from a json
  factory MessageReplyToMessage.fromJson(Map<String, dynamic> json) =>
      MessageReplyToMessage(
        chatId: json['chat_id'],
        messageId: json['message_id'],
        quote: json['quote'] == null ? null : TextQuote.fromJson(json['quote']),
        checklistTaskId: json['checklist_task_id'] ?? 0,
        pollOptionId: json['poll_option_id'],
        origin: json['origin'] == null
            ? null
            : MessageOrigin.fromJson(json['origin']),
        originSendDate: json['origin_send_date'],
        content: json['content'] == null
            ? null
            : MessageContent.fromJson(json['content']),
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
      "origin": origin?.toJson(),
      "origin_send_date": originSendDate,
      "content": content?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The identifier of the chat to which the message belongs; may be 0 if the replied message is in unknown chat
  /// * [message_id]: The identifier of the message; may be 0 if the replied message is in unknown chat
  /// * [quote]: Chosen quote from the replied message; may be null if none
  /// * [checklist_task_id]: Identifier of the checklist task in the original message that was replied; 0 if none
  /// * [poll_option_id]: Identifier of the poll option in the original message that was replied; empty if none
  /// * [origin]: Information about origin of the message if the message was from another chat or topic; may be null for messages from the same chat
  /// * [origin_send_date]: Point in time (Unix timestamp) when the message was sent if the message was from another chat or topic; 0 for messages from the same chat
  /// * [content]: Media content of the message if the message was from another chat or topic; may be null for messages from the same chat and messages without media.. Can be only one of the following types: messageAnimation, messageAudio, messageChecklist, messageContact, messageDice, messageDocument, messageGame,. messageGiveaway, messageGiveawayWinners, messageInvoice, messageLocation, messagePaidMedia, messagePhoto, messagePoll, messageStakeDice,. messageSticker, messageStory, messageText (for link preview), messageVenue, messageVideo, messageVideoNote, or messageVoiceNote
  @override
  MessageReplyToMessage copyWith({
    int? chatId,
    int? messageId,
    TextQuote? quote,
    int? checklistTaskId,
    String? pollOptionId,
    MessageOrigin? origin,
    int? originSendDate,
    MessageContent? content,
  }) =>
      MessageReplyToMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        quote: quote ?? this.quote,
        checklistTaskId: checklistTaskId ?? this.checklistTaskId,
        pollOptionId: pollOptionId ?? this.pollOptionId,
        origin: origin ?? this.origin,
        originSendDate: originSendDate ?? this.originSendDate,
        content: content ?? this.content,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageReplyToMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **MessageReplyToStory** *(messageReplyToStory)* - child of MessageReplyTo
///
/// Describes a story replied by a given message.
///
/// * [storyPosterChatId]: The identifier of the poster of the story.
/// * [storyId]: The identifier of the story.
final class MessageReplyToStory extends MessageReplyTo {
  /// **MessageReplyToStory** *(messageReplyToStory)* - child of MessageReplyTo
  ///
  /// Describes a story replied by a given message.
  ///
  /// * [storyPosterChatId]: The identifier of the poster of the story.
  /// * [storyId]: The identifier of the story.
  const MessageReplyToStory({
    required this.storyPosterChatId,
    required this.storyId,
  });

  /// The identifier of the poster of the story
  final int storyPosterChatId;

  /// The identifier of the story
  final int storyId;

  /// Parse from a json
  factory MessageReplyToStory.fromJson(Map<String, dynamic> json) =>
      MessageReplyToStory(
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
  /// * [story_poster_chat_id]: The identifier of the poster of the story
  /// * [story_id]: The identifier of the story
  @override
  MessageReplyToStory copyWith({
    int? storyPosterChatId,
    int? storyId,
  }) =>
      MessageReplyToStory(
        storyPosterChatId: storyPosterChatId ?? this.storyPosterChatId,
        storyId: storyId ?? this.storyId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageReplyToStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
