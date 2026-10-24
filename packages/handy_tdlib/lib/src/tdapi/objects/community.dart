part of '../tdapi.dart';

/// **Community** *(community)* - basic class
///
/// Represents a community consisting of supergroup chats, channel chats and chats with bots.
///
/// * [id]: Community identifier.
/// * [haveAccess]: If false, the community is inaccessible, and the only information known about the community is inside this class. Identifier of the community can't be passed to any method.
/// * [name]: Community name.
/// * [photo]: Community photo; may be null *(optional)*.
/// * [date]: Point in time (Unix timestamp) when the community was joined, or the point in time when the community was created, in case the user is not a member of any chat in the community.
/// * [status]: Status of the current user in the community.
/// * [permissions]: Actions that non-administrator community members are allowed to take in the community.
final class Community extends TdObject {
  /// **Community** *(community)* - basic class
  ///
  /// Represents a community consisting of supergroup chats, channel chats and chats with bots.
  ///
  /// * [id]: Community identifier.
  /// * [haveAccess]: If false, the community is inaccessible, and the only information known about the community is inside this class. Identifier of the community can't be passed to any method.
  /// * [name]: Community name.
  /// * [photo]: Community photo; may be null *(optional)*.
  /// * [date]: Point in time (Unix timestamp) when the community was joined, or the point in time when the community was created, in case the user is not a member of any chat in the community.
  /// * [status]: Status of the current user in the community.
  /// * [permissions]: Actions that non-administrator community members are allowed to take in the community.
  const Community({
    required this.id,
    required this.haveAccess,
    required this.name,
    this.photo,
    required this.date,
    required this.status,
    required this.permissions,
  });

  /// Community identifier
  final int id;

  /// If false, the community is inaccessible, and the only information known about the community is inside this class. Identifier of the community can't be passed to any method
  final bool haveAccess;

  /// Community name
  final String name;

  /// Community photo; may be null
  final ChatPhotoInfo? photo;

  /// Point in time (Unix timestamp) when the community was joined, or the point in time when the community was created, in case the user is not a member of any chat in the community
  final int date;

  /// Status of the current user in the community
  final CommunityMemberStatus status;

  /// Actions that non-administrator community members are allowed to take in the community
  final CommunityPermissions permissions;

  /// Parse from a json
  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json['id'],
        haveAccess: json['have_access'],
        name: json['name'],
        photo: json['photo'] == null
            ? null
            : ChatPhotoInfo.fromJson(json['photo']),
        date: json['date'],
        status: CommunityMemberStatus.fromJson(json['status']),
        permissions: CommunityPermissions.fromJson(json['permissions']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "have_access": haveAccess,
      "name": name,
      "photo": photo?.toJson(),
      "date": date,
      "status": status.toJson(),
      "permissions": permissions.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Community identifier
  /// * [have_access]: If false, the community is inaccessible, and the only information known about the community is inside this class. Identifier of the community can't be passed to any method
  /// * [name]: Community name
  /// * [photo]: Community photo; may be null
  /// * [date]: Point in time (Unix timestamp) when the community was joined, or the point in time when the community was created, in case the user is not a member of any chat in the community
  /// * [status]: Status of the current user in the community
  /// * [permissions]: Actions that non-administrator community members are allowed to take in the community
  Community copyWith({
    int? id,
    bool? haveAccess,
    String? name,
    ChatPhotoInfo? photo,
    int? date,
    CommunityMemberStatus? status,
    CommunityPermissions? permissions,
  }) =>
      Community(
        id: id ?? this.id,
        haveAccess: haveAccess ?? this.haveAccess,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        date: date ?? this.date,
        status: status ?? this.status,
        permissions: permissions ?? this.permissions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'community';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
