part of '../tdapi.dart';

/// **SetChatSlowModeDelay** *(setChatSlowModeDelay)* - TDLib function
///
/// Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members administrator right.
///
/// * [chatId]: Chat identifier.
/// * [slowModeDelay]: New slow mode delay for the chat, in seconds; must be one of 0, 5, 10, 30, 60, 300, 900, 3600.
///
/// [Ok] is returned on completion.
final class SetChatSlowModeDelay extends TdFunction {
  /// **SetChatSlowModeDelay** *(setChatSlowModeDelay)* - TDLib function
  ///
  /// Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [slowModeDelay]: New slow mode delay for the chat, in seconds; must be one of 0, 5, 10, 30, 60, 300, 900, 3600.
  ///
  /// [Ok] is returned on completion.
  const SetChatSlowModeDelay({
    required this.chatId,
    required this.slowModeDelay,
  });

  /// Chat identifier
  final int chatId;

  /// New slow mode delay for the chat, in seconds; must be one of 0, 5, 10, 30, 60, 300, 900, 3600
  final int slowModeDelay;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "slow_mode_delay": slowModeDelay,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [slow_mode_delay]: New slow mode delay for the chat, in seconds; must be one of 0, 5, 10, 30, 60, 300, 900, 3600
  SetChatSlowModeDelay copyWith({
    int? chatId,
    int? slowModeDelay,
  }) =>
      SetChatSlowModeDelay(
        chatId: chatId ?? this.chatId,
        slowModeDelay: slowModeDelay ?? this.slowModeDelay,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatSlowModeDelay';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
