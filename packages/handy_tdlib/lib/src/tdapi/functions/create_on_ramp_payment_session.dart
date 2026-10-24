part of '../tdapi.dart';

/// **CreateOnRampPaymentSession** *(createOnRampPaymentSession)* - TDLib function
///
/// Creates a session for an on-ramp payment.
///
/// * [providerId]: Unique identifier of the on-ramp provider.
/// * [cryptocurrency]: The cryptocurrency that will be bought.
/// * [address]: Address to which the cryptocurrency will be sent.
/// * [paymentMethodName]: Name of the chosen payment method; pass an empty string if none.
/// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown.
/// * [cryptocurrencyAmount]: The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount.
/// * [baseCurrencyAmount]: The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount.
/// * [memo]: Memo for the query; pass an empty string if none.
/// * [theme]: Preferred theme for the WebView; pass "light" for a light theme, "dark" for a dark theme, or leave empty for a default theme.
/// * [successReturnUrl]: The URL opened on successful payment; pass an empty string if none.
/// * [failReturnUrl]: The URL opened on failed payment; pass an empty string if none.
///
/// [OnRampPaymentSession] is returned on completion.
final class CreateOnRampPaymentSession extends TdFunction {
  /// **CreateOnRampPaymentSession** *(createOnRampPaymentSession)* - TDLib function
  ///
  /// Creates a session for an on-ramp payment.
  ///
  /// * [providerId]: Unique identifier of the on-ramp provider.
  /// * [cryptocurrency]: The cryptocurrency that will be bought.
  /// * [address]: Address to which the cryptocurrency will be sent.
  /// * [paymentMethodName]: Name of the chosen payment method; pass an empty string if none.
  /// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown.
  /// * [cryptocurrencyAmount]: The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount.
  /// * [baseCurrencyAmount]: The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount.
  /// * [memo]: Memo for the query; pass an empty string if none.
  /// * [theme]: Preferred theme for the WebView; pass "light" for a light theme, "dark" for a dark theme, or leave empty for a default theme.
  /// * [successReturnUrl]: The URL opened on successful payment; pass an empty string if none.
  /// * [failReturnUrl]: The URL opened on failed payment; pass an empty string if none.
  ///
  /// [OnRampPaymentSession] is returned on completion.
  const CreateOnRampPaymentSession({
    required this.providerId,
    required this.cryptocurrency,
    required this.address,
    required this.paymentMethodName,
    required this.baseCurrency,
    required this.cryptocurrencyAmount,
    required this.baseCurrencyAmount,
    required this.memo,
    required this.theme,
    required this.successReturnUrl,
    required this.failReturnUrl,
  });

  /// Unique identifier of the on-ramp provider
  final String providerId;

  /// The cryptocurrency that will be bought
  final String cryptocurrency;

  /// Address to which the cryptocurrency will be sent
  final String address;

  /// Name of the chosen payment method; pass an empty string if none
  final String paymentMethodName;

  /// ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown
  final String baseCurrency;

  /// The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount
  final String cryptocurrencyAmount;

  /// The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount
  final String baseCurrencyAmount;

  /// Memo for the query; pass an empty string if none
  final String memo;

  /// Preferred theme for the WebView; pass "light" for a light theme, "dark" for a dark theme, or leave empty for a default theme
  final String theme;

  /// The URL opened on successful payment; pass an empty string if none
  final String successReturnUrl;

  /// The URL opened on failed payment; pass an empty string if none
  final String failReturnUrl;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "provider_id": providerId,
      "cryptocurrency": cryptocurrency,
      "address": address,
      "payment_method_name": paymentMethodName,
      "base_currency": baseCurrency,
      "cryptocurrency_amount": cryptocurrencyAmount,
      "base_currency_amount": baseCurrencyAmount,
      "memo": memo,
      "theme": theme,
      "success_return_url": successReturnUrl,
      "fail_return_url": failReturnUrl,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [provider_id]: Unique identifier of the on-ramp provider
  /// * [cryptocurrency]: The cryptocurrency that will be bought
  /// * [address]: Address to which the cryptocurrency will be sent
  /// * [payment_method_name]: Name of the chosen payment method; pass an empty string if none
  /// * [base_currency]: ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown
  /// * [cryptocurrency_amount]: The amount of the cryptocurrency to buy; pass an empty string if the user selected base_currency_amount
  /// * [base_currency_amount]: The amount of the base currency to spend; pass an empty string if the user selected cryptocurrency_amount
  /// * [memo]: Memo for the query; pass an empty string if none
  /// * [theme]: Preferred theme for the WebView; pass "light" for a light theme, "dark" for a dark theme, or leave empty for a default theme
  /// * [success_return_url]: The URL opened on successful payment; pass an empty string if none
  /// * [fail_return_url]: The URL opened on failed payment; pass an empty string if none
  CreateOnRampPaymentSession copyWith({
    String? providerId,
    String? cryptocurrency,
    String? address,
    String? paymentMethodName,
    String? baseCurrency,
    String? cryptocurrencyAmount,
    String? baseCurrencyAmount,
    String? memo,
    String? theme,
    String? successReturnUrl,
    String? failReturnUrl,
  }) =>
      CreateOnRampPaymentSession(
        providerId: providerId ?? this.providerId,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        address: address ?? this.address,
        paymentMethodName: paymentMethodName ?? this.paymentMethodName,
        baseCurrency: baseCurrency ?? this.baseCurrency,
        cryptocurrencyAmount: cryptocurrencyAmount ?? this.cryptocurrencyAmount,
        baseCurrencyAmount: baseCurrencyAmount ?? this.baseCurrencyAmount,
        memo: memo ?? this.memo,
        theme: theme ?? this.theme,
        successReturnUrl: successReturnUrl ?? this.successReturnUrl,
        failReturnUrl: failReturnUrl ?? this.failReturnUrl,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createOnRampPaymentSession';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
