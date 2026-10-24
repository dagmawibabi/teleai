part of '../tdapi.dart';

/// **RecoverAuthenticationPassword** *(recoverAuthenticationPassword)* - TDLib function
///
/// Recovers the 2-step verification password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword.
///
/// * [recoveryCode]: Recovery code to check.
/// * [newPassword]: New 2-step verification password of the user; may be empty to remove the password.
/// * [newHint]: New password hint; may be empty.
///
/// [Ok] is returned on completion.
final class RecoverAuthenticationPassword extends TdFunction {
  /// **RecoverAuthenticationPassword** *(recoverAuthenticationPassword)* - TDLib function
  ///
  /// Recovers the 2-step verification password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword.
  ///
  /// * [recoveryCode]: Recovery code to check.
  /// * [newPassword]: New 2-step verification password of the user; may be empty to remove the password.
  /// * [newHint]: New password hint; may be empty.
  ///
  /// [Ok] is returned on completion.
  const RecoverAuthenticationPassword({
    required this.recoveryCode,
    required this.newPassword,
    required this.newHint,
  });

  /// Recovery code to check
  final String recoveryCode;

  /// New 2-step verification password of the user; may be empty to remove the password
  final String newPassword;

  /// New password hint; may be empty
  final String newHint;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "recovery_code": recoveryCode,
      "new_password": newPassword,
      "new_hint": newHint,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [recovery_code]: Recovery code to check
  /// * [new_password]: New 2-step verification password of the user; may be empty to remove the password
  /// * [new_hint]: New password hint; may be empty
  RecoverAuthenticationPassword copyWith({
    String? recoveryCode,
    String? newPassword,
    String? newHint,
  }) =>
      RecoverAuthenticationPassword(
        recoveryCode: recoveryCode ?? this.recoveryCode,
        newPassword: newPassword ?? this.newPassword,
        newHint: newHint ?? this.newHint,
      );

  /// TDLib object type
  static const String defaultObjectId = 'recoverAuthenticationPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
