part of '../tdapi.dart';

/// **GetChatsForChatFolderInviteLink** *(getChatsForChatFolderInviteLink)* - TDLib function
///
/// Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link.
///
/// * [chatFolderId]: Chat folder identifier.
///
/// [Chats] is returned on completion.
final class GetChatsForChatFolderInviteLink extends TdFunction {
  /// **GetChatsForChatFolderInviteLink** *(getChatsForChatFolderInviteLink)* - TDLib function
  ///
  /// Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  ///
  /// [Chats] is returned on completion.
  const GetChatsForChatFolderInviteLink({
    required this.chatFolderId,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  GetChatsForChatFolderInviteLink copyWith({
    int? chatFolderId,
  }) =>
      GetChatsForChatFolderInviteLink(
        chatFolderId: chatFolderId ?? this.chatFolderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatsForChatFolderInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
