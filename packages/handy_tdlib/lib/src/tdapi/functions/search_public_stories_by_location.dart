part of '../tdapi.dart';

/// **SearchPublicStoriesByLocation** *(searchPublicStoriesByLocation)* - TDLib function
///
/// Searches for public stories by the given address location. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
///
/// * [address]: Address of the location.
/// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
///
/// [FoundStories] is returned on completion.
final class SearchPublicStoriesByLocation extends TdFunction {
  /// **SearchPublicStoriesByLocation** *(searchPublicStoriesByLocation)* - TDLib function
  ///
  /// Searches for public stories by the given address location. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// * [address]: Address of the location.
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit.
  ///
  /// [FoundStories] is returned on completion.
  const SearchPublicStoriesByLocation({
    required this.address,
    required this.offset,
    required this.limit,
  });

  /// Address of the location
  final LocationAddress address;

  /// Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "address": address.toJson(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [address]: Address of the location
  /// * [offset]: Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of stories to be returned; up to 100. For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
  SearchPublicStoriesByLocation copyWith({
    LocationAddress? address,
    String? offset,
    int? limit,
  }) =>
      SearchPublicStoriesByLocation(
        address: address ?? this.address,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchPublicStoriesByLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
