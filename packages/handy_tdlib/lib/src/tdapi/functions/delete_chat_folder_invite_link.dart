part of '../tdapi.dart';

/// **DeleteChatFolderInviteLink** *(deleteChatFolderInviteLink)* - TDLib function
///
/// Deletes an invite link for a chat folder.
///
/// * [chatFolderId]: Chat folder identifier.
/// * [inviteLink]: Invite link to be deleted.
///
/// [Ok] is returned on completion.
final class DeleteChatFolderInviteLink extends TdFunction {
  /// **DeleteChatFolderInviteLink** *(deleteChatFolderInviteLink)* - TDLib function
  ///
  /// Deletes an invite link for a chat folder.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  /// * [inviteLink]: Invite link to be deleted.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatFolderInviteLink({
    required this.chatFolderId,
    required this.inviteLink,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// Invite link to be deleted
  final String inviteLink;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  /// * [invite_link]: Invite link to be deleted
  DeleteChatFolderInviteLink copyWith({
    int? chatFolderId,
    String? inviteLink,
  }) =>
      DeleteChatFolderInviteLink(
        chatFolderId: chatFolderId ?? this.chatFolderId,
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatFolderInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
