part of '../tdapi.dart';

/// **ProcessChatFolderNewChats** *(processChatFolderNewChats)* - TDLib function
///
/// Processes new chats added to a shareable chat folder by its owner.
///
/// * [chatFolderId]: Chat folder identifier.
/// * [addedChatIds]: Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet.
///
/// [Ok] is returned on completion.
final class ProcessChatFolderNewChats extends TdFunction {
  /// **ProcessChatFolderNewChats** *(processChatFolderNewChats)* - TDLib function
  ///
  /// Processes new chats added to a shareable chat folder by its owner.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  /// * [addedChatIds]: Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet.
  ///
  /// [Ok] is returned on completion.
  const ProcessChatFolderNewChats({
    required this.chatFolderId,
    required this.addedChatIds,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet
  final List<int> addedChatIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "added_chat_ids": addedChatIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  /// * [added_chat_ids]: Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet
  ProcessChatFolderNewChats copyWith({
    int? chatFolderId,
    List<int>? addedChatIds,
  }) =>
      ProcessChatFolderNewChats(
        chatFolderId: chatFolderId ?? this.chatFolderId,
        addedChatIds: addedChatIds ?? this.addedChatIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'processChatFolderNewChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
