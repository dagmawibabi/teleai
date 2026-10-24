part of '../tdapi.dart';

/// **ChatInviteLinkInfo** *(chatInviteLinkInfo)* - basic class
///
/// Contains information about a chat invite link.
///
/// * [chatId]: Chat identifier of the invite link; 0 if the user has no access to the chat before joining.
/// * [accessibleFor]: If non-zero, the amount of time for which read access to the chat will remain available, in seconds.
/// * [type]: Type of the chat.
/// * [title]: Title of the chat.
/// * [photo]: Chat photo; may be null *(optional)*.
/// * [accentColorId]: Identifier of the accent color for chat title and background of chat photo.
/// * [description]: Chat description.
/// * [memberCount]: Number of members in the chat.
/// * [memberUserIds]: User identifiers of some chat members that may be known to the current user.
/// * [subscriptionInfo]: Information about subscription plan that must be paid by the user to use the link; may be null if the link doesn't require subscription *(optional)*.
/// * [createsJoinRequest]: True, if the link only creates join request.
/// * [isPublic]: True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup.
/// * [verificationStatus]: Information about verification status of the chat; may be null if none *(optional)*.
final class ChatInviteLinkInfo extends TdObject {
  /// **ChatInviteLinkInfo** *(chatInviteLinkInfo)* - basic class
  ///
  /// Contains information about a chat invite link.
  ///
  /// * [chatId]: Chat identifier of the invite link; 0 if the user has no access to the chat before joining.
  /// * [accessibleFor]: If non-zero, the amount of time for which read access to the chat will remain available, in seconds.
  /// * [type]: Type of the chat.
  /// * [title]: Title of the chat.
  /// * [photo]: Chat photo; may be null *(optional)*.
  /// * [accentColorId]: Identifier of the accent color for chat title and background of chat photo.
  /// * [description]: Chat description.
  /// * [memberCount]: Number of members in the chat.
  /// * [memberUserIds]: User identifiers of some chat members that may be known to the current user.
  /// * [subscriptionInfo]: Information about subscription plan that must be paid by the user to use the link; may be null if the link doesn't require subscription *(optional)*.
  /// * [createsJoinRequest]: True, if the link only creates join request.
  /// * [isPublic]: True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup.
  /// * [verificationStatus]: Information about verification status of the chat; may be null if none *(optional)*.
  const ChatInviteLinkInfo({
    required this.chatId,
    required this.accessibleFor,
    required this.type,
    required this.title,
    this.photo,
    required this.accentColorId,
    required this.description,
    required this.memberCount,
    required this.memberUserIds,
    this.subscriptionInfo,
    required this.createsJoinRequest,
    required this.isPublic,
    this.verificationStatus,
    this.extra,
    this.clientId,
  });

  /// Chat identifier of the invite link; 0 if the user has no access to the chat before joining
  final int chatId;

  /// If non-zero, the amount of time for which read access to the chat will remain available, in seconds
  final int accessibleFor;

  /// Type of the chat
  final InviteLinkChatType type;

  /// Title of the chat
  final String title;

  /// Chat photo; may be null
  final ChatPhotoInfo? photo;

  /// Identifier of the accent color for chat title and background of chat photo
  final int accentColorId;

  /// Chat description
  final String description;

  /// Number of members in the chat
  final int memberCount;

  /// User identifiers of some chat members that may be known to the current user
  final List<int> memberUserIds;

  /// Information about subscription plan that must be paid by the user to use the link; may be null if the link doesn't require subscription
  final ChatInviteLinkSubscriptionInfo? subscriptionInfo;

  /// True, if the link only creates join request
  final bool createsJoinRequest;

  /// True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
  final bool isPublic;

  /// Information about verification status of the chat; may be null if none
  final VerificationStatus? verificationStatus;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatInviteLinkInfo.fromJson(Map<String, dynamic> json) =>
      ChatInviteLinkInfo(
        chatId: json['chat_id'],
        accessibleFor: json['accessible_for'],
        type: InviteLinkChatType.fromJson(json['type']),
        title: json['title'],
        photo: json['photo'] == null
            ? null
            : ChatPhotoInfo.fromJson(json['photo']),
        accentColorId: json['accent_color_id'],
        description: json['description'],
        memberCount: json['member_count'],
        memberUserIds: List<int>.from(
            (json['member_user_ids'] ?? []).map((item) => item).toList()),
        subscriptionInfo: json['subscription_info'] == null
            ? null
            : ChatInviteLinkSubscriptionInfo.fromJson(
                json['subscription_info']),
        createsJoinRequest: json['creates_join_request'],
        isPublic: json['is_public'],
        verificationStatus: json['verification_status'] == null
            ? null
            : VerificationStatus.fromJson(json['verification_status']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "accessible_for": accessibleFor,
      "type": type.toJson(),
      "title": title,
      "photo": photo?.toJson(),
      "accent_color_id": accentColorId,
      "description": description,
      "member_count": memberCount,
      "member_user_ids": memberUserIds.map((i) => i).toList(),
      "subscription_info": subscriptionInfo?.toJson(),
      "creates_join_request": createsJoinRequest,
      "is_public": isPublic,
      "verification_status": verificationStatus?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the invite link; 0 if the user has no access to the chat before joining
  /// * [accessible_for]: If non-zero, the amount of time for which read access to the chat will remain available, in seconds
  /// * [type]: Type of the chat
  /// * [title]: Title of the chat
  /// * [photo]: Chat photo; may be null
  /// * [accent_color_id]: Identifier of the accent color for chat title and background of chat photo
  /// * [description]: Chat description
  /// * [member_count]: Number of members in the chat
  /// * [member_user_ids]: User identifiers of some chat members that may be known to the current user
  /// * [subscription_info]: Information about subscription plan that must be paid by the user to use the link; may be null if the link doesn't require subscription
  /// * [creates_join_request]: True, if the link only creates join request
  /// * [is_public]: True, if the chat is a public supergroup or channel, i.e. it has a username or it is a location-based supergroup
  /// * [verification_status]: Information about verification status of the chat; may be null if none
  ChatInviteLinkInfo copyWith({
    int? chatId,
    int? accessibleFor,
    InviteLinkChatType? type,
    String? title,
    ChatPhotoInfo? photo,
    int? accentColorId,
    String? description,
    int? memberCount,
    List<int>? memberUserIds,
    ChatInviteLinkSubscriptionInfo? subscriptionInfo,
    bool? createsJoinRequest,
    bool? isPublic,
    VerificationStatus? verificationStatus,
    dynamic extra,
    int? clientId,
  }) =>
      ChatInviteLinkInfo(
        chatId: chatId ?? this.chatId,
        accessibleFor: accessibleFor ?? this.accessibleFor,
        type: type ?? this.type,
        title: title ?? this.title,
        photo: photo ?? this.photo,
        accentColorId: accentColorId ?? this.accentColorId,
        description: description ?? this.description,
        memberCount: memberCount ?? this.memberCount,
        memberUserIds: memberUserIds ?? this.memberUserIds,
        subscriptionInfo: subscriptionInfo ?? this.subscriptionInfo,
        createsJoinRequest: createsJoinRequest ?? this.createsJoinRequest,
        isPublic: isPublic ?? this.isPublic,
        verificationStatus: verificationStatus ?? this.verificationStatus,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatInviteLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
