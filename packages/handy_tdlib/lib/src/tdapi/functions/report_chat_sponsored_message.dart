part of '../tdapi.dart';

/// **ReportChatSponsoredMessage** *(reportChatSponsoredMessage)* - TDLib function
///
/// Reports a sponsored message to Telegram moderators.
///
/// * [chatId]: Chat identifier of the sponsored message.
/// * [messageId]: Identifier of the sponsored message.
/// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
///
/// [ReportSponsoredResult] is returned on completion.
final class ReportChatSponsoredMessage extends TdFunction {
  /// **ReportChatSponsoredMessage** *(reportChatSponsoredMessage)* - TDLib function
  ///
  /// Reports a sponsored message to Telegram moderators.
  ///
  /// * [chatId]: Chat identifier of the sponsored message.
  /// * [messageId]: Identifier of the sponsored message.
  /// * [optionId]: Option identifier chosen by the user; leave empty for the initial request.
  ///
  /// [ReportSponsoredResult] is returned on completion.
  const ReportChatSponsoredMessage({
    required this.chatId,
    required this.messageId,
    required this.optionId,
  });

  /// Chat identifier of the sponsored message
  final int chatId;

  /// Identifier of the sponsored message
  final int messageId;

  /// Option identifier chosen by the user; leave empty for the initial request
  final String optionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "option_id": optionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the sponsored message
  /// * [message_id]: Identifier of the sponsored message
  /// * [option_id]: Option identifier chosen by the user; leave empty for the initial request
  ReportChatSponsoredMessage copyWith({
    int? chatId,
    int? messageId,
    String? optionId,
  }) =>
      ReportChatSponsoredMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        optionId: optionId ?? this.optionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'reportChatSponsoredMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
