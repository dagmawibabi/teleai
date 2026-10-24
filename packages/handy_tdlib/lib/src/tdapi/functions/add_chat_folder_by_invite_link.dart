part of '../tdapi.dart';

/// **AddChatFolderByInviteLink** *(addChatFolderByInviteLink)* - TDLib function
///
/// Adds a chat folder by an invite link.
///
/// * [inviteLink]: Invite link for the chat folder.
/// * [chatIds]: Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet.
///
/// [Ok] is returned on completion.
final class AddChatFolderByInviteLink extends TdFunction {
  /// **AddChatFolderByInviteLink** *(addChatFolderByInviteLink)* - TDLib function
  ///
  /// Adds a chat folder by an invite link.
  ///
  /// * [inviteLink]: Invite link for the chat folder.
  /// * [chatIds]: Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet.
  ///
  /// [Ok] is returned on completion.
  const AddChatFolderByInviteLink({
    required this.inviteLink,
    required this.chatIds,
  });

  /// Invite link for the chat folder
  final String inviteLink;

  /// Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet
  final List<int> chatIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
      "chat_ids": chatIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Invite link for the chat folder
  /// * [chat_ids]: Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet
  AddChatFolderByInviteLink copyWith({
    String? inviteLink,
    List<int>? chatIds,
  }) =>
      AddChatFolderByInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
        chatIds: chatIds ?? this.chatIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addChatFolderByInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
