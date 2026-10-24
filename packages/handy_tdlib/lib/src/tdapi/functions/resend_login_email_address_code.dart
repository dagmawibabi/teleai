part of '../tdapi.dart';

/// **ResendLoginEmailAddressCode** *(resendLoginEmailAddressCode)* - TDLib function
///
/// Resends the login email address verification code.
///
/// [EmailAddressAuthenticationCodeInfo] is returned on completion.
final class ResendLoginEmailAddressCode extends TdFunction {
  /// **ResendLoginEmailAddressCode** *(resendLoginEmailAddressCode)* - TDLib function
  ///
  /// Resends the login email address verification code.
  ///
  /// [EmailAddressAuthenticationCodeInfo] is returned on completion.
  const ResendLoginEmailAddressCode();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  ResendLoginEmailAddressCode copyWith() => const ResendLoginEmailAddressCode();

  /// TDLib object type
  static const String defaultObjectId = 'resendLoginEmailAddressCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
