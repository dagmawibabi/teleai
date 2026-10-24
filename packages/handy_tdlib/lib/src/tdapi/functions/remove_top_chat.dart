part of '../tdapi.dart';

/// **RemoveTopChat** *(removeTopChat)* - TDLib function
///
/// Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled.
///
/// * [category]: Category of frequently used chats.
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class RemoveTopChat extends TdFunction {
  /// **RemoveTopChat** *(removeTopChat)* - TDLib function
  ///
  /// Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled.
  ///
  /// * [category]: Category of frequently used chats.
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const RemoveTopChat({
    required this.category,
    required this.chatId,
  });

  /// Category of frequently used chats
  final TopChatCategory category;

  /// Chat identifier
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "category": category.toJson(),
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [category]: Category of frequently used chats
  /// * [chat_id]: Chat identifier
  RemoveTopChat copyWith({
    TopChatCategory? category,
    int? chatId,
  }) =>
      RemoveTopChat(
        category: category ?? this.category,
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeTopChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
