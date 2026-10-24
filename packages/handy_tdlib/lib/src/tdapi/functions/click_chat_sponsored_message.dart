part of '../tdapi.dart';

/// **ClickChatSponsoredMessage** *(clickChatSponsoredMessage)* - TDLib function
///
/// Informs TDLib that the user opened the sponsored chat via the button, the name, the chat photo, a mention in the sponsored message text, or the media in the sponsored message.
///
/// * [chatId]: Chat identifier of the sponsored message.
/// * [messageId]: Identifier of the sponsored message.
/// * [isMediaClick]: Pass true if the media was clicked in the sponsored message.
/// * [fromFullscreen]: Pass true if the user expanded the video from the sponsored message fullscreen before the click.
///
/// [Ok] is returned on completion.
final class ClickChatSponsoredMessage extends TdFunction {
  /// **ClickChatSponsoredMessage** *(clickChatSponsoredMessage)* - TDLib function
  ///
  /// Informs TDLib that the user opened the sponsored chat via the button, the name, the chat photo, a mention in the sponsored message text, or the media in the sponsored message.
  ///
  /// * [chatId]: Chat identifier of the sponsored message.
  /// * [messageId]: Identifier of the sponsored message.
  /// * [isMediaClick]: Pass true if the media was clicked in the sponsored message.
  /// * [fromFullscreen]: Pass true if the user expanded the video from the sponsored message fullscreen before the click.
  ///
  /// [Ok] is returned on completion.
  const ClickChatSponsoredMessage({
    required this.chatId,
    required this.messageId,
    required this.isMediaClick,
    required this.fromFullscreen,
  });

  /// Chat identifier of the sponsored message
  final int chatId;

  /// Identifier of the sponsored message
  final int messageId;

  /// Pass true if the media was clicked in the sponsored message
  final bool isMediaClick;

  /// Pass true if the user expanded the video from the sponsored message fullscreen before the click
  final bool fromFullscreen;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "is_media_click": isMediaClick,
      "from_fullscreen": fromFullscreen,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the sponsored message
  /// * [message_id]: Identifier of the sponsored message
  /// * [is_media_click]: Pass true if the media was clicked in the sponsored message
  /// * [from_fullscreen]: Pass true if the user expanded the video from the sponsored message fullscreen before the click
  ClickChatSponsoredMessage copyWith({
    int? chatId,
    int? messageId,
    bool? isMediaClick,
    bool? fromFullscreen,
  }) =>
      ClickChatSponsoredMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        isMediaClick: isMediaClick ?? this.isMediaClick,
        fromFullscreen: fromFullscreen ?? this.fromFullscreen,
      );

  /// TDLib object type
  static const String defaultObjectId = 'clickChatSponsoredMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
