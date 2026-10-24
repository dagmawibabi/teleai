part of '../tdapi.dart';

/// **CreateChatFolder** *(createChatFolder)* - TDLib function
///
/// Creates new chat folder. Returns information about the created chat folder. There can be up to getOption("chat_folder_count_max") chat folders, but the limit can be increased with Telegram Premium.
///
/// * [folder]: The new chat folder.
///
/// [ChatFolderInfo] is returned on completion.
final class CreateChatFolder extends TdFunction {
  /// **CreateChatFolder** *(createChatFolder)* - TDLib function
  ///
  /// Creates new chat folder. Returns information about the created chat folder. There can be up to getOption("chat_folder_count_max") chat folders, but the limit can be increased with Telegram Premium.
  ///
  /// * [folder]: The new chat folder.
  ///
  /// [ChatFolderInfo] is returned on completion.
  const CreateChatFolder({
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
  CreateChatFolder copyWith({
    ChatFolder? folder,
  }) =>
      CreateChatFolder(
        folder: folder ?? this.folder,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createChatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
