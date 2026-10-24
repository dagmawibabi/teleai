part of '../tdapi.dart';

/// **MessageCopyOptions** *(messageCopyOptions)* - basic class
///
/// Options to be used when a message content is copied without reference to the original sender. Service messages, messages with messageInvoice, messagePaidMedia, messageGiveaway, or messageGiveawayWinners content can't be copied.
///
/// * [sendCopy]: True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable.
/// * [replaceCaption]: True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false.
/// * [newCaption]: New message caption; pass null to copy message without caption. Ignored if replace_caption is false *(optional)*.
/// * [newShowCaptionAboveMedia]: True, if new caption must be shown above the media; otherwise, new caption must be shown below the media; not supported in secret chats. Ignored if replace_caption is false.
final class MessageCopyOptions extends TdObject {
  /// **MessageCopyOptions** *(messageCopyOptions)* - basic class
  ///
  /// Options to be used when a message content is copied without reference to the original sender. Service messages, messages with messageInvoice, messagePaidMedia, messageGiveaway, or messageGiveawayWinners content can't be copied.
  ///
  /// * [sendCopy]: True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable.
  /// * [replaceCaption]: True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false.
  /// * [newCaption]: New message caption; pass null to copy message without caption. Ignored if replace_caption is false *(optional)*.
  /// * [newShowCaptionAboveMedia]: True, if new caption must be shown above the media; otherwise, new caption must be shown below the media; not supported in secret chats. Ignored if replace_caption is false.
  const MessageCopyOptions({
    required this.sendCopy,
    required this.replaceCaption,
    this.newCaption,
    required this.newShowCaptionAboveMedia,
  });

  /// True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable
  final bool sendCopy;

  /// True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
  final bool replaceCaption;

  /// New message caption; pass null to copy message without caption. Ignored if replace_caption is false
  final FormattedText? newCaption;

  /// True, if new caption must be shown above the media; otherwise, new caption must be shown below the media; not supported in secret chats. Ignored if replace_caption is false
  final bool newShowCaptionAboveMedia;

  /// Parse from a json
  factory MessageCopyOptions.fromJson(Map<String, dynamic> json) =>
      MessageCopyOptions(
        sendCopy: json['send_copy'],
        replaceCaption: json['replace_caption'],
        newCaption: json['new_caption'] == null
            ? null
            : FormattedText.fromJson(json['new_caption']),
        newShowCaptionAboveMedia: json['new_show_caption_above_media'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "send_copy": sendCopy,
      "replace_caption": replaceCaption,
      "new_caption": newCaption?.toJson(),
      "new_show_caption_above_media": newShowCaptionAboveMedia,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [send_copy]: True, if content of the message needs to be copied without reference to the original sender. Always true if the message is forwarded to a secret chat or is local.. Use messageProperties.can_be_copied and messageProperties.can_be_copied_to_secret_chat to check whether the message is suitable
  /// * [replace_caption]: True, if media caption of the message copy needs to be replaced. Ignored if send_copy is false
  /// * [new_caption]: New message caption; pass null to copy message without caption. Ignored if replace_caption is false
  /// * [new_show_caption_above_media]: True, if new caption must be shown above the media; otherwise, new caption must be shown below the media; not supported in secret chats. Ignored if replace_caption is false
  MessageCopyOptions copyWith({
    bool? sendCopy,
    bool? replaceCaption,
    FormattedText? newCaption,
    bool? newShowCaptionAboveMedia,
  }) =>
      MessageCopyOptions(
        sendCopy: sendCopy ?? this.sendCopy,
        replaceCaption: replaceCaption ?? this.replaceCaption,
        newCaption: newCaption ?? this.newCaption,
        newShowCaptionAboveMedia:
            newShowCaptionAboveMedia ?? this.newShowCaptionAboveMedia,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageCopyOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
