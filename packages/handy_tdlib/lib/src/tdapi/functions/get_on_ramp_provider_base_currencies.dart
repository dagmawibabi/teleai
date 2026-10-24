part of '../tdapi.dart';

/// **GetOnRampProviderBaseCurrencies** *(getOnRampProviderBaseCurrencies)* - TDLib function
///
/// Returns the list of fiat currencies supported by an on-ramp provider for the given cryptocurrency.
///
/// * [providerId]: Unique identifier of the on-ramp provider; only for providers that support base currencies.
/// * [cryptocurrency]: The cryptocurrency that will be bought.
///
/// [Currencies] is returned on completion.
final class GetOnRampProviderBaseCurrencies extends TdFunction {
  /// **GetOnRampProviderBaseCurrencies** *(getOnRampProviderBaseCurrencies)* - TDLib function
  ///
  /// Returns the list of fiat currencies supported by an on-ramp provider for the given cryptocurrency.
  ///
  /// * [providerId]: Unique identifier of the on-ramp provider; only for providers that support base currencies.
  /// * [cryptocurrency]: The cryptocurrency that will be bought.
  ///
  /// [Currencies] is returned on completion.
  const GetOnRampProviderBaseCurrencies({
    required this.providerId,
    required this.cryptocurrency,
  });

  /// Unique identifier of the on-ramp provider; only for providers that support base currencies
  final String providerId;

  /// The cryptocurrency that will be bought
  final String cryptocurrency;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "provider_id": providerId,
      "cryptocurrency": cryptocurrency,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [provider_id]: Unique identifier of the on-ramp provider; only for providers that support base currencies
  /// * [cryptocurrency]: The cryptocurrency that will be bought
  GetOnRampProviderBaseCurrencies copyWith({
    String? providerId,
    String? cryptocurrency,
  }) =>
      GetOnRampProviderBaseCurrencies(
        providerId: providerId ?? this.providerId,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getOnRampProviderBaseCurrencies';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
