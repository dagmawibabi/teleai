part of '../tdapi.dart';

/// **DeleteAllRevokedChatInviteLinks** *(deleteAllRevokedChatInviteLinks)* - TDLib function
///
/// Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
///
/// * [chatId]: Chat identifier.
/// * [creatorUserId]: User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner.
///
/// [Ok] is returned on completion.
final class DeleteAllRevokedChatInviteLinks extends TdFunction {
  /// **DeleteAllRevokedChatInviteLinks** *(deleteAllRevokedChatInviteLinks)* - TDLib function
  ///
  /// Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
  ///
  /// * [chatId]: Chat identifier.
  /// * [creatorUserId]: User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner.
  ///
  /// [Ok] is returned on completion.
  const DeleteAllRevokedChatInviteLinks({
    required this.chatId,
    required this.creatorUserId,
  });

  /// Chat identifier
  final int chatId;

  /// User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
  final int creatorUserId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "creator_user_id": creatorUserId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [creator_user_id]: User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
  DeleteAllRevokedChatInviteLinks copyWith({
    int? chatId,
    int? creatorUserId,
  }) =>
      DeleteAllRevokedChatInviteLinks(
        chatId: chatId ?? this.chatId,
        creatorUserId: creatorUserId ?? this.creatorUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteAllRevokedChatInviteLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
