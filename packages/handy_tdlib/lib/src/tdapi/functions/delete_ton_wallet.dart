part of '../tdapi.dart';

/// **DeleteTonWallet** *(deleteTonWallet)* - TDLib function
///
/// Deletes the current TON wallet of the user and creates a new one; can be used only if getOption("can_use_ton_wallet").
///
/// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
///
/// [Ok] is returned on completion.
final class DeleteTonWallet extends TdFunction {
  /// **DeleteTonWallet** *(deleteTonWallet)* - TDLib function
  ///
  /// Deletes the current TON wallet of the user and creates a new one; can be used only if getOption("can_use_ton_wallet").
  ///
  /// * [password]: Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request.
  ///
  /// [Ok] is returned on completion.
  const DeleteTonWallet({
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
  DeleteTonWallet copyWith({
    String? password,
  }) =>
      DeleteTonWallet(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteTonWallet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
