part of '../tdapi.dart';

/// **SendTonConnectSessionConnectResult** *(sendTonConnectSessionConnectResult)* - TDLib function
///
/// Accepts or rejects a TON Connect session.
///
/// * [sessionId]: Unique identifier of the session.
/// * [challengeAnswer]: Answer to the challenge received from setTonConnectSessionWalletClientId.
/// * [isError]: Pass true to reject the request; pass false to accept it.
/// * [body]: Body of the result.
/// * [traceId]: Identifier to trace the connection request.
///
/// [Ok] is returned on completion.
final class SendTonConnectSessionConnectResult extends TdFunction {
  /// **SendTonConnectSessionConnectResult** *(sendTonConnectSessionConnectResult)* - TDLib function
  ///
  /// Accepts or rejects a TON Connect session.
  ///
  /// * [sessionId]: Unique identifier of the session.
  /// * [challengeAnswer]: Answer to the challenge received from setTonConnectSessionWalletClientId.
  /// * [isError]: Pass true to reject the request; pass false to accept it.
  /// * [body]: Body of the result.
  /// * [traceId]: Identifier to trace the connection request.
  ///
  /// [Ok] is returned on completion.
  const SendTonConnectSessionConnectResult({
    required this.sessionId,
    required this.challengeAnswer,
    required this.isError,
    required this.body,
    required this.traceId,
  });

  /// Unique identifier of the session
  final int sessionId;

  /// Answer to the challenge received from setTonConnectSessionWalletClientId
  final String challengeAnswer;

  /// Pass true to reject the request; pass false to accept it
  final bool isError;

  /// Body of the result
  final String body;

  /// Identifier to trace the connection request
  final String traceId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "challenge_answer": challengeAnswer,
      "is_error": isError,
      "body": body,
      "trace_id": traceId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the session
  /// * [challenge_answer]: Answer to the challenge received from setTonConnectSessionWalletClientId
  /// * [is_error]: Pass true to reject the request; pass false to accept it
  /// * [body]: Body of the result
  /// * [trace_id]: Identifier to trace the connection request
  SendTonConnectSessionConnectResult copyWith({
    int? sessionId,
    String? challengeAnswer,
    bool? isError,
    String? body,
    String? traceId,
  }) =>
      SendTonConnectSessionConnectResult(
        sessionId: sessionId ?? this.sessionId,
        challengeAnswer: challengeAnswer ?? this.challengeAnswer,
        isError: isError ?? this.isError,
        body: body ?? this.body,
        traceId: traceId ?? this.traceId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendTonConnectSessionConnectResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
