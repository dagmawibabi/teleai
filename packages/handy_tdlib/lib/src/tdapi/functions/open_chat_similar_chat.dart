part of '../tdapi.dart';

/// **OpenChatSimilarChat** *(openChatSimilarChat)* - TDLib function
///
/// Informs TDLib that a chat was opened from the list of similar chats. The method is independent of openChat and closeChat methods.
///
/// * [chatId]: Identifier of the original chat, which similar chats were requested.
/// * [openedChatId]: Identifier of the opened chat.
///
/// [Ok] is returned on completion.
final class OpenChatSimilarChat extends TdFunction {
  /// **OpenChatSimilarChat** *(openChatSimilarChat)* - TDLib function
  ///
  /// Informs TDLib that a chat was opened from the list of similar chats. The method is independent of openChat and closeChat methods.
  ///
  /// * [chatId]: Identifier of the original chat, which similar chats were requested.
  /// * [openedChatId]: Identifier of the opened chat.
  ///
  /// [Ok] is returned on completion.
  const OpenChatSimilarChat({
    required this.chatId,
    required this.openedChatId,
  });

  /// Identifier of the original chat, which similar chats were requested
  final int chatId;

  /// Identifier of the opened chat
  final int openedChatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "opened_chat_id": openedChatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the original chat, which similar chats were requested
  /// * [opened_chat_id]: Identifier of the opened chat
  OpenChatSimilarChat copyWith({
    int? chatId,
    int? openedChatId,
  }) =>
      OpenChatSimilarChat(
        chatId: chatId ?? this.chatId,
        openedChatId: openedChatId ?? this.openedChatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'openChatSimilarChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
