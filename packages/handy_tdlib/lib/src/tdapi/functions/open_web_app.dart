part of '../tdapi.dart';

/// **OpenWebApp** *(openWebApp)* - TDLib function
///
/// Informs TDLib that a Web App is being opened from the attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button.. For each bot, a confirmation alert about data sent to the bot must be shown once.
///
/// * [chatId]: Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats.
/// * [botUserId]: Identifier of the bot, providing the Web App. If the bot is restricted for the current user, then show an error instead of calling the method.
/// * [url]: The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise.
/// * [topicId]: Topic in which the message will be sent; pass null if none *(optional)*.
/// * [replyTo]: Information about the message or story to be replied in the message sent by the Web App; pass null if none *(optional)*.
/// * [parameters]: Parameters to use to open the Web App.
///
/// [WebAppInfo] is returned on completion.
final class OpenWebApp extends TdFunction {
  /// **OpenWebApp** *(openWebApp)* - TDLib function
  ///
  /// Informs TDLib that a Web App is being opened from the attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button.. For each bot, a confirmation alert about data sent to the bot must be shown once.
  ///
  /// * [chatId]: Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats.
  /// * [botUserId]: Identifier of the bot, providing the Web App. If the bot is restricted for the current user, then show an error instead of calling the method.
  /// * [url]: The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise.
  /// * [topicId]: Topic in which the message will be sent; pass null if none *(optional)*.
  /// * [replyTo]: Information about the message or story to be replied in the message sent by the Web App; pass null if none *(optional)*.
  /// * [parameters]: Parameters to use to open the Web App.
  ///
  /// [WebAppInfo] is returned on completion.
  const OpenWebApp({
    required this.chatId,
    required this.botUserId,
    required this.url,
    this.topicId,
    this.replyTo,
    required this.parameters,
  });

  /// Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats
  final int chatId;

  /// Identifier of the bot, providing the Web App. If the bot is restricted for the current user, then show an error instead of calling the method
  final int botUserId;

  /// The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
  final String url;

  /// Topic in which the message will be sent; pass null if none
  final MessageTopic? topicId;

  /// Information about the message or story to be replied in the message sent by the Web App; pass null if none
  final InputMessageReplyTo? replyTo;

  /// Parameters to use to open the Web App
  final WebAppOpenParameters parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "bot_user_id": botUserId,
      "url": url,
      "topic_id": topicId?.toJson(),
      "reply_to": replyTo?.toJson(),
      "parameters": parameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats
  /// * [bot_user_id]: Identifier of the bot, providing the Web App. If the bot is restricted for the current user, then show an error instead of calling the method
  /// * [url]: The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
  /// * [topic_id]: Topic in which the message will be sent; pass null if none
  /// * [reply_to]: Information about the message or story to be replied in the message sent by the Web App; pass null if none
  /// * [parameters]: Parameters to use to open the Web App
  OpenWebApp copyWith({
    int? chatId,
    int? botUserId,
    String? url,
    MessageTopic? topicId,
    InputMessageReplyTo? replyTo,
    WebAppOpenParameters? parameters,
  }) =>
      OpenWebApp(
        chatId: chatId ?? this.chatId,
        botUserId: botUserId ?? this.botUserId,
        url: url ?? this.url,
        topicId: topicId ?? this.topicId,
        replyTo: replyTo ?? this.replyTo,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'openWebApp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
