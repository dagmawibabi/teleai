part of '../tdapi.dart';

/// **AddChatMember** *(addChatMember)* - TDLib function
///
/// Adds a new member to a chat; requires can_invite_users member right. Members can't be added to private or secret chats. Returns information about members that weren't added.
///
/// * [chatId]: Chat identifier.
/// * [userId]: Identifier of the user.
/// * [forwardLimit]: The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot.
///
/// [FailedToAddMembers] is returned on completion.
final class AddChatMember extends TdFunction {
  /// **AddChatMember** *(addChatMember)* - TDLib function
  ///
  /// Adds a new member to a chat; requires can_invite_users member right. Members can't be added to private or secret chats. Returns information about members that weren't added.
  ///
  /// * [chatId]: Chat identifier.
  /// * [userId]: Identifier of the user.
  /// * [forwardLimit]: The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot.
  ///
  /// [FailedToAddMembers] is returned on completion.
  const AddChatMember({
    required this.chatId,
    required this.userId,
    required this.forwardLimit,
  });

  /// Chat identifier
  final int chatId;

  /// Identifier of the user
  final int userId;

  /// The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
  final int forwardLimit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "user_id": userId,
      "forward_limit": forwardLimit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [user_id]: Identifier of the user
  /// * [forward_limit]: The number of earlier messages from the chat to be forwarded to the new member; up to 100. Ignored for supergroups and channels, or if the added user is a bot
  AddChatMember copyWith({
    int? chatId,
    int? userId,
    int? forwardLimit,
  }) =>
      AddChatMember(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
        forwardLimit: forwardLimit ?? this.forwardLimit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addChatMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
