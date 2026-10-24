part of '../tdapi.dart';

/// **CheckEmailAddressVerificationCode** *(checkEmailAddressVerificationCode)* - TDLib function
///
/// Checks the email address verification code for Telegram Passport.
///
/// * [code]: Verification code to check.
///
/// [Ok] is returned on completion.
final class CheckEmailAddressVerificationCode extends TdFunction {
  /// **CheckEmailAddressVerificationCode** *(checkEmailAddressVerificationCode)* - TDLib function
  ///
  /// Checks the email address verification code for Telegram Passport.
  ///
  /// * [code]: Verification code to check.
  ///
  /// [Ok] is returned on completion.
  const CheckEmailAddressVerificationCode({
    required this.code,
  });

  /// Verification code to check
  final String code;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "code": code,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [code]: Verification code to check
  CheckEmailAddressVerificationCode copyWith({
    String? code,
  }) =>
      CheckEmailAddressVerificationCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkEmailAddressVerificationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
