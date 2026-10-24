part of '../tdapi.dart';

/// **OnRampPaymentSession** *(onRampPaymentSession)* - basic class
///
/// Describes a session for an on-ramp purchase.
///
/// * [sessionId]: Identifier of the session.
/// * [expirationDate]: Point in time (Unix timestamp) when the session will expire.
/// * [url]: HTTPS URL to be opened in a WebView to complete the purchase.
final class OnRampPaymentSession extends TdObject {
  /// **OnRampPaymentSession** *(onRampPaymentSession)* - basic class
  ///
  /// Describes a session for an on-ramp purchase.
  ///
  /// * [sessionId]: Identifier of the session.
  /// * [expirationDate]: Point in time (Unix timestamp) when the session will expire.
  /// * [url]: HTTPS URL to be opened in a WebView to complete the purchase.
  const OnRampPaymentSession({
    required this.sessionId,
    required this.expirationDate,
    required this.url,
    this.extra,
    this.clientId,
  });

  /// Identifier of the session
  final String sessionId;

  /// Point in time (Unix timestamp) when the session will expire
  final int expirationDate;

  /// HTTPS URL to be opened in a WebView to complete the purchase
  final String url;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OnRampPaymentSession.fromJson(Map<String, dynamic> json) =>
      OnRampPaymentSession(
        sessionId: json['session_id'],
        expirationDate: json['expiration_date'],
        url: json['url'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "expiration_date": expirationDate,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Identifier of the session
  /// * [expiration_date]: Point in time (Unix timestamp) when the session will expire
  /// * [url]: HTTPS URL to be opened in a WebView to complete the purchase
  OnRampPaymentSession copyWith({
    String? sessionId,
    int? expirationDate,
    String? url,
    dynamic extra,
    int? clientId,
  }) =>
      OnRampPaymentSession(
        sessionId: sessionId ?? this.sessionId,
        expirationDate: expirationDate ?? this.expirationDate,
        url: url ?? this.url,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampPaymentSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
