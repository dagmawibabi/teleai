part of '../tdapi.dart';

/// **CommunityFullInfo** *(communityFullInfo)* - basic class
///
/// Contains full information about a community.
///
/// * [photo]: Photo of the community.
/// * [chats]: Chats belonging to the community.
/// * [administratorCount]: Number of privileged users in the community; 0 if the current user isn't an administrator of the community.
/// * [bannedCount]: Number of users banned from the community; 0 if the current user isn't an administrator of the community.
/// * [addChatRequestCount]: Number of pending requests for addition of chats to the community; 0 if the current user isn't an administrator of the community.
final class CommunityFullInfo extends TdObject {
  /// **CommunityFullInfo** *(communityFullInfo)* - basic class
  ///
  /// Contains full information about a community.
  ///
  /// * [photo]: Photo of the community.
  /// * [chats]: Chats belonging to the community.
  /// * [administratorCount]: Number of privileged users in the community; 0 if the current user isn't an administrator of the community.
  /// * [bannedCount]: Number of users banned from the community; 0 if the current user isn't an administrator of the community.
  /// * [addChatRequestCount]: Number of pending requests for addition of chats to the community; 0 if the current user isn't an administrator of the community.
  const CommunityFullInfo({
    required this.photo,
    required this.chats,
    required this.administratorCount,
    required this.bannedCount,
    required this.addChatRequestCount,
    this.extra,
    this.clientId,
  });

  /// Photo of the community
  final ChatPhoto photo;

  /// Chats belonging to the community
  final List<CommunityChat> chats;

  /// Number of privileged users in the community; 0 if the current user isn't an administrator of the community
  final int administratorCount;

  /// Number of users banned from the community; 0 if the current user isn't an administrator of the community
  final int bannedCount;

  /// Number of pending requests for addition of chats to the community; 0 if the current user isn't an administrator of the community
  final int addChatRequestCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CommunityFullInfo.fromJson(Map<String, dynamic> json) =>
      CommunityFullInfo(
        photo: ChatPhoto.fromJson(json['photo']),
        chats: List<CommunityChat>.from((json['chats'] ?? [])
            .map((item) => CommunityChat.fromJson(item))
            .toList()),
        administratorCount: json['administrator_count'],
        bannedCount: json['banned_count'],
        addChatRequestCount: json['add_chat_request_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
      "chats": chats.map((i) => i.toJson()).toList(),
      "administrator_count": administratorCount,
      "banned_count": bannedCount,
      "add_chat_request_count": addChatRequestCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo of the community
  /// * [chats]: Chats belonging to the community
  /// * [administrator_count]: Number of privileged users in the community; 0 if the current user isn't an administrator of the community
  /// * [banned_count]: Number of users banned from the community; 0 if the current user isn't an administrator of the community
  /// * [add_chat_request_count]: Number of pending requests for addition of chats to the community; 0 if the current user isn't an administrator of the community
  CommunityFullInfo copyWith({
    ChatPhoto? photo,
    List<CommunityChat>? chats,
    int? administratorCount,
    int? bannedCount,
    int? addChatRequestCount,
    dynamic extra,
    int? clientId,
  }) =>
      CommunityFullInfo(
        photo: photo ?? this.photo,
        chats: chats ?? this.chats,
        administratorCount: administratorCount ?? this.administratorCount,
        bannedCount: bannedCount ?? this.bannedCount,
        addChatRequestCount: addChatRequestCount ?? this.addChatRequestCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'communityFullInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
