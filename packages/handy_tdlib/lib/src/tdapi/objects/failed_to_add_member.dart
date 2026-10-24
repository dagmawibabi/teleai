part of '../tdapi.dart';

/// **FailedToAddMember** *(failedToAddMember)* - basic class
///
/// Contains information about a user who has failed to be added to a chat.
///
/// * [userId]: User identifier.
/// * [premiumWouldAllowInvite]: True, if subscription to Telegram Premium would have allowed to add the user to the chat.
/// * [premiumRequiredToSendMessages]: True, if subscription to Telegram Premium is required to send the user chat invite link.
final class FailedToAddMember extends TdObject {
  /// **FailedToAddMember** *(failedToAddMember)* - basic class
  ///
  /// Contains information about a user who has failed to be added to a chat.
  ///
  /// * [userId]: User identifier.
  /// * [premiumWouldAllowInvite]: True, if subscription to Telegram Premium would have allowed to add the user to the chat.
  /// * [premiumRequiredToSendMessages]: True, if subscription to Telegram Premium is required to send the user chat invite link.
  const FailedToAddMember({
    required this.userId,
    required this.premiumWouldAllowInvite,
    required this.premiumRequiredToSendMessages,
  });

  /// User identifier
  final int userId;

  /// True, if subscription to Telegram Premium would have allowed to add the user to the chat
  final bool premiumWouldAllowInvite;

  /// True, if subscription to Telegram Premium is required to send the user chat invite link
  final bool premiumRequiredToSendMessages;

  /// Parse from a json
  factory FailedToAddMember.fromJson(Map<String, dynamic> json) =>
      FailedToAddMember(
        userId: json['user_id'],
        premiumWouldAllowInvite: json['premium_would_allow_invite'],
        premiumRequiredToSendMessages:
            json['premium_required_to_send_messages'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "premium_would_allow_invite": premiumWouldAllowInvite,
      "premium_required_to_send_messages": premiumRequiredToSendMessages,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [premium_would_allow_invite]: True, if subscription to Telegram Premium would have allowed to add the user to the chat
  /// * [premium_required_to_send_messages]: True, if subscription to Telegram Premium is required to send the user chat invite link
  FailedToAddMember copyWith({
    int? userId,
    bool? premiumWouldAllowInvite,
    bool? premiumRequiredToSendMessages,
  }) =>
      FailedToAddMember(
        userId: userId ?? this.userId,
        premiumWouldAllowInvite:
            premiumWouldAllowInvite ?? this.premiumWouldAllowInvite,
        premiumRequiredToSendMessages:
            premiumRequiredToSendMessages ?? this.premiumRequiredToSendMessages,
      );

  /// TDLib object type
  static const String defaultObjectId = 'failedToAddMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
