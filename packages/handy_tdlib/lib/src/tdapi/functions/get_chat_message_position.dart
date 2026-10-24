part of '../tdapi.dart';

/// **GetChatMessagePosition** *(getChatMessagePosition)* - TDLib function
///
/// Returns approximate 1-based position of a message among messages, which can be found by the specified filter in the chat and topic. Cannot be used in secret chats.
///
/// * [chatId]: Identifier of the chat in which to find message position.
/// * [topicId]: Pass topic identifier to get position among messages only in specific topic; pass null to get position among all chat messages; message threads aren't supported *(optional)*.
/// * [filter]: Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterUnreadPollVote,. and searchMessagesFilterFailedToSend are unsupported in this function.
/// * [messageId]: Message identifier.
///
/// [Count] is returned on completion.
final class GetChatMessagePosition extends TdFunction {
  /// **GetChatMessagePosition** *(getChatMessagePosition)* - TDLib function
  ///
  /// Returns approximate 1-based position of a message among messages, which can be found by the specified filter in the chat and topic. Cannot be used in secret chats.
  ///
  /// * [chatId]: Identifier of the chat in which to find message position.
  /// * [topicId]: Pass topic identifier to get position among messages only in specific topic; pass null to get position among all chat messages; message threads aren't supported *(optional)*.
  /// * [filter]: Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterUnreadPollVote,. and searchMessagesFilterFailedToSend are unsupported in this function.
  /// * [messageId]: Message identifier.
  ///
  /// [Count] is returned on completion.
  const GetChatMessagePosition({
    required this.chatId,
    this.topicId,
    required this.filter,
    required this.messageId,
  });

  /// Identifier of the chat in which to find message position
  final int chatId;

  /// Pass topic identifier to get position among messages only in specific topic; pass null to get position among all chat messages; message threads aren't supported
  final MessageTopic? topicId;

  /// Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterUnreadPollVote,. and searchMessagesFilterFailedToSend are unsupported in this function
  final SearchMessagesFilter filter;

  /// Message identifier
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "filter": filter.toJson(),
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which to find message position
  /// * [topic_id]: Pass topic identifier to get position among messages only in specific topic; pass null to get position among all chat messages; message threads aren't supported
  /// * [filter]: Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, searchMessagesFilterUnreadPollVote,. and searchMessagesFilterFailedToSend are unsupported in this function
  /// * [message_id]: Message identifier
  GetChatMessagePosition copyWith({
    int? chatId,
    MessageTopic? topicId,
    SearchMessagesFilter? filter,
    int? messageId,
  }) =>
      GetChatMessagePosition(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        filter: filter ?? this.filter,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatMessagePosition';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
