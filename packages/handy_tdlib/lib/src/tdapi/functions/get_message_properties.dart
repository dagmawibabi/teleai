part of '../tdapi.dart';

/// **GetMessageProperties** *(getMessageProperties)* - TDLib function
///
/// Returns properties of a message. This is an offline method.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message.
///
/// [MessageProperties] is returned on completion.
final class GetMessageProperties extends TdFunction {
  /// **GetMessageProperties** *(getMessageProperties)* - TDLib function
  ///
  /// Returns properties of a message. This is an offline method.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message.
  ///
  /// [MessageProperties] is returned on completion.
  const GetMessageProperties({
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
  GetMessageProperties copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetMessageProperties(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageProperties';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
