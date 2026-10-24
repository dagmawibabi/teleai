part of '../tdapi.dart';

/// **DeleteChat** *(deleteChat)* - TDLib function
///
/// Deletes a chat along with all messages in the corresponding chat for all chat members. For group chats this will release the usernames and remove all members.. Use the field chat.can_be_deleted_for_all_users to find whether the method can be applied to the chat.
///
/// * [chatId]: Chat identifier.
///
/// [Ok] is returned on completion.
final class DeleteChat extends TdFunction {
  /// **DeleteChat** *(deleteChat)* - TDLib function
  ///
  /// Deletes a chat along with all messages in the corresponding chat for all chat members. For group chats this will release the usernames and remove all members.. Use the field chat.can_be_deleted_for_all_users to find whether the method can be applied to the chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [Ok] is returned on completion.
  const DeleteChat({
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
  DeleteChat copyWith({
    int? chatId,
  }) =>
      DeleteChat(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
