part of '../tdapi.dart';

/// **GetFullRichMessage** *(getFullRichMessage)* - TDLib function
///
/// Returns the full version of a rich message.
///
/// * [chatId]: Identifier of the chat the message belongs to.
/// * [messageId]: Identifier of the message.
///
/// [RichMessage] is returned on completion.
final class GetFullRichMessage extends TdFunction {
  /// **GetFullRichMessage** *(getFullRichMessage)* - TDLib function
  ///
  /// Returns the full version of a rich message.
  ///
  /// * [chatId]: Identifier of the chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  ///
  /// [RichMessage] is returned on completion.
  const GetFullRichMessage({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat the message belongs to
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
  /// * [chat_id]: Identifier of the chat the message belongs to
  /// * [message_id]: Identifier of the message
  GetFullRichMessage copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetFullRichMessage(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getFullRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
