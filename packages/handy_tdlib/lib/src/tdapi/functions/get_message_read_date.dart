part of '../tdapi.dart';

/// **GetMessageReadDate** *(getMessageReadDate)* - TDLib function
///
/// Returns read date of a recent outgoing message in a private chat. The method can be called if messageProperties.can_get_read_date == true.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message.
///
/// [MessageReadDate] is returned on completion.
final class GetMessageReadDate extends TdFunction {
  /// **GetMessageReadDate** *(getMessageReadDate)* - TDLib function
  ///
  /// Returns read date of a recent outgoing message in a private chat. The method can be called if messageProperties.can_get_read_date == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message.
  ///
  /// [MessageReadDate] is returned on completion.
  const GetMessageReadDate({
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
  GetMessageReadDate copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetMessageReadDate(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageReadDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
