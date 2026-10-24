part of '../tdapi.dart';

/// **SearchChatMembers** *(searchChatMembers)* - TDLib function
///
/// Searches for a specified query in the first name, last name and usernames of the members of a specified chat. Requires administrator rights if the chat is a channel.
///
/// * [chatId]: Chat identifier.
/// * [query]: Query to search for.
/// * [limit]: The maximum number of users to be returned; up to 200.
/// * [filter]: The type of users to search for; pass null to search among all chat members *(optional)*.
///
/// [ChatMembers] is returned on completion.
final class SearchChatMembers extends TdFunction {
  /// **SearchChatMembers** *(searchChatMembers)* - TDLib function
  ///
  /// Searches for a specified query in the first name, last name and usernames of the members of a specified chat. Requires administrator rights if the chat is a channel.
  ///
  /// * [chatId]: Chat identifier.
  /// * [query]: Query to search for.
  /// * [limit]: The maximum number of users to be returned; up to 200.
  /// * [filter]: The type of users to search for; pass null to search among all chat members *(optional)*.
  ///
  /// [ChatMembers] is returned on completion.
  const SearchChatMembers({
    required this.chatId,
    required this.query,
    required this.limit,
    this.filter,
  });

  /// Chat identifier
  final int chatId;

  /// Query to search for
  final String query;

  /// The maximum number of users to be returned; up to 200
  final int limit;

  /// The type of users to search for; pass null to search among all chat members
  final ChatMembersFilter? filter;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "query": query,
      "limit": limit,
      "filter": filter?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [query]: Query to search for
  /// * [limit]: The maximum number of users to be returned; up to 200
  /// * [filter]: The type of users to search for; pass null to search among all chat members
  SearchChatMembers copyWith({
    int? chatId,
    String? query,
    int? limit,
    ChatMembersFilter? filter,
  }) =>
      SearchChatMembers(
        chatId: chatId ?? this.chatId,
        query: query ?? this.query,
        limit: limit ?? this.limit,
        filter: filter ?? this.filter,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchChatMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
