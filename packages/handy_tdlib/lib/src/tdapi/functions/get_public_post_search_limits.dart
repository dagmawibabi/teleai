part of '../tdapi.dart';

/// **GetPublicPostSearchLimits** *(getPublicPostSearchLimits)* - TDLib function
///
/// Checks public post search limits without actually performing the search.
///
/// * [query]: Query that will be searched for.
///
/// [PublicPostSearchLimits] is returned on completion.
final class GetPublicPostSearchLimits extends TdFunction {
  /// **GetPublicPostSearchLimits** *(getPublicPostSearchLimits)* - TDLib function
  ///
  /// Checks public post search limits without actually performing the search.
  ///
  /// * [query]: Query that will be searched for.
  ///
  /// [PublicPostSearchLimits] is returned on completion.
  const GetPublicPostSearchLimits({
    required this.query,
  });

  /// Query that will be searched for
  final String query;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query": query,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query that will be searched for
  GetPublicPostSearchLimits copyWith({
    String? query,
  }) =>
      GetPublicPostSearchLimits(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPublicPostSearchLimits';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
