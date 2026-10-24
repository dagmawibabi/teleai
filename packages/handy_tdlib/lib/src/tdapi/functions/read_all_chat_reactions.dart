part of '../tdapi.dart';

/// **ReadAllChatReactions** *(readAllChatReactions)* - TDLib function
///
/// Marks all reactions in a chat as read.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class ReadAllChatReactions extends TdFunction {
  /// **ReadAllChatReactions** *(readAllChatReactions)* - TDLib function
  ///
  /// Marks all reactions in a chat as read.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const ReadAllChatReactions({
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
  ReadAllChatReactions copyWith({
    int? chatId,
  }) =>
      ReadAllChatReactions(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'readAllChatReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
