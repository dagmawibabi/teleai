part of '../tdapi.dart';

/// **ChatJoinRequest** *(chatJoinRequest)* - basic class
///
/// Describes a user who sent a join request and waits for administrator approval.
///
/// * [userId]: User identifier.
/// * [date]: Point in time (Unix timestamp) when the user sent the join request.
/// * [bio]: A short bio of the user.
final class ChatJoinRequest extends TdObject {
  /// **ChatJoinRequest** *(chatJoinRequest)* - basic class
  ///
  /// Describes a user who sent a join request and waits for administrator approval.
  ///
  /// * [userId]: User identifier.
  /// * [date]: Point in time (Unix timestamp) when the user sent the join request.
  /// * [bio]: A short bio of the user.
  const ChatJoinRequest({
    required this.userId,
    required this.date,
    required this.bio,
  });

  /// User identifier
  final int userId;

  /// Point in time (Unix timestamp) when the user sent the join request
  final int date;

  /// A short bio of the user
  final String bio;

  /// Parse from a json
  factory ChatJoinRequest.fromJson(Map<String, dynamic> json) =>
      ChatJoinRequest(
        userId: json['user_id'],
        date: json['date'],
        bio: json['bio'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "date": date,
      "bio": bio,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [date]: Point in time (Unix timestamp) when the user sent the join request
  /// * [bio]: A short bio of the user
  ChatJoinRequest copyWith({
    int? userId,
    int? date,
    String? bio,
  }) =>
      ChatJoinRequest(
        userId: userId ?? this.userId,
        date: date ?? this.date,
        bio: bio ?? this.bio,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatJoinRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
