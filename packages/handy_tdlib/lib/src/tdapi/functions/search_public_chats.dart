part of '../tdapi.dart';

/// **SearchPublicChats** *(searchPublicChats)* - TDLib function
///
/// Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results.. Excludes private chats with contacts and chats from the chat list from the results.
///
/// * [query]: Query to search for.
/// * [typeFilter]: Additional filter for type of the chats to be returned; pass null to search for chats of all types *(optional)*.
///
/// [Chats] is returned on completion.
final class SearchPublicChats extends TdFunction {
  /// **SearchPublicChats** *(searchPublicChats)* - TDLib function
  ///
  /// Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results.. Excludes private chats with contacts and chats from the chat list from the results.
  ///
  /// * [query]: Query to search for.
  /// * [typeFilter]: Additional filter for type of the chats to be returned; pass null to search for chats of all types *(optional)*.
  ///
  /// [Chats] is returned on completion.
  const SearchPublicChats({
    required this.query,
    this.typeFilter,
  });

  /// Query to search for
  final String query;

  /// Additional filter for type of the chats to be returned; pass null to search for chats of all types
  final SearchChatTypeFilter? typeFilter;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query": query,
      "type_filter": typeFilter?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  /// * [type_filter]: Additional filter for type of the chats to be returned; pass null to search for chats of all types
  SearchPublicChats copyWith({
    String? query,
    SearchChatTypeFilter? typeFilter,
  }) =>
      SearchPublicChats(
        query: query ?? this.query,
        typeFilter: typeFilter ?? this.typeFilter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchPublicChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
