part of '../tdapi.dart';

/// **TerminateSession** *(terminateSession)* - TDLib function
///
/// Terminates a session of the current user.
///
/// * [sessionId]: Session identifier.
///
/// [Ok] is returned on completion.
final class TerminateSession extends TdFunction {
  /// **TerminateSession** *(terminateSession)* - TDLib function
  ///
  /// Terminates a session of the current user.
  ///
  /// * [sessionId]: Session identifier.
  ///
  /// [Ok] is returned on completion.
  const TerminateSession({
    required this.sessionId,
  });

  /// Session identifier
  final int sessionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Session identifier
  TerminateSession copyWith({
    int? sessionId,
  }) =>
      TerminateSession(
        sessionId: sessionId ?? this.sessionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'terminateSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
