part of '../tdapi.dart';

/// **DeleteChatFolder** *(deleteChatFolder)* - TDLib function
///
/// Deletes existing chat folder.
///
/// * [chatFolderId]: Chat folder identifier.
/// * [leaveChatIds]: Identifiers of the chats to leave. The chats must be pinned or always included in the folder.
///
/// [Ok] is returned on completion.
final class DeleteChatFolder extends TdFunction {
  /// **DeleteChatFolder** *(deleteChatFolder)* - TDLib function
  ///
  /// Deletes existing chat folder.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  /// * [leaveChatIds]: Identifiers of the chats to leave. The chats must be pinned or always included in the folder.
  ///
  /// [Ok] is returned on completion.
  const DeleteChatFolder({
    required this.chatFolderId,
    required this.leaveChatIds,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// Identifiers of the chats to leave. The chats must be pinned or always included in the folder
  final List<int> leaveChatIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "leave_chat_ids": leaveChatIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  /// * [leave_chat_ids]: Identifiers of the chats to leave. The chats must be pinned or always included in the folder
  DeleteChatFolder copyWith({
    int? chatFolderId,
    List<int>? leaveChatIds,
  }) =>
      DeleteChatFolder(
        chatFolderId: chatFolderId ?? this.chatFolderId,
        leaveChatIds: leaveChatIds ?? this.leaveChatIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
