part of '../tdapi.dart';

/// **GetChatAvailableMessageSenders** *(getChatAvailableMessageSenders)* - TDLib function
///
/// Returns the list of message sender identifiers, which can be used to send messages in a chat.
///
/// * [chatId]: Chat identifier.
///
/// [ChatMessageSenders] is returned on completion.
final class GetChatAvailableMessageSenders extends TdFunction {
  /// **GetChatAvailableMessageSenders** *(getChatAvailableMessageSenders)* - TDLib function
  ///
  /// Returns the list of message sender identifiers, which can be used to send messages in a chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatMessageSenders] is returned on completion.
  const GetChatAvailableMessageSenders({
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
  GetChatAvailableMessageSenders copyWith({
    int? chatId,
  }) =>
      GetChatAvailableMessageSenders(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatAvailableMessageSenders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
