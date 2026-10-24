part of '../tdapi.dart';

/// **ChatInviteLinkMember** *(chatInviteLinkMember)* - basic class
///
/// Describes a chat member joined a chat via an invite link.
///
/// * [userId]: User identifier.
/// * [joinedChatDate]: Point in time (Unix timestamp) when the user joined the chat.
/// * [viaChatFolderInviteLink]: True, if the user has joined the chat using an invite link for a chat folder.
/// * [approverUserId]: User identifier of the chat administrator, approved user join request.
final class ChatInviteLinkMember extends TdObject {
  /// **ChatInviteLinkMember** *(chatInviteLinkMember)* - basic class
  ///
  /// Describes a chat member joined a chat via an invite link.
  ///
  /// * [userId]: User identifier.
  /// * [joinedChatDate]: Point in time (Unix timestamp) when the user joined the chat.
  /// * [viaChatFolderInviteLink]: True, if the user has joined the chat using an invite link for a chat folder.
  /// * [approverUserId]: User identifier of the chat administrator, approved user join request.
  const ChatInviteLinkMember({
    required this.userId,
    required this.joinedChatDate,
    required this.viaChatFolderInviteLink,
    required this.approverUserId,
  });

  /// User identifier
  final int userId;

  /// Point in time (Unix timestamp) when the user joined the chat
  final int joinedChatDate;

  /// True, if the user has joined the chat using an invite link for a chat folder
  final bool viaChatFolderInviteLink;

  /// User identifier of the chat administrator, approved user join request
  final int approverUserId;

  /// Parse from a json
  factory ChatInviteLinkMember.fromJson(Map<String, dynamic> json) =>
      ChatInviteLinkMember(
        userId: json['user_id'],
        joinedChatDate: json['joined_chat_date'],
        viaChatFolderInviteLink: json['via_chat_folder_invite_link'],
        approverUserId: json['approver_user_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "joined_chat_date": joinedChatDate,
      "via_chat_folder_invite_link": viaChatFolderInviteLink,
      "approver_user_id": approverUserId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [joined_chat_date]: Point in time (Unix timestamp) when the user joined the chat
  /// * [via_chat_folder_invite_link]: True, if the user has joined the chat using an invite link for a chat folder
  /// * [approver_user_id]: User identifier of the chat administrator, approved user join request
  ChatInviteLinkMember copyWith({
    int? userId,
    int? joinedChatDate,
    bool? viaChatFolderInviteLink,
    int? approverUserId,
  }) =>
      ChatInviteLinkMember(
        userId: userId ?? this.userId,
        joinedChatDate: joinedChatDate ?? this.joinedChatDate,
        viaChatFolderInviteLink:
            viaChatFolderInviteLink ?? this.viaChatFolderInviteLink,
        approverUserId: approverUserId ?? this.approverUserId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatInviteLinkMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
