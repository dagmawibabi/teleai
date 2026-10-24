part of '../tdapi.dart';

/// **TonConnectSessions** *(tonConnectSessions)* - basic class
///
/// Contains a list of TON Connect sessions.
///
/// * [sessions]: The list of sessions.
final class TonConnectSessions extends TdObject {
  /// **TonConnectSessions** *(tonConnectSessions)* - basic class
  ///
  /// Contains a list of TON Connect sessions.
  ///
  /// * [sessions]: The list of sessions.
  const TonConnectSessions({
    required this.sessions,
    this.extra,
    this.clientId,
  });

  /// The list of sessions
  final List<TonConnectSession> sessions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonConnectSessions.fromJson(Map<String, dynamic> json) =>
      TonConnectSessions(
        sessions: List<TonConnectSession>.from((json['sessions'] ?? [])
            .map((item) => TonConnectSession.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sessions": sessions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sessions]: The list of sessions
  TonConnectSessions copyWith({
    List<TonConnectSession>? sessions,
    dynamic extra,
    int? clientId,
  }) =>
      TonConnectSessions(
        sessions: sessions ?? this.sessions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectSessions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
