part of '../tdapi.dart';

/// **ToggleBusinessConnectedBotChatIsPaused** *(toggleBusinessConnectedBotChatIsPaused)* - TDLib function
///
/// Pauses or resumes the connected business bot in a specific chat.
///
/// * [chatId]: Chat identifier.
/// * [isPaused]: Pass true to pause the connected bot in the chat; pass false to resume the bot.
///
/// [Ok] is returned on completion.
final class ToggleBusinessConnectedBotChatIsPaused extends TdFunction {
  /// **ToggleBusinessConnectedBotChatIsPaused** *(toggleBusinessConnectedBotChatIsPaused)* - TDLib function
  ///
  /// Pauses or resumes the connected business bot in a specific chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isPaused]: Pass true to pause the connected bot in the chat; pass false to resume the bot.
  ///
  /// [Ok] is returned on completion.
  const ToggleBusinessConnectedBotChatIsPaused({
    required this.chatId,
    required this.isPaused,
  });

  /// Chat identifier
  final int chatId;

  /// Pass true to pause the connected bot in the chat; pass false to resume the bot
  final bool isPaused;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_paused": isPaused,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [is_paused]: Pass true to pause the connected bot in the chat; pass false to resume the bot
  ToggleBusinessConnectedBotChatIsPaused copyWith({
    int? chatId,
    bool? isPaused,
  }) =>
      ToggleBusinessConnectedBotChatIsPaused(
        chatId: chatId ?? this.chatId,
        isPaused: isPaused ?? this.isPaused,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'toggleBusinessConnectedBotChatIsPaused';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
