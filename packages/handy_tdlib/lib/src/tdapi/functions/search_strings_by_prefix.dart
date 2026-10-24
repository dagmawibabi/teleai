part of '../tdapi.dart';

/// **SearchStringsByPrefix** *(searchStringsByPrefix)* - TDLib function
///
/// Searches specified query by word prefixes in the provided strings. Returns 0-based positions of strings that matched. Can be called synchronously.
///
/// * [strings]: The strings to search in for the query.
/// * [query]: Query to search for.
/// * [limit]: The maximum number of objects to return.
/// * [returnNoneForEmptyQuery]: Pass true to receive no results for an empty query.
///
/// [FoundPositions] is returned on completion.
final class SearchStringsByPrefix extends TdFunction {
  /// **SearchStringsByPrefix** *(searchStringsByPrefix)* - TDLib function
  ///
  /// Searches specified query by word prefixes in the provided strings. Returns 0-based positions of strings that matched. Can be called synchronously.
  ///
  /// * [strings]: The strings to search in for the query.
  /// * [query]: Query to search for.
  /// * [limit]: The maximum number of objects to return.
  /// * [returnNoneForEmptyQuery]: Pass true to receive no results for an empty query.
  ///
  /// [FoundPositions] is returned on completion.
  const SearchStringsByPrefix({
    required this.strings,
    required this.query,
    required this.limit,
    required this.returnNoneForEmptyQuery,
  });

  /// The strings to search in for the query
  final List<String> strings;

  /// Query to search for
  final String query;

  /// The maximum number of objects to return
  final int limit;

  /// Pass true to receive no results for an empty query
  final bool returnNoneForEmptyQuery;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "strings": strings.map((i) => i).toList(),
      "query": query,
      "limit": limit,
      "return_none_for_empty_query": returnNoneForEmptyQuery,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [strings]: The strings to search in for the query
  /// * [query]: Query to search for
  /// * [limit]: The maximum number of objects to return
  /// * [return_none_for_empty_query]: Pass true to receive no results for an empty query
  SearchStringsByPrefix copyWith({
    List<String>? strings,
    String? query,
    int? limit,
    bool? returnNoneForEmptyQuery,
  }) =>
      SearchStringsByPrefix(
        strings: strings ?? this.strings,
        query: query ?? this.query,
        limit: limit ?? this.limit,
        returnNoneForEmptyQuery:
            returnNoneForEmptyQuery ?? this.returnNoneForEmptyQuery,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchStringsByPrefix';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
