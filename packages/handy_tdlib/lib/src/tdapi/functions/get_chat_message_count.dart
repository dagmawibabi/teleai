part of '../tdapi.dart';

/// **GetChatMessageCount** *(getChatMessageCount)* - TDLib function
///
/// Returns approximate number of messages of the specified type in the chat or its topic.
///
/// * [chatId]: Identifier of the chat in which to count messages.
/// * [topicId]: Pass topic identifier to get number of messages only in specific topic; pass null to get number of messages in all topics; message threads aren't supported *(optional)*.
/// * [filter]: Filter for message content; searchMessagesFilterEmpty is unsupported in this function.
/// * [returnLocal]: Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally.
///
/// [Count] is returned on completion.
final class GetChatMessageCount extends TdFunction {
  /// **GetChatMessageCount** *(getChatMessageCount)* - TDLib function
  ///
  /// Returns approximate number of messages of the specified type in the chat or its topic.
  ///
  /// * [chatId]: Identifier of the chat in which to count messages.
  /// * [topicId]: Pass topic identifier to get number of messages only in specific topic; pass null to get number of messages in all topics; message threads aren't supported *(optional)*.
  /// * [filter]: Filter for message content; searchMessagesFilterEmpty is unsupported in this function.
  /// * [returnLocal]: Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally.
  ///
  /// [Count] is returned on completion.
  const GetChatMessageCount({
    required this.chatId,
    this.topicId,
    required this.filter,
    required this.returnLocal,
  });

  /// Identifier of the chat in which to count messages
  final int chatId;

  /// Pass topic identifier to get number of messages only in specific topic; pass null to get number of messages in all topics; message threads aren't supported
  final MessageTopic? topicId;

  /// Filter for message content; searchMessagesFilterEmpty is unsupported in this function
  final SearchMessagesFilter filter;

  /// Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally
  final bool returnLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "filter": filter.toJson(),
      "return_local": returnLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which to count messages
  /// * [topic_id]: Pass topic identifier to get number of messages only in specific topic; pass null to get number of messages in all topics; message threads aren't supported
  /// * [filter]: Filter for message content; searchMessagesFilterEmpty is unsupported in this function
  /// * [return_local]: Pass true to get the number of messages without sending network requests, or -1 if the number of messages is unknown locally
  GetChatMessageCount copyWith({
    int? chatId,
    MessageTopic? topicId,
    SearchMessagesFilter? filter,
    bool? returnLocal,
  }) =>
      GetChatMessageCount(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        filter: filter ?? this.filter,
        returnLocal: returnLocal ?? this.returnLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatMessageCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
