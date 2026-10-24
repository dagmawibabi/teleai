part of '../tdapi.dart';

/// **AnswerInlineQuery** *(answerInlineQuery)* - TDLib function
///
/// Sets the result of an inline query; for bots only.
///
/// * [inlineQueryId]: Identifier of the inline query.
/// * [isPersonal]: Pass true if results may be cached and returned only for the user who sent the query. By default, results may be returned to any user who sends the same query.
/// * [button]: Button to be shown above inline query results; pass null if none *(optional)*.
/// * [results]: The results of the query.
/// * [cacheTime]: Allowed time to cache the results of the query, in seconds.
/// * [nextOffset]: Offset for the next inline query; pass an empty string if there are no more results.
///
/// [Ok] is returned on completion.
final class AnswerInlineQuery extends TdFunction {
  /// **AnswerInlineQuery** *(answerInlineQuery)* - TDLib function
  ///
  /// Sets the result of an inline query; for bots only.
  ///
  /// * [inlineQueryId]: Identifier of the inline query.
  /// * [isPersonal]: Pass true if results may be cached and returned only for the user who sent the query. By default, results may be returned to any user who sends the same query.
  /// * [button]: Button to be shown above inline query results; pass null if none *(optional)*.
  /// * [results]: The results of the query.
  /// * [cacheTime]: Allowed time to cache the results of the query, in seconds.
  /// * [nextOffset]: Offset for the next inline query; pass an empty string if there are no more results.
  ///
  /// [Ok] is returned on completion.
  const AnswerInlineQuery({
    required this.inlineQueryId,
    required this.isPersonal,
    this.button,
    required this.results,
    required this.cacheTime,
    required this.nextOffset,
  });

  /// Identifier of the inline query
  final int inlineQueryId;

  /// Pass true if results may be cached and returned only for the user who sent the query. By default, results may be returned to any user who sends the same query
  final bool isPersonal;

  /// Button to be shown above inline query results; pass null if none
  final InlineQueryResultsButton? button;

  /// The results of the query
  final List<InputInlineQueryResult> results;

  /// Allowed time to cache the results of the query, in seconds
  final int cacheTime;

  /// Offset for the next inline query; pass an empty string if there are no more results
  final String nextOffset;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "inline_query_id": inlineQueryId,
      "is_personal": isPersonal,
      "button": button?.toJson(),
      "results": results.map((i) => i.toJson()).toList(),
      "cache_time": cacheTime,
      "next_offset": nextOffset,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_query_id]: Identifier of the inline query
  /// * [is_personal]: Pass true if results may be cached and returned only for the user who sent the query. By default, results may be returned to any user who sends the same query
  /// * [button]: Button to be shown above inline query results; pass null if none
  /// * [results]: The results of the query
  /// * [cache_time]: Allowed time to cache the results of the query, in seconds
  /// * [next_offset]: Offset for the next inline query; pass an empty string if there are no more results
  AnswerInlineQuery copyWith({
    int? inlineQueryId,
    bool? isPersonal,
    InlineQueryResultsButton? button,
    List<InputInlineQueryResult>? results,
    int? cacheTime,
    String? nextOffset,
  }) =>
      AnswerInlineQuery(
        inlineQueryId: inlineQueryId ?? this.inlineQueryId,
        isPersonal: isPersonal ?? this.isPersonal,
        button: button ?? this.button,
        results: results ?? this.results,
        cacheTime: cacheTime ?? this.cacheTime,
        nextOffset: nextOffset ?? this.nextOffset,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerInlineQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
