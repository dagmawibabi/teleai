part of '../tdapi.dart';

/// **GetPollVoteStatistics** *(getPollVoteStatistics)* - TDLib function
///
/// Returns statistics of poll votes in a poll.
///
/// * [chatId]: Identifier of the chat to which the poll belongs.
/// * [messageId]: Identifier of the message containing the poll. Use messageProperties.can_get_poll_vote_statistics to check whether the method can be used for a message.
/// * [isDark]: Pass true if a dark theme is used by the application.
///
/// [PollVoteStatistics] is returned on completion.
final class GetPollVoteStatistics extends TdFunction {
  /// **GetPollVoteStatistics** *(getPollVoteStatistics)* - TDLib function
  ///
  /// Returns statistics of poll votes in a poll.
  ///
  /// * [chatId]: Identifier of the chat to which the poll belongs.
  /// * [messageId]: Identifier of the message containing the poll. Use messageProperties.can_get_poll_vote_statistics to check whether the method can be used for a message.
  /// * [isDark]: Pass true if a dark theme is used by the application.
  ///
  /// [PollVoteStatistics] is returned on completion.
  const GetPollVoteStatistics({
    required this.chatId,
    required this.messageId,
    required this.isDark,
  });

  /// Identifier of the chat to which the poll belongs
  final int chatId;

  /// Identifier of the message containing the poll. Use messageProperties.can_get_poll_vote_statistics to check whether the method can be used for a message
  final int messageId;

  /// Pass true if a dark theme is used by the application
  final bool isDark;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "is_dark": isDark,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat to which the poll belongs
  /// * [message_id]: Identifier of the message containing the poll. Use messageProperties.can_get_poll_vote_statistics to check whether the method can be used for a message
  /// * [is_dark]: Pass true if a dark theme is used by the application
  GetPollVoteStatistics copyWith({
    int? chatId,
    int? messageId,
    bool? isDark,
  }) =>
      GetPollVoteStatistics(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        isDark: isDark ?? this.isDark,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPollVoteStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
