part of '../tdapi.dart';

/// **ProcessChatHasProtectedContentDisableRequest** *(processChatHasProtectedContentDisableRequest)* - TDLib function
///
/// Processes request to disable has_protected_content in a chat.
///
/// * [chatId]: Chat identifier.
/// * [requestMessageId]: Identifier of the message with the request. The message must be incoming and have content of the type messageChatHasProtectedContentDisableRequested.
/// * [approve]: Pass true to approve the request; pass false to reject the request.
///
/// [Ok] is returned on completion.
final class ProcessChatHasProtectedContentDisableRequest extends TdFunction {
  /// **ProcessChatHasProtectedContentDisableRequest** *(processChatHasProtectedContentDisableRequest)* - TDLib function
  ///
  /// Processes request to disable has_protected_content in a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [requestMessageId]: Identifier of the message with the request. The message must be incoming and have content of the type messageChatHasProtectedContentDisableRequested.
  /// * [approve]: Pass true to approve the request; pass false to reject the request.
  ///
  /// [Ok] is returned on completion.
  const ProcessChatHasProtectedContentDisableRequest({
    required this.chatId,
    required this.requestMessageId,
    required this.approve,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the message with the request. The message must be incoming and have content of the type messageChatHasProtectedContentDisableRequested
  final int requestMessageId;

  /// Pass true to approve the request; pass false to reject the request
  final bool approve;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "request_message_id": requestMessageId,
      "approve": approve,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [request_message_id]: Identifier of the message with the request. The message must be incoming and have content of the type messageChatHasProtectedContentDisableRequested
  /// * [approve]: Pass true to approve the request; pass false to reject the request
  ProcessChatHasProtectedContentDisableRequest copyWith({
    int? chatId,
    int? requestMessageId,
    bool? approve,
  }) =>
      ProcessChatHasProtectedContentDisableRequest(
        chatId: chatId ?? this.chatId,
        requestMessageId: requestMessageId ?? this.requestMessageId,
        approve: approve ?? this.approve,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'processChatHasProtectedContentDisableRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
