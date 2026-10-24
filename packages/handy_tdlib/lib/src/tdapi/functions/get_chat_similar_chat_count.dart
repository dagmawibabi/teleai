part of '../tdapi.dart';

/// **GetChatSimilarChatCount** *(getChatSimilarChatCount)* - TDLib function
///
/// Returns approximate number of chats similar to the given chat.
///
/// * [chatId]: Identifier of the target chat; must be an identifier of a channel chat.
/// * [returnLocal]: Pass true to get the number of chats without sending network requests, or -1 if the number of chats is unknown locally.
///
/// [Count] is returned on completion.
final class GetChatSimilarChatCount extends TdFunction {
  /// **GetChatSimilarChatCount** *(getChatSimilarChatCount)* - TDLib function
  ///
  /// Returns approximate number of chats similar to the given chat.
  ///
  /// * [chatId]: Identifier of the target chat; must be an identifier of a channel chat.
  /// * [returnLocal]: Pass true to get the number of chats without sending network requests, or -1 if the number of chats is unknown locally.
  ///
  /// [Count] is returned on completion.
  const GetChatSimilarChatCount({
    required this.chatId,
    required this.returnLocal,
  });

  /// Identifier of the target chat; must be an identifier of a channel chat
  final int chatId;

  /// Pass true to get the number of chats without sending network requests, or -1 if the number of chats is unknown locally
  final bool returnLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "return_local": returnLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the target chat; must be an identifier of a channel chat
  /// * [return_local]: Pass true to get the number of chats without sending network requests, or -1 if the number of chats is unknown locally
  GetChatSimilarChatCount copyWith({
    int? chatId,
    bool? returnLocal,
  }) =>
      GetChatSimilarChatCount(
        chatId: chatId ?? this.chatId,
        returnLocal: returnLocal ?? this.returnLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatSimilarChatCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
