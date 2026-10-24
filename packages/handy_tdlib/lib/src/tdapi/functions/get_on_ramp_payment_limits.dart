part of '../tdapi.dart';

/// **GetOnRampPaymentLimits** *(getOnRampPaymentLimits)* - TDLib function
///
/// Returns the limits for an on-ramp payment; only for providers that support limits retrieval.
///
/// * [providerId]: Unique identifier of the on-ramp provider.
/// * [cryptocurrency]: The cryptocurrency that will be bought.
/// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase.
/// * [paymentMethodName]: Name of the chosen payment method; pass an empty string if none.
///
/// [OnRampPaymentLimits] is returned on completion.
final class GetOnRampPaymentLimits extends TdFunction {
  /// **GetOnRampPaymentLimits** *(getOnRampPaymentLimits)* - TDLib function
  ///
  /// Returns the limits for an on-ramp payment; only for providers that support limits retrieval.
  ///
  /// * [providerId]: Unique identifier of the on-ramp provider.
  /// * [cryptocurrency]: The cryptocurrency that will be bought.
  /// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase.
  /// * [paymentMethodName]: Name of the chosen payment method; pass an empty string if none.
  ///
  /// [OnRampPaymentLimits] is returned on completion.
  const GetOnRampPaymentLimits({
    required this.providerId,
    required this.cryptocurrency,
    required this.baseCurrency,
    required this.paymentMethodName,
  });

  /// Unique identifier of the on-ramp provider
  final String providerId;

  /// The cryptocurrency that will be bought
  final String cryptocurrency;

  /// ISO 4217 currency code of the currency that will be used for the purchase
  final String baseCurrency;

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
  /// * [payment_method_name]: Name of the chosen payment method; pass an empty string if none
  GetOnRampPaymentLimits copyWith({
    String? providerId,
    String? cryptocurrency,
    String? baseCurrency,
    String? paymentMethodName,
  }) =>
      GetOnRampPaymentLimits(
        providerId: providerId ?? this.providerId,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        baseCurrency: baseCurrency ?? this.baseCurrency,
        paymentMethodName: paymentMethodName ?? this.paymentMethodName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOnRampPaymentLimits';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
