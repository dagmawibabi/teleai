part of '../tdapi.dart';

/// **GetChatFolderInviteLinks** *(getChatFolderInviteLinks)* - TDLib function
///
/// Returns invite links created by the current user for a shareable chat folder.
///
/// * [chatFolderId]: Chat folder identifier.
///
/// [ChatFolderInviteLinks] is returned on completion.
final class GetChatFolderInviteLinks extends TdFunction {
  /// **GetChatFolderInviteLinks** *(getChatFolderInviteLinks)* - TDLib function
  ///
  /// Returns invite links created by the current user for a shareable chat folder.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  ///
  /// [ChatFolderInviteLinks] is returned on completion.
  const GetChatFolderInviteLinks({
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
  GetChatFolderInviteLinks copyWith({
    int? chatFolderId,
  }) =>
      GetChatFolderInviteLinks(
        chatFolderId: chatFolderId ?? this.chatFolderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatFolderInviteLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
