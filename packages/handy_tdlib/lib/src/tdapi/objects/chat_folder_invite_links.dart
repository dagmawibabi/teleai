part of '../tdapi.dart';

/// **ChatFolderInviteLinks** *(chatFolderInviteLinks)* - basic class
///
/// Represents a list of chat folder invite links.
///
/// * [inviteLinks]: List of the invite links.
final class ChatFolderInviteLinks extends TdObject {
  /// **ChatFolderInviteLinks** *(chatFolderInviteLinks)* - basic class
  ///
  /// Represents a list of chat folder invite links.
  ///
  /// * [inviteLinks]: List of the invite links.
  const ChatFolderInviteLinks({
    required this.inviteLinks,
    this.extra,
    this.clientId,
  });

  /// List of the invite links
  final List<ChatFolderInviteLink> inviteLinks;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatFolderInviteLinks.fromJson(Map<String, dynamic> json) =>
      ChatFolderInviteLinks(
        inviteLinks: List<ChatFolderInviteLink>.from(
            (json['invite_links'] ?? [])
                .map((item) => ChatFolderInviteLink.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_links": inviteLinks.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_links]: List of the invite links
  ChatFolderInviteLinks copyWith({
    List<ChatFolderInviteLink>? inviteLinks,
    dynamic extra,
    int? clientId,
  }) =>
      ChatFolderInviteLinks(
        inviteLinks: inviteLinks ?? this.inviteLinks,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatFolderInviteLinks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
