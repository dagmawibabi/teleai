part of '../tdapi.dart';

/// **SearchContacts** *(searchContacts)* - TDLib function
///
/// Searches for the specified query in the first names, last names and usernames of the known user contacts.
///
/// * [query]: Query to search for; may be empty to return all contacts.
/// * [limit]: The maximum number of users to be returned.
///
/// [Users] is returned on completion.
final class SearchContacts extends TdFunction {
  /// **SearchContacts** *(searchContacts)* - TDLib function
  ///
  /// Searches for the specified query in the first names, last names and usernames of the known user contacts.
  ///
  /// * [query]: Query to search for; may be empty to return all contacts.
  /// * [limit]: The maximum number of users to be returned.
  ///
  /// [Users] is returned on completion.
  const SearchContacts({
    required this.query,
    required this.limit,
  });

  /// Query to search for; may be empty to return all contacts
  final String query;

  /// The maximum number of users to be returned
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query": query,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query]: Query to search for; may be empty to return all contacts
  /// * [limit]: The maximum number of users to be returned
  SearchContacts copyWith({
    String? query,
    int? limit,
  }) =>
      SearchContacts(
        query: query ?? this.query,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchContacts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
