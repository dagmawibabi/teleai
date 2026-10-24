part of '../tdapi.dart';

/// **GetChatEventLog** *(getChatEventLog)* - TDLib function
///
/// Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only in supergroups and channels.. Requires administrator rights. Returns results in reverse chronological order (i.e., in order of decreasing event_id).
///
/// * [chatId]: Chat identifier.
/// * [query]: Search query by which to filter events.
/// * [fromEventId]: Identifier of an event from which to return results. Use 0 to get results from the latest events.
/// * [limit]: The maximum number of events to return; up to 100.
/// * [filters]: The types of events to return; pass null to get chat events of all types *(optional)*.
/// * [userIds]: User identifiers by which to filter events. By default, events relating to all users will be returned.
///
/// [ChatEvents] is returned on completion.
final class GetChatEventLog extends TdFunction {
  /// **GetChatEventLog** *(getChatEventLog)* - TDLib function
  ///
  /// Returns a list of service actions taken by chat members and administrators in the last 48 hours. Available only in supergroups and channels.. Requires administrator rights. Returns results in reverse chronological order (i.e., in order of decreasing event_id).
  ///
  /// * [chatId]: Chat identifier.
  /// * [query]: Search query by which to filter events.
  /// * [fromEventId]: Identifier of an event from which to return results. Use 0 to get results from the latest events.
  /// * [limit]: The maximum number of events to return; up to 100.
  /// * [filters]: The types of events to return; pass null to get chat events of all types *(optional)*.
  /// * [userIds]: User identifiers by which to filter events. By default, events relating to all users will be returned.
  ///
  /// [ChatEvents] is returned on completion.
  const GetChatEventLog({
    required this.chatId,
    required this.query,
    required this.fromEventId,
    required this.limit,
    this.filters,
    required this.userIds,
  });

  /// Chat identifier
  final int chatId;

  /// Search query by which to filter events
  final String query;

  /// Identifier of an event from which to return results. Use 0 to get results from the latest events
  final int fromEventId;

  /// The maximum number of events to return; up to 100
  final int limit;

  /// The types of events to return; pass null to get chat events of all types
  final ChatEventLogFilters? filters;

  /// User identifiers by which to filter events. By default, events relating to all users will be returned
  final List<int> userIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "query": query,
      "from_event_id": fromEventId,
      "limit": limit,
      "filters": filters?.toJson(),
      "user_ids": userIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [query]: Search query by which to filter events
  /// * [from_event_id]: Identifier of an event from which to return results. Use 0 to get results from the latest events
  /// * [limit]: The maximum number of events to return; up to 100
  /// * [filters]: The types of events to return; pass null to get chat events of all types
  /// * [user_ids]: User identifiers by which to filter events. By default, events relating to all users will be returned
  GetChatEventLog copyWith({
    int? chatId,
    String? query,
    int? fromEventId,
    int? limit,
    ChatEventLogFilters? filters,
    List<int>? userIds,
  }) =>
      GetChatEventLog(
        chatId: chatId ?? this.chatId,
        query: query ?? this.query,
        fromEventId: fromEventId ?? this.fromEventId,
        limit: limit ?? this.limit,
        filters: filters ?? this.filters,
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatEventLog';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
