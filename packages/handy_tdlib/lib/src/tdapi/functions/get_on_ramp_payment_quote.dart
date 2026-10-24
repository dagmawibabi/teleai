part of '../tdapi.dart';

/// **GetOnRampPaymentQuote** *(getOnRampPaymentQuote)* - TDLib function
///
/// Returns a quote for an on-ramp payment; only for providers that support quote retrieval.
///
/// * [providerId]: Unique identifier of the on-ramp provider.
/// * [cryptocurrency]: The cryptocurrency that will be bought.
/// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase.
/// * [cryptocurrencyAmount]: The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount.
/// * [baseCurrencyAmount]: The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount.
/// * [paymentMethodName]: Name of the chosen payment method; pass an empty string if none.
///
/// [OnRampPaymentQuote] is returned on completion.
final class GetOnRampPaymentQuote extends TdFunction {
  /// **GetOnRampPaymentQuote** *(getOnRampPaymentQuote)* - TDLib function
  ///
  /// Returns a quote for an on-ramp payment; only for providers that support quote retrieval.
  ///
  /// * [providerId]: Unique identifier of the on-ramp provider.
  /// * [cryptocurrency]: The cryptocurrency that will be bought.
  /// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase.
  /// * [cryptocurrencyAmount]: The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount.
  /// * [baseCurrencyAmount]: The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount.
  /// * [paymentMethodName]: Name of the chosen payment method; pass an empty string if none.
  ///
  /// [OnRampPaymentQuote] is returned on completion.
  const GetOnRampPaymentQuote({
    required this.providerId,
    required this.cryptocurrency,
    required this.baseCurrency,
    required this.cryptocurrencyAmount,
    required this.baseCurrencyAmount,
    required this.paymentMethodName,
  });

  /// Unique identifier of the on-ramp provider
  final String providerId;

  /// The cryptocurrency that will be bought
  final String cryptocurrency;

  /// ISO 4217 currency code of the currency that will be used for the purchase
  final String baseCurrency;

  /// The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount
  final String cryptocurrencyAmount;

  /// The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount
  final String baseCurrencyAmount;

  /// Name of the chosen payment method; pass an empty string if none
  final String paymentMethodName;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "provider_id": providerId,
      "cryptocurrency": cryptocurrency,
      "base_currency": baseCurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "base_currency_amount": baseCurrencyAmount,
      "payment_method_name": paymentMethodName,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [provider_id]: Unique identifier of the on-ramp provider
  /// * [cryptocurrency]: The cryptocurrency that will be bought
  /// * [base_currency]: ISO 4217 currency code of the currency that will be used for the purchase
  /// * [cryptocurrency_amount]: The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount
  /// * [base_currency_amount]: The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount
  /// * [payment_method_name]: Name of the chosen payment method; pass an empty string if none
  GetOnRampPaymentQuote copyWith({
    String? providerId,
    String? cryptocurrency,
    String? baseCurrency,
    String? cryptocurrencyAmount,
    String? baseCurrencyAmount,
    String? paymentMethodName,
  }) =>
      GetOnRampPaymentQuote(
        providerId: providerId ?? this.providerId,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        baseCurrency: baseCurrency ?? this.baseCurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        baseCurrencyAmount: baseCurrencyAmount ?? this.baseCurrencyAmount,
        paymentMethodName: paymentMethodName ?? this.paymentMethodName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOnRampPaymentQuote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
