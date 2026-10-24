part of '../tdapi.dart';

/// **FoundPublicPosts** *(foundPublicPosts)* - basic class
///
/// Contains a list of messages found by a public post search.
///
/// * [messages]: List of found public posts.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
/// * [searchLimits]: Updated public post search limits after the query; repeated requests with the same query will be free; may be null if they didn't change *(optional)*.
/// * [areLimitsExceeded]: True, if the query has failed because search limits are exceeded. In this case search_limits.daily_free_query_count will be equal to 0.
final class FoundPublicPosts extends TdObject {
  /// **FoundPublicPosts** *(foundPublicPosts)* - basic class
  ///
  /// Contains a list of messages found by a public post search.
  ///
  /// * [messages]: List of found public posts.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  /// * [searchLimits]: Updated public post search limits after the query; repeated requests with the same query will be free; may be null if they didn't change *(optional)*.
  /// * [areLimitsExceeded]: True, if the query has failed because search limits are exceeded. In this case search_limits.daily_free_query_count will be equal to 0.
  const FoundPublicPosts({
    required this.messages,
    required this.nextOffset,
    this.searchLimits,
    required this.areLimitsExceeded,
    this.extra,
    this.clientId,
  });

  /// List of found public posts
  final List<Message> messages;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// Updated public post search limits after the query; repeated requests with the same query will be free; may be null if they didn't change
  final PublicPostSearchLimits? searchLimits;

  /// True, if the query has failed because search limits are exceeded. In this case search_limits.daily_free_query_count will be equal to 0
  final bool areLimitsExceeded;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundPublicPosts.fromJson(Map<String, dynamic> json) =>
      FoundPublicPosts(
        messages: List<Message>.from((json['messages'] ?? [])
            .map((item) => Message.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        searchLimits: json['search_limits'] == null
            ? null
            : PublicPostSearchLimits.fromJson(json['search_limits']),
        areLimitsExceeded: json['are_limits_exceeded'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "messages": messages.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
      "search_limits": searchLimits?.toJson(),
      "are_limits_exceeded": areLimitsExceeded,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [messages]: List of found public posts
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  /// * [search_limits]: Updated public post search limits after the query; repeated requests with the same query will be free; may be null if they didn't change
  /// * [are_limits_exceeded]: True, if the query has failed because search limits are exceeded. In this case search_limits.daily_free_query_count will be equal to 0
  FoundPublicPosts copyWith({
    List<Message>? messages,
    String? nextOffset,
    PublicPostSearchLimits? searchLimits,
    bool? areLimitsExceeded,
    dynamic extra,
    int? clientId,
  }) =>
      FoundPublicPosts(
        messages: messages ?? this.messages,
        nextOffset: nextOffset ?? this.nextOffset,
        searchLimits: searchLimits ?? this.searchLimits,
        areLimitsExceeded: areLimitsExceeded ?? this.areLimitsExceeded,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundPublicPosts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
