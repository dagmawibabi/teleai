part of '../tdapi.dart';

/// **CallId** *(callId)* - basic class
///
/// Contains the call identifier.
///
/// * [id]: Call identifier.
final class CallId extends TdObject {
  /// **CallId** *(callId)* - basic class
  ///
  /// Contains the call identifier.
  ///
  /// * [id]: Call identifier.
  const CallId({
    required this.id,
    this.extra,
    this.clientId,
  });

  /// Call identifier
  final int id;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CallId.fromJson(Map<String, dynamic> json) => CallId(
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
  /// * [id]: Call identifier
  CallId copyWith({
    int? id,
    dynamic extra,
    int? clientId,
  }) =>
      CallId(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'callId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
