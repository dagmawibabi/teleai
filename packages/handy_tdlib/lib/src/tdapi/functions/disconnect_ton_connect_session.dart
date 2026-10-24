part of '../tdapi.dart';

/// **DisconnectTonConnectSession** *(disconnectTonConnectSession)* - TDLib function
///
/// Closes a TON Connect session.
///
/// * [sessionId]: Unique identifier of the TON Connect session to close.
/// * [body]: Encrypted body of the disconnect event; may be empty if the session has already been closed. Use getTonConnectSessionNextEventId to get event identifier for the event.
///
/// [Ok] is returned on completion.
final class DisconnectTonConnectSession extends TdFunction {
  /// **DisconnectTonConnectSession** *(disconnectTonConnectSession)* - TDLib function
  ///
  /// Closes a TON Connect session.
  ///
  /// * [sessionId]: Unique identifier of the TON Connect session to close.
  /// * [body]: Encrypted body of the disconnect event; may be empty if the session has already been closed. Use getTonConnectSessionNextEventId to get event identifier for the event.
  ///
  /// [Ok] is returned on completion.
  const DisconnectTonConnectSession({
    required this.sessionId,
    required this.body,
  });

  /// Unique identifier of the TON Connect session to close
  final int sessionId;

  /// Encrypted body of the disconnect event; may be empty if the session has already been closed. Use getTonConnectSessionNextEventId to get event identifier for the event
  final String body;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "body": body,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the TON Connect session to close
  /// * [body]: Encrypted body of the disconnect event; may be empty if the session has already been closed. Use getTonConnectSessionNextEventId to get event identifier for the event
  DisconnectTonConnectSession copyWith({
    int? sessionId,
    String? body,
  }) =>
      DisconnectTonConnectSession(
        sessionId: sessionId ?? this.sessionId,
        body: body ?? this.body,
      );

  /// TDLib object type
  static const String defaultObjectId = 'disconnectTonConnectSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
