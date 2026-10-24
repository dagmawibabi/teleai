part of '../tdapi.dart';

/// **CloseBirthdayUser** *(closeBirthdayUser)* - basic class
///
/// Describes a user who had or will have a birthday soon.
///
/// * [userId]: User identifier.
/// * [birthdate]: Birthdate of the user.
final class CloseBirthdayUser extends TdObject {
  /// **CloseBirthdayUser** *(closeBirthdayUser)* - basic class
  ///
  /// Describes a user who had or will have a birthday soon.
  ///
  /// * [userId]: User identifier.
  /// * [birthdate]: Birthdate of the user.
  const CloseBirthdayUser({
    required this.userId,
    required this.birthdate,
  });

  /// User identifier
  final int userId;

  /// Birthdate of the user
  final Birthdate birthdate;

  /// Parse from a json
  factory CloseBirthdayUser.fromJson(Map<String, dynamic> json) =>
      CloseBirthdayUser(
        userId: json['user_id'],
        birthdate: Birthdate.fromJson(json['birthdate']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "birthdate": birthdate.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [birthdate]: Birthdate of the user
  CloseBirthdayUser copyWith({
    int? userId,
    Birthdate? birthdate,
  }) =>
      CloseBirthdayUser(
        userId: userId ?? this.userId,
        birthdate: birthdate ?? this.birthdate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closeBirthdayUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
