part of '../tdapi.dart';

/// **SearchPublicStoriesByVenue** *(searchPublicStoriesByVenue)* - TDLib function
///
/// Searches for public stories from the given venue. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
///
/// * [venueProvider]: Provider of the venue.
/// * [venueId]: Identifier of the venue in the provider database.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
///
/// [FoundStories] is returned on completion.
final class SearchPublicStoriesByVenue extends TdFunction {
  /// **SearchPublicStoriesByVenue** *(searchPublicStoriesByVenue)* - TDLib function
  ///
  /// Searches for public stories from the given venue. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// * [venueProvider]: Provider of the venue.
  /// * [venueId]: Identifier of the venue in the provider database.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [FoundStories] is returned on completion.
  const SearchPublicStoriesByVenue({
    required this.venueProvider,
    required this.venueId,
    required this.offset,
    required this.limit,
  });

  /// Provider of the venue
  final String venueProvider;

  /// Identifier of the venue in the provider database
  final String venueId;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "venue_provider": venueProvider,
      "venue_id": venueId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [venue_provider]: Provider of the venue
  /// * [venue_id]: Identifier of the venue in the provider database
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
  SearchPublicStoriesByVenue copyWith({
    String? venueProvider,
    String? venueId,
    String? offset,
    int? limit,
  }) =>
      SearchPublicStoriesByVenue(
        venueProvider: venueProvider ?? this.venueProvider,
        venueId: venueId ?? this.venueId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchPublicStoriesByVenue';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
