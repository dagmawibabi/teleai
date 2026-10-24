part of '../tdapi.dart';

/// **PushReceiverId** *(pushReceiverId)* - basic class
///
/// Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification.
///
/// * [id]: The globally unique identifier of push notification subscription.
final class PushReceiverId extends TdObject {
  /// **PushReceiverId** *(pushReceiverId)* - basic class
  ///
  /// Contains a globally unique push receiver identifier, which can be used to identify which account has received a push notification.
  ///
  /// * [id]: The globally unique identifier of push notification subscription.
  const PushReceiverId({
    required this.id,
    this.extra,
    this.clientId,
  });

  /// The globally unique identifier of push notification subscription
  final int id;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PushReceiverId.fromJson(Map<String, dynamic> json) => PushReceiverId(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
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
  /// * [id]: The globally unique identifier of push notification subscription
  PushReceiverId copyWith({
    int? id,
    dynamic extra,
    int? clientId,
  }) =>
      PushReceiverId(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pushReceiverId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
