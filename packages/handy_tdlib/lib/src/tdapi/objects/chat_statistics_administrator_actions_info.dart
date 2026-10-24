part of '../tdapi.dart';

/// **ChatStatisticsAdministratorActionsInfo** *(chatStatisticsAdministratorActionsInfo)* - basic class
///
/// Contains statistics about administrator actions done by a user.
///
/// * [userId]: Administrator user identifier.
/// * [deletedMessageCount]: Number of messages deleted by the administrator.
/// * [bannedUserCount]: Number of users banned by the administrator.
/// * [restrictedUserCount]: Number of users restricted by the administrator.
final class ChatStatisticsAdministratorActionsInfo extends TdObject {
  /// **ChatStatisticsAdministratorActionsInfo** *(chatStatisticsAdministratorActionsInfo)* - basic class
  ///
  /// Contains statistics about administrator actions done by a user.
  ///
  /// * [userId]: Administrator user identifier.
  /// * [deletedMessageCount]: Number of messages deleted by the administrator.
  /// * [bannedUserCount]: Number of users banned by the administrator.
  /// * [restrictedUserCount]: Number of users restricted by the administrator.
  const ChatStatisticsAdministratorActionsInfo({
    required this.userId,
    required this.deletedMessageCount,
    required this.bannedUserCount,
    required this.restrictedUserCount,
  });

  /// Administrator user identifier
  final int userId;

  /// Number of messages deleted by the administrator
  final int deletedMessageCount;

  /// Number of users banned by the administrator
  final int bannedUserCount;

  /// Number of users restricted by the administrator
  final int restrictedUserCount;

  /// Parse from a json
  factory ChatStatisticsAdministratorActionsInfo.fromJson(
          Map<String, dynamic> json) =>
      ChatStatisticsAdministratorActionsInfo(
        userId: json['user_id'],
        deletedMessageCount: json['deleted_message_count'],
        bannedUserCount: json['banned_user_count'],
        restrictedUserCount: json['restricted_user_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "deleted_message_count": deletedMessageCount,
      "banned_user_count": bannedUserCount,
      "restricted_user_count": restrictedUserCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Administrator user identifier
  /// * [deleted_message_count]: Number of messages deleted by the administrator
  /// * [banned_user_count]: Number of users banned by the administrator
  /// * [restricted_user_count]: Number of users restricted by the administrator
  ChatStatisticsAdministratorActionsInfo copyWith({
    int? userId,
    int? deletedMessageCount,
    int? bannedUserCount,
    int? restrictedUserCount,
  }) =>
      ChatStatisticsAdministratorActionsInfo(
        userId: userId ?? this.userId,
        deletedMessageCount: deletedMessageCount ?? this.deletedMessageCount,
        bannedUserCount: bannedUserCount ?? this.bannedUserCount,
        restrictedUserCount: restrictedUserCount ?? this.restrictedUserCount,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatStatisticsAdministratorActionsInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
