part of '../tdapi.dart';

/// **EditInlineMessageText** *(editInlineMessageText)* - TDLib function
///
/// Edits the text of an inline text or game message sent via the bot; for bots only.
///
/// * [inlineMessageId]: Inline message identifier.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [inputMessageContent]: New text content of the message. Must be of type inputMessageText or inputMessageRichMessage; file upload isn't supported.
///
/// [Ok] is returned on completion.
final class EditInlineMessageText extends TdFunction {
  /// **EditInlineMessageText** *(editInlineMessageText)* - TDLib function
  ///
  /// Edits the text of an inline text or game message sent via the bot; for bots only.
  ///
  /// * [inlineMessageId]: Inline message identifier.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [inputMessageContent]: New text content of the message. Must be of type inputMessageText or inputMessageRichMessage; file upload isn't supported.
  ///
  /// [Ok] is returned on completion.
  const EditInlineMessageText({
    required this.inlineMessageId,
    this.replyMarkup,
    required this.inputMessageContent,
  });

  /// Inline message identifier
  final String inlineMessageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// New text content of the message. Must be of type inputMessageText or inputMessageRichMessage; file upload isn't supported
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "inline_message_id": inlineMessageId,
      "reply_markup": replyMarkup?.toJson(),
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_message_id]: Inline message identifier
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [input_message_content]: New text content of the message. Must be of type inputMessageText or inputMessageRichMessage; file upload isn't supported
  EditInlineMessageText copyWith({
    String? inlineMessageId,
    ReplyMarkup? replyMarkup,
    InputMessageContent? inputMessageContent,
  }) =>
      EditInlineMessageText(
        inlineMessageId: inlineMessageId ?? this.inlineMessageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editInlineMessageText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
