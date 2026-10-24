part of '../tdapi.dart';

/// **GetActiveSessions** *(getActiveSessions)* - TDLib function
///
/// Returns all active sessions of the current user. Additionally, getBusinessConnectedBot must be used to show the bot on top of active sessions.
///
/// [Sessions] is returned on completion.
final class GetActiveSessions extends TdFunction {
  /// **GetActiveSessions** *(getActiveSessions)* - TDLib function
  ///
  /// Returns all active sessions of the current user. Additionally, getBusinessConnectedBot must be used to show the bot on top of active sessions.
  ///
  /// [Sessions] is returned on completion.
  const GetActiveSessions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetActiveSessions copyWith() => const GetActiveSessions();

  /// TDLib object type
  static const String defaultObjectId = 'getActiveSessions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
