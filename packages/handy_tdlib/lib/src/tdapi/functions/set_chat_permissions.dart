part of '../tdapi.dart';

/// **SetChatPermissions** *(setChatPermissions)* - TDLib function
///
/// Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right.
///
/// * [chatId]: Chat identifier.
/// * [permissions]: New non-administrator members permissions in the chat.
///
/// [Ok] is returned on completion.
final class SetChatPermissions extends TdFunction {
  /// **SetChatPermissions** *(setChatPermissions)* - TDLib function
  ///
  /// Changes the chat members permissions. Supported only for basic groups and supergroups. Requires can_restrict_members administrator right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [permissions]: New non-administrator members permissions in the chat.
  ///
  /// [Ok] is returned on completion.
  const SetChatPermissions({
    required this.chatId,
    required this.permissions,
  });

  /// Chat identifier
  final int chatId;

  /// New non-administrator members permissions in the chat
  final ChatPermissions permissions;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "permissions": permissions.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [permissions]: New non-administrator members permissions in the chat
  SetChatPermissions copyWith({
    int? chatId,
    ChatPermissions? permissions,
  }) =>
      SetChatPermissions(
        chatId: chatId ?? this.chatId,
        permissions: permissions ?? this.permissions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatPermissions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
