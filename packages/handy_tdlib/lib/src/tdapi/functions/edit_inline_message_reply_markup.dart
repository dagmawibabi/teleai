part of '../tdapi.dart';

/// **EditInlineMessageReplyMarkup** *(editInlineMessageReplyMarkup)* - TDLib function
///
/// Edits the reply markup of an inline message sent via a bot; for bots only.
///
/// * [inlineMessageId]: Inline message identifier.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
///
/// [Ok] is returned on completion.
final class EditInlineMessageReplyMarkup extends TdFunction {
  /// **EditInlineMessageReplyMarkup** *(editInlineMessageReplyMarkup)* - TDLib function
  ///
  /// Edits the reply markup of an inline message sent via a bot; for bots only.
  ///
  /// * [inlineMessageId]: Inline message identifier.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const EditInlineMessageReplyMarkup({
    required this.inlineMessageId,
    this.replyMarkup,
  });

  /// Inline message identifier
  final String inlineMessageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "inline_message_id": inlineMessageId,
      "reply_markup": replyMarkup?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_message_id]: Inline message identifier
  /// * [reply_markup]: The new message reply markup; pass null if none
  EditInlineMessageReplyMarkup copyWith({
    String? inlineMessageId,
    ReplyMarkup? replyMarkup,
  }) =>
      EditInlineMessageReplyMarkup(
        inlineMessageId: inlineMessageId ?? this.inlineMessageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editInlineMessageReplyMarkup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
