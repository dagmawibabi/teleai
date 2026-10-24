part of '../tdapi.dart';

/// **GetChatMessageByDate** *(getChatMessageByDate)* - TDLib function
///
/// Returns the last message sent in a chat no later than the specified date. Returns a 404 error if such message doesn't exist.
///
/// * [chatId]: Chat identifier.
/// * [date]: Point in time (Unix timestamp) relative to which to search for messages.
///
/// [Message] is returned on completion.
final class GetChatMessageByDate extends TdFunction {
  /// **GetChatMessageByDate** *(getChatMessageByDate)* - TDLib function
  ///
  /// Returns the last message sent in a chat no later than the specified date. Returns a 404 error if such message doesn't exist.
  ///
  /// * [chatId]: Chat identifier.
  /// * [date]: Point in time (Unix timestamp) relative to which to search for messages.
  ///
  /// [Message] is returned on completion.
  const GetChatMessageByDate({
    required this.chatId,
    required this.date,
  });

  /// Chat identifier
  final int chatId;

  /// Point in time (Unix timestamp) relative to which to search for messages
  final int date;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "date": date,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [date]: Point in time (Unix timestamp) relative to which to search for messages
  GetChatMessageByDate copyWith({
    int? chatId,
    int? date,
  }) =>
      GetChatMessageByDate(
        chatId: chatId ?? this.chatId,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatMessageByDate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
