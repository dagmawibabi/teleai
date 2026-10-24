part of '../tdapi.dart';

/// **ReadAllChatMentions** *(readAllChatMentions)* - TDLib function
///
/// Marks all mentions in a chat as read.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class ReadAllChatMentions extends TdFunction {
  /// **ReadAllChatMentions** *(readAllChatMentions)* - TDLib function
  ///
  /// Marks all mentions in a chat as read.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const ReadAllChatMentions({
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
  ReadAllChatMentions copyWith({
    int? chatId,
  }) =>
      ReadAllChatMentions(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readAllChatMentions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
