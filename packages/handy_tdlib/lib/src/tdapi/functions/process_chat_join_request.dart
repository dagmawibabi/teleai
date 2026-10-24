part of '../tdapi.dart';

/// **ProcessChatJoinRequest** *(processChatJoinRequest)* - TDLib function
///
/// Handles a pending join request in a chat.
///
/// * [chatId]: Chat identifier.
/// * [userId]: Identifier of the user who sent the request.
/// * [approve]: Pass true to approve the request; pass false to decline it.
///
/// [Ok] is returned on completion.
final class ProcessChatJoinRequest extends TdFunction {
  /// **ProcessChatJoinRequest** *(processChatJoinRequest)* - TDLib function
  ///
  /// Handles a pending join request in a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [userId]: Identifier of the user who sent the request.
  /// * [approve]: Pass true to approve the request; pass false to decline it.
  ///
  /// [Ok] is returned on completion.
  const ProcessChatJoinRequest({
    required this.chatId,
    required this.userId,
    required this.approve,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the user who sent the request
  final int userId;

  /// Pass true to approve the request; pass false to decline it
  final bool approve;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "user_id": userId,
      "approve": approve,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [user_id]: Identifier of the user who sent the request
  /// * [approve]: Pass true to approve the request; pass false to decline it
  ProcessChatJoinRequest copyWith({
    int? chatId,
    int? userId,
    bool? approve,
  }) =>
      ProcessChatJoinRequest(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
        approve: approve ?? this.approve,
      );

  /// TDLib object type
  static const String defaultObjectId = 'processChatJoinRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
