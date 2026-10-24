part of '../tdapi.dart';

/// **GetChatListsToAddChat** *(getChatListsToAddChat)* - TDLib function
///
/// Returns chat lists to which the chat can be added. This is an offline method.
///
/// * [chatId]: Chat identifier.
///
/// [ChatLists] is returned on completion.
final class GetChatListsToAddChat extends TdFunction {
  /// **GetChatListsToAddChat** *(getChatListsToAddChat)* - TDLib function
  ///
  /// Returns chat lists to which the chat can be added. This is an offline method.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatLists] is returned on completion.
  const GetChatListsToAddChat({
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
  GetChatListsToAddChat copyWith({
    int? chatId,
  }) =>
      GetChatListsToAddChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatListsToAddChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
