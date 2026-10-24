part of '../tdapi.dart';

/// **SetChatAvailableReactions** *(setChatAvailableReactions)* - TDLib function
///
/// Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right.
///
/// * [chatId]: Identifier of the chat.
/// * [availableReactions]: Reactions available in the chat. All explicitly specified emoji reactions must be active. In channel chats up to the chat's boost level custom emoji reactions can be explicitly specified.
///
/// [Ok] is returned on completion.
final class SetChatAvailableReactions extends TdFunction {
  /// **SetChatAvailableReactions** *(setChatAvailableReactions)* - TDLib function
  ///
  /// Changes reactions, available in a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [availableReactions]: Reactions available in the chat. All explicitly specified emoji reactions must be active. In channel chats up to the chat's boost level custom emoji reactions can be explicitly specified.
  ///
  /// [Ok] is returned on completion.
  const SetChatAvailableReactions({
    required this.chatId,
    required this.availableReactions,
  });

  /// Identifier of the chat
  final int chatId;

  /// Reactions available in the chat. All explicitly specified emoji reactions must be active. In channel chats up to the chat's boost level custom emoji reactions can be explicitly specified
  final ChatAvailableReactions availableReactions;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "available_reactions": availableReactions.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [available_reactions]: Reactions available in the chat. All explicitly specified emoji reactions must be active. In channel chats up to the chat's boost level custom emoji reactions can be explicitly specified
  SetChatAvailableReactions copyWith({
    int? chatId,
    ChatAvailableReactions? availableReactions,
  }) =>
      SetChatAvailableReactions(
        chatId: chatId ?? this.chatId,
        availableReactions: availableReactions ?? this.availableReactions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatAvailableReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
