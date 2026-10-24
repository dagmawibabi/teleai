part of '../tdapi.dart';

/// **GetMessageAuthor** *(getMessageAuthor)* - TDLib function
///
/// Returns information about actual author of a message sent on behalf of a channel. The method can be called if messageProperties.can_get_author == true.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message.
///
/// [User] is returned on completion.
final class GetMessageAuthor extends TdFunction {
  /// **GetMessageAuthor** *(getMessageAuthor)* - TDLib function
  ///
  /// Returns information about actual author of a message sent on behalf of a channel. The method can be called if messageProperties.can_get_author == true.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message.
  ///
  /// [User] is returned on completion.
  const GetMessageAuthor({
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
  GetMessageAuthor copyWith({
    int? chatId,
    int? messageId,
  }) =>
      GetMessageAuthor(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMessageAuthor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
