part of '../tdapi.dart';

/// **EditChatFolderInviteLink** *(editChatFolderInviteLink)* - TDLib function
///
/// Edits an invite link for a chat folder.
///
/// * [chatFolderId]: Chat folder identifier.
/// * [inviteLink]: Invite link to be edited.
/// * [name]: New name of the link; 0-32 characters.
/// * [chatIds]: New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing.
///
/// [ChatFolderInviteLink] is returned on completion.
final class EditChatFolderInviteLink extends TdFunction {
  /// **EditChatFolderInviteLink** *(editChatFolderInviteLink)* - TDLib function
  ///
  /// Edits an invite link for a chat folder.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  /// * [inviteLink]: Invite link to be edited.
  /// * [name]: New name of the link; 0-32 characters.
  /// * [chatIds]: New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing.
  ///
  /// [ChatFolderInviteLink] is returned on completion.
  const EditChatFolderInviteLink({
    required this.chatFolderId,
    required this.inviteLink,
    required this.name,
    required this.chatIds,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// Invite link to be edited
  final String inviteLink;

  /// New name of the link; 0-32 characters
  final String name;

  /// New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing
  final List<int> chatIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "invite_link": inviteLink,
      "name": name,
      "chat_ids": chatIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  /// * [invite_link]: Invite link to be edited
  /// * [name]: New name of the link; 0-32 characters
  /// * [chat_ids]: New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing
  EditChatFolderInviteLink copyWith({
    int? chatFolderId,
    String? inviteLink,
    String? name,
    List<int>? chatIds,
  }) =>
      EditChatFolderInviteLink(
        chatFolderId: chatFolderId ?? this.chatFolderId,
        inviteLink: inviteLink ?? this.inviteLink,
        name: name ?? this.name,
        chatIds: chatIds ?? this.chatIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editChatFolderInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
