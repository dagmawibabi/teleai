part of '../tdapi.dart';

/// **GetChatAvailablePaidMessageReactionSenders** *(getChatAvailablePaidMessageReactionSenders)* - TDLib function
///
/// Returns the list of message sender identifiers, which can be used to send a paid reaction in a chat.
///
/// * [chatId]: Chat identifier.
///
/// [MessageSenders] is returned on completion.
final class GetChatAvailablePaidMessageReactionSenders extends TdFunction {
  /// **GetChatAvailablePaidMessageReactionSenders** *(getChatAvailablePaidMessageReactionSenders)* - TDLib function
  ///
  /// Returns the list of message sender identifiers, which can be used to send a paid reaction in a chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [MessageSenders] is returned on completion.
  const GetChatAvailablePaidMessageReactionSenders({
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
  GetChatAvailablePaidMessageReactionSenders copyWith({
    int? chatId,
  }) =>
      GetChatAvailablePaidMessageReactionSenders(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'getChatAvailablePaidMessageReactionSenders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
