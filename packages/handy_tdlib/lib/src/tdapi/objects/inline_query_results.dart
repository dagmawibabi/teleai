part of '../tdapi.dart';

/// **InlineQueryResults** *(inlineQueryResults)* - basic class
///
/// Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query.
///
/// * [inlineQueryId]: Unique identifier of the inline query.
/// * [button]: Button to be shown above inline query results; may be null *(optional)*.
/// * [results]: Results of the query.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class InlineQueryResults extends TdObject {
  /// **InlineQueryResults** *(inlineQueryResults)* - basic class
  ///
  /// Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query.
  ///
  /// * [inlineQueryId]: Unique identifier of the inline query.
  /// * [button]: Button to be shown above inline query results; may be null *(optional)*.
  /// * [results]: Results of the query.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const InlineQueryResults({
    required this.inlineQueryId,
    this.button,
    required this.results,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the inline query
  final int inlineQueryId;

  /// Button to be shown above inline query results; may be null
  final InlineQueryResultsButton? button;

  /// Results of the query
  final List<InlineQueryResult> results;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InlineQueryResults.fromJson(Map<String, dynamic> json) =>
      InlineQueryResults(
        inlineQueryId: json['inline_query_id'] is int
            ? json['inline_query_id']
            : int.parse(json['inline_query_id']),
        button: json['button'] == null
            ? null
            : InlineQueryResultsButton.fromJson(json['button']),
        results: List<InlineQueryResult>.from((json['results'] ?? [])
            .map((item) => InlineQueryResult.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "inline_query_id": inlineQueryId,
      "button": button?.toJson(),
      "results": results.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_query_id]: Unique identifier of the inline query
  /// * [button]: Button to be shown above inline query results; may be null
  /// * [results]: Results of the query
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  InlineQueryResults copyWith({
    int? inlineQueryId,
    InlineQueryResultsButton? button,
    List<InlineQueryResult>? results,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      InlineQueryResults(
        inlineQueryId: inlineQueryId ?? this.inlineQueryId,
        button: button ?? this.button,
        results: results ?? this.results,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResults';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
