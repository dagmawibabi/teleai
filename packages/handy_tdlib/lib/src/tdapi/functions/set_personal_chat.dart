part of '../tdapi.dart';

/// **SetPersonalChat** *(setPersonalChat)* - TDLib function
///
/// Changes the personal chat of the current user.
///
/// * [chatId]: Identifier of the new personal chat; pass 0 to remove the chat. Use getSuitablePersonalChats to get suitable chats.
///
/// [Ok] is returned on completion.
final class SetPersonalChat extends TdFunction {
  /// **SetPersonalChat** *(setPersonalChat)* - TDLib function
  ///
  /// Changes the personal chat of the current user.
  ///
  /// * [chatId]: Identifier of the new personal chat; pass 0 to remove the chat. Use getSuitablePersonalChats to get suitable chats.
  ///
  /// [Ok] is returned on completion.
  const SetPersonalChat({
    required this.chatId,
  });

  /// Identifier of the new personal chat; pass 0 to remove the chat. Use getSuitablePersonalChats to get suitable chats
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
  /// * [chat_id]: Identifier of the new personal chat; pass 0 to remove the chat. Use getSuitablePersonalChats to get suitable chats
  SetPersonalChat copyWith({
    int? chatId,
  }) =>
      SetPersonalChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPersonalChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
