part of '../tdapi.dart';

/// **RemoveChatActionBar** *(removeChatActionBar)* - TDLib function
///
/// Removes a chat action bar without any other action.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class RemoveChatActionBar extends TdFunction {
  /// **RemoveChatActionBar** *(removeChatActionBar)* - TDLib function
  ///
  /// Removes a chat action bar without any other action.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const RemoveChatActionBar({
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
  RemoveChatActionBar copyWith({
    int? chatId,
  }) =>
      RemoveChatActionBar(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'removeChatActionBar';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
