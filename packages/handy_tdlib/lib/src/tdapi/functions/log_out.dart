part of '../tdapi.dart';

/// **LogOut** *(logOut)* - TDLib function
///
/// Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent.
///
/// [Ok] is returned on completion.
final class LogOut extends TdFunction {
  /// **LogOut** *(logOut)* - TDLib function
  ///
  /// Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent.
  ///
  /// [Ok] is returned on completion.
  const LogOut();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  LogOut copyWith() => const LogOut();

  /// TDLib object type
  static const String defaultObjectId = 'logOut';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
