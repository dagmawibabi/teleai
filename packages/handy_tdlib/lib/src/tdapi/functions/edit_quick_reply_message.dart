part of '../tdapi.dart';

/// **EditQuickReplyMessage** *(editQuickReplyMessage)* - TDLib function
///
/// Asynchronously edits the text, media, or caption of a quick reply message. Use quickReplyMessage.can_be_edited to check whether a message can be edited.. Media message can be edited only to a media message. Checklist messages can be edited only to a checklist message.. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa.
///
/// * [shortcutId]: Unique identifier of the quick reply shortcut with the message.
/// * [messageId]: Identifier of the message.
/// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio,. inputMessageChecklist, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageText, or inputMessageVideo.
///
/// [Ok] is returned on completion.
final class EditQuickReplyMessage extends TdFunction {
  /// **EditQuickReplyMessage** *(editQuickReplyMessage)* - TDLib function
  ///
  /// Asynchronously edits the text, media, or caption of a quick reply message. Use quickReplyMessage.can_be_edited to check whether a message can be edited.. Media message can be edited only to a media message. Checklist messages can be edited only to a checklist message.. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa.
  ///
  /// * [shortcutId]: Unique identifier of the quick reply shortcut with the message.
  /// * [messageId]: Identifier of the message.
  /// * [inputMessageContent]: New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio,. inputMessageChecklist, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageText, or inputMessageVideo.
  ///
  /// [Ok] is returned on completion.
  const EditQuickReplyMessage({
    required this.shortcutId,
    required this.messageId,
    required this.inputMessageContent,
  });

  /// Unique identifier of the quick reply shortcut with the message
  final int shortcutId;

  /// Identifier of the message
  final int messageId;

  /// New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio,. inputMessageChecklist, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageText, or inputMessageVideo
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shortcut_id": shortcutId,
      "message_id": messageId,
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shortcut_id]: Unique identifier of the quick reply shortcut with the message
  /// * [message_id]: Identifier of the message
  /// * [input_message_content]: New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio,. inputMessageChecklist, inputMessageDocument, inputMessagePhoto, inputMessageRichMessage, inputMessageText, or inputMessageVideo
  EditQuickReplyMessage copyWith({
    int? shortcutId,
    int? messageId,
    InputMessageContent? inputMessageContent,
  }) =>
      EditQuickReplyMessage(
        shortcutId: shortcutId ?? this.shortcutId,
        messageId: messageId ?? this.messageId,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editQuickReplyMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
