part of '../tdapi.dart';

/// **CheckPhoneNumberCode** *(checkPhoneNumberCode)* - TDLib function
///
/// Checks the authentication code and completes the request for which the code was sent if appropriate.
///
/// * [code]: Authentication code to check.
///
/// [Ok] is returned on completion.
final class CheckPhoneNumberCode extends TdFunction {
  /// **CheckPhoneNumberCode** *(checkPhoneNumberCode)* - TDLib function
  ///
  /// Checks the authentication code and completes the request for which the code was sent if appropriate.
  ///
  /// * [code]: Authentication code to check.
  ///
  /// [Ok] is returned on completion.
  const CheckPhoneNumberCode({
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
  CheckPhoneNumberCode copyWith({
    String? code,
  }) =>
      CheckPhoneNumberCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkPhoneNumberCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
