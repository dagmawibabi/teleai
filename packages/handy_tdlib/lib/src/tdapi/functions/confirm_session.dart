part of '../tdapi.dart';

/// **ConfirmSession** *(confirmSession)* - TDLib function
///
/// Confirms an unconfirmed session of the current user from another device.
///
/// * [sessionId]: Session identifier.
///
/// [Ok] is returned on completion.
final class ConfirmSession extends TdFunction {
  /// **ConfirmSession** *(confirmSession)* - TDLib function
  ///
  /// Confirms an unconfirmed session of the current user from another device.
  ///
  /// * [sessionId]: Session identifier.
  ///
  /// [Ok] is returned on completion.
  const ConfirmSession({
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
  ConfirmSession copyWith({
    int? sessionId,
  }) =>
      ConfirmSession(
        sessionId: sessionId ?? this.sessionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'confirmSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
