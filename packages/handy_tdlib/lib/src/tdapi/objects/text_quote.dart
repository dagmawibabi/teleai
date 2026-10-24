part of '../tdapi.dart';

/// **TextQuote** *(textQuote)* - basic class
///
/// Describes manually or automatically chosen quote from another message.
///
/// * [text]: Text of the quote. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities can be present in the text.. May be empty if the quote was chosen from a rich message.
/// * [richTexts]: Rich text of the quote if it was chosen from a rich message; empty if the quote wasn't chosen from a rich message.. Only richTextPlain, richTextBold, richTextItalic, richTextUnderline, richTextStrikethrough, richTextSpoiler, richTextSubscript, richTextSuperscript,. richTextDateTime, richTextCustomEmoji, richTextMathematicalExpression, and richTexts can be present in the texts.
/// * [position]: Approximate quote position in the original message in UTF-16 code units as specified by the message sender. For quotes from rich messages,. it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds.
/// * [isManual]: True, if the quote was manually chosen by the message sender.
final class TextQuote extends TdObject {
  /// **TextQuote** *(textQuote)* - basic class
  ///
  /// Describes manually or automatically chosen quote from another message.
  ///
  /// * [text]: Text of the quote. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities can be present in the text.. May be empty if the quote was chosen from a rich message.
  /// * [richTexts]: Rich text of the quote if it was chosen from a rich message; empty if the quote wasn't chosen from a rich message.. Only richTextPlain, richTextBold, richTextItalic, richTextUnderline, richTextStrikethrough, richTextSpoiler, richTextSubscript, richTextSuperscript,. richTextDateTime, richTextCustomEmoji, richTextMathematicalExpression, and richTexts can be present in the texts.
  /// * [position]: Approximate quote position in the original message in UTF-16 code units as specified by the message sender. For quotes from rich messages,. it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds.
  /// * [isManual]: True, if the quote was manually chosen by the message sender.
  const TextQuote({
    required this.text,
    required this.richTexts,
    required this.position,
    required this.isManual,
  });

  /// Text of the quote. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities can be present in the text.. May be empty if the quote was chosen from a rich message
  final FormattedText text;

  /// Rich text of the quote if it was chosen from a rich message; empty if the quote wasn't chosen from a rich message.. Only richTextPlain, richTextBold, richTextItalic, richTextUnderline, richTextStrikethrough, richTextSpoiler, richTextSubscript, richTextSuperscript,. richTextDateTime, richTextCustomEmoji, richTextMathematicalExpression, and richTexts can be present in the texts
  final List<RichText> richTexts;

  /// Approximate quote position in the original message in UTF-16 code units as specified by the message sender. For quotes from rich messages,. it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds
  final int position;

  /// True, if the quote was manually chosen by the message sender
  final bool isManual;

  /// Parse from a json
  factory TextQuote.fromJson(Map<String, dynamic> json) => TextQuote(
        text: FormattedText.fromJson(json['text']),
        richTexts: List<RichText>.from((json['rich_texts'] ?? [])
            .map((item) => RichText.fromJson(item))
            .toList()),
        position: json['position'],
        isManual: json['is_manual'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "rich_texts": richTexts.map((i) => i.toJson()).toList(),
      "position": position,
      "is_manual": isManual,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the quote. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, and DateTime entities can be present in the text.. May be empty if the quote was chosen from a rich message
  /// * [rich_texts]: Rich text of the quote if it was chosen from a rich message; empty if the quote wasn't chosen from a rich message.. Only richTextPlain, richTextBold, richTextItalic, richTextUnderline, richTextStrikethrough, richTextSpoiler, richTextSubscript, richTextSuperscript,. richTextDateTime, richTextCustomEmoji, richTextMathematicalExpression, and richTexts can be present in the texts
  /// * [position]: Approximate quote position in the original message in UTF-16 code units as specified by the message sender. For quotes from rich messages,. it is the position in the text formed by joining plain texts of all quotable texts of the message, separated by line feeds
  /// * [is_manual]: True, if the quote was manually chosen by the message sender
  TextQuote copyWith({
    FormattedText? text,
    List<RichText>? richTexts,
    int? position,
    bool? isManual,
  }) =>
      TextQuote(
        text: text ?? this.text,
        richTexts: richTexts ?? this.richTexts,
        position: position ?? this.position,
        isManual: isManual ?? this.isManual,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
