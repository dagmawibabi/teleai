part of '../tdapi.dart';

/// **OnRampPaymentLimits** *(onRampPaymentLimits)* - basic class
///
/// Describes limits for an on-ramp purchase.
///
/// * [paymentMethod]: The payment method to be used.
/// * [baseCurrencyMinAmount]: The minimum allowed amount of the base currency.
/// * [baseCurrencyMaxAmount]: The maximum allowed amount of the base currency.
/// * [cryptocurrencyMinAmount]: The minimum allowed amount of the bought cryptocurrency.
/// * [cryptocurrencyMaxAmount]: The maximum allowed amount of the bought cryptocurrency.
final class OnRampPaymentLimits extends TdObject {
  /// **OnRampPaymentLimits** *(onRampPaymentLimits)* - basic class
  ///
  /// Describes limits for an on-ramp purchase.
  ///
  /// * [paymentMethod]: The payment method to be used.
  /// * [baseCurrencyMinAmount]: The minimum allowed amount of the base currency.
  /// * [baseCurrencyMaxAmount]: The maximum allowed amount of the base currency.
  /// * [cryptocurrencyMinAmount]: The minimum allowed amount of the bought cryptocurrency.
  /// * [cryptocurrencyMaxAmount]: The maximum allowed amount of the bought cryptocurrency.
  const OnRampPaymentLimits({
    required this.paymentMethod,
    required this.baseCurrencyMinAmount,
    required this.baseCurrencyMaxAmount,
    required this.cryptocurrencyMinAmount,
    required this.cryptocurrencyMaxAmount,
    this.extra,
    this.clientId,
  });

  /// The payment method to be used
  final String paymentMethod;

  /// The minimum allowed amount of the base currency
  final String baseCurrencyMinAmount;

  /// The maximum allowed amount of the base currency
  final String baseCurrencyMaxAmount;

  /// The minimum allowed amount of the bought cryptocurrency
  final String cryptocurrencyMinAmount;

  /// The maximum allowed amount of the bought cryptocurrency
  final String cryptocurrencyMaxAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OnRampPaymentLimits.fromJson(Map<String, dynamic> json) =>
      OnRampPaymentLimits(
        paymentMethod: json['payment_method'],
        baseCurrencyMinAmount: json['base_currency_min_amount'],
        baseCurrencyMaxAmount: json['base_currency_max_amount'],
        cryptocurrencyMinAmount: json['cryptocurrency_min_amount'],
        cryptocurrencyMaxAmount: json['cryptocurrency_max_amount'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payment_method": paymentMethod,
      "base_currency_min_amount": baseCurrencyMinAmount,
      "base_currency_max_amount": baseCurrencyMaxAmount,
      "cryptocurrency_min_amount": cryptocurrencyMinAmount,
      "cryptocurrency_max_amount": cryptocurrencyMaxAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payment_method]: The payment method to be used
  /// * [base_currency_min_amount]: The minimum allowed amount of the base currency
  /// * [base_currency_max_amount]: The maximum allowed amount of the base currency
  /// * [cryptocurrency_min_amount]: The minimum allowed amount of the bought cryptocurrency
  /// * [cryptocurrency_max_amount]: The maximum allowed amount of the bought cryptocurrency
  OnRampPaymentLimits copyWith({
    String? paymentMethod,
    String? baseCurrencyMinAmount,
    String? baseCurrencyMaxAmount,
    String? cryptocurrencyMinAmount,
    String? cryptocurrencyMaxAmount,
    dynamic extra,
    int? clientId,
  }) =>
      OnRampPaymentLimits(
        paymentMethod: paymentMethod ?? this.paymentMethod,
        baseCurrencyMinAmount:
            baseCurrencyMinAmount ?? this.baseCurrencyMinAmount,
        baseCurrencyMaxAmount:
            baseCurrencyMaxAmount ?? this.baseCurrencyMaxAmount,
        cryptocurrencyMinAmount:
            cryptocurrencyMinAmount ?? this.cryptocurrencyMinAmount,
        cryptocurrencyMaxAmount:
            cryptocurrencyMaxAmount ?? this.cryptocurrencyMaxAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampPaymentLimits';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
