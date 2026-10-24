part of '../tdapi.dart';

/// **ReportChat** *(reportChat)* - TDLib function
///
/// Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, if chat.can_be_reported, or if messageProperties.can_report_chat.
///
/// * [chatId]: Chat identifier.
/// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
/// * [messageIds]: Identifiers of reported messages. Use messageProperties.can_report_chat to check whether the message can be reported.
/// * [text]: Additional report details if asked by the server; 0-1024 characters; leave empty for the initial request.
///
/// [ReportChatResult] is returned on completion.
final class ReportChat extends TdFunction {
  /// **ReportChat** *(reportChat)* - TDLib function
  ///
  /// Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, if chat.can_be_reported, or if messageProperties.can_report_chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
  /// * [messageIds]: Identifiers of reported messages. Use messageProperties.can_report_chat to check whether the message can be reported.
  /// * [text]: Additional report details if asked by the server; 0-1024 characters; leave empty for the initial request.
  ///
  /// [ReportChatResult] is returned on completion.
  const ReportChat({
    required this.chatId,
    required this.optionId,
    required this.messageIds,
    required this.text,
  });

  /// Chat identifier
  final int chatId;

  /// Option identifier chosen by the user; leave empty for the initial request
  final String optionId;

  /// Identifiers of reported messages. Use messageProperties.can_report_chat to check whether the message can be reported
  final List<int> messageIds;

  /// Additional report details if asked by the server; 0-1024 characters; leave empty for the initial request
  final String text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "option_id": optionId,
      "message_ids": messageIds.map((i) => i).toList(),
      "text": text,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [option_id]: Option identifier chosen by the user; leave empty for the initial request
  /// * [message_ids]: Identifiers of reported messages. Use messageProperties.can_report_chat to check whether the message can be reported
  /// * [text]: Additional report details if asked by the server; 0-1024 characters; leave empty for the initial request
  ReportChat copyWith({
    int? chatId,
    String? optionId,
    List<int>? messageIds,
    String? text,
  }) =>
      ReportChat(
        chatId: chatId ?? this.chatId,
        optionId: optionId ?? this.optionId,
        messageIds: messageIds ?? this.messageIds,
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
