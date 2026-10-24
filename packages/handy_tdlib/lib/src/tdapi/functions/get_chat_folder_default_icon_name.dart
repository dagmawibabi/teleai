part of '../tdapi.dart';

/// **GetChatFolderDefaultIconName** *(getChatFolderDefaultIconName)* - TDLib function
///
/// Returns default icon name for a folder. Can be called synchronously.
///
/// * [folder]: Chat folder.
///
/// [ChatFolderIcon] is returned on completion.
final class GetChatFolderDefaultIconName extends TdFunction {
  /// **GetChatFolderDefaultIconName** *(getChatFolderDefaultIconName)* - TDLib function
  ///
  /// Returns default icon name for a folder. Can be called synchronously.
  ///
  /// * [folder]: Chat folder.
  ///
  /// [ChatFolderIcon] is returned on completion.
  const GetChatFolderDefaultIconName({
    required this.folder,
  });

  /// Chat folder
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
  /// * [folder]: Chat folder
  GetChatFolderDefaultIconName copyWith({
    ChatFolder? folder,
  }) =>
      GetChatFolderDefaultIconName(
        folder: folder ?? this.folder,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatFolderDefaultIconName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
