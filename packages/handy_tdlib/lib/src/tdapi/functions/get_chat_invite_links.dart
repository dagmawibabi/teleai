part of '../tdapi.dart';

/// **GetChatInviteLinks** *(getChatInviteLinks)* - TDLib function
///
/// Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links.
///
/// * [chatId]: Chat identifier.
/// * [creatorUserId]: User identifier of a chat administrator. Must be an identifier of the current user for non-owner.
/// * [isRevoked]: Pass true if revoked links need to be returned instead of active or expired.
/// * [offsetDate]: Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning.
/// * [offsetInviteLink]: Invite link starting after which to return invite links; use empty string to get results from the beginning.
/// * [limit]: The maximum number of invite links to return; up to 100.
///
/// [ChatInviteLinks] is returned on completion.
final class GetChatInviteLinks extends TdFunction {
  /// **GetChatInviteLinks** *(getChatInviteLinks)* - TDLib function
  ///
  /// Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links.
  ///
  /// * [chatId]: Chat identifier.
  /// * [creatorUserId]: User identifier of a chat administrator. Must be an identifier of the current user for non-owner.
  /// * [isRevoked]: Pass true if revoked links need to be returned instead of active or expired.
  /// * [offsetDate]: Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning.
  /// * [offsetInviteLink]: Invite link starting after which to return invite links; use empty string to get results from the beginning.
  /// * [limit]: The maximum number of invite links to return; up to 100.
  ///
  /// [ChatInviteLinks] is returned on completion.
  const GetChatInviteLinks({
    required this.chatId,
    required this.creatorUserId,
    required this.isRevoked,
    required this.offsetDate,
    required this.offsetInviteLink,
    required this.limit,
  });

  /// Chat identifier
  final int chatId;

  /// User identifier of a chat administrator. Must be an identifier of the current user for non-owner
  final int creatorUserId;

  /// Pass true if revoked links need to be returned instead of active or expired
  final bool isRevoked;

  /// Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
  final int offsetDate;

  /// Invite link starting after which to return invite links; use empty string to get results from the beginning
  final String offsetInviteLink;

  /// The maximum number of invite links to return; up to 100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "creator_user_id": creatorUserId,
      "is_revoked": isRevoked,
      "offset_date": offsetDate,
      "offset_invite_link": offsetInviteLink,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [creator_user_id]: User identifier of a chat administrator. Must be an identifier of the current user for non-owner
  /// * [is_revoked]: Pass true if revoked links need to be returned instead of active or expired
  /// * [offset_date]: Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
  /// * [offset_invite_link]: Invite link starting after which to return invite links; use empty string to get results from the beginning
  /// * [limit]: The maximum number of invite links to return; up to 100
  GetChatInviteLinks copyWith({
    int? chatId,
    int? creatorUserId,
    bool? isRevoked,
    int? offsetDate,
    String? offsetInviteLink,
    int? limit,
  }) =>
      GetChatInviteLinks(
        chatId: chatId ?? this.chatId,
        creatorUserId: creatorUserId ?? this.creatorUserId,
        isRevoked: isRevoked ?? this.isRevoked,
        offsetDate: offsetDate ?? this.offsetDate,
        offsetInviteLink: offsetInviteLink ?? this.offsetInviteLink,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatInviteLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
