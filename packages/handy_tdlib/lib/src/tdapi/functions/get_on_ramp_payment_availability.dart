part of '../tdapi.dart';

/// **GetOnRampPaymentAvailability** *(getOnRampPaymentAvailability)* - TDLib function
///
/// Returns the available on-ramp payment methods based on the current user location.
///
/// * [providerId]: Unique identifier of the on-ramp provider.
/// * [cryptocurrency]: The cryptocurrency that will be bought.
/// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown.
///
/// [OnRampPaymentAvailability] is returned on completion.
final class GetOnRampPaymentAvailability extends TdFunction {
  /// **GetOnRampPaymentAvailability** *(getOnRampPaymentAvailability)* - TDLib function
  ///
  /// Returns the available on-ramp payment methods based on the current user location.
  ///
  /// * [providerId]: Unique identifier of the on-ramp provider.
  /// * [cryptocurrency]: The cryptocurrency that will be bought.
  /// * [baseCurrency]: ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown.
  ///
  /// [OnRampPaymentAvailability] is returned on completion.
  const GetOnRampPaymentAvailability({
    required this.providerId,
    required this.cryptocurrency,
    required this.baseCurrency,
  });

  /// Unique identifier of the on-ramp provider
  final String providerId;

  /// The cryptocurrency that will be bought
  final String cryptocurrency;

  /// ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown
  final String baseCurrency;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "provider_id": providerId,
      "cryptocurrency": cryptocurrency,
      "base_currency": baseCurrency,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [provider_id]: Unique identifier of the on-ramp provider
  /// * [cryptocurrency]: The cryptocurrency that will be bought
  /// * [base_currency]: ISO 4217 currency code of the currency that will be used for the purchase; pass an empty string if unknown
  GetOnRampPaymentAvailability copyWith({
    String? providerId,
    String? cryptocurrency,
    String? baseCurrency,
  }) =>
      GetOnRampPaymentAvailability(
        providerId: providerId ?? this.providerId,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        baseCurrency: baseCurrency ?? this.baseCurrency,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOnRampPaymentAvailability';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
