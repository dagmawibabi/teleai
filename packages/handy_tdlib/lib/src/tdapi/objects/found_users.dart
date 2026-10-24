part of '../tdapi.dart';

/// **FoundUsers** *(foundUsers)* - basic class
///
/// Represents a list of found users.
///
/// * [userIds]: Identifiers of the found users.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class FoundUsers extends TdObject {
  /// **FoundUsers** *(foundUsers)* - basic class
  ///
  /// Represents a list of found users.
  ///
  /// * [userIds]: Identifiers of the found users.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const FoundUsers({
    required this.userIds,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// Identifiers of the found users
  final List<int> userIds;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FoundUsers.fromJson(Map<String, dynamic> json) => FoundUsers(
        userIds: List<int>.from(
            (json['user_ids'] ?? []).map((item) => item).toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_ids": userIds.map((i) => i).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_ids]: Identifiers of the found users
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  FoundUsers copyWith({
    List<int>? userIds,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      FoundUsers(
        userIds: userIds ?? this.userIds,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'foundUsers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
