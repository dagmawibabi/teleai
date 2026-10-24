part of '../tdapi.dart';

/// **ToggleSessionCanAcceptCalls** *(toggleSessionCanAcceptCalls)* - TDLib function
///
/// Toggles whether a session can accept incoming calls.
///
/// * [sessionId]: Session identifier.
/// * [canAcceptCalls]: Pass true to allow accepting incoming calls by the session; pass false otherwise.
///
/// [Ok] is returned on completion.
final class ToggleSessionCanAcceptCalls extends TdFunction {
  /// **ToggleSessionCanAcceptCalls** *(toggleSessionCanAcceptCalls)* - TDLib function
  ///
  /// Toggles whether a session can accept incoming calls.
  ///
  /// * [sessionId]: Session identifier.
  /// * [canAcceptCalls]: Pass true to allow accepting incoming calls by the session; pass false otherwise.
  ///
  /// [Ok] is returned on completion.
  const ToggleSessionCanAcceptCalls({
    required this.sessionId,
    required this.canAcceptCalls,
  });

  /// Session identifier
  final int sessionId;

  /// Pass true to allow accepting incoming calls by the session; pass false otherwise
  final bool canAcceptCalls;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "can_accept_calls": canAcceptCalls,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Session identifier
  /// * [can_accept_calls]: Pass true to allow accepting incoming calls by the session; pass false otherwise
  ToggleSessionCanAcceptCalls copyWith({
    int? sessionId,
    bool? canAcceptCalls,
  }) =>
      ToggleSessionCanAcceptCalls(
        sessionId: sessionId ?? this.sessionId,
        canAcceptCalls: canAcceptCalls ?? this.canAcceptCalls,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSessionCanAcceptCalls';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
