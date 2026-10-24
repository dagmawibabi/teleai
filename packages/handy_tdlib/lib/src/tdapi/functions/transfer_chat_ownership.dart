part of '../tdapi.dart';

/// **TransferChatOwnership** *(transferChatOwnership)* - TDLib function
///
/// Changes the owner of a chat; for basic groups, supergroups and channel chats only; requires owner privileges in the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session.
///
/// * [chatId]: Chat identifier.
/// * [userId]: Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user.
/// * [password]: The 2-step verification password of the current user.
///
/// [Ok] is returned on completion.
final class TransferChatOwnership extends TdFunction {
  /// **TransferChatOwnership** *(transferChatOwnership)* - TDLib function
  ///
  /// Changes the owner of a chat; for basic groups, supergroups and channel chats only; requires owner privileges in the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session.
  ///
  /// * [chatId]: Chat identifier.
  /// * [userId]: Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user.
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [Ok] is returned on completion.
  const TransferChatOwnership({
    required this.chatId,
    required this.userId,
    required this.password,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user
  final int userId;

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "user_id": userId,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [user_id]: Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user
  /// * [password]: The 2-step verification password of the current user
  TransferChatOwnership copyWith({
    int? chatId,
    int? userId,
    String? password,
  }) =>
      TransferChatOwnership(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'transferChatOwnership';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
