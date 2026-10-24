part of '../tdapi.dart';

/// **GetChatPinnedMessage** *(getChatPinnedMessage)* - TDLib function
///
/// Returns information about the newest pinned message in the chat. Returns a 404 error if the message doesn't exist.
///
/// * [chatId]: Identifier of the chat the message belongs to.
///
/// [Message] is returned on completion.
final class GetChatPinnedMessage extends TdFunction {
  /// **GetChatPinnedMessage** *(getChatPinnedMessage)* - TDLib function
  ///
  /// Returns information about the newest pinned message in the chat. Returns a 404 error if the message doesn't exist.
  ///
  /// * [chatId]: Identifier of the chat the message belongs to.
  ///
  /// [Message] is returned on completion.
  const GetChatPinnedMessage({
    required this.chatId,
  });

  /// Identifier of the chat the message belongs to
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
  /// * [chat_id]: Identifier of the chat the message belongs to
  GetChatPinnedMessage copyWith({
    int? chatId,
  }) =>
      GetChatPinnedMessage(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatPinnedMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
