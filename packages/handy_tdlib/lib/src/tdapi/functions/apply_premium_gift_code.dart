part of '../tdapi.dart';

/// **ApplyPremiumGiftCode** *(applyPremiumGiftCode)* - TDLib function
///
/// Applies a Telegram Premium gift code.
///
/// * [code]: The code to apply.
///
/// [Ok] is returned on completion.
final class ApplyPremiumGiftCode extends TdFunction {
  /// **ApplyPremiumGiftCode** *(applyPremiumGiftCode)* - TDLib function
  ///
  /// Applies a Telegram Premium gift code.
  ///
  /// * [code]: The code to apply.
  ///
  /// [Ok] is returned on completion.
  const ApplyPremiumGiftCode({
    required this.code,
  });

  /// The code to apply
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
  /// * [code]: The code to apply
  ApplyPremiumGiftCode copyWith({
    String? code,
  }) =>
      ApplyPremiumGiftCode(
        code: code ?? this.code,
      );

  /// TDLib object type
  static const String defaultObjectId = 'applyPremiumGiftCode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
