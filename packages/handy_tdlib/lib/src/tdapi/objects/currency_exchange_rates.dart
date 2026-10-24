part of '../tdapi.dart';

/// **CurrencyExchangeRates** *(currencyExchangeRates)* - basic class
///
/// Represents a list of currency exchange rates.
///
/// * [rates]: A list of currency exchange rates.
final class CurrencyExchangeRates extends TdObject {
  /// **CurrencyExchangeRates** *(currencyExchangeRates)* - basic class
  ///
  /// Represents a list of currency exchange rates.
  ///
  /// * [rates]: A list of currency exchange rates.
  const CurrencyExchangeRates({
    required this.rates,
    this.extra,
    this.clientId,
  });

  /// A list of currency exchange rates
  final List<CurrencyExchangeRate> rates;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory CurrencyExchangeRates.fromJson(Map<String, dynamic> json) =>
      CurrencyExchangeRates(
        rates: List<CurrencyExchangeRate>.from((json['rates'] ?? [])
            .map((item) => CurrencyExchangeRate.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "rates": rates.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [rates]: A list of currency exchange rates
  CurrencyExchangeRates copyWith({
    List<CurrencyExchangeRate>? rates,
    dynamic extra,
    int? clientId,
  }) =>
      CurrencyExchangeRates(
        rates: rates ?? this.rates,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'currencyExchangeRates';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
