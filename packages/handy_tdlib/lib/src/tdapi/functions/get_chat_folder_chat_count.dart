part of '../tdapi.dart';

/// **GetChatFolderChatCount** *(getChatFolderChatCount)* - TDLib function
///
/// Returns approximate number of chats in a being created chat folder. Main and archive chat lists must be fully preloaded for this function to work correctly.
///
/// * [folder]: The new chat folder.
///
/// [Count] is returned on completion.
final class GetChatFolderChatCount extends TdFunction {
  /// **GetChatFolderChatCount** *(getChatFolderChatCount)* - TDLib function
  ///
  /// Returns approximate number of chats in a being created chat folder. Main and archive chat lists must be fully preloaded for this function to work correctly.
  ///
  /// * [folder]: The new chat folder.
  ///
  /// [Count] is returned on completion.
  const GetChatFolderChatCount({
    required this.folder,
  });

  /// The new chat folder
  final ChatFolder folder;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "folder": folder.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [folder]: The new chat folder
  GetChatFolderChatCount copyWith({
    ChatFolder? folder,
  }) =>
      GetChatFolderChatCount(
        folder: folder ?? this.folder,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatFolderChatCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
