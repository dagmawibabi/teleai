part of '../tdapi.dart';

/// **SetChatDescription** *(setChatDescription)* - TDLib function
///
/// Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right.
///
/// * [chatId]: Identifier of the chat.
/// * [description]: New chat description; 0-255 characters.
///
/// [Ok] is returned on completion.
final class SetChatDescription extends TdFunction {
  /// **SetChatDescription** *(setChatDescription)* - TDLib function
  ///
  /// Changes information about a chat. Available for basic groups, supergroups, and channels. Requires can_change_info member right.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [description]: New chat description; 0-255 characters.
  ///
  /// [Ok] is returned on completion.
  const SetChatDescription({
    required this.chatId,
    required this.description,
  });

  /// Identifier of the chat
  final int chatId;

  /// New chat description; 0-255 characters
  final String description;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "description": description,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [description]: New chat description; 0-255 characters
  SetChatDescription copyWith({
    int? chatId,
    String? description,
  }) =>
      SetChatDescription(
        chatId: chatId ?? this.chatId,
        description: description ?? this.description,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatDescription';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
