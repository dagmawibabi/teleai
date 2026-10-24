part of '../tdapi.dart';

/// **GetRecoveryEmailAddress** *(getRecoveryEmailAddress)* - TDLib function
///
/// Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user.
///
/// * [password]: The 2-step verification password for the current user.
///
/// [RecoveryEmailAddress] is returned on completion.
final class GetRecoveryEmailAddress extends TdFunction {
  /// **GetRecoveryEmailAddress** *(getRecoveryEmailAddress)* - TDLib function
  ///
  /// Returns a 2-step verification recovery email address that was previously set up. This method can be used to verify a password provided by the user.
  ///
  /// * [password]: The 2-step verification password for the current user.
  ///
  /// [RecoveryEmailAddress] is returned on completion.
  const GetRecoveryEmailAddress({
    required this.password,
  });

  /// The 2-step verification password for the current user
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
  /// * [password]: The 2-step verification password for the current user
  GetRecoveryEmailAddress copyWith({
    String? password,
  }) =>
      GetRecoveryEmailAddress(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getRecoveryEmailAddress';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
