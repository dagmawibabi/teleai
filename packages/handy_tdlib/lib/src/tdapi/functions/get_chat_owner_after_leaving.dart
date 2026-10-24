part of '../tdapi.dart';

/// **GetChatOwnerAfterLeaving** *(getChatOwnerAfterLeaving)* - TDLib function
///
/// Returns the user who will become the owner of the chat after 7 days if the current user does not return to the supergroup or channel during that period or immediately for basic groups;. requires owner privileges in the chat. Available only for basic groups, supergroups, and channel chats.
///
/// * [chatId]: Chat identifier.
///
/// [User] is returned on completion.
final class GetChatOwnerAfterLeaving extends TdFunction {
  /// **GetChatOwnerAfterLeaving** *(getChatOwnerAfterLeaving)* - TDLib function
  ///
  /// Returns the user who will become the owner of the chat after 7 days if the current user does not return to the supergroup or channel during that period or immediately for basic groups;. requires owner privileges in the chat. Available only for basic groups, supergroups, and channel chats.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [User] is returned on completion.
  const GetChatOwnerAfterLeaving({
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
  GetChatOwnerAfterLeaving copyWith({
    int? chatId,
  }) =>
      GetChatOwnerAfterLeaving(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatOwnerAfterLeaving';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
