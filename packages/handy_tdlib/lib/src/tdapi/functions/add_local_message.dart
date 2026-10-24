part of '../tdapi.dart';

/// **AddLocalMessage** *(addLocalMessage)* - TDLib function
///
/// Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message.
///
/// * [chatId]: Target chat; channel direct messages chats aren't supported.
/// * [senderId]: Identifier of the sender of the message.
/// * [replyTo]: Information about the message or story to be replied; pass null if none *(optional)*.
/// * [disableNotification]: Pass true to disable notification for the message.
/// * [inputMessageContent]: The content of the message to be added.
///
/// [Message] is returned on completion.
final class AddLocalMessage extends TdFunction {
  /// **AddLocalMessage** *(addLocalMessage)* - TDLib function
  ///
  /// Adds a local message to a chat. The message is persistent across application restarts only if the message database is used. Returns the added message.
  ///
  /// * [chatId]: Target chat; channel direct messages chats aren't supported.
  /// * [senderId]: Identifier of the sender of the message.
  /// * [replyTo]: Information about the message or story to be replied; pass null if none *(optional)*.
  /// * [disableNotification]: Pass true to disable notification for the message.
  /// * [inputMessageContent]: The content of the message to be added.
  ///
  /// [Message] is returned on completion.
  const AddLocalMessage({
    required this.chatId,
    required this.senderId,
    this.replyTo,
    required this.disableNotification,
    required this.inputMessageContent,
  });

  /// Target chat; channel direct messages chats aren't supported
  final int chatId;

  /// Identifier of the sender of the message
  final MessageSender senderId;

  /// Information about the message or story to be replied; pass null if none
  final InputMessageReplyTo? replyTo;

  /// Pass true to disable notification for the message
  final bool disableNotification;

  /// The content of the message to be added
  final InputMessageContent inputMessageContent;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "sender_id": senderId.toJson(),
      "reply_to": replyTo?.toJson(),
      "disable_notification": disableNotification,
      "input_message_content": inputMessageContent.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Target chat; channel direct messages chats aren't supported
  /// * [sender_id]: Identifier of the sender of the message
  /// * [reply_to]: Information about the message or story to be replied; pass null if none
  /// * [disable_notification]: Pass true to disable notification for the message
  /// * [input_message_content]: The content of the message to be added
  AddLocalMessage copyWith({
    int? chatId,
    MessageSender? senderId,
    InputMessageReplyTo? replyTo,
    bool? disableNotification,
    InputMessageContent? inputMessageContent,
  }) =>
      AddLocalMessage(
        chatId: chatId ?? this.chatId,
        senderId: senderId ?? this.senderId,
        replyTo: replyTo ?? this.replyTo,
        disableNotification: disableNotification ?? this.disableNotification,
        inputMessageContent: inputMessageContent ?? this.inputMessageContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addLocalMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
