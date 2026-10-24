part of '../tdapi.dart';

/// **GetPollVoters** *(getPollVoters)* - TDLib function
///
/// Returns message senders voted for the specified option in a poll; use poll.can_get_voters to check whether the method can be used.. For optimal performance, the number of returned users is chosen by TDLib.
///
/// * [chatId]: Identifier of the chat to which the poll belongs.
/// * [messageId]: Identifier of the message containing the poll.
/// * [optionId]: 0-based identifier of the answer option.
/// * [offset]: Number of voters to skip in the result; must be non-negative.
/// * [limit]: The maximum number of voters to be returned; must be positive and can't be greater than 50. For optimal performance,. the number of returned voters is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached.
///
/// [PollVoters] is returned on completion.
final class GetPollVoters extends TdFunction {
  /// **GetPollVoters** *(getPollVoters)* - TDLib function
  ///
  /// Returns message senders voted for the specified option in a poll; use poll.can_get_voters to check whether the method can be used.. For optimal performance, the number of returned users is chosen by TDLib.
  ///
  /// * [chatId]: Identifier of the chat to which the poll belongs.
  /// * [messageId]: Identifier of the message containing the poll.
  /// * [optionId]: 0-based identifier of the answer option.
  /// * [offset]: Number of voters to skip in the result; must be non-negative.
  /// * [limit]: The maximum number of voters to be returned; must be positive and can't be greater than 50. For optimal performance,. the number of returned voters is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached.
  ///
  /// [PollVoters] is returned on completion.
  const GetPollVoters({
    required this.chatId,
    required this.messageId,
    required this.optionId,
    required this.offset,
    required this.limit,
  });

  /// Identifier of the chat to which the poll belongs
  final int chatId;

  /// Identifier of the message containing the poll
  final int messageId;

  /// 0-based identifier of the answer option
  final int optionId;

  /// Number of voters to skip in the result; must be non-negative
  final int offset;

  /// The maximum number of voters to be returned; must be positive and can't be greater than 50. For optimal performance,. the number of returned voters is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "option_id": optionId,
      "offset": offset,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the poll belongs
  /// * [message_id]: Identifier of the message containing the poll
  /// * [option_id]: 0-based identifier of the answer option
  /// * [offset]: Number of voters to skip in the result; must be non-negative
  /// * [limit]: The maximum number of voters to be returned; must be positive and can't be greater than 50. For optimal performance,. the number of returned voters is chosen by TDLib and can be smaller than the specified limit, even if the end of the voter list has not been reached
  GetPollVoters copyWith({
    int? chatId,
    int? messageId,
    int? optionId,
    int? offset,
    int? limit,
  }) =>
      GetPollVoters(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        optionId: optionId ?? this.optionId,
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPollVoters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
