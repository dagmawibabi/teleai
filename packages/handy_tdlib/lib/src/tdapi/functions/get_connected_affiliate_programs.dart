part of '../tdapi.dart';

/// **GetConnectedAffiliatePrograms** *(getConnectedAffiliatePrograms)* - TDLib function
///
/// Returns affiliate programs that were connected to the given affiliate.
///
/// * [affiliate]: The affiliate to which the affiliate programs were connected.
/// * [offset]: Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results.
/// * [limit]: The maximum number of affiliate programs to return.
///
/// [ConnectedAffiliatePrograms] is returned on completion.
final class GetConnectedAffiliatePrograms extends TdFunction {
  /// **GetConnectedAffiliatePrograms** *(getConnectedAffiliatePrograms)* - TDLib function
  ///
  /// Returns affiliate programs that were connected to the given affiliate.
  ///
  /// * [affiliate]: The affiliate to which the affiliate programs were connected.
  /// * [offset]: Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results.
  /// * [limit]: The maximum number of affiliate programs to return.
  ///
  /// [ConnectedAffiliatePrograms] is returned on completion.
  const GetConnectedAffiliatePrograms({
    required this.affiliate,
    required this.offset,
    required this.limit,
  });

  /// The affiliate to which the affiliate programs were connected
  final AffiliateType affiliate;

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
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [affiliate]: The affiliate to which the affiliate programs were connected
  /// * [offset]: Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
  /// * [limit]: The maximum number of affiliate programs to return
  GetConnectedAffiliatePrograms copyWith({
    AffiliateType? affiliate,
    String? offset,
    int? limit,
  }) =>
      GetConnectedAffiliatePrograms(
        affiliate: affiliate ?? this.affiliate,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getConnectedAffiliatePrograms';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
