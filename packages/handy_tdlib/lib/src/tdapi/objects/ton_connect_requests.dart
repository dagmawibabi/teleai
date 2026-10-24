part of '../tdapi.dart';

/// **TonConnectRequests** *(tonConnectRequests)* - basic class
///
/// Represents a session with its pending TON Connect requests.
///
/// * [session]: The session.
/// * [requests]: The requests.
final class TonConnectRequests extends TdObject {
  /// **TonConnectRequests** *(tonConnectRequests)* - basic class
  ///
  /// Represents a session with its pending TON Connect requests.
  ///
  /// * [session]: The session.
  /// * [requests]: The requests.
  const TonConnectRequests({
    required this.session,
    required this.requests,
    this.extra,
    this.clientId,
  });

  /// The session
  final TonConnectSession session;

  /// The requests
  final List<TonConnectRequest> requests;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonConnectRequests.fromJson(Map<String, dynamic> json) =>
      TonConnectRequests(
        session: TonConnectSession.fromJson(json['session']),
        requests: List<TonConnectRequest>.from((json['requests'] ?? [])
            .map((item) => TonConnectRequest.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session": session.toJson(),
      "requests": requests.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session]: The session
  /// * [requests]: The requests
  TonConnectRequests copyWith({
    TonConnectSession? session,
    List<TonConnectRequest>? requests,
    dynamic extra,
    int? clientId,
  }) =>
      TonConnectRequests(
        session: session ?? this.session,
        requests: requests ?? this.requests,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectRequests';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
