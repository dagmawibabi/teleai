part of '../tdapi.dart';

/// **CheckLoginEmailAddressCode** *(checkLoginEmailAddressCode)* - TDLib function
///
/// Checks the login email address authentication.
///
/// * [code]: Email address authentication to check.
///
/// [Ok] is returned on completion.
final class CheckLoginEmailAddressCode extends TdFunction {
  /// **CheckLoginEmailAddressCode** *(checkLoginEmailAddressCode)* - TDLib function
  ///
  /// Checks the login email address authentication.
  ///
  /// * [code]: Email address authentication to check.
  ///
  /// [Ok] is returned on completion.
  const CheckLoginEmailAddressCode({
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
  CheckLoginEmailAddressCode copyWith({
    EmailAddressAuthentication? code,
  }) =>
      CheckLoginEmailAddressCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkLoginEmailAddressCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
