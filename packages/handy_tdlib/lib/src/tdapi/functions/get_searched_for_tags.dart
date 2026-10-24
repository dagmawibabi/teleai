part of '../tdapi.dart';

/// **GetSearchedForTags** *(getSearchedForTags)* - TDLib function
///
/// Returns recently searched for hashtags or cashtags by their prefix.
///
/// * [tagPrefix]: Prefix of hashtags or cashtags to return.
/// * [limit]: The maximum number of items to be returned.
///
/// [Hashtags] is returned on completion.
final class GetSearchedForTags extends TdFunction {
  /// **GetSearchedForTags** *(getSearchedForTags)* - TDLib function
  ///
  /// Returns recently searched for hashtags or cashtags by their prefix.
  ///
  /// * [tagPrefix]: Prefix of hashtags or cashtags to return.
  /// * [limit]: The maximum number of items to be returned.
  ///
  /// [Hashtags] is returned on completion.
  const GetSearchedForTags({
    required this.tagPrefix,
    required this.limit,
  });

  /// Prefix of hashtags or cashtags to return
  final String tagPrefix;

  /// The maximum number of items to be returned
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "tag_prefix": tagPrefix,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [tag_prefix]: Prefix of hashtags or cashtags to return
  /// * [limit]: The maximum number of items to be returned
  GetSearchedForTags copyWith({
    String? tagPrefix,
    int? limit,
  }) =>
      GetSearchedForTags(
        tagPrefix: tagPrefix ?? this.tagPrefix,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSearchedForTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
