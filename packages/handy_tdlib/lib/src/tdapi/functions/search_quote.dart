part of '../tdapi.dart';

/// **SearchQuote** *(searchQuote)* - TDLib function
///
/// Searches for a given quote in a text. Returns found quote start position in UTF-16 code units. Returns a 404 error if the quote is not found. Can be called synchronously.
///
/// * [text]: Text in which to search for the quote.
/// * [quote]: Quote to search for.
/// * [quotePosition]: Approximate quote position in UTF-16 code units.
///
/// [FoundPosition] is returned on completion.
final class SearchQuote extends TdFunction {
  /// **SearchQuote** *(searchQuote)* - TDLib function
  ///
  /// Searches for a given quote in a text. Returns found quote start position in UTF-16 code units. Returns a 404 error if the quote is not found. Can be called synchronously.
  ///
  /// * [text]: Text in which to search for the quote.
  /// * [quote]: Quote to search for.
  /// * [quotePosition]: Approximate quote position in UTF-16 code units.
  ///
  /// [FoundPosition] is returned on completion.
  const SearchQuote({
    required this.text,
    required this.quote,
    required this.quotePosition,
  });

  /// Text in which to search for the quote
  final FormattedText text;

  /// Quote to search for
  final FormattedText quote;

  /// Approximate quote position in UTF-16 code units
  final int quotePosition;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "quote": quote.toJson(),
      "quote_position": quotePosition,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text in which to search for the quote
  /// * [quote]: Quote to search for
  /// * [quote_position]: Approximate quote position in UTF-16 code units
  SearchQuote copyWith({
    FormattedText? text,
    FormattedText? quote,
    int? quotePosition,
  }) =>
      SearchQuote(
        text: text ?? this.text,
        quote: quote ?? this.quote,
        quotePosition: quotePosition ?? this.quotePosition,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
