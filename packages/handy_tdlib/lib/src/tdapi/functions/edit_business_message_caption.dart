part of '../tdapi.dart';

/// **EditBusinessMessageCaption** *(editBusinessMessageCaption)* - TDLib function
///
/// Edits the caption of a message sent on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [caption]: New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [showCaptionAboveMedia]: Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages.
///
/// [BusinessMessage] is returned on completion.
final class EditBusinessMessageCaption extends TdFunction {
  /// **EditBusinessMessageCaption** *(editBusinessMessageCaption)* - TDLib function
  ///
  /// Edits the caption of a message sent on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [caption]: New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [showCaptionAboveMedia]: Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages.
  ///
  /// [BusinessMessage] is returned on completion.
  const EditBusinessMessageCaption({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.caption,
    required this.showCaptionAboveMedia,
  });

  /// Unique identifier of business connection on behalf of which the message was sent
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
  final FormattedText? caption;

  /// Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages
  final bool showCaptionAboveMedia;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup?.toJson(),
      "caption": caption?.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which the message was sent
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [caption]: New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
  /// * [show_caption_above_media]: Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages
  EditBusinessMessageCaption copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
  }) =>
      EditBusinessMessageCaption(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBusinessMessageCaption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
