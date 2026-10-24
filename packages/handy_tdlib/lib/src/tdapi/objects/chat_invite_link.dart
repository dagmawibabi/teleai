part of '../tdapi.dart';

/// **ChatInviteLink** *(chatInviteLink)* - basic class
///
/// Contains a chat invite link.
///
/// * [inviteLink]: Chat invite link.
/// * [name]: Name of the link.
/// * [creatorUserId]: User identifier of an administrator created the link.
/// * [date]: Point in time (Unix timestamp) when the link was created.
/// * [editDate]: Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown.
/// * [expirationDate]: Point in time (Unix timestamp) when the link will expire; 0 if never.
/// * [subscriptionPricing]: Information about subscription plan that is applied to the users joining the chat by the link; may be null if the link doesn't require subscription *(optional)*.
/// * [memberLimit]: The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval.
/// * [memberCount]: Number of chat members, which joined the chat using the link.
/// * [expiredMemberCount]: Number of chat members, which joined the chat using the link, but have already left because of expired subscription; for subscription links only.
/// * [pendingJoinRequestCount]: Number of pending join requests created using this link.
/// * [createsJoinRequest]: True, if the link only creates join request. If true, total number of joining members will be unlimited.
/// * [isPrimary]: True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. Primary link can create join requests only if this is set up using toggleSupergroupJoinByRequest.. There is exactly one primary invite link for each administrator with can_invite_users right at a given time.
/// * [isRevoked]: True, if the link was revoked.
final class ChatInviteLink extends TdObject {
  /// **ChatInviteLink** *(chatInviteLink)* - basic class
  ///
  /// Contains a chat invite link.
  ///
  /// * [inviteLink]: Chat invite link.
  /// * [name]: Name of the link.
  /// * [creatorUserId]: User identifier of an administrator created the link.
  /// * [date]: Point in time (Unix timestamp) when the link was created.
  /// * [editDate]: Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown.
  /// * [expirationDate]: Point in time (Unix timestamp) when the link will expire; 0 if never.
  /// * [subscriptionPricing]: Information about subscription plan that is applied to the users joining the chat by the link; may be null if the link doesn't require subscription *(optional)*.
  /// * [memberLimit]: The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval.
  /// * [memberCount]: Number of chat members, which joined the chat using the link.
  /// * [expiredMemberCount]: Number of chat members, which joined the chat using the link, but have already left because of expired subscription; for subscription links only.
  /// * [pendingJoinRequestCount]: Number of pending join requests created using this link.
  /// * [createsJoinRequest]: True, if the link only creates join request. If true, total number of joining members will be unlimited.
  /// * [isPrimary]: True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. Primary link can create join requests only if this is set up using toggleSupergroupJoinByRequest.. There is exactly one primary invite link for each administrator with can_invite_users right at a given time.
  /// * [isRevoked]: True, if the link was revoked.
  const ChatInviteLink({
    required this.inviteLink,
    required this.name,
    required this.creatorUserId,
    required this.date,
    required this.editDate,
    required this.expirationDate,
    this.subscriptionPricing,
    required this.memberLimit,
    required this.memberCount,
    required this.expiredMemberCount,
    required this.pendingJoinRequestCount,
    required this.createsJoinRequest,
    required this.isPrimary,
    required this.isRevoked,
    this.extra,
    this.clientId,
  });

  /// Chat invite link
  final String inviteLink;

  /// Name of the link
  final String name;

  /// User identifier of an administrator created the link
  final int creatorUserId;

  /// Point in time (Unix timestamp) when the link was created
  final int date;

  /// Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
  final int editDate;

  /// Point in time (Unix timestamp) when the link will expire; 0 if never
  final int expirationDate;

  /// Information about subscription plan that is applied to the users joining the chat by the link; may be null if the link doesn't require subscription
  final StarSubscriptionPricing? subscriptionPricing;

  /// The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
  final int memberLimit;

  /// Number of chat members, which joined the chat using the link
  final int memberCount;

  /// Number of chat members, which joined the chat using the link, but have already left because of expired subscription; for subscription links only
  final int expiredMemberCount;

  /// Number of pending join requests created using this link
  final int pendingJoinRequestCount;

  /// True, if the link only creates join request. If true, total number of joining members will be unlimited
  final bool createsJoinRequest;

  /// True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. Primary link can create join requests only if this is set up using toggleSupergroupJoinByRequest.. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
  final bool isPrimary;

  /// True, if the link was revoked
  final bool isRevoked;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatInviteLink.fromJson(Map<String, dynamic> json) => ChatInviteLink(
        inviteLink: json['invite_link'],
        name: json['name'],
        creatorUserId: json['creator_user_id'],
        date: json['date'],
        editDate: json['edit_date'],
        expirationDate: json['expiration_date'],
        subscriptionPricing: json['subscription_pricing'] == null
            ? null
            : StarSubscriptionPricing.fromJson(json['subscription_pricing']),
        memberLimit: json['member_limit'],
        memberCount: json['member_count'],
        expiredMemberCount: json['expired_member_count'],
        pendingJoinRequestCount: json['pending_join_request_count'],
        createsJoinRequest: json['creates_join_request'],
        isPrimary: json['is_primary'],
        isRevoked: json['is_revoked'],
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
      "creator_user_id": creatorUserId,
      "date": date,
      "edit_date": editDate,
      "expiration_date": expirationDate,
      "subscription_pricing": subscriptionPricing?.toJson(),
      "member_limit": memberLimit,
      "member_count": memberCount,
      "expired_member_count": expiredMemberCount,
      "pending_join_request_count": pendingJoinRequestCount,
      "creates_join_request": createsJoinRequest,
      "is_primary": isPrimary,
      "is_revoked": isRevoked,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Chat invite link
  /// * [name]: Name of the link
  /// * [creator_user_id]: User identifier of an administrator created the link
  /// * [date]: Point in time (Unix timestamp) when the link was created
  /// * [edit_date]: Point in time (Unix timestamp) when the link was last edited; 0 if never or unknown
  /// * [expiration_date]: Point in time (Unix timestamp) when the link will expire; 0 if never
  /// * [subscription_pricing]: Information about subscription plan that is applied to the users joining the chat by the link; may be null if the link doesn't require subscription
  /// * [member_limit]: The maximum number of members, which can join the chat using the link simultaneously; 0 if not limited. Always 0 if the link requires approval
  /// * [member_count]: Number of chat members, which joined the chat using the link
  /// * [expired_member_count]: Number of chat members, which joined the chat using the link, but have already left because of expired subscription; for subscription links only
  /// * [pending_join_request_count]: Number of pending join requests created using this link
  /// * [creates_join_request]: True, if the link only creates join request. If true, total number of joining members will be unlimited
  /// * [is_primary]: True, if the link is primary. Primary invite link can't have name, expiration date, or usage limit. Primary link can create join requests only if this is set up using toggleSupergroupJoinByRequest.. There is exactly one primary invite link for each administrator with can_invite_users right at a given time
  /// * [is_revoked]: True, if the link was revoked
  ChatInviteLink copyWith({
    String? inviteLink,
    String? name,
    int? creatorUserId,
    int? date,
    int? editDate,
    int? expirationDate,
    StarSubscriptionPricing? subscriptionPricing,
    int? memberLimit,
    int? memberCount,
    int? expiredMemberCount,
    int? pendingJoinRequestCount,
    bool? createsJoinRequest,
    bool? isPrimary,
    bool? isRevoked,
    dynamic extra,
    int? clientId,
  }) =>
      ChatInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
        name: name ?? this.name,
        creatorUserId: creatorUserId ?? this.creatorUserId,
        date: date ?? this.date,
        editDate: editDate ?? this.editDate,
        expirationDate: expirationDate ?? this.expirationDate,
        subscriptionPricing: subscriptionPricing ?? this.subscriptionPricing,
        memberLimit: memberLimit ?? this.memberLimit,
        memberCount: memberCount ?? this.memberCount,
        expiredMemberCount: expiredMemberCount ?? this.expiredMemberCount,
        pendingJoinRequestCount:
            pendingJoinRequestCount ?? this.pendingJoinRequestCount,
        createsJoinRequest: createsJoinRequest ?? this.createsJoinRequest,
        isPrimary: isPrimary ?? this.isPrimary,
        isRevoked: isRevoked ?? this.isRevoked,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
