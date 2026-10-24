part of '../tdapi.dart';

/// **SetChatMemberTag** *(setChatMemberTag)* - TDLib function
///
/// Changes the tag or custom title of a chat member; requires can_manage_tags administrator right to change tag of other users; for basic groups and supergroups only.
///
/// * [chatId]: Chat identifier.
/// * [userId]: Identifier of the user whose tag is changed. Chats can't have member tags.
/// * [tag]: The new tag of the member in the chat; 0-16 characters without emoji.
///
/// [Ok] is returned on completion.
final class SetChatMemberTag extends TdFunction {
  /// **SetChatMemberTag** *(setChatMemberTag)* - TDLib function
  ///
  /// Changes the tag or custom title of a chat member; requires can_manage_tags administrator right to change tag of other users; for basic groups and supergroups only.
  ///
  /// * [chatId]: Chat identifier.
  /// * [userId]: Identifier of the user whose tag is changed. Chats can't have member tags.
  /// * [tag]: The new tag of the member in the chat; 0-16 characters without emoji.
  ///
  /// [Ok] is returned on completion.
  const SetChatMemberTag({
    required this.chatId,
    required this.userId,
    required this.tag,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the user whose tag is changed. Chats can't have member tags
  final int userId;

  /// The new tag of the member in the chat; 0-16 characters without emoji
  final String tag;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "user_id": userId,
      "tag": tag,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [user_id]: Identifier of the user whose tag is changed. Chats can't have member tags
  /// * [tag]: The new tag of the member in the chat; 0-16 characters without emoji
  SetChatMemberTag copyWith({
    int? chatId,
    int? userId,
    String? tag,
  }) =>
      SetChatMemberTag(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
        tag: tag ?? this.tag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatMemberTag';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
