part of '../tdapi.dart';

/// **GetCurrencyExchangeRates** *(getCurrencyExchangeRates)* - TDLib function
///
/// Returns exchange rates of currencies to USD.
///
/// [CurrencyExchangeRates] is returned on completion.
final class GetCurrencyExchangeRates extends TdFunction {
  /// **GetCurrencyExchangeRates** *(getCurrencyExchangeRates)* - TDLib function
  ///
  /// Returns exchange rates of currencies to USD.
  ///
  /// [CurrencyExchangeRates] is returned on completion.
  const GetCurrencyExchangeRates();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetCurrencyExchangeRates copyWith() => const GetCurrencyExchangeRates();

  /// TDLib object type
  static const String defaultObjectId = 'getCurrencyExchangeRates';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
