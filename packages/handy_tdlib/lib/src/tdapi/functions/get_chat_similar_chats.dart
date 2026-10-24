part of '../tdapi.dart';

/// **GetChatSimilarChats** *(getChatSimilarChats)* - TDLib function
///
/// Returns a list of chats similar to the given chat.
///
/// * [chatId]: Identifier of the target chat; must be an identifier of a channel chat.
///
/// [Chats] is returned on completion.
final class GetChatSimilarChats extends TdFunction {
  /// **GetChatSimilarChats** *(getChatSimilarChats)* - TDLib function
  ///
  /// Returns a list of chats similar to the given chat.
  ///
  /// * [chatId]: Identifier of the target chat; must be an identifier of a channel chat.
  ///
  /// [Chats] is returned on completion.
  const GetChatSimilarChats({
    required this.chatId,
  });

  /// Identifier of the target chat; must be an identifier of a channel chat
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
  /// * [chat_id]: Identifier of the target chat; must be an identifier of a channel chat
  GetChatSimilarChats copyWith({
    int? chatId,
  }) =>
      GetChatSimilarChats(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatSimilarChats';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
