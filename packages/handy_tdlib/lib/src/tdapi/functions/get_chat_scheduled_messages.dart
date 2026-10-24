part of '../tdapi.dart';

/// **GetChatScheduledMessages** *(getChatScheduledMessages)* - TDLib function
///
/// Returns all scheduled messages in a chat. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id).
///
/// * [chatId]: Chat identifier.
///
/// [Messages] is returned on completion.
final class GetChatScheduledMessages extends TdFunction {
  /// **GetChatScheduledMessages** *(getChatScheduledMessages)* - TDLib function
  ///
  /// Returns all scheduled messages in a chat. The messages are returned in reverse chronological order (i.e., in order of decreasing message_id).
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Messages] is returned on completion.
  const GetChatScheduledMessages({
    required this.chatId,
  });

  /// Chat identifier
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  GetChatScheduledMessages copyWith({
    int? chatId,
  }) =>
      GetChatScheduledMessages(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatScheduledMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
