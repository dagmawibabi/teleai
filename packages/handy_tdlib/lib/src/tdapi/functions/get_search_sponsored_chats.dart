part of '../tdapi.dart';

/// **GetSearchSponsoredChats** *(getSearchSponsoredChats)* - TDLib function
///
/// Returns sponsored chats to be shown in the search results.
///
/// * [query]: Query the user searches for.
///
/// [SponsoredChats] is returned on completion.
final class GetSearchSponsoredChats extends TdFunction {
  /// **GetSearchSponsoredChats** *(getSearchSponsoredChats)* - TDLib function
  ///
  /// Returns sponsored chats to be shown in the search results.
  ///
  /// * [query]: Query the user searches for.
  ///
  /// [SponsoredChats] is returned on completion.
  const GetSearchSponsoredChats({
    required this.query,
  });

  /// Query the user searches for
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
  /// * [query]: Query the user searches for
  GetSearchSponsoredChats copyWith({
    String? query,
  }) =>
      GetSearchSponsoredChats(
        query: query ?? this.query,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getSearchSponsoredChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
