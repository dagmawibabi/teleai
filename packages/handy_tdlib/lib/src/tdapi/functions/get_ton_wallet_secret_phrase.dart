part of '../tdapi.dart';

/// **GetTonWalletSecretPhrase** *(getTonWalletSecretPhrase)* - TDLib function
///
/// Returns the secret phrase of the user's TON wallet. Works only if tonWalletState.can_export_phrase is true.
///
/// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
///
/// [TonWalletSecretPhrase] is returned on completion.
final class GetTonWalletSecretPhrase extends TdFunction {
  /// **GetTonWalletSecretPhrase** *(getTonWalletSecretPhrase)* - TDLib function
  ///
  /// Returns the secret phrase of the user's TON wallet. Works only if tonWalletState.can_export_phrase is true.
  ///
  /// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
  ///
  /// [TonWalletSecretPhrase] is returned on completion.
  const GetTonWalletSecretPhrase({
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
  GetTonWalletSecretPhrase copyWith({
    String? password,
  }) =>
      GetTonWalletSecretPhrase(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTonWalletSecretPhrase';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
