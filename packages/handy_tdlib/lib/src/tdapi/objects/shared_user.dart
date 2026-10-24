part of '../tdapi.dart';

/// **SharedUser** *(sharedUser)* - basic class
///
/// Contains information about a user shared with a bot.
///
/// * [userId]: User identifier.
/// * [firstName]: First name of the user; for bots only.
/// * [lastName]: Last name of the user; for bots only.
/// * [username]: Username of the user; for bots only.
/// * [photo]: Profile photo of the user; for bots only; may be null *(optional)*.
final class SharedUser extends TdObject {
  /// **SharedUser** *(sharedUser)* - basic class
  ///
  /// Contains information about a user shared with a bot.
  ///
  /// * [userId]: User identifier.
  /// * [firstName]: First name of the user; for bots only.
  /// * [lastName]: Last name of the user; for bots only.
  /// * [username]: Username of the user; for bots only.
  /// * [photo]: Profile photo of the user; for bots only; may be null *(optional)*.
  const SharedUser({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.photo,
  });

  /// User identifier
  final int userId;

  /// First name of the user; for bots only
  final String firstName;

  /// Last name of the user; for bots only
  final String lastName;

  /// Username of the user; for bots only
  final String username;

  /// Profile photo of the user; for bots only; may be null
  final Photo? photo;

  /// Parse from a json
  factory SharedUser.fromJson(Map<String, dynamic> json) => SharedUser(
        userId: json['user_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        username: json['username'],
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [first_name]: First name of the user; for bots only
  /// * [last_name]: Last name of the user; for bots only
  /// * [username]: Username of the user; for bots only
  /// * [photo]: Profile photo of the user; for bots only; may be null
  SharedUser copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? username,
    Photo? photo,
  }) =>
      SharedUser(
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        username: username ?? this.username,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sharedUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
