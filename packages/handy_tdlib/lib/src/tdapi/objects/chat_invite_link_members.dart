part of '../tdapi.dart';

/// **ChatInviteLinkMembers** *(chatInviteLinkMembers)* - basic class
///
/// Contains a list of chat members joined a chat via an invite link.
///
/// * [totalCount]: Approximate total number of chat members found.
/// * [members]: List of chat members, joined a chat via an invite link.
final class ChatInviteLinkMembers extends TdObject {
  /// **ChatInviteLinkMembers** *(chatInviteLinkMembers)* - basic class
  ///
  /// Contains a list of chat members joined a chat via an invite link.
  ///
  /// * [totalCount]: Approximate total number of chat members found.
  /// * [members]: List of chat members, joined a chat via an invite link.
  const ChatInviteLinkMembers({
    required this.totalCount,
    required this.members,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of chat members found
  final int totalCount;

  /// List of chat members, joined a chat via an invite link
  final List<ChatInviteLinkMember> members;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatInviteLinkMembers.fromJson(Map<String, dynamic> json) =>
      ChatInviteLinkMembers(
        totalCount: json['total_count'],
        members: List<ChatInviteLinkMember>.from((json['members'] ?? [])
            .map((item) => ChatInviteLinkMember.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "members": members.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of chat members found
  /// * [members]: List of chat members, joined a chat via an invite link
  ChatInviteLinkMembers copyWith({
    int? totalCount,
    List<ChatInviteLinkMember>? members,
    dynamic extra,
    int? clientId,
  }) =>
      ChatInviteLinkMembers(
        totalCount: totalCount ?? this.totalCount,
        members: members ?? this.members,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatInviteLinkMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
