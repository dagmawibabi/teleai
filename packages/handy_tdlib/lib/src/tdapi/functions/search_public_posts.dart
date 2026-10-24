part of '../tdapi.dart';

/// **SearchPublicPosts** *(searchPublicPosts)* - TDLib function
///
/// Searches for public channel posts using the given query. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// * [query]: Query to search for.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
/// * [starCount]: The Telegram Star amount the user agreed to pay for the search; pass 0 for free searches.
///
/// [FoundPublicPosts] is returned on completion.
final class SearchPublicPosts extends TdFunction {
  /// **SearchPublicPosts** *(searchPublicPosts)* - TDLib function
  ///
  /// Searches for public channel posts using the given query. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// * [query]: Query to search for.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  /// * [starCount]: The Telegram Star amount the user agreed to pay for the search; pass 0 for free searches.
  ///
  /// [FoundPublicPosts] is returned on completion.
  const SearchPublicPosts({
    required this.query,
    required this.offset,
    required this.limit,
    required this.starCount,
  });

  /// Query to search for
  final String query;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// The Telegram Star amount the user agreed to pay for the search; pass 0 for free searches
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query": query,
      "offset": offset,
      "limit": limit,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  /// * [star_count]: The Telegram Star amount the user agreed to pay for the search; pass 0 for free searches
  SearchPublicPosts copyWith({
    String? query,
    String? offset,
    int? limit,
    int? starCount,
  }) =>
      SearchPublicPosts(
        query: query ?? this.query,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchPublicPosts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
