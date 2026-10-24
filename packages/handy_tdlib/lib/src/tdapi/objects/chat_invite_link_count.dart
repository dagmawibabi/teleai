part of '../tdapi.dart';

/// **ChatInviteLinkCount** *(chatInviteLinkCount)* - basic class
///
/// Describes a chat administrator with a number of active and revoked chat invite links.
///
/// * [userId]: Administrator's user identifier.
/// * [inviteLinkCount]: Number of active invite links.
/// * [revokedInviteLinkCount]: Number of revoked invite links.
final class ChatInviteLinkCount extends TdObject {
  /// **ChatInviteLinkCount** *(chatInviteLinkCount)* - basic class
  ///
  /// Describes a chat administrator with a number of active and revoked chat invite links.
  ///
  /// * [userId]: Administrator's user identifier.
  /// * [inviteLinkCount]: Number of active invite links.
  /// * [revokedInviteLinkCount]: Number of revoked invite links.
  const ChatInviteLinkCount({
    required this.userId,
    required this.inviteLinkCount,
    required this.revokedInviteLinkCount,
  });

  /// Administrator's user identifier
  final int userId;

  /// Number of active invite links
  final int inviteLinkCount;

  /// Number of revoked invite links
  final int revokedInviteLinkCount;

  /// Parse from a json
  factory ChatInviteLinkCount.fromJson(Map<String, dynamic> json) =>
      ChatInviteLinkCount(
        userId: json['user_id'],
        inviteLinkCount: json['invite_link_count'],
        revokedInviteLinkCount: json['revoked_invite_link_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "invite_link_count": inviteLinkCount,
      "revoked_invite_link_count": revokedInviteLinkCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Administrator's user identifier
  /// * [invite_link_count]: Number of active invite links
  /// * [revoked_invite_link_count]: Number of revoked invite links
  ChatInviteLinkCount copyWith({
    int? userId,
    int? inviteLinkCount,
    int? revokedInviteLinkCount,
  }) =>
      ChatInviteLinkCount(
        userId: userId ?? this.userId,
        inviteLinkCount: inviteLinkCount ?? this.inviteLinkCount,
        revokedInviteLinkCount:
            revokedInviteLinkCount ?? this.revokedInviteLinkCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatInviteLinkCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
