part of '../tdapi.dart';

/// **AddPollOption** *(addPollOption)* - TDLib function
///
/// Adds an option to a poll.
///
/// * [chatId]: Identifier of the chat to which the poll belongs.
/// * [messageId]: Identifier of the message containing the poll. Use messagePoll.can_add_option to check whether an option can be added.
/// * [option]: The new option.
///
/// [Ok] is returned on completion.
final class AddPollOption extends TdFunction {
  /// **AddPollOption** *(addPollOption)* - TDLib function
  ///
  /// Adds an option to a poll.
  ///
  /// * [chatId]: Identifier of the chat to which the poll belongs.
  /// * [messageId]: Identifier of the message containing the poll. Use messagePoll.can_add_option to check whether an option can be added.
  /// * [option]: The new option.
  ///
  /// [Ok] is returned on completion.
  const AddPollOption({
    required this.chatId,
    required this.messageId,
    required this.option,
  });

  /// Identifier of the chat to which the poll belongs
  final int chatId;

  /// Identifier of the message containing the poll. Use messagePoll.can_add_option to check whether an option can be added
  final int messageId;

  /// The new option
  final InputPollOption option;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "option": option.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the poll belongs
  /// * [message_id]: Identifier of the message containing the poll. Use messagePoll.can_add_option to check whether an option can be added
  /// * [option]: The new option
  AddPollOption copyWith({
    int? chatId,
    int? messageId,
    InputPollOption? option,
  }) =>
      AddPollOption(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        option: option ?? this.option,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addPollOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
