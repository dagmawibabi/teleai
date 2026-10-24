part of '../tdapi.dart';

/// **EditEphemeralMessageCaption** *(editEphemeralMessageCaption)* - TDLib function
///
/// Edits the caption and reply markup of an ephemeral message sent by the bot; for bots only.
///
/// * [chatId]: The chat the message belongs to.
/// * [receiverUserId]: Identifier of the user who received the message.
/// * [ephemeralMessageId]: Identifier of the ephemeral message.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [caption]: New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters *(optional)*.
/// * [showCaptionAboveMedia]: Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages.
///
/// [Ok] is returned on completion.
final class EditEphemeralMessageCaption extends TdFunction {
  /// **EditEphemeralMessageCaption** *(editEphemeralMessageCaption)* - TDLib function
  ///
  /// Edits the caption and reply markup of an ephemeral message sent by the bot; for bots only.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [receiverUserId]: Identifier of the user who received the message.
  /// * [ephemeralMessageId]: Identifier of the ephemeral message.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [caption]: New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters *(optional)*.
  /// * [showCaptionAboveMedia]: Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages.
  ///
  /// [Ok] is returned on completion.
  const EditEphemeralMessageCaption({
    required this.chatId,
    required this.receiverUserId,
    required this.ephemeralMessageId,
    this.replyMarkup,
    this.caption,
    required this.showCaptionAboveMedia,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the user who received the message
  final int receiverUserId;

  /// Identifier of the ephemeral message
  final int ephemeralMessageId;

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
      "chat_id": chatId,
      "receiver_user_id": receiverUserId,
      "ephemeral_message_id": ephemeralMessageId,
      "reply_markup": replyMarkup?.toJson(),
      "caption": caption?.toJson(),
      "show_caption_above_media": showCaptionAboveMedia,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat the message belongs to
  /// * [receiver_user_id]: Identifier of the user who received the message
  /// * [ephemeral_message_id]: Identifier of the ephemeral message
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [caption]: New message content caption; pass null to remove caption; 0-getOption("message_caption_length_max") characters
  /// * [show_caption_above_media]: Pass true to show the caption above the media; otherwise, the caption will be shown below the media. May be true only for animation, photo, and video messages
  EditEphemeralMessageCaption copyWith({
    int? chatId,
    int? receiverUserId,
    int? ephemeralMessageId,
    ReplyMarkup? replyMarkup,
    FormattedText? caption,
    bool? showCaptionAboveMedia,
  }) =>
      EditEphemeralMessageCaption(
        chatId: chatId ?? this.chatId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        ephemeralMessageId: ephemeralMessageId ?? this.ephemeralMessageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        caption: caption ?? this.caption,
        showCaptionAboveMedia:
            showCaptionAboveMedia ?? this.showCaptionAboveMedia,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editEphemeralMessageCaption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
