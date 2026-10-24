part of '../tdapi.dart';

/// **GetMessageThread** *(getMessageThread)* - TDLib function
///
/// Returns information about a message thread. Can be used only if messageProperties.can_get_message_thread == true.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message.
///
/// [MessageThreadInfo] is returned on completion.
final class GetMessageThread extends TdFunction {
  /// **GetMessageThread** *(getMessageThread)* - TDLib function
  ///
  /// Returns information about a message thread. Can be used only if messageProperties.can_get_message_thread == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message.
  ///
  /// [MessageThreadInfo] is returned on completion.
  const GetMessageThread({
    required this.chatId,
    required this.messageId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Identifier of the message
  GetMessageThread copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetMessageThread(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageThread';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
