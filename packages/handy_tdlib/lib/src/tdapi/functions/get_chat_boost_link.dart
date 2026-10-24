part of '../tdapi.dart';

/// **GetChatBoostLink** *(getChatBoostLink)* - TDLib function
///
/// Returns an HTTPS link to boost the specified supergroup or channel chat.
///
/// * [chatId]: Identifier of the chat.
///
/// [ChatBoostLink] is returned on completion.
final class GetChatBoostLink extends TdFunction {
  /// **GetChatBoostLink** *(getChatBoostLink)* - TDLib function
  ///
  /// Returns an HTTPS link to boost the specified supergroup or channel chat.
  ///
  /// * [chatId]: Identifier of the chat.
  ///
  /// [ChatBoostLink] is returned on completion.
  const GetChatBoostLink({
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
  GetChatBoostLink copyWith({
    int? chatId,
  }) =>
      GetChatBoostLink(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatBoostLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
