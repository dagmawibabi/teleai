part of '../tdapi.dart';

/// **AddRecentlyFoundChat** *(addRecentlyFoundChat)* - TDLib function
///
/// Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first.
///
/// * [chatId]: Identifier of the chat to add.
///
/// [Ok] is returned on completion.
final class AddRecentlyFoundChat extends TdFunction {
  /// **AddRecentlyFoundChat** *(addRecentlyFoundChat)* - TDLib function
  ///
  /// Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first.
  ///
  /// * [chatId]: Identifier of the chat to add.
  ///
  /// [Ok] is returned on completion.
  const AddRecentlyFoundChat({
    required this.chatId,
  });

  /// Identifier of the chat to add
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
  /// * [chat_id]: Identifier of the chat to add
  AddRecentlyFoundChat copyWith({
    int? chatId,
  }) =>
      AddRecentlyFoundChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addRecentlyFoundChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
