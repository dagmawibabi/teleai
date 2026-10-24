part of '../tdapi.dart';

/// **ChatStatisticsInviterInfo** *(chatStatisticsInviterInfo)* - basic class
///
/// Contains statistics about number of new members invited by a user.
///
/// * [userId]: User identifier.
/// * [addedMemberCount]: Number of new members invited by the user.
final class ChatStatisticsInviterInfo extends TdObject {
  /// **ChatStatisticsInviterInfo** *(chatStatisticsInviterInfo)* - basic class
  ///
  /// Contains statistics about number of new members invited by a user.
  ///
  /// * [userId]: User identifier.
  /// * [addedMemberCount]: Number of new members invited by the user.
  const ChatStatisticsInviterInfo({
    required this.userId,
    required this.addedMemberCount,
  });

  /// User identifier
  final int userId;

  /// Number of new members invited by the user
  final int addedMemberCount;

  /// Parse from a json
  factory ChatStatisticsInviterInfo.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsInviterInfo(
        userId: json['user_id'],
        addedMemberCount: json['added_member_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "added_member_count": addedMemberCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [added_member_count]: Number of new members invited by the user
  ChatStatisticsInviterInfo copyWith({
    int? userId,
    int? addedMemberCount,
  }) =>
      ChatStatisticsInviterInfo(
        userId: userId ?? this.userId,
        addedMemberCount: addedMemberCount ?? this.addedMemberCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsInviterInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
