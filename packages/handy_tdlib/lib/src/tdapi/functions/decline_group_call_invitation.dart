part of '../tdapi.dart';

/// **DeclineGroupCallInvitation** *(declineGroupCallInvitation)* - TDLib function
///
/// Declines an invitation to an active group call via messageGroupCall. Can be called both by the sender and the receiver of the invitation.
///
/// * [chatId]: Identifier of the chat with the message.
/// * [messageId]: Identifier of the message of the type messageGroupCall.
///
/// [Ok] is returned on completion.
final class DeclineGroupCallInvitation extends TdFunction {
  /// **DeclineGroupCallInvitation** *(declineGroupCallInvitation)* - TDLib function
  ///
  /// Declines an invitation to an active group call via messageGroupCall. Can be called both by the sender and the receiver of the invitation.
  ///
  /// * [chatId]: Identifier of the chat with the message.
  /// * [messageId]: Identifier of the message of the type messageGroupCall.
  ///
  /// [Ok] is returned on completion.
  const DeclineGroupCallInvitation({
    required this.chatId,
    required this.messageId,
  });

  /// Identifier of the chat with the message
  final int chatId;

  /// Identifier of the message of the type messageGroupCall
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
  /// * [chat_id]: Identifier of the chat with the message
  /// * [message_id]: Identifier of the message of the type messageGroupCall
  DeclineGroupCallInvitation copyWith({
    int? chatId,
    int? messageId,
  }) =>
      DeclineGroupCallInvitation(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'declineGroupCallInvitation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
