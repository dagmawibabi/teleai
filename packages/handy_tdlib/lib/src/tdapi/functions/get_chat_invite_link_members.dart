part of '../tdapi.dart';

/// **GetChatInviteLinkMembers** *(getChatInviteLinkMembers)* - TDLib function
///
/// Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
///
/// * [chatId]: Chat identifier.
/// * [inviteLink]: Invite link for which to return chat members.
/// * [onlyWithExpiredSubscription]: Pass true if the link is a subscription link and only members with expired subscription must be returned.
/// * [offsetMember]: A chat member from which to return next chat members; pass null to get results from the beginning *(optional)*.
/// * [limit]: The maximum number of chat members to return; up to 100.
///
/// [ChatInviteLinkMembers] is returned on completion.
final class GetChatInviteLinkMembers extends TdFunction {
  /// **GetChatInviteLinkMembers** *(getChatInviteLinkMembers)* - TDLib function
  ///
  /// Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
  ///
  /// * [chatId]: Chat identifier.
  /// * [inviteLink]: Invite link for which to return chat members.
  /// * [onlyWithExpiredSubscription]: Pass true if the link is a subscription link and only members with expired subscription must be returned.
  /// * [offsetMember]: A chat member from which to return next chat members; pass null to get results from the beginning *(optional)*.
  /// * [limit]: The maximum number of chat members to return; up to 100.
  ///
  /// [ChatInviteLinkMembers] is returned on completion.
  const GetChatInviteLinkMembers({
    required this.chatId,
    required this.inviteLink,
    required this.onlyWithExpiredSubscription,
    this.offsetMember,
    required this.limit,
  });

  /// Chat identifier
  final int chatId;

  /// Invite link for which to return chat members
  final String inviteLink;

  /// Pass true if the link is a subscription link and only members with expired subscription must be returned
  final bool onlyWithExpiredSubscription;

  /// A chat member from which to return next chat members; pass null to get results from the beginning
  final ChatInviteLinkMember? offsetMember;

  /// The maximum number of chat members to return; up to 100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "invite_link": inviteLink,
      "only_with_expired_subscription": onlyWithExpiredSubscription,
      "offset_member": offsetMember?.toJson(),
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [invite_link]: Invite link for which to return chat members
  /// * [only_with_expired_subscription]: Pass true if the link is a subscription link and only members with expired subscription must be returned
  /// * [offset_member]: A chat member from which to return next chat members; pass null to get results from the beginning
  /// * [limit]: The maximum number of chat members to return; up to 100
  GetChatInviteLinkMembers copyWith({
    int? chatId,
    String? inviteLink,
    bool? onlyWithExpiredSubscription,
    ChatInviteLinkMember? offsetMember,
    int? limit,
  }) =>
      GetChatInviteLinkMembers(
        chatId: chatId ?? this.chatId,
        inviteLink: inviteLink ?? this.inviteLink,
        onlyWithExpiredSubscription:
            onlyWithExpiredSubscription ?? this.onlyWithExpiredSubscription,
        offsetMember: offsetMember ?? this.offsetMember,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatInviteLinkMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
