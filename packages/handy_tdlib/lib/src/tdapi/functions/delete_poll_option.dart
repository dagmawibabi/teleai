part of '../tdapi.dart';

/// **DeletePollOption** *(deletePollOption)* - TDLib function
///
/// Deletes an option from a poll.
///
/// * [chatId]: Identifier of the chat to which the poll belongs.
/// * [messageId]: Identifier of the message containing the poll.
/// * [optionId]: Unique identifier of the option. Use pollOptionProperties.can_be_deleted to check whether the option can be deleted by the user.
///
/// [Ok] is returned on completion.
final class DeletePollOption extends TdFunction {
  /// **DeletePollOption** *(deletePollOption)* - TDLib function
  ///
  /// Deletes an option from a poll.
  ///
  /// * [chatId]: Identifier of the chat to which the poll belongs.
  /// * [messageId]: Identifier of the message containing the poll.
  /// * [optionId]: Unique identifier of the option. Use pollOptionProperties.can_be_deleted to check whether the option can be deleted by the user.
  ///
  /// [Ok] is returned on completion.
  const DeletePollOption({
    required this.chatId,
    required this.messageId,
    required this.optionId,
  });

  /// Identifier of the chat to which the poll belongs
  final int chatId;

  /// Identifier of the message containing the poll
  final int messageId;

  /// Unique identifier of the option. Use pollOptionProperties.can_be_deleted to check whether the option can be deleted by the user
  final String optionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "option_id": optionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the poll belongs
  /// * [message_id]: Identifier of the message containing the poll
  /// * [option_id]: Unique identifier of the option. Use pollOptionProperties.can_be_deleted to check whether the option can be deleted by the user
  DeletePollOption copyWith({
    int? chatId,
    int? messageId,
    String? optionId,
  }) =>
      DeletePollOption(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        optionId: optionId ?? this.optionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deletePollOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
