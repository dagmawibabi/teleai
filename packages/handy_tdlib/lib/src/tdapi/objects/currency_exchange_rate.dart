part of '../tdapi.dart';

/// **CurrencyExchangeRate** *(currencyExchangeRate)* - basic class
///
/// Describes exchange rate of a currency to USD.
///
/// * [currency]: ISO 4217 currency code of the payment currency.
/// * [rate]: Exchange rate of the currency to USD.
final class CurrencyExchangeRate extends TdObject {
  /// **CurrencyExchangeRate** *(currencyExchangeRate)* - basic class
  ///
  /// Describes exchange rate of a currency to USD.
  ///
  /// * [currency]: ISO 4217 currency code of the payment currency.
  /// * [rate]: Exchange rate of the currency to USD.
  const CurrencyExchangeRate({
    required this.currency,
    required this.rate,
  });

  /// ISO 4217 currency code of the payment currency
  final String currency;

  /// Exchange rate of the currency to USD
  final double rate;

  /// Parse from a json
  factory CurrencyExchangeRate.fromJson(Map<String, dynamic> json) =>
      CurrencyExchangeRate(
        currency: json['currency'],
        rate: json['rate'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "rate": rate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code of the payment currency
  /// * [rate]: Exchange rate of the currency to USD
  CurrencyExchangeRate copyWith({
    String? currency,
    double? rate,
  }) =>
      CurrencyExchangeRate(
        currency: currency ?? this.currency,
        rate: rate ?? this.rate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'currencyExchangeRate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
