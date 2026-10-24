part of '../tdapi.dart';

/// **CloseChat** *(closeChat)* - TDLib function
///
/// Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class CloseChat extends TdFunction {
  /// **CloseChat** *(closeChat)* - TDLib function
  ///
  /// Informs TDLib that the chat is closed by the user. Many useful activities depend on the chat being opened or closed.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const CloseChat({
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
  CloseChat copyWith({
    int? chatId,
  }) =>
      CloseChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closeChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
