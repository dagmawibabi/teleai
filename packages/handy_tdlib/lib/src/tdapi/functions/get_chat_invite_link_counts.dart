part of '../tdapi.dart';

/// **GetChatInviteLinkCounts** *(getChatInviteLinkCounts)* - TDLib function
///
/// Returns the list of chat administrators with number of their invite links. Requires owner privileges in the chat.
///
/// * [chatId]: Chat identifier.
///
/// [ChatInviteLinkCounts] is returned on completion.
final class GetChatInviteLinkCounts extends TdFunction {
  /// **GetChatInviteLinkCounts** *(getChatInviteLinkCounts)* - TDLib function
  ///
  /// Returns the list of chat administrators with number of their invite links. Requires owner privileges in the chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatInviteLinkCounts] is returned on completion.
  const GetChatInviteLinkCounts({
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
  GetChatInviteLinkCounts copyWith({
    int? chatId,
  }) =>
      GetChatInviteLinkCounts(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatInviteLinkCounts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
