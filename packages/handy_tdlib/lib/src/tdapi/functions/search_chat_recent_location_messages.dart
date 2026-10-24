part of '../tdapi.dart';

/// **SearchChatRecentLocationMessages** *(searchChatRecentLocationMessages)* - TDLib function
///
/// Returns information about the recent live locations of chat members that were sent to the chat. Returns at most one live location message per user.
///
/// * [chatId]: Chat identifier.
/// * [limit]: The maximum number of messages to be returned.
///
/// [Messages] is returned on completion.
final class SearchChatRecentLocationMessages extends TdFunction {
  /// **SearchChatRecentLocationMessages** *(searchChatRecentLocationMessages)* - TDLib function
  ///
  /// Returns information about the recent live locations of chat members that were sent to the chat. Returns at most one live location message per user.
  ///
  /// * [chatId]: Chat identifier.
  /// * [limit]: The maximum number of messages to be returned.
  ///
  /// [Messages] is returned on completion.
  const SearchChatRecentLocationMessages({
    required this.chatId,
    required this.limit,
  });

  /// Chat identifier
  final int chatId;

  /// The maximum number of messages to be returned
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [limit]: The maximum number of messages to be returned
  SearchChatRecentLocationMessages copyWith({
    int? chatId,
    int? limit,
  }) =>
      SearchChatRecentLocationMessages(
        chatId: chatId ?? this.chatId,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'searchChatRecentLocationMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
