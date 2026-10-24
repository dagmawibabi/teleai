part of '../tdapi.dart';

/// **TonConnectSessionEventId** *(tonConnectSessionEventId)* - basic class
///
/// Represents identifier of an event in a TON Connect session.
///
/// * [eventId]: The event identifier.
final class TonConnectSessionEventId extends TdObject {
  /// **TonConnectSessionEventId** *(tonConnectSessionEventId)* - basic class
  ///
  /// Represents identifier of an event in a TON Connect session.
  ///
  /// * [eventId]: The event identifier.
  const TonConnectSessionEventId({
    required this.eventId,
    this.extra,
    this.clientId,
  });

  /// The event identifier
  final int eventId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonConnectSessionEventId.fromJson(Map<String, dynamic> json) =>
      TonConnectSessionEventId(
        eventId: json['event_id'] is int
            ? json['event_id']
            : int.parse(json['event_id']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "event_id": eventId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [event_id]: The event identifier
  TonConnectSessionEventId copyWith({
    int? eventId,
    dynamic extra,
    int? clientId,
  }) =>
      TonConnectSessionEventId(
        eventId: eventId ?? this.eventId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessionEventId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
