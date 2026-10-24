part of '../tdapi.dart';

/// **UnpinAllChatMessages** *(unpinAllChatMessages)* - TDLib function
///
/// Removes all pinned messages from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel.
///
/// * [chatId]: Identifier of the chat.
///
/// [Ok] is returned on completion.
final class UnpinAllChatMessages extends TdFunction {
  /// **UnpinAllChatMessages** *(unpinAllChatMessages)* - TDLib function
  ///
  /// Removes all pinned messages from a chat; requires can_pin_messages member right if the chat is a basic group or supergroup, or can_edit_messages administrator right if the chat is a channel.
  ///
  /// * [chatId]: Identifier of the chat.
  ///
  /// [Ok] is returned on completion.
  const UnpinAllChatMessages({
    required this.chatId,
  });

  /// Identifier of the chat
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
  /// * [chat_id]: Identifier of the chat
  UnpinAllChatMessages copyWith({
    int? chatId,
  }) =>
      UnpinAllChatMessages(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'unpinAllChatMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
