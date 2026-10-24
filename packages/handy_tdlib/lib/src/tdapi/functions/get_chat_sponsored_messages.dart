part of '../tdapi.dart';

/// **GetChatSponsoredMessages** *(getChatSponsoredMessages)* - TDLib function
///
/// Returns sponsored messages to be shown in a chat; for channel chats and chats with bots only.
///
/// * [chatId]: Identifier of the chat.
///
/// [SponsoredMessages] is returned on completion.
final class GetChatSponsoredMessages extends TdFunction {
  /// **GetChatSponsoredMessages** *(getChatSponsoredMessages)* - TDLib function
  ///
  /// Returns sponsored messages to be shown in a chat; for channel chats and chats with bots only.
  ///
  /// * [chatId]: Identifier of the chat.
  ///
  /// [SponsoredMessages] is returned on completion.
  const GetChatSponsoredMessages({
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
  GetChatSponsoredMessages copyWith({
    int? chatId,
  }) =>
      GetChatSponsoredMessages(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatSponsoredMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
