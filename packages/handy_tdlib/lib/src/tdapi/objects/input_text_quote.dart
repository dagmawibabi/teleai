part of '../tdapi.dart';

/// **InputTextQuote** *(inputTextQuote)* - basic class
///
/// Describes manually chosen quote from another message.
///
/// * [text]: Text of the quote; 0-getOption("message_reply_quote_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed to be kept and must be kept in the quote.. Ignored if rich_texts are non-empty.
/// * [richTexts]: Quote from a rich message; pass an empty array if the quote isn't chosen from a rich message. Must contain one element for each quoted text of the message in the order of their appearance.. The first and the last elements can contain only a part of the corresponding text; all other elements must contain the whole text. Formatting of the quoted parts must be kept.. Mathematical expressions must be quoted entirely. Buttons in pageBlockButtonRow, anchors and dividers can't be quoted.. There can be up to 32 quoted texts with total length up to getOption("message_reply_quote_length_max") characters.
/// * [position]: Quote position in the original message in UTF-16 code units. For quotes from rich messages, it is the position in the text formed by joining plain texts. of all quotable texts of the message, separated by line feeds.
final class InputTextQuote extends TdObject {
  /// **InputTextQuote** *(inputTextQuote)* - basic class
  ///
  /// Describes manually chosen quote from another message.
  ///
  /// * [text]: Text of the quote; 0-getOption("message_reply_quote_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed to be kept and must be kept in the quote.. Ignored if rich_texts are non-empty.
  /// * [richTexts]: Quote from a rich message; pass an empty array if the quote isn't chosen from a rich message. Must contain one element for each quoted text of the message in the order of their appearance.. The first and the last elements can contain only a part of the corresponding text; all other elements must contain the whole text. Formatting of the quoted parts must be kept.. Mathematical expressions must be quoted entirely. Buttons in pageBlockButtonRow, anchors and dividers can't be quoted.. There can be up to 32 quoted texts with total length up to getOption("message_reply_quote_length_max") characters.
  /// * [position]: Quote position in the original message in UTF-16 code units. For quotes from rich messages, it is the position in the text formed by joining plain texts. of all quotable texts of the message, separated by line feeds.
  const InputTextQuote({
    required this.text,
    required this.richTexts,
    required this.position,
  });

  /// Text of the quote; 0-getOption("message_reply_quote_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed to be kept and must be kept in the quote.. Ignored if rich_texts are non-empty
  final FormattedText text;

  /// Quote from a rich message; pass an empty array if the quote isn't chosen from a rich message. Must contain one element for each quoted text of the message in the order of their appearance.. The first and the last elements can contain only a part of the corresponding text; all other elements must contain the whole text. Formatting of the quoted parts must be kept.. Mathematical expressions must be quoted entirely. Buttons in pageBlockButtonRow, anchors and dividers can't be quoted.. There can be up to 32 quoted texts with total length up to getOption("message_reply_quote_length_max") characters
  final List<RichText> richTexts;

  /// Quote position in the original message in UTF-16 code units. For quotes from rich messages, it is the position in the text formed by joining plain texts. of all quotable texts of the message, separated by line feeds
  final int position;

  /// Parse from a json
  factory InputTextQuote.fromJson(Map<String, dynamic> json) => InputTextQuote(
        text: FormattedText.fromJson(json['text']),
        richTexts: List<RichText>.from((json['rich_texts'] ?? [])
            .map((item) => RichText.fromJson(item))
            .toList()),
        position: json['position'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "rich_texts": richTexts.map((i) => i.toJson()).toList(),
      "position": position,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the quote; 0-getOption("message_reply_quote_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities are allowed to be kept and must be kept in the quote.. Ignored if rich_texts are non-empty
  /// * [rich_texts]: Quote from a rich message; pass an empty array if the quote isn't chosen from a rich message. Must contain one element for each quoted text of the message in the order of their appearance.. The first and the last elements can contain only a part of the corresponding text; all other elements must contain the whole text. Formatting of the quoted parts must be kept.. Mathematical expressions must be quoted entirely. Buttons in pageBlockButtonRow, anchors and dividers can't be quoted.. There can be up to 32 quoted texts with total length up to getOption("message_reply_quote_length_max") characters
  /// * [position]: Quote position in the original message in UTF-16 code units. For quotes from rich messages, it is the position in the text formed by joining plain texts. of all quotable texts of the message, separated by line feeds
  InputTextQuote copyWith({
    FormattedText? text,
    List<RichText>? richTexts,
    int? position,
  }) =>
      InputTextQuote(
        text: text ?? this.text,
        richTexts: richTexts ?? this.richTexts,
        position: position ?? this.position,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputTextQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
