part of '../tdapi.dart';

/// **SendInlineQueryResultMessage** *(sendInlineQueryResultMessage)* - TDLib function
///
/// Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message.
///
/// * [chatId]: Target chat.
/// * [topicId]: Topic in which the message will be sent; pass null if none *(optional)*.
/// * [replyTo]: Information about the message or story to be replied; pass null if none *(optional)*.
/// * [options]: Options to be used to send the message; pass null to use default options *(optional)*.
/// * [queryId]: Identifier of the inline query.
/// * [resultId]: Identifier of the inline query result.
/// * [hideViaBot]: Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username").
///
/// [Message] is returned on completion.
final class SendInlineQueryResultMessage extends TdFunction {
  /// **SendInlineQueryResultMessage** *(sendInlineQueryResultMessage)* - TDLib function
  ///
  /// Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message.
  ///
  /// * [chatId]: Target chat.
  /// * [topicId]: Topic in which the message will be sent; pass null if none *(optional)*.
  /// * [replyTo]: Information about the message or story to be replied; pass null if none *(optional)*.
  /// * [options]: Options to be used to send the message; pass null to use default options *(optional)*.
  /// * [queryId]: Identifier of the inline query.
  /// * [resultId]: Identifier of the inline query result.
  /// * [hideViaBot]: Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username").
  ///
  /// [Message] is returned on completion.
  const SendInlineQueryResultMessage({
    required this.chatId,
    this.topicId,
    this.replyTo,
    this.options,
    required this.queryId,
    required this.resultId,
    required this.hideViaBot,
  });

  /// Target chat
  final int chatId;

  /// Topic in which the message will be sent; pass null if none
  final MessageTopic? topicId;

  /// Information about the message or story to be replied; pass null if none
  final InputMessageReplyTo? replyTo;

  /// Options to be used to send the message; pass null to use default options
  final MessageSendOptions? options;

  /// Identifier of the inline query
  final int queryId;

  /// Identifier of the inline query result
  final String resultId;

  /// Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
  final bool hideViaBot;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "topic_id": topicId?.toJson(),
      "reply_to": replyTo?.toJson(),
      "options": options?.toJson(),
      "query_id": queryId,
      "result_id": resultId,
      "hide_via_bot": hideViaBot,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Target chat
  /// * [topic_id]: Topic in which the message will be sent; pass null if none
  /// * [reply_to]: Information about the message or story to be replied; pass null if none
  /// * [options]: Options to be used to send the message; pass null to use default options
  /// * [query_id]: Identifier of the inline query
  /// * [result_id]: Identifier of the inline query result
  /// * [hide_via_bot]: Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
  SendInlineQueryResultMessage copyWith({
    int? chatId,
    MessageTopic? topicId,
    InputMessageReplyTo? replyTo,
    MessageSendOptions? options,
    int? queryId,
    String? resultId,
    bool? hideViaBot,
  }) =>
      SendInlineQueryResultMessage(
        chatId: chatId ?? this.chatId,
        topicId: topicId ?? this.topicId,
        replyTo: replyTo ?? this.replyTo,
        options: options ?? this.options,
        queryId: queryId ?? this.queryId,
        resultId: resultId ?? this.resultId,
        hideViaBot: hideViaBot ?? this.hideViaBot,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendInlineQueryResultMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
