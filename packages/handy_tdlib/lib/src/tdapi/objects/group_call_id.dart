part of '../tdapi.dart';

/// **GroupCallId** *(groupCallId)* - basic class
///
/// Contains the group call identifier.
///
/// * [id]: Group call identifier.
final class GroupCallId extends TdObject {
  /// **GroupCallId** *(groupCallId)* - basic class
  ///
  /// Contains the group call identifier.
  ///
  /// * [id]: Group call identifier.
  const GroupCallId({
    required this.id,
    this.extra,
    this.clientId,
  });

  /// Group call identifier
  final int id;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GroupCallId.fromJson(Map<String, dynamic> json) => GroupCallId(
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
  /// * [id]: Group call identifier
  GroupCallId copyWith({
    int? id,
    dynamic extra,
    int? clientId,
  }) =>
      GroupCallId(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCallId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
