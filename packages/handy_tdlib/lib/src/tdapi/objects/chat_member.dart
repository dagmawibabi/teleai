part of '../tdapi.dart';

/// **ChatMember** *(chatMember)* - basic class
///
/// Describes a user or a chat as a member of another chat.
///
/// * [memberId]: Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels.
/// * [tag]: Tag of the chat member or its custom title if the member is an administrator of the chat; 0-16 characters without emoji; applicable to basic groups and supergroups only.
/// * [inviterUserId]: Identifier of a user who invited/promoted/banned this member in the chat; 0 if unknown.
/// * [joinedChatDate]: Point in time (Unix timestamp) when the user joined/was promoted/was banned in the chat.
/// * [status]: Status of the member in the chat.
final class ChatMember extends TdObject {
  /// **ChatMember** *(chatMember)* - basic class
  ///
  /// Describes a user or a chat as a member of another chat.
  ///
  /// * [memberId]: Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels.
  /// * [tag]: Tag of the chat member or its custom title if the member is an administrator of the chat; 0-16 characters without emoji; applicable to basic groups and supergroups only.
  /// * [inviterUserId]: Identifier of a user who invited/promoted/banned this member in the chat; 0 if unknown.
  /// * [joinedChatDate]: Point in time (Unix timestamp) when the user joined/was promoted/was banned in the chat.
  /// * [status]: Status of the member in the chat.
  const ChatMember({
    required this.memberId,
    required this.tag,
    required this.inviterUserId,
    required this.joinedChatDate,
    required this.status,
    this.extra,
    this.clientId,
  });

  /// Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
  final MessageSender memberId;

  /// Tag of the chat member or its custom title if the member is an administrator of the chat; 0-16 characters without emoji; applicable to basic groups and supergroups only
  final String tag;

  /// Identifier of a user who invited/promoted/banned this member in the chat; 0 if unknown
  final int inviterUserId;

  /// Point in time (Unix timestamp) when the user joined/was promoted/was banned in the chat
  final int joinedChatDate;

  /// Status of the member in the chat
  final ChatMemberStatus status;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatMember.fromJson(Map<String, dynamic> json) => ChatMember(
        memberId: MessageSender.fromJson(json['member_id']),
        tag: json['tag'],
        inviterUserId: json['inviter_user_id'],
        joinedChatDate: json['joined_chat_date'],
        status: ChatMemberStatus.fromJson(json['status']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "member_id": memberId.toJson(),
      "tag": tag,
      "inviter_user_id": inviterUserId,
      "joined_chat_date": joinedChatDate,
      "status": status.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [member_id]: Identifier of the chat member. Currently, other chats can be only Left or Banned. Only supergroups and channels can have other chats as Left or Banned members and these chats must be supergroups or channels
  /// * [tag]: Tag of the chat member or its custom title if the member is an administrator of the chat; 0-16 characters without emoji; applicable to basic groups and supergroups only
  /// * [inviter_user_id]: Identifier of a user who invited/promoted/banned this member in the chat; 0 if unknown
  /// * [joined_chat_date]: Point in time (Unix timestamp) when the user joined/was promoted/was banned in the chat
  /// * [status]: Status of the member in the chat
  ChatMember copyWith({
    MessageSender? memberId,
    String? tag,
    int? inviterUserId,
    int? joinedChatDate,
    ChatMemberStatus? status,
    dynamic extra,
    int? clientId,
  }) =>
      ChatMember(
        memberId: memberId ?? this.memberId,
        tag: tag ?? this.tag,
        inviterUserId: inviterUserId ?? this.inviterUserId,
        joinedChatDate: joinedChatDate ?? this.joinedChatDate,
        status: status ?? this.status,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMember';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
