part of '../tdapi.dart';

/// **TerminateAllOtherSessions** *(terminateAllOtherSessions)* - TDLib function
///
/// Terminates all other sessions of the current user. Additionally, the user must be suggested to delete the connected business bot using deleteBusinessConnectedBot if there is any.
///
/// [Ok] is returned on completion.
final class TerminateAllOtherSessions extends TdFunction {
  /// **TerminateAllOtherSessions** *(terminateAllOtherSessions)* - TDLib function
  ///
  /// Terminates all other sessions of the current user. Additionally, the user must be suggested to delete the connected business bot using deleteBusinessConnectedBot if there is any.
  ///
  /// [Ok] is returned on completion.
  const TerminateAllOtherSessions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  TerminateAllOtherSessions copyWith() => const TerminateAllOtherSessions();

  /// TDLib object type
  static const String defaultObjectId = 'terminateAllOtherSessions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
