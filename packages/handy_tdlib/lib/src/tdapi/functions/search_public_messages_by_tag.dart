part of '../tdapi.dart';

/// **SearchPublicMessagesByTag** *(searchPublicMessagesByTag)* - TDLib function
///
/// Searches for public channel posts containing the given hashtag or cashtag. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// * [tag]: Hashtag or cashtag to search for.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
///
/// [FoundMessages] is returned on completion.
final class SearchPublicMessagesByTag extends TdFunction {
  /// **SearchPublicMessagesByTag** *(searchPublicMessagesByTag)* - TDLib function
  ///
  /// Searches for public channel posts containing the given hashtag or cashtag. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// * [tag]: Hashtag or cashtag to search for.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [FoundMessages] is returned on completion.
  const SearchPublicMessagesByTag({
    required this.tag,
    required this.offset,
    required this.limit,
  });

  /// Hashtag or cashtag to search for
  final String tag;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "tag": tag,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag]: Hashtag or cashtag to search for
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
  SearchPublicMessagesByTag copyWith({
    String? tag,
    String? offset,
    int? limit,
  }) =>
      SearchPublicMessagesByTag(
        tag: tag ?? this.tag,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchPublicMessagesByTag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
