part of '../tdapi.dart';

/// **GetMessageViewers** *(getMessageViewers)* - TDLib function
///
/// Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users,. opened content of the message, are returned. The method can be called if messageProperties.can_get_viewers == true.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message.
///
/// [MessageViewers] is returned on completion.
final class GetMessageViewers extends TdFunction {
  /// **GetMessageViewers** *(getMessageViewers)* - TDLib function
  ///
  /// Returns viewers of a recent outgoing message in a basic group or a supergroup chat. For video notes and voice notes only users,. opened content of the message, are returned. The method can be called if messageProperties.can_get_viewers == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message.
  ///
  /// [MessageViewers] is returned on completion.
  const GetMessageViewers({
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
  GetMessageViewers copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetMessageViewers(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageViewers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
