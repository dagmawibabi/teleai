part of '../tdapi.dart';

/// **ParseTextEntities** *(parseTextEntities)* - TDLib function
///
/// Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote, Code, Pre, PreCode, TextUrl,. MentionName, and DateTime entities from a marked-up text. Can be called synchronously.
///
/// * [text]: The text to parse.
/// * [parseMode]: Text parse mode.
///
/// [FormattedText] is returned on completion.
final class ParseTextEntities extends TdFunction {
  /// **ParseTextEntities** *(parseTextEntities)* - TDLib function
  ///
  /// Parses Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote, Code, Pre, PreCode, TextUrl,. MentionName, and DateTime entities from a marked-up text. Can be called synchronously.
  ///
  /// * [text]: The text to parse.
  /// * [parseMode]: Text parse mode.
  ///
  /// [FormattedText] is returned on completion.
  const ParseTextEntities({
    required this.text,
    required this.parseMode,
  });

  /// The text to parse
  final String text;

  /// Text parse mode
  final TextParseMode parseMode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text,
      "parse_mode": parseMode.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text to parse
  /// * [parse_mode]: Text parse mode
  ParseTextEntities copyWith({
    String? text,
    TextParseMode? parseMode,
  }) =>
      ParseTextEntities(
        text: text ?? this.text,
        parseMode: parseMode ?? this.parseMode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'parseTextEntities';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
