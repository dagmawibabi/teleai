part of '../tdapi.dart';

/// **EditChatSubscriptionInviteLink** *(editChatSubscriptionInviteLink)* - TDLib function
///
/// Edits a subscription invite link for a channel chat. Requires can_invite_users right in the chat for own links and owner privileges for other links.
///
/// * [chatId]: Chat identifier.
/// * [inviteLink]: Invite link to be edited.
/// * [name]: Invite link name; 0-32 characters.
///
/// [ChatInviteLink] is returned on completion.
final class EditChatSubscriptionInviteLink extends TdFunction {
  /// **EditChatSubscriptionInviteLink** *(editChatSubscriptionInviteLink)* - TDLib function
  ///
  /// Edits a subscription invite link for a channel chat. Requires can_invite_users right in the chat for own links and owner privileges for other links.
  ///
  /// * [chatId]: Chat identifier.
  /// * [inviteLink]: Invite link to be edited.
  /// * [name]: Invite link name; 0-32 characters.
  ///
  /// [ChatInviteLink] is returned on completion.
  const EditChatSubscriptionInviteLink({
    required this.chatId,
    required this.inviteLink,
    required this.name,
  });

  /// Chat identifier
  final int chatId;

  /// Invite link to be edited
  final String inviteLink;

  /// Invite link name; 0-32 characters
  final String name;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "name": name,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [invite_link]: Invite link to be edited
  /// * [name]: Invite link name; 0-32 characters
  EditChatSubscriptionInviteLink copyWith({
    int? chatId,
    String? inviteLink,
    String? name,
  }) =>
      EditChatSubscriptionInviteLink(
        chatId: chatId ?? this.chatId,
        inviteLink: inviteLink ?? this.inviteLink,
        name: name ?? this.name,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editChatSubscriptionInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
