part of '../tdapi.dart';

/// **TonConnectRequest** *(tonConnectRequest)* - basic class
///
/// Represents a pending TON Connect request.
///
/// * [sessionId]: Unique identifier of the session.
/// * [messageId]: Unique identifier of the service message in the chat 777000 with the request.
/// * [body]: Body of the request.
/// * [expirationDate]: Point in time (Unix timestamp) when the request will expire; 0 if never.
/// * [topic]: Topic of the request; may be empty if none.
/// * [traceId]: Identifier to trace the request; may be empty if none.
final class TonConnectRequest extends TdObject {
  /// **TonConnectRequest** *(tonConnectRequest)* - basic class
  ///
  /// Represents a pending TON Connect request.
  ///
  /// * [sessionId]: Unique identifier of the session.
  /// * [messageId]: Unique identifier of the service message in the chat 777000 with the request.
  /// * [body]: Body of the request.
  /// * [expirationDate]: Point in time (Unix timestamp) when the request will expire; 0 if never.
  /// * [topic]: Topic of the request; may be empty if none.
  /// * [traceId]: Identifier to trace the request; may be empty if none.
  const TonConnectRequest({
    required this.sessionId,
    required this.messageId,
    required this.body,
    required this.expirationDate,
    required this.topic,
    required this.traceId,
  });

  /// Unique identifier of the session
  final int sessionId;

  /// Unique identifier of the service message in the chat 777000 with the request
  final int messageId;

  /// Body of the request
  final String body;

  /// Point in time (Unix timestamp) when the request will expire; 0 if never
  final int expirationDate;

  /// Topic of the request; may be empty if none
  final String topic;

  /// Identifier to trace the request; may be empty if none
  final String traceId;

  /// Parse from a json
  factory TonConnectRequest.fromJson(Map<String, dynamic> json) =>
      TonConnectRequest(
        sessionId: json['session_id'] is int
            ? json['session_id']
            : int.parse(json['session_id']),
        messageId: json['message_id'],
        body: json['body'],
        expirationDate: json['expiration_date'],
        topic: json['topic'],
        traceId: json['trace_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "message_id": messageId,
      "body": body,
      "expiration_date": expirationDate,
      "topic": topic,
      "trace_id": traceId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the session
  /// * [message_id]: Unique identifier of the service message in the chat 777000 with the request
  /// * [body]: Body of the request
  /// * [expiration_date]: Point in time (Unix timestamp) when the request will expire; 0 if never
  /// * [topic]: Topic of the request; may be empty if none
  /// * [trace_id]: Identifier to trace the request; may be empty if none
  TonConnectRequest copyWith({
    int? sessionId,
    int? messageId,
    String? body,
    int? expirationDate,
    String? topic,
    String? traceId,
  }) =>
      TonConnectRequest(
        sessionId: sessionId ?? this.sessionId,
        messageId: messageId ?? this.messageId,
        body: body ?? this.body,
        expirationDate: expirationDate ?? this.expirationDate,
        topic: topic ?? this.topic,
        traceId: traceId ?? this.traceId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonConnectRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
