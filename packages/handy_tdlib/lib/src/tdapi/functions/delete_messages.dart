part of '../tdapi.dart';

/// **DeleteMessages** *(deleteMessages)* - TDLib function
///
/// Deletes messages.
///
/// * [chatId]: Chat identifier.
/// * [messageIds]: Identifiers of the messages to be deleted. Use messageProperties.can_be_deleted_only_for_self and messageProperties.can_be_deleted_for_all_users to get suitable messages.
/// * [revoke]: Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats.
///
/// [Ok] is returned on completion.
final class DeleteMessages extends TdFunction {
  /// **DeleteMessages** *(deleteMessages)* - TDLib function
  ///
  /// Deletes messages.
  ///
  /// * [chatId]: Chat identifier.
  /// * [messageIds]: Identifiers of the messages to be deleted. Use messageProperties.can_be_deleted_only_for_self and messageProperties.can_be_deleted_for_all_users to get suitable messages.
  /// * [revoke]: Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats.
  ///
  /// [Ok] is returned on completion.
  const DeleteMessages({
    required this.chatId,
    required this.messageIds,
    required this.revoke,
  });

  /// Chat identifier
  final int chatId;

  /// Identifiers of the messages to be deleted. Use messageProperties.can_be_deleted_only_for_self and messageProperties.can_be_deleted_for_all_users to get suitable messages
  final List<int> messageIds;

  /// Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats
  final bool revoke;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_ids": messageIds.map((i) => i).toList(),
      "revoke": revoke,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [message_ids]: Identifiers of the messages to be deleted. Use messageProperties.can_be_deleted_only_for_self and messageProperties.can_be_deleted_for_all_users to get suitable messages
  /// * [revoke]: Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats
  DeleteMessages copyWith({
    int? chatId,
    List<int>? messageIds,
    bool? revoke,
  }) =>
      DeleteMessages(
        chatId: chatId ?? this.chatId,
        messageIds: messageIds ?? this.messageIds,
        revoke: revoke ?? this.revoke,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
