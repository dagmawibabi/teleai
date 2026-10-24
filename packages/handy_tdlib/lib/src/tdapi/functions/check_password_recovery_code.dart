part of '../tdapi.dart';

/// **CheckPasswordRecoveryCode** *(checkPasswordRecoveryCode)* - TDLib function
///
/// Checks whether a 2-step verification password recovery code sent to an email address is valid.
///
/// * [recoveryCode]: Recovery code to check.
///
/// [Ok] is returned on completion.
final class CheckPasswordRecoveryCode extends TdFunction {
  /// **CheckPasswordRecoveryCode** *(checkPasswordRecoveryCode)* - TDLib function
  ///
  /// Checks whether a 2-step verification password recovery code sent to an email address is valid.
  ///
  /// * [recoveryCode]: Recovery code to check.
  ///
  /// [Ok] is returned on completion.
  const CheckPasswordRecoveryCode({
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
  CheckPasswordRecoveryCode copyWith({
    String? recoveryCode,
  }) =>
      CheckPasswordRecoveryCode(
        recoveryCode: recoveryCode ?? this.recoveryCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkPasswordRecoveryCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
