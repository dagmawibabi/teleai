part of '../tdapi.dart';

/// **GetChatFolderChatsToLeave** *(getChatFolderChatsToLeave)* - TDLib function
///
/// Returns identifiers of pinned or always included chats from a chat folder, which are suggested to be left when the chat folder is deleted.
///
/// * [chatFolderId]: Chat folder identifier.
///
/// [Chats] is returned on completion.
final class GetChatFolderChatsToLeave extends TdFunction {
  /// **GetChatFolderChatsToLeave** *(getChatFolderChatsToLeave)* - TDLib function
  ///
  /// Returns identifiers of pinned or always included chats from a chat folder, which are suggested to be left when the chat folder is deleted.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  ///
  /// [Chats] is returned on completion.
  const GetChatFolderChatsToLeave({
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
  GetChatFolderChatsToLeave copyWith({
    int? chatFolderId,
  }) =>
      GetChatFolderChatsToLeave(
        chatFolderId: chatFolderId ?? this.chatFolderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatFolderChatsToLeave';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
