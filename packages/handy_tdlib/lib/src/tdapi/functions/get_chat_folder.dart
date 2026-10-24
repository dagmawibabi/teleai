part of '../tdapi.dart';

/// **GetChatFolder** *(getChatFolder)* - TDLib function
///
/// Returns information about a chat folder by its identifier.
///
/// * [chatFolderId]: Chat folder identifier.
///
/// [ChatFolder] is returned on completion.
final class GetChatFolder extends TdFunction {
  /// **GetChatFolder** *(getChatFolder)* - TDLib function
  ///
  /// Returns information about a chat folder by its identifier.
  ///
  /// * [chatFolderId]: Chat folder identifier.
  ///
  /// [ChatFolder] is returned on completion.
  const GetChatFolder({
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
  GetChatFolder copyWith({
    int? chatFolderId,
  }) =>
      GetChatFolder(
        chatFolderId: chatFolderId ?? this.chatFolderId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
