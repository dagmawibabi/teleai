part of '../tdapi.dart';

/// **RemoveBusinessConnectedBotFromChat** *(removeBusinessConnectedBotFromChat)* - TDLib function
///
/// Removes the connected business bot from a specific chat by adding the chat to businessRecipients.excluded_chat_ids.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class RemoveBusinessConnectedBotFromChat extends TdFunction {
  /// **RemoveBusinessConnectedBotFromChat** *(removeBusinessConnectedBotFromChat)* - TDLib function
  ///
  /// Removes the connected business bot from a specific chat by adding the chat to businessRecipients.excluded_chat_ids.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const RemoveBusinessConnectedBotFromChat({
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
  RemoveBusinessConnectedBotFromChat copyWith({
    int? chatId,
  }) =>
      RemoveBusinessConnectedBotFromChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeBusinessConnectedBotFromChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
