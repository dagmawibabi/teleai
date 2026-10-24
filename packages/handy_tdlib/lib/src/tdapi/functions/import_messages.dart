part of '../tdapi.dart';

/// **ImportMessages** *(importMessages)* - TDLib function
///
/// Imports messages exported from another application.
///
/// * [chatId]: Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right.
/// * [messageFile]: File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded.
/// * [attachedFiles]: Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded.
///
/// [Ok] is returned on completion.
final class ImportMessages extends TdFunction {
  /// **ImportMessages** *(importMessages)* - TDLib function
  ///
  /// Imports messages exported from another application.
  ///
  /// * [chatId]: Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right.
  /// * [messageFile]: File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded.
  /// * [attachedFiles]: Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded.
  ///
  /// [Ok] is returned on completion.
  const ImportMessages({
    required this.chatId,
    required this.messageFile,
    required this.attachedFiles,
  });

  /// Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
  final int chatId;

  /// File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
  final InputFile messageFile;

  /// Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
  final List<InputFile> attachedFiles;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_file": messageFile.toJson(),
      "attached_files": attachedFiles.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info member right
  /// * [message_file]: File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
  /// * [attached_files]: Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
  ImportMessages copyWith({
    int? chatId,
    InputFile? messageFile,
    List<InputFile>? attachedFiles,
  }) =>
      ImportMessages(
        chatId: chatId ?? this.chatId,
        messageFile: messageFile ?? this.messageFile,
        attachedFiles: attachedFiles ?? this.attachedFiles,
      );

  /// TDLib object type
  static const String defaultObjectId = 'importMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
