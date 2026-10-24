part of '../tdapi.dart';

/// **GetChat** *(getChat)* - TDLib function
///
/// Returns information about a chat by its identifier. This is an offline method if the current user is not a bot.
///
/// * [chatId]: Chat identifier.
///
/// [Chat] is returned on completion.
final class GetChat extends TdFunction {
  /// **GetChat** *(getChat)* - TDLib function
  ///
  /// Returns information about a chat by its identifier. This is an offline method if the current user is not a bot.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Chat] is returned on completion.
  const GetChat({
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
  GetChat copyWith({
    int? chatId,
  }) =>
      GetChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
