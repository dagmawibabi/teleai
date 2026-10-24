part of '../tdapi.dart';

/// **DisableTonWalletBackup** *(disableTonWalletBackup)* - TDLib function
///
/// Disables backup of the TON wallet of the user. Works only if tonWalletState.is_backup_enabled is true.
///
/// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
///
/// [Ok] is returned on completion.
final class DisableTonWalletBackup extends TdFunction {
  /// **DisableTonWalletBackup** *(disableTonWalletBackup)* - TDLib function
  ///
  /// Disables backup of the TON wallet of the user. Works only if tonWalletState.is_backup_enabled is true.
  ///
  /// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
  ///
  /// [Ok] is returned on completion.
  const DisableTonWalletBackup({
    required this.password,
  });

  /// Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
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
  /// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
  DisableTonWalletBackup copyWith({
    String? password,
  }) =>
      DisableTonWalletBackup(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'disableTonWalletBackup';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
