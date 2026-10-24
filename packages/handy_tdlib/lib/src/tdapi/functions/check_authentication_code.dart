part of '../tdapi.dart';

/// **CheckAuthenticationCode** *(checkAuthenticationCode)* - TDLib function
///
/// Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode.
///
/// * [code]: Authentication code to check.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationCode extends TdFunction {
  /// **CheckAuthenticationCode** *(checkAuthenticationCode)* - TDLib function
  ///
  /// Checks the authentication code. Works only when the current authorization state is authorizationStateWaitCode.
  ///
  /// * [code]: Authentication code to check.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationCode({
    required this.code,
  });

  /// Authentication code to check
  final String code;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "code": code,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [code]: Authentication code to check
  CheckAuthenticationCode copyWith({
    String? code,
  }) =>
      CheckAuthenticationCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkAuthenticationCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
