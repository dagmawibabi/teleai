part of '../tdapi.dart';

/// **AddFileToDownloads** *(addFileToDownloads)* - TDLib function
///
/// Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates.. If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent of download using downloadFile,. i.e. it continues if downloadFile is canceled or is used to download a part of the file.
///
/// * [fileId]: Identifier of the file to download.
/// * [chatId]: Chat identifier of the message with the file.
/// * [messageId]: Message identifier.
/// * [priority]: Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first.
///
/// [File] is returned on completion.
final class AddFileToDownloads extends TdFunction {
  /// **AddFileToDownloads** *(addFileToDownloads)* - TDLib function
  ///
  /// Adds a file from a message to the list of file downloads. Download progress and completion of the download will be notified through updateFile updates.. If message database is used, the list of file downloads is persistent across application restarts. The downloading is independent of download using downloadFile,. i.e. it continues if downloadFile is canceled or is used to download a part of the file.
  ///
  /// * [fileId]: Identifier of the file to download.
  /// * [chatId]: Chat identifier of the message with the file.
  /// * [messageId]: Message identifier.
  /// * [priority]: Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first.
  ///
  /// [File] is returned on completion.
  const AddFileToDownloads({
    required this.fileId,
    required this.chatId,
    required this.messageId,
    required this.priority,
  });

  /// Identifier of the file to download
  final int fileId;

  /// Chat identifier of the message with the file
  final int chatId;

  /// Message identifier
  final int messageId;

  /// Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
  final int priority;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "chat_id": chatId,
      "message_id": messageId,
      "priority": priority,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the file to download
  /// * [chat_id]: Chat identifier of the message with the file
  /// * [message_id]: Message identifier
  /// * [priority]: Priority of the download (1-32). The higher the priority, the earlier the file will be downloaded. If the priorities of two files are equal, then the last one for which downloadFile/addFileToDownloads was called will be downloaded first
  AddFileToDownloads copyWith({
    int? fileId,
    int? chatId,
    int? messageId,
    int? priority,
  }) =>
      AddFileToDownloads(
        fileId: fileId ?? this.fileId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        priority: priority ?? this.priority,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addFileToDownloads';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
