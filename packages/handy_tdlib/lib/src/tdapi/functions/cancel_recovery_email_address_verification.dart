part of '../tdapi.dart';

/// **CancelRecoveryEmailAddressVerification** *(cancelRecoveryEmailAddressVerification)* - TDLib function
///
/// Cancels verification of the 2-step verification recovery email address.
///
/// [PasswordState] is returned on completion.
final class CancelRecoveryEmailAddressVerification extends TdFunction {
  /// **CancelRecoveryEmailAddressVerification** *(cancelRecoveryEmailAddressVerification)* - TDLib function
  ///
  /// Cancels verification of the 2-step verification recovery email address.
  ///
  /// [PasswordState] is returned on completion.
  const CancelRecoveryEmailAddressVerification();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  CancelRecoveryEmailAddressVerification copyWith() =>
      const CancelRecoveryEmailAddressVerification();

  /// TDLib object type
  static const String defaultObjectId =
      'cancelRecoveryEmailAddressVerification';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
