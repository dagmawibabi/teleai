part of '../tdapi.dart';

/// **DeleteMessageEphemeralContent** *(deleteMessageEphemeralContent)* - TDLib function
///
/// Removes message ephemeral content and reverts message state to the original.
///
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
///
/// [Ok] is returned on completion.
final class DeleteMessageEphemeralContent extends TdFunction {
  /// **DeleteMessageEphemeralContent** *(deleteMessageEphemeralContent)* - TDLib function
  ///
  /// Removes message ephemeral content and reverts message state to the original.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  ///
  /// [Ok] is returned on completion.
  const DeleteMessageEphemeralContent({
    required this.chatId,
    required this.messageId,
  });

  /// The chat the message belongs to
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
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  DeleteMessageEphemeralContent copyWith({
    int? chatId,
    int? messageId,
  }) =>
      DeleteMessageEphemeralContent(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteMessageEphemeralContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
