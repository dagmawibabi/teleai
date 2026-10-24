part of '../tdapi.dart';

/// **GetPremiumGiftPaymentOptions** *(getPremiumGiftPaymentOptions)* - TDLib function
///
/// Returns available options for gifting Telegram Premium to a user.
///
/// [PremiumGiftPaymentOptions] is returned on completion.
final class GetPremiumGiftPaymentOptions extends TdFunction {
  /// **GetPremiumGiftPaymentOptions** *(getPremiumGiftPaymentOptions)* - TDLib function
  ///
  /// Returns available options for gifting Telegram Premium to a user.
  ///
  /// [PremiumGiftPaymentOptions] is returned on completion.
  const GetPremiumGiftPaymentOptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetPremiumGiftPaymentOptions copyWith() =>
      const GetPremiumGiftPaymentOptions();

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumGiftPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
