part of '../tdapi.dart';

/// **GetChatAdministrators** *(getChatAdministrators)* - TDLib function
///
/// Returns a list of administrators of the chat with their custom titles.
///
/// * [chatId]: Chat identifier.
///
/// [ChatAdministrators] is returned on completion.
final class GetChatAdministrators extends TdFunction {
  /// **GetChatAdministrators** *(getChatAdministrators)* - TDLib function
  ///
  /// Returns a list of administrators of the chat with their custom titles.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatAdministrators] is returned on completion.
  const GetChatAdministrators({
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
  GetChatAdministrators copyWith({
    int? chatId,
  }) =>
      GetChatAdministrators(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatAdministrators';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
