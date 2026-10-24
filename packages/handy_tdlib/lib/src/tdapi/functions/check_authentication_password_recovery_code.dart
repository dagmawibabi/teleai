part of '../tdapi.dart';

/// **CheckAuthenticationPasswordRecoveryCode** *(checkAuthenticationPasswordRecoveryCode)* - TDLib function
///
/// Checks whether a 2-step verification password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword.
///
/// * [recoveryCode]: Recovery code to check.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationPasswordRecoveryCode extends TdFunction {
  /// **CheckAuthenticationPasswordRecoveryCode** *(checkAuthenticationPasswordRecoveryCode)* - TDLib function
  ///
  /// Checks whether a 2-step verification password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword.
  ///
  /// * [recoveryCode]: Recovery code to check.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationPasswordRecoveryCode({
    required this.recoveryCode,
  });

  /// Recovery code to check
  final String recoveryCode;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "recovery_code": recoveryCode,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [recovery_code]: Recovery code to check
  CheckAuthenticationPasswordRecoveryCode copyWith({
    String? recoveryCode,
  }) =>
      CheckAuthenticationPasswordRecoveryCode(
        recoveryCode: recoveryCode ?? this.recoveryCode,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'checkAuthenticationPasswordRecoveryCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
