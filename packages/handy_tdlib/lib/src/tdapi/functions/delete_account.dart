part of '../tdapi.dart';

/// **DeleteAccount** *(deleteAccount)* - TDLib function
///
/// Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account.. Can be called before authorization when the current authorization state is authorizationStateWaitPassword.
///
/// * [reason]: The reason why the account was deleted; optional.
/// * [password]: The 2-step verification password of the current user. If the current user isn't authorized, then an empty string can be passed and account deletion can be canceled within one week.
///
/// [Ok] is returned on completion.
final class DeleteAccount extends TdFunction {
  /// **DeleteAccount** *(deleteAccount)* - TDLib function
  ///
  /// Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account.. Can be called before authorization when the current authorization state is authorizationStateWaitPassword.
  ///
  /// * [reason]: The reason why the account was deleted; optional.
  /// * [password]: The 2-step verification password of the current user. If the current user isn't authorized, then an empty string can be passed and account deletion can be canceled within one week.
  ///
  /// [Ok] is returned on completion.
  const DeleteAccount({
    required this.reason,
    required this.password,
  });

  /// The reason why the account was deleted; optional
  final String reason;

  /// The 2-step verification password of the current user. If the current user isn't authorized, then an empty string can be passed and account deletion can be canceled within one week
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "reason": reason,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reason]: The reason why the account was deleted; optional
  /// * [password]: The 2-step verification password of the current user. If the current user isn't authorized, then an empty string can be passed and account deletion can be canceled within one week
  DeleteAccount copyWith({
    String? reason,
    String? password,
  }) =>
      DeleteAccount(
        reason: reason ?? this.reason,
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteAccount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
