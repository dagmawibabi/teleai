part of '../tdapi.dart';

/// **DeleteEphemeralMessage** *(deleteEphemeralMessage)* - TDLib function
///
/// Deletes an ephemeral message; for bots only.
///
/// * [chatId]: Chat identifier.
/// * [receiverUserId]: Identifier of the user who received the message.
/// * [ephemeralMessageId]: Identifier of the message to be deleted.
///
/// [Ok] is returned on completion.
final class DeleteEphemeralMessage extends TdFunction {
  /// **DeleteEphemeralMessage** *(deleteEphemeralMessage)* - TDLib function
  ///
  /// Deletes an ephemeral message; for bots only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [receiverUserId]: Identifier of the user who received the message.
  /// * [ephemeralMessageId]: Identifier of the message to be deleted.
  ///
  /// [Ok] is returned on completion.
  const DeleteEphemeralMessage({
    required this.chatId,
    required this.receiverUserId,
    required this.ephemeralMessageId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the user who received the message
  final int receiverUserId;

  /// Identifier of the message to be deleted
  final int ephemeralMessageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "receiver_user_id": receiverUserId,
      "ephemeral_message_id": ephemeralMessageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [receiver_user_id]: Identifier of the user who received the message
  /// * [ephemeral_message_id]: Identifier of the message to be deleted
  DeleteEphemeralMessage copyWith({
    int? chatId,
    int? receiverUserId,
    int? ephemeralMessageId,
  }) =>
      DeleteEphemeralMessage(
        chatId: chatId ?? this.chatId,
        receiverUserId: receiverUserId ?? this.receiverUserId,
        ephemeralMessageId: ephemeralMessageId ?? this.ephemeralMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteEphemeralMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
