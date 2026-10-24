part of '../tdapi.dart';

/// **OnRampPaymentQuote** *(onRampPaymentQuote)* - basic class
///
/// Describes a quote for an on-ramp purchase.
///
/// * [paymentMethod]: The payment method to be used.
/// * [expirationDate]: Point in time (Unix timestamp) when the quote will expire.
/// * [baseCurrencyAmount]: Paid amount of the base currency.
/// * [cryptocurrencyAmount]: Purchased amount of the cryptocurrency.
/// * [cryptocurrencyPrice]: The price of the cryptocurrency.
/// * [feeAmount]: Fee amount.
/// * [extraFeeAmount]: Extra fee amount.
/// * [networkFeeAmount]: Network fee amount.
/// * [totalAmount]: Total paid amount.
final class OnRampPaymentQuote extends TdObject {
  /// **OnRampPaymentQuote** *(onRampPaymentQuote)* - basic class
  ///
  /// Describes a quote for an on-ramp purchase.
  ///
  /// * [paymentMethod]: The payment method to be used.
  /// * [expirationDate]: Point in time (Unix timestamp) when the quote will expire.
  /// * [baseCurrencyAmount]: Paid amount of the base currency.
  /// * [cryptocurrencyAmount]: Purchased amount of the cryptocurrency.
  /// * [cryptocurrencyPrice]: The price of the cryptocurrency.
  /// * [feeAmount]: Fee amount.
  /// * [extraFeeAmount]: Extra fee amount.
  /// * [networkFeeAmount]: Network fee amount.
  /// * [totalAmount]: Total paid amount.
  const OnRampPaymentQuote({
    required this.paymentMethod,
    required this.expirationDate,
    required this.baseCurrencyAmount,
    required this.cryptocurrencyAmount,
    required this.cryptocurrencyPrice,
    required this.feeAmount,
    required this.extraFeeAmount,
    required this.networkFeeAmount,
    required this.totalAmount,
    this.extra,
    this.clientId,
  });

  /// The payment method to be used
  final String paymentMethod;

  /// Point in time (Unix timestamp) when the quote will expire
  final int expirationDate;

  /// Paid amount of the base currency
  final String baseCurrencyAmount;

  /// Purchased amount of the cryptocurrency
  final String cryptocurrencyAmount;

  /// The price of the cryptocurrency
  final String cryptocurrencyPrice;

  /// Fee amount
  final String feeAmount;

  /// Extra fee amount
  final String extraFeeAmount;

  /// Network fee amount
  final String networkFeeAmount;

  /// Total paid amount
  final String totalAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory OnRampPaymentQuote.fromJson(Map<String, dynamic> json) =>
      OnRampPaymentQuote(
        paymentMethod: json['payment_method'],
        expirationDate: json['expiration_date'],
        baseCurrencyAmount: json['base_currency_amount'],
        cryptocurrencyAmount: json['cryptocurrency_amount'],
        cryptocurrencyPrice: json['cryptocurrency_price'],
        feeAmount: json['fee_amount'],
        extraFeeAmount: json['extra_fee_amount'],
        networkFeeAmount: json['network_fee_amount'],
        totalAmount: json['total_amount'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payment_method": paymentMethod,
      "expiration_date": expirationDate,
      "base_currency_amount": baseCurrencyAmount,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "cryptocurrency_price": cryptocurrencyPrice,
      "fee_amount": feeAmount,
      "extra_fee_amount": extraFeeAmount,
      "network_fee_amount": networkFeeAmount,
      "total_amount": totalAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payment_method]: The payment method to be used
  /// * [expiration_date]: Point in time (Unix timestamp) when the quote will expire
  /// * [base_currency_amount]: Paid amount of the base currency
  /// * [cryptocurrency_amount]: Purchased amount of the cryptocurrency
  /// * [cryptocurrency_price]: The price of the cryptocurrency
  /// * [fee_amount]: Fee amount
  /// * [extra_fee_amount]: Extra fee amount
  /// * [network_fee_amount]: Network fee amount
  /// * [total_amount]: Total paid amount
  OnRampPaymentQuote copyWith({
    String? paymentMethod,
    int? expirationDate,
    String? baseCurrencyAmount,
    String? cryptocurrencyAmount,
    String? cryptocurrencyPrice,
    String? feeAmount,
    String? extraFeeAmount,
    String? networkFeeAmount,
    String? totalAmount,
    dynamic extra,
    int? clientId,
  }) =>
      OnRampPaymentQuote(
        paymentMethod: paymentMethod ?? this.paymentMethod,
        expirationDate: expirationDate ?? this.expirationDate,
        baseCurrencyAmount: baseCurrencyAmount ?? this.baseCurrencyAmount,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        cryptocurrencyPrice: cryptocurrencyPrice ?? this.cryptocurrencyPrice,
        feeAmount: feeAmount ?? this.feeAmount,
        extraFeeAmount: extraFeeAmount ?? this.extraFeeAmount,
        networkFeeAmount: networkFeeAmount ?? this.networkFeeAmount,
        totalAmount: totalAmount ?? this.totalAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampPaymentQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
