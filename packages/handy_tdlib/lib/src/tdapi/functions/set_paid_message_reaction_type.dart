part of '../tdapi.dart';

/// **SetPaidMessageReactionType** *(setPaidMessageReactionType)* - TDLib function
///
/// Changes type of paid message reaction of the current user on a message. The message must have paid reaction added by the current user.
///
/// * [chatId]: Identifier of the chat to which the message belongs.
/// * [messageId]: Identifier of the message.
/// * [type]: New type of the paid reaction.
///
/// [Ok] is returned on completion.
final class SetPaidMessageReactionType extends TdFunction {
  /// **SetPaidMessageReactionType** *(setPaidMessageReactionType)* - TDLib function
  ///
  /// Changes type of paid message reaction of the current user on a message. The message must have paid reaction added by the current user.
  ///
  /// * [chatId]: Identifier of the chat to which the message belongs.
  /// * [messageId]: Identifier of the message.
  /// * [type]: New type of the paid reaction.
  ///
  /// [Ok] is returned on completion.
  const SetPaidMessageReactionType({
    required this.chatId,
    required this.messageId,
    required this.type,
  });

  /// Identifier of the chat to which the message belongs
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// New type of the paid reaction
  final PaidReactionType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the message belongs
  /// * [message_id]: Identifier of the message
  /// * [type]: New type of the paid reaction
  SetPaidMessageReactionType copyWith({
    int? chatId,
    int? messageId,
    PaidReactionType? type,
  }) =>
      SetPaidMessageReactionType(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPaidMessageReactionType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
