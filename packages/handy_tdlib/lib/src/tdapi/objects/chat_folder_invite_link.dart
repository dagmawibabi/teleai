part of '../tdapi.dart';

/// **ChatFolderInviteLink** *(chatFolderInviteLink)* - basic class
///
/// Contains a chat folder invite link.
///
/// * [inviteLink]: The chat folder invite link.
/// * [name]: Name of the link.
/// * [chatIds]: Identifiers of chats, included in the link.
final class ChatFolderInviteLink extends TdObject {
  /// **ChatFolderInviteLink** *(chatFolderInviteLink)* - basic class
  ///
  /// Contains a chat folder invite link.
  ///
  /// * [inviteLink]: The chat folder invite link.
  /// * [name]: Name of the link.
  /// * [chatIds]: Identifiers of chats, included in the link.
  const ChatFolderInviteLink({
    required this.inviteLink,
    required this.name,
    required this.chatIds,
    this.extra,
    this.clientId,
  });

  /// The chat folder invite link
  final String inviteLink;

  /// Name of the link
  final String name;

  /// Identifiers of chats, included in the link
  final List<int> chatIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatFolderInviteLink.fromJson(Map<String, dynamic> json) =>
      ChatFolderInviteLink(
        inviteLink: json['invite_link'],
        name: json['name'],
        chatIds: List<int>.from(
            (json['chat_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
      "name": name,
      "chat_ids": chatIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: The chat folder invite link
  /// * [name]: Name of the link
  /// * [chat_ids]: Identifiers of chats, included in the link
  ChatFolderInviteLink copyWith({
    String? inviteLink,
    String? name,
    List<int>? chatIds,
    dynamic extra,
    int? clientId,
  }) =>
      ChatFolderInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
        name: name ?? this.name,
        chatIds: chatIds ?? this.chatIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatFolderInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
