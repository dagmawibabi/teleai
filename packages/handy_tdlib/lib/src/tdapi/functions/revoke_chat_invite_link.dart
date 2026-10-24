part of '../tdapi.dart';

/// **RevokeChatInviteLink** *(revokeChatInviteLink)* - TDLib function
///
/// Revokes invite link for a chat. Available in basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.. If a primary link is revoked, then additionally to the revoked link returns new primary link.
///
/// * [chatId]: Chat identifier.
/// * [inviteLink]: Invite link to be revoked.
///
/// [ChatInviteLinks] is returned on completion.
final class RevokeChatInviteLink extends TdFunction {
  /// **RevokeChatInviteLink** *(revokeChatInviteLink)* - TDLib function
  ///
  /// Revokes invite link for a chat. Available in basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.. If a primary link is revoked, then additionally to the revoked link returns new primary link.
  ///
  /// * [chatId]: Chat identifier.
  /// * [inviteLink]: Invite link to be revoked.
  ///
  /// [ChatInviteLinks] is returned on completion.
  const RevokeChatInviteLink({
    required this.chatId,
    required this.inviteLink,
  });

  /// Chat identifier
  final int chatId;

  /// Invite link to be revoked
  final String inviteLink;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [invite_link]: Invite link to be revoked
  RevokeChatInviteLink copyWith({
    int? chatId,
    String? inviteLink,
  }) =>
      RevokeChatInviteLink(
        chatId: chatId ?? this.chatId,
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'revokeChatInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
