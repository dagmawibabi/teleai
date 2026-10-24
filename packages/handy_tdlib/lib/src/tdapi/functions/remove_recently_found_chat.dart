part of '../tdapi.dart';

/// **RemoveRecentlyFoundChat** *(removeRecentlyFoundChat)* - TDLib function
///
/// Removes a chat from the list of recently found chats.
///
/// * [chatId]: Identifier of the chat to be removed.
///
/// [Ok] is returned on completion.
final class RemoveRecentlyFoundChat extends TdFunction {
  /// **RemoveRecentlyFoundChat** *(removeRecentlyFoundChat)* - TDLib function
  ///
  /// Removes a chat from the list of recently found chats.
  ///
  /// * [chatId]: Identifier of the chat to be removed.
  ///
  /// [Ok] is returned on completion.
  const RemoveRecentlyFoundChat({
    required this.chatId,
  });

  /// Identifier of the chat to be removed
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
  /// * [chat_id]: Identifier of the chat to be removed
  RemoveRecentlyFoundChat copyWith({
    int? chatId,
  }) =>
      RemoveRecentlyFoundChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeRecentlyFoundChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
