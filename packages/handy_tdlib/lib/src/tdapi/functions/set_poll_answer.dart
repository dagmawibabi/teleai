part of '../tdapi.dart';

/// **SetPollAnswer** *(setPollAnswer)* - TDLib function
///
/// Changes the user answer to a poll.
///
/// * [chatId]: Identifier of the chat to which the poll belongs.
/// * [messageId]: Identifier of the message containing the poll.
/// * [optionIds]: 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only if the poll allows multiple answers.
///
/// [Ok] is returned on completion.
final class SetPollAnswer extends TdFunction {
  /// **SetPollAnswer** *(setPollAnswer)* - TDLib function
  ///
  /// Changes the user answer to a poll.
  ///
  /// * [chatId]: Identifier of the chat to which the poll belongs.
  /// * [messageId]: Identifier of the message containing the poll.
  /// * [optionIds]: 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only if the poll allows multiple answers.
  ///
  /// [Ok] is returned on completion.
  const SetPollAnswer({
    required this.chatId,
    required this.messageId,
    required this.optionIds,
  });

  /// Identifier of the chat to which the poll belongs
  final int chatId;

  /// Identifier of the message containing the poll
  final int messageId;

  /// 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only if the poll allows multiple answers
  final List<int> optionIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "option_ids": optionIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the poll belongs
  /// * [message_id]: Identifier of the message containing the poll
  /// * [option_ids]: 0-based identifiers of answer options, chosen by the user. User can choose more than 1 answer option only if the poll allows multiple answers
  SetPollAnswer copyWith({
    int? chatId,
    int? messageId,
    List<int>? optionIds,
  }) =>
      SetPollAnswer(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        optionIds: optionIds ?? this.optionIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPollAnswer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
