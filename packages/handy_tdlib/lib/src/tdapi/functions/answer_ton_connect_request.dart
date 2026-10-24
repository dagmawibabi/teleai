part of '../tdapi.dart';

/// **AnswerTonConnectRequest** *(answerTonConnectRequest)* - TDLib function
///
/// Sends an answer for a request received through TON Connect.
///
/// * [sessionId]: Unique identifier of the TON Connect session.
/// * [messageId]: Identifier of the message with the request.
/// * [traceId]: Identifier to trace the request.
/// * [body]: Body of the response.
///
/// [Ok] is returned on completion.
final class AnswerTonConnectRequest extends TdFunction {
  /// **AnswerTonConnectRequest** *(answerTonConnectRequest)* - TDLib function
  ///
  /// Sends an answer for a request received through TON Connect.
  ///
  /// * [sessionId]: Unique identifier of the TON Connect session.
  /// * [messageId]: Identifier of the message with the request.
  /// * [traceId]: Identifier to trace the request.
  /// * [body]: Body of the response.
  ///
  /// [Ok] is returned on completion.
  const AnswerTonConnectRequest({
    required this.sessionId,
    required this.messageId,
    required this.traceId,
    required this.body,
  });

  /// Unique identifier of the TON Connect session
  final int sessionId;

  /// Identifier of the message with the request
  final int messageId;

  /// Identifier to trace the request
  final String traceId;

  /// Body of the response
  final String body;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "message_id": messageId,
      "trace_id": traceId,
      "body": body,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the TON Connect session
  /// * [message_id]: Identifier of the message with the request
  /// * [trace_id]: Identifier to trace the request
  /// * [body]: Body of the response
  AnswerTonConnectRequest copyWith({
    int? sessionId,
    int? messageId,
    String? traceId,
    String? body,
  }) =>
      AnswerTonConnectRequest(
        sessionId: sessionId ?? this.sessionId,
        messageId: messageId ?? this.messageId,
        traceId: traceId ?? this.traceId,
        body: body ?? this.body,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerTonConnectRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
