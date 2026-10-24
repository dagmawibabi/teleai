part of '../tdapi.dart';

/// **EditChatFolder** *(editChatFolder)* - TDLib function
///
/// Edits existing chat folder. Returns information about the edited chat folder.
///
/// * [chatFolderId]: Chat folder identifier.
/// * [folder]: The edited chat folder.
///
/// [ChatFolderInfo] is returned on completion.
final class EditChatFolder extends TdFunction {
  /// **EditChatFolder** *(editChatFolder)* - TDLib function
  ///
  /// Edits existing chat folder. Returns information about the edited chat folder.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  /// * [folder]: The edited chat folder.
  ///
  /// [ChatFolderInfo] is returned on completion.
  const EditChatFolder({
    required this.chatFolderId,
    required this.folder,
  });

  /// Chat folder identifier
  final int chatFolderId;

  /// The edited chat folder
  final ChatFolder folder;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_folder_id": chatFolderId,
      "folder": folder.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_id]: Chat folder identifier
  /// * [folder]: The edited chat folder
  EditChatFolder copyWith({
    int? chatFolderId,
    ChatFolder? folder,
  }) =>
      EditChatFolder(
        chatFolderId: chatFolderId ?? this.chatFolderId,
        folder: folder ?? this.folder,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editChatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
