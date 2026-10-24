part of '../tdapi.dart';

/// **GetUserChatBoosts** *(getUserChatBoosts)* - TDLib function
///
/// Returns the list of boosts applied to a chat by a given user; requires administrator rights in the chat; for bots only.
///
/// * [chatId]: Identifier of the chat.
/// * [userId]: Identifier of the user.
///
/// [FoundChatBoosts] is returned on completion.
final class GetUserChatBoosts extends TdFunction {
  /// **GetUserChatBoosts** *(getUserChatBoosts)* - TDLib function
  ///
  /// Returns the list of boosts applied to a chat by a given user; requires administrator rights in the chat; for bots only.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [userId]: Identifier of the user.
  ///
  /// [FoundChatBoosts] is returned on completion.
  const GetUserChatBoosts({
    required this.chatId,
    required this.userId,
  });

  /// Identifier of the chat
  final int chatId;

  /// Identifier of the user
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [user_id]: Identifier of the user
  GetUserChatBoosts copyWith({
    int? chatId,
    int? userId,
  }) =>
      GetUserChatBoosts(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUserChatBoosts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
