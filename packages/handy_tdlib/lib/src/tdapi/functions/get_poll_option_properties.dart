part of '../tdapi.dart';

/// **GetPollOptionProperties** *(getPollOptionProperties)* - TDLib function
///
/// Returns properties of a poll option. This is an offline method.
///
/// * [chatId]: Chat identifier.
/// * [messageId]: Identifier of the message.
/// * [pollOptionId]: Unique identifier of the answer option, which properties will be returned.
///
/// [PollOptionProperties] is returned on completion.
final class GetPollOptionProperties extends TdFunction {
  /// **GetPollOptionProperties** *(getPollOptionProperties)* - TDLib function
  ///
  /// Returns properties of a poll option. This is an offline method.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageId]: Identifier of the message.
  /// * [pollOptionId]: Unique identifier of the answer option, which properties will be returned.
  ///
  /// [PollOptionProperties] is returned on completion.
  const GetPollOptionProperties({
    required this.chatId,
    required this.messageId,
    required this.pollOptionId,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// Unique identifier of the answer option, which properties will be returned
  final String pollOptionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "poll_option_id": pollOptionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_id]: Identifier of the message
  /// * [poll_option_id]: Unique identifier of the answer option, which properties will be returned
  GetPollOptionProperties copyWith({
    int? chatId,
    int? messageId,
    String? pollOptionId,
  }) =>
      GetPollOptionProperties(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        pollOptionId: pollOptionId ?? this.pollOptionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPollOptionProperties';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
