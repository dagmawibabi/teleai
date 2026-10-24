part of '../tdapi.dart';

/// **GetChatInviteLink** *(getChatInviteLink)* - TDLib function
///
/// Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links.
///
/// * [chatId]: Chat identifier.
/// * [inviteLink]: Invite link to get.
///
/// [ChatInviteLink] is returned on completion.
final class GetChatInviteLink extends TdFunction {
  /// **GetChatInviteLink** *(getChatInviteLink)* - TDLib function
  ///
  /// Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links.
  ///
  /// * [chatId]: Chat identifier.
  /// * [inviteLink]: Invite link to get.
  ///
  /// [ChatInviteLink] is returned on completion.
  const GetChatInviteLink({
    required this.chatId,
    required this.inviteLink,
  });

  /// Chat identifier
  final int chatId;

  /// Invite link to get
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
  /// * [invite_link]: Invite link to get
  GetChatInviteLink copyWith({
    int? chatId,
    String? inviteLink,
  }) =>
      GetChatInviteLink(
        chatId: chatId ?? this.chatId,
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
