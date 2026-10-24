part of '../tdapi.dart';

/// **ReportChatPhoto** *(reportChatPhoto)* - TDLib function
///
/// Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_reported.
///
/// * [chatId]: Chat identifier.
/// * [fileId]: Identifier of the photo to report. Only full photos from chatPhoto can be reported.
/// * [reason]: The reason for reporting the chat photo.
/// * [text]: Additional report details; 0-1024 characters.
///
/// [Ok] is returned on completion.
final class ReportChatPhoto extends TdFunction {
  /// **ReportChatPhoto** *(reportChatPhoto)* - TDLib function
  ///
  /// Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_reported.
  ///
  /// * [chatId]: Chat identifier.
  /// * [fileId]: Identifier of the photo to report. Only full photos from chatPhoto can be reported.
  /// * [reason]: The reason for reporting the chat photo.
  /// * [text]: Additional report details; 0-1024 characters.
  ///
  /// [Ok] is returned on completion.
  const ReportChatPhoto({
    required this.chatId,
    required this.fileId,
    required this.reason,
    required this.text,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the photo to report. Only full photos from chatPhoto can be reported
  final int fileId;

  /// The reason for reporting the chat photo
  final ReportReason reason;

  /// Additional report details; 0-1024 characters
  final String text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "file_id": fileId,
      "reason": reason.toJson(),
      "text": text,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [file_id]: Identifier of the photo to report. Only full photos from chatPhoto can be reported
  /// * [reason]: The reason for reporting the chat photo
  /// * [text]: Additional report details; 0-1024 characters
  ReportChatPhoto copyWith({
    int? chatId,
    int? fileId,
    ReportReason? reason,
    String? text,
  }) =>
      ReportChatPhoto(
        chatId: chatId ?? this.chatId,
        fileId: fileId ?? this.fileId,
        reason: reason ?? this.reason,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
