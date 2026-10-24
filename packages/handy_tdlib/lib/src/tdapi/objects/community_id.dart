part of '../tdapi.dart';

/// **CommunityId** *(communityId)* - basic class
///
/// Contains identifier of a community.
///
/// * [id]: Community identifier.
final class CommunityId extends TdObject {
  /// **CommunityId** *(communityId)* - basic class
  ///
  /// Contains identifier of a community.
  ///
  /// * [id]: Community identifier.
  const CommunityId({
    required this.id,
    this.extra,
    this.clientId,
  });

  /// Community identifier
  final int id;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CommunityId.fromJson(Map<String, dynamic> json) => CommunityId(
        id: json['id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Community identifier
  CommunityId copyWith({
    int? id,
    dynamic extra,
    int? clientId,
  }) =>
      CommunityId(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'communityId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
