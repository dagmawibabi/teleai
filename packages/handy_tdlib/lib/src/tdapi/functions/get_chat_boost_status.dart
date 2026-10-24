part of '../tdapi.dart';

/// **GetChatBoostStatus** *(getChatBoostStatus)* - TDLib function
///
/// Returns the current boost status for a supergroup or a channel chat.
///
/// * [chatId]: Identifier of the chat.
///
/// [ChatBoostStatus] is returned on completion.
final class GetChatBoostStatus extends TdFunction {
  /// **GetChatBoostStatus** *(getChatBoostStatus)* - TDLib function
  ///
  /// Returns the current boost status for a supergroup or a channel chat.
  ///
  /// * [chatId]: Identifier of the chat.
  ///
  /// [ChatBoostStatus] is returned on completion.
  const GetChatBoostStatus({
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
  GetChatBoostStatus copyWith({
    int? chatId,
  }) =>
      GetChatBoostStatus(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatBoostStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
