part of '../tdapi.dart';

/// **SearchChatsOnServer** *(searchChatsOnServer)* - TDLib function
///
/// Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list.
///
/// * [query]: Query to search for.
/// * [typeFilter]: Additional filter for type of the chats to be returned; pass null to search for chats of all types *(optional)*.
/// * [limit]: The maximum number of chats to be returned.
///
/// [Chats] is returned on completion.
final class SearchChatsOnServer extends TdFunction {
  /// **SearchChatsOnServer** *(searchChatsOnServer)* - TDLib function
  ///
  /// Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list.
  ///
  /// * [query]: Query to search for.
  /// * [typeFilter]: Additional filter for type of the chats to be returned; pass null to search for chats of all types *(optional)*.
  /// * [limit]: The maximum number of chats to be returned.
  ///
  /// [Chats] is returned on completion.
  const SearchChatsOnServer({
    required this.query,
    this.typeFilter,
    required this.limit,
  });

  /// Query to search for
  final String query;

  /// Additional filter for type of the chats to be returned; pass null to search for chats of all types
  final SearchChatTypeFilter? typeFilter;

  /// The maximum number of chats to be returned
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query": query,
      "type_filter": typeFilter?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for
  /// * [type_filter]: Additional filter for type of the chats to be returned; pass null to search for chats of all types
  /// * [limit]: The maximum number of chats to be returned
  SearchChatsOnServer copyWith({
    String? query,
    SearchChatTypeFilter? typeFilter,
    int? limit,
  }) =>
      SearchChatsOnServer(
        query: query ?? this.query,
        typeFilter: typeFilter ?? this.typeFilter,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchChatsOnServer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
