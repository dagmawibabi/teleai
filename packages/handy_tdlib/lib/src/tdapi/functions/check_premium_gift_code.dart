part of '../tdapi.dart';

/// **CheckPremiumGiftCode** *(checkPremiumGiftCode)* - TDLib function
///
/// Returns information about a Telegram Premium gift code.
///
/// * [code]: The code to check.
///
/// [PremiumGiftCodeInfo] is returned on completion.
final class CheckPremiumGiftCode extends TdFunction {
  /// **CheckPremiumGiftCode** *(checkPremiumGiftCode)* - TDLib function
  ///
  /// Returns information about a Telegram Premium gift code.
  ///
  /// * [code]: The code to check.
  ///
  /// [PremiumGiftCodeInfo] is returned on completion.
  const CheckPremiumGiftCode({
    required this.code,
  });

  /// The code to check
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
  /// * [code]: The code to check
  CheckPremiumGiftCode copyWith({
    String? code,
  }) =>
      CheckPremiumGiftCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkPremiumGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
