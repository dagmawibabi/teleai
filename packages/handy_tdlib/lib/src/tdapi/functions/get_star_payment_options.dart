part of '../tdapi.dart';

/// **GetStarPaymentOptions** *(getStarPaymentOptions)* - TDLib function
///
/// Returns available options for Telegram Stars purchase.
///
/// [StarPaymentOptions] is returned on completion.
final class GetStarPaymentOptions extends TdFunction {
  /// **GetStarPaymentOptions** *(getStarPaymentOptions)* - TDLib function
  ///
  /// Returns available options for Telegram Stars purchase.
  ///
  /// [StarPaymentOptions] is returned on completion.
  const GetStarPaymentOptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetStarPaymentOptions copyWith() => const GetStarPaymentOptions();

  /// TDLib object type
  static const String defaultObjectId = 'getStarPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
