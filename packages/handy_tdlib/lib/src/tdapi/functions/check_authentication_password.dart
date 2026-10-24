part of '../tdapi.dart';

/// **CheckAuthenticationPassword** *(checkAuthenticationPassword)* - TDLib function
///
/// Checks the 2-step verification password for correctness. Works only when the current authorization state is authorizationStateWaitPassword.
///
/// * [password]: The 2-step verification password to check.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationPassword extends TdFunction {
  /// **CheckAuthenticationPassword** *(checkAuthenticationPassword)* - TDLib function
  ///
  /// Checks the 2-step verification password for correctness. Works only when the current authorization state is authorizationStateWaitPassword.
  ///
  /// * [password]: The 2-step verification password to check.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationPassword({
    required this.password,
  });

  /// The 2-step verification password to check
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [password]: The 2-step verification password to check
  CheckAuthenticationPassword copyWith({
    String? password,
  }) =>
      CheckAuthenticationPassword(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkAuthenticationPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
