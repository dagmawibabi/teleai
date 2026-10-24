part of '../tdapi.dart';

/// **SearchOutgoingDocumentMessages** *(searchOutgoingDocumentMessages)* - TDLib function
///
/// Searches for outgoing messages with content of the type messageDocument in all chats except secret chats. Returns the results in reverse chronological order.
///
/// * [query]: Query to search for in document file name and message caption.
/// * [limit]: The maximum number of messages to be returned; up to 100.
///
/// [FoundMessages] is returned on completion.
final class SearchOutgoingDocumentMessages extends TdFunction {
  /// **SearchOutgoingDocumentMessages** *(searchOutgoingDocumentMessages)* - TDLib function
  ///
  /// Searches for outgoing messages with content of the type messageDocument in all chats except secret chats. Returns the results in reverse chronological order.
  ///
  /// * [query]: Query to search for in document file name and message caption.
  /// * [limit]: The maximum number of messages to be returned; up to 100.
  ///
  /// [FoundMessages] is returned on completion.
  const SearchOutgoingDocumentMessages({
    required this.query,
    required this.limit,
  });

  /// Query to search for in document file name and message caption
  final String query;

  /// The maximum number of messages to be returned; up to 100
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
  /// * [query]: Query to search for in document file name and message caption
  /// * [limit]: The maximum number of messages to be returned; up to 100
  SearchOutgoingDocumentMessages copyWith({
    String? query,
    int? limit,
  }) =>
      SearchOutgoingDocumentMessages(
        query: query ?? this.query,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchOutgoingDocumentMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
