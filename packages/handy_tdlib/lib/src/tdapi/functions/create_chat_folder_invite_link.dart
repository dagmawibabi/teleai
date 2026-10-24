part of '../tdapi.dart';

/// **CreateChatFolderInviteLink** *(createChatFolderInviteLink)* - TDLib function
///
/// Creates a new invite link for a chat folder. A link can be created for a chat folder if it has only pinned and included chats.
///
/// * [chatFolderId]: Chat folder identifier.
/// * [name]: Name of the link; 0-32 characters.
/// * [chatIds]: Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation.
///
/// [ChatFolderInviteLink] is returned on completion.
final class CreateChatFolderInviteLink extends TdFunction {
  /// **CreateChatFolderInviteLink** *(createChatFolderInviteLink)* - TDLib function
  ///
  /// Creates a new invite link for a chat folder. A link can be created for a chat folder if it has only pinned and included chats.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  /// * [name]: Name of the link; 0-32 characters.
  /// * [chatIds]: Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation.
  ///
  /// [ChatFolderInviteLink] is returned on completion.
  const CreateChatFolderInviteLink({
    required this.chatFolderId,
    required this.name,
    required this.chatIds,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// Name of the link; 0-32 characters
  final String name;

  /// Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation
  final List<int> chatIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "name": name,
      "chat_ids": chatIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  /// * [name]: Name of the link; 0-32 characters
  /// * [chat_ids]: Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation
  CreateChatFolderInviteLink copyWith({
    int? chatFolderId,
    String? name,
    List<int>? chatIds,
  }) =>
      CreateChatFolderInviteLink(
        chatFolderId: chatFolderId ?? this.chatFolderId,
        name: name ?? this.name,
        chatIds: chatIds ?? this.chatIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createChatFolderInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
