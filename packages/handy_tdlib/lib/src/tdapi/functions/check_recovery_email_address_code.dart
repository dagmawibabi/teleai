part of '../tdapi.dart';

/// **CheckRecoveryEmailAddressCode** *(checkRecoveryEmailAddressCode)* - TDLib function
///
/// Checks the 2-step verification recovery email address verification code.
///
/// * [code]: Verification code to check.
///
/// [PasswordState] is returned on completion.
final class CheckRecoveryEmailAddressCode extends TdFunction {
  /// **CheckRecoveryEmailAddressCode** *(checkRecoveryEmailAddressCode)* - TDLib function
  ///
  /// Checks the 2-step verification recovery email address verification code.
  ///
  /// * [code]: Verification code to check.
  ///
  /// [PasswordState] is returned on completion.
  const CheckRecoveryEmailAddressCode({
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
  CheckRecoveryEmailAddressCode copyWith({
    String? code,
  }) =>
      CheckRecoveryEmailAddressCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkRecoveryEmailAddressCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
