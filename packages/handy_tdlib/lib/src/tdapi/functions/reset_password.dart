part of '../tdapi.dart';

/// **ResetPassword** *(resetPassword)* - TDLib function
///
/// Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time.
///
/// [ResetPasswordResult] is returned on completion.
final class ResetPassword extends TdFunction {
  /// **ResetPassword** *(resetPassword)* - TDLib function
  ///
  /// Removes 2-step verification password without previous password and access to recovery email address. The password can't be reset immediately and the request needs to be repeated after the specified time.
  ///
  /// [ResetPasswordResult] is returned on completion.
  const ResetPassword();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ResetPassword copyWith() => const ResetPassword();

  /// TDLib object type
  static const String defaultObjectId = 'resetPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
