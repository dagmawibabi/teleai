part of '../tdapi.dart';

/// **ResendEmailAddressVerificationCode** *(resendEmailAddressVerificationCode)* - TDLib function
///
/// Resends the code to verify an email address to be added to a user's Telegram Passport.
///
/// [EmailAddressAuthenticationCodeInfo] is returned on completion.
final class ResendEmailAddressVerificationCode extends TdFunction {
  /// **ResendEmailAddressVerificationCode** *(resendEmailAddressVerificationCode)* - TDLib function
  ///
  /// Resends the code to verify an email address to be added to a user's Telegram Passport.
  ///
  /// [EmailAddressAuthenticationCodeInfo] is returned on completion.
  const ResendEmailAddressVerificationCode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ResendEmailAddressVerificationCode copyWith() =>
      const ResendEmailAddressVerificationCode();

  /// TDLib object type
  static const String defaultObjectId = 'resendEmailAddressVerificationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
