part of '../tdapi.dart';

/// **SearchHashtags** *(searchHashtags)* - TDLib function
///
/// Searches for recently used hashtags by their prefix.
///
/// * [prefix]: Hashtag prefix to search for.
/// * [limit]: The maximum number of hashtags to be returned.
///
/// [Hashtags] is returned on completion.
final class SearchHashtags extends TdFunction {
  /// **SearchHashtags** *(searchHashtags)* - TDLib function
  ///
  /// Searches for recently used hashtags by their prefix.
  ///
  /// * [prefix]: Hashtag prefix to search for.
  /// * [limit]: The maximum number of hashtags to be returned.
  ///
  /// [Hashtags] is returned on completion.
  const SearchHashtags({
    required this.prefix,
    required this.limit,
  });

  /// Hashtag prefix to search for
  final String prefix;

  /// The maximum number of hashtags to be returned
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "prefix": prefix,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [prefix]: Hashtag prefix to search for
  /// * [limit]: The maximum number of hashtags to be returned
  SearchHashtags copyWith({
    String? prefix,
    int? limit,
  }) =>
      SearchHashtags(
        prefix: prefix ?? this.prefix,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchHashtags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
