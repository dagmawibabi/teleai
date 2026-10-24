part of '../tdapi.dart';

/// **Destroy** *(destroy)* - TDLib function
///
/// Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed.. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent. Can be called before authorization.
///
/// [Ok] is returned on completion.
final class Destroy extends TdFunction {
  /// **Destroy** *(destroy)* - TDLib function
  ///
  /// Closes the TDLib instance, destroying all local data without a proper logout. The current user session will remain in the list of all active sessions. All local data will be destroyed.. After the destruction completes updateAuthorizationState with authorizationStateClosed will be sent. Can be called before authorization.
  ///
  /// [Ok] is returned on completion.
  const Destroy();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  Destroy copyWith() => const Destroy();

  /// TDLib object type
  static const String defaultObjectId = 'destroy';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
