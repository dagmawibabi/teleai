part of '../tdapi.dart';

/// **TonConnectChallenge** *(tonConnectChallenge)* - basic class
///
/// Represents a TON Connect challenge.
///
/// * [challenge]: 104-byte challenge.
/// * [eventId]: Unique identifier of the first outgoing event.
final class TonConnectChallenge extends TdObject {
  /// **TonConnectChallenge** *(tonConnectChallenge)* - basic class
  ///
  /// Represents a TON Connect challenge.
  ///
  /// * [challenge]: 104-byte challenge.
  /// * [eventId]: Unique identifier of the first outgoing event.
  const TonConnectChallenge({
    required this.challenge,
    required this.eventId,
    this.extra,
    this.clientId,
  });

  /// 104-byte challenge
  final String challenge;

  /// Unique identifier of the first outgoing event
  final int eventId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonConnectChallenge.fromJson(Map<String, dynamic> json) =>
      TonConnectChallenge(
        challenge: json['challenge'],
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
      "challenge": challenge,
      "event_id": eventId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [challenge]: 104-byte challenge
  /// * [event_id]: Unique identifier of the first outgoing event
  TonConnectChallenge copyWith({
    String? challenge,
    int? eventId,
    dynamic extra,
    int? clientId,
  }) =>
      TonConnectChallenge(
        challenge: challenge ?? this.challenge,
        eventId: eventId ?? this.eventId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectChallenge';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
