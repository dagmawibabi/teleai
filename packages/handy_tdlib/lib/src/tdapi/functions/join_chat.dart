part of '../tdapi.dart';

/// **JoinChat** *(joinChat)* - TDLib function
///
/// Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method.
///
/// * [chatId]: Chat identifier.
///
/// [ChatJoinResult] is returned on completion.
final class JoinChat extends TdFunction {
  /// **JoinChat** *(joinChat)* - TDLib function
  ///
  /// Adds the current user as a new member to a chat. Private and secret chats can't be joined using this method.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatJoinResult] is returned on completion.
  const JoinChat({
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
  JoinChat copyWith({
    int? chatId,
  }) =>
      JoinChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'joinChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
