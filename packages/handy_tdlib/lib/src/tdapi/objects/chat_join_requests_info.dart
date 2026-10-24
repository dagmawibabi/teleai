part of '../tdapi.dart';

/// **ChatJoinRequestsInfo** *(chatJoinRequestsInfo)* - basic class
///
/// Contains information about pending join requests for a chat.
///
/// * [totalCount]: Total number of pending join requests.
/// * [userIds]: Identifiers of at most 3 users sent the newest pending join requests.
final class ChatJoinRequestsInfo extends TdObject {
  /// **ChatJoinRequestsInfo** *(chatJoinRequestsInfo)* - basic class
  ///
  /// Contains information about pending join requests for a chat.
  ///
  /// * [totalCount]: Total number of pending join requests.
  /// * [userIds]: Identifiers of at most 3 users sent the newest pending join requests.
  const ChatJoinRequestsInfo({
    required this.totalCount,
    required this.userIds,
  });

  /// Total number of pending join requests
  final int totalCount;

  /// Identifiers of at most 3 users sent the newest pending join requests
  final List<int> userIds;

  /// Parse from a json
  factory ChatJoinRequestsInfo.fromJson(Map<String, dynamic> json) =>
      ChatJoinRequestsInfo(
        totalCount: json['total_count'],
        userIds: List<int>.from(
            (json['user_ids'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "user_ids": userIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Total number of pending join requests
  /// * [user_ids]: Identifiers of at most 3 users sent the newest pending join requests
  ChatJoinRequestsInfo copyWith({
    int? totalCount,
    List<int>? userIds,
  }) =>
      ChatJoinRequestsInfo(
        totalCount: totalCount ?? this.totalCount,
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequestsInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
