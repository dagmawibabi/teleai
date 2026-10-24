part of '../tdapi.dart';

/// **CheckAuthenticationEmailCode** *(checkAuthenticationEmailCode)* - TDLib function
///
/// Checks the authentication of an email address. Works only when the current authorization state is authorizationStateWaitEmailCode.
///
/// * [code]: Email address authentication to check.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationEmailCode extends TdFunction {
  /// **CheckAuthenticationEmailCode** *(checkAuthenticationEmailCode)* - TDLib function
  ///
  /// Checks the authentication of an email address. Works only when the current authorization state is authorizationStateWaitEmailCode.
  ///
  /// * [code]: Email address authentication to check.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationEmailCode({
    required this.code,
  });

  /// Email address authentication to check
  final EmailAddressAuthentication code;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "code": code.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [code]: Email address authentication to check
  CheckAuthenticationEmailCode copyWith({
    EmailAddressAuthentication? code,
  }) =>
      CheckAuthenticationEmailCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkAuthenticationEmailCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
