part of '../tdapi.dart';

/// **SearchAffiliatePrograms** *(searchAffiliatePrograms)* - TDLib function
///
/// Searches affiliate programs that can be connected to the given affiliate.
///
/// * [affiliate]: The affiliate for which affiliate programs are searched for.
/// * [sortOrder]: Sort order for the results.
/// * [offset]: Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of affiliate programs to return.
///
/// [FoundAffiliatePrograms] is returned on completion.
final class SearchAffiliatePrograms extends TdFunction {
  /// **SearchAffiliatePrograms** *(searchAffiliatePrograms)* - TDLib function
  ///
  /// Searches affiliate programs that can be connected to the given affiliate.
  ///
  /// * [affiliate]: The affiliate for which affiliate programs are searched for.
  /// * [sortOrder]: Sort order for the results.
  /// * [offset]: Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of affiliate programs to return.
  ///
  /// [FoundAffiliatePrograms] is returned on completion.
  const SearchAffiliatePrograms({
    required this.affiliate,
    required this.sortOrder,
    required this.offset,
    required this.limit,
  });

  /// The affiliate for which affiliate programs are searched for
  final AffiliateType affiliate;

  /// Sort order for the results
  final AffiliateProgramSortOrder sortOrder;

  /// Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
  final String offset;

  /// The maximum number of affiliate programs to return
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "affiliate": affiliate.toJson(),
      "sort_order": sortOrder.toJson(),
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [affiliate]: The affiliate for which affiliate programs are searched for
  /// * [sort_order]: Sort order for the results
  /// * [offset]: Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of affiliate programs to return
  SearchAffiliatePrograms copyWith({
    AffiliateType? affiliate,
    AffiliateProgramSortOrder? sortOrder,
    String? offset,
    int? limit,
  }) =>
      SearchAffiliatePrograms(
        affiliate: affiliate ?? this.affiliate,
        sortOrder: sortOrder ?? this.sortOrder,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchAffiliatePrograms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
