part of '../tdapi.dart';

/// **ResendRecoveryEmailAddressCode** *(resendRecoveryEmailAddressCode)* - TDLib function
///
/// Resends the 2-step verification recovery email address verification code.
///
/// [PasswordState] is returned on completion.
final class ResendRecoveryEmailAddressCode extends TdFunction {
  /// **ResendRecoveryEmailAddressCode** *(resendRecoveryEmailAddressCode)* - TDLib function
  ///
  /// Resends the 2-step verification recovery email address verification code.
  ///
  /// [PasswordState] is returned on completion.
  const ResendRecoveryEmailAddressCode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ResendRecoveryEmailAddressCode copyWith() =>
      const ResendRecoveryEmailAddressCode();

  /// TDLib object type
  static const String defaultObjectId = 'resendRecoveryEmailAddressCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
