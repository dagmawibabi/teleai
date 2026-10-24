part of '../tdapi.dart';

/// **PublicPostSearchLimits** *(publicPostSearchLimits)* - basic class
///
/// Contains information about public post search limits.
///
/// * [dailyFreeQueryCount]: Number of queries that can be sent daily for free.
/// * [remainingFreeQueryCount]: Number of remaining free queries today.
/// * [nextFreeQueryIn]: Amount of time till the next free query can be sent; 0 if it can be sent now.
/// * [starCount]: Number of Telegram Stars that must be paid for each non-free query.
/// * [isCurrentQueryFree]: True, if the search for the specified query isn't charged.
final class PublicPostSearchLimits extends TdObject {
  /// **PublicPostSearchLimits** *(publicPostSearchLimits)* - basic class
  ///
  /// Contains information about public post search limits.
  ///
  /// * [dailyFreeQueryCount]: Number of queries that can be sent daily for free.
  /// * [remainingFreeQueryCount]: Number of remaining free queries today.
  /// * [nextFreeQueryIn]: Amount of time till the next free query can be sent; 0 if it can be sent now.
  /// * [starCount]: Number of Telegram Stars that must be paid for each non-free query.
  /// * [isCurrentQueryFree]: True, if the search for the specified query isn't charged.
  const PublicPostSearchLimits({
    required this.dailyFreeQueryCount,
    required this.remainingFreeQueryCount,
    required this.nextFreeQueryIn,
    required this.starCount,
    required this.isCurrentQueryFree,
    this.extra,
    this.clientId,
  });

  /// Number of queries that can be sent daily for free
  final int dailyFreeQueryCount;

  /// Number of remaining free queries today
  final int remainingFreeQueryCount;

  /// Amount of time till the next free query can be sent; 0 if it can be sent now
  final int nextFreeQueryIn;

  /// Number of Telegram Stars that must be paid for each non-free query
  final int starCount;

  /// True, if the search for the specified query isn't charged
  final bool isCurrentQueryFree;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PublicPostSearchLimits.fromJson(Map<String, dynamic> json) =>
      PublicPostSearchLimits(
        dailyFreeQueryCount: json['daily_free_query_count'],
        remainingFreeQueryCount: json['remaining_free_query_count'],
        nextFreeQueryIn: json['next_free_query_in'],
        starCount: json['star_count'],
        isCurrentQueryFree: json['is_current_query_free'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "daily_free_query_count": dailyFreeQueryCount,
      "remaining_free_query_count": remainingFreeQueryCount,
      "next_free_query_in": nextFreeQueryIn,
      "star_count": starCount,
      "is_current_query_free": isCurrentQueryFree,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [daily_free_query_count]: Number of queries that can be sent daily for free
  /// * [remaining_free_query_count]: Number of remaining free queries today
  /// * [next_free_query_in]: Amount of time till the next free query can be sent; 0 if it can be sent now
  /// * [star_count]: Number of Telegram Stars that must be paid for each non-free query
  /// * [is_current_query_free]: True, if the search for the specified query isn't charged
  PublicPostSearchLimits copyWith({
    int? dailyFreeQueryCount,
    int? remainingFreeQueryCount,
    int? nextFreeQueryIn,
    int? starCount,
    bool? isCurrentQueryFree,
    dynamic extra,
    int? clientId,
  }) =>
      PublicPostSearchLimits(
        dailyFreeQueryCount: dailyFreeQueryCount ?? this.dailyFreeQueryCount,
        remainingFreeQueryCount:
            remainingFreeQueryCount ?? this.remainingFreeQueryCount,
        nextFreeQueryIn: nextFreeQueryIn ?? this.nextFreeQueryIn,
        starCount: starCount ?? this.starCount,
        isCurrentQueryFree: isCurrentQueryFree ?? this.isCurrentQueryFree,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'publicPostSearchLimits';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
