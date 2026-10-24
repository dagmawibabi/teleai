part of '../tdapi.dart';

/// **LeaveChat** *(leaveChat)* - TDLib function
///
/// Removes the current user from chat members. Private and secret chats can't be left using this method.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class LeaveChat extends TdFunction {
  /// **LeaveChat** *(leaveChat)* - TDLib function
  ///
  /// Removes the current user from chat members. Private and secret chats can't be left using this method.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const LeaveChat({
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
  LeaveChat copyWith({
    int? chatId,
  }) =>
      LeaveChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'leaveChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
