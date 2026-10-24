part of '../tdapi.dart';

/// **OnRampProvider** *(onRampProvider)* - basic class
///
/// Describes an on-ramp provider.
///
/// * [id]: Unique identifier of the provider.
/// * [name]: Name of the provider.
/// * [cryptocurrencies]: List of cryptocurrencies supported by the provider.
/// * [supportsBaseCurrencies]: True, if the provider supports base currencies and can be used in the method getOnRampProviderBaseCurrencies.
/// * [supportsLimits]: True, if the provider supports limits retrieval using the method getOnRampPaymentLimits.
/// * [supportsQuote]: True, if the provider supports quote retrieval using the method getOnRampPaymentQuote.
final class OnRampProvider extends TdObject {
  /// **OnRampProvider** *(onRampProvider)* - basic class
  ///
  /// Describes an on-ramp provider.
  ///
  /// * [id]: Unique identifier of the provider.
  /// * [name]: Name of the provider.
  /// * [cryptocurrencies]: List of cryptocurrencies supported by the provider.
  /// * [supportsBaseCurrencies]: True, if the provider supports base currencies and can be used in the method getOnRampProviderBaseCurrencies.
  /// * [supportsLimits]: True, if the provider supports limits retrieval using the method getOnRampPaymentLimits.
  /// * [supportsQuote]: True, if the provider supports quote retrieval using the method getOnRampPaymentQuote.
  const OnRampProvider({
    required this.id,
    required this.name,
    required this.cryptocurrencies,
    required this.supportsBaseCurrencies,
    required this.supportsLimits,
    required this.supportsQuote,
  });

  /// Unique identifier of the provider
  final String id;

  /// Name of the provider
  final String name;

  /// List of cryptocurrencies supported by the provider
  final List<String> cryptocurrencies;

  /// True, if the provider supports base currencies and can be used in the method getOnRampProviderBaseCurrencies
  final bool supportsBaseCurrencies;

  /// True, if the provider supports limits retrieval using the method getOnRampPaymentLimits
  final bool supportsLimits;

  /// True, if the provider supports quote retrieval using the method getOnRampPaymentQuote
  final bool supportsQuote;

  /// Parse from a json
  factory OnRampProvider.fromJson(Map<String, dynamic> json) => OnRampProvider(
        id: json['id'],
        name: json['name'],
        cryptocurrencies: List<String>.from(
            (json['cryptocurrencies'] ?? []).map((item) => item).toList()),
        supportsBaseCurrencies: json['supports_base_currencies'],
        supportsLimits: json['supports_limits'],
        supportsQuote: json['supports_quote'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "cryptocurrencies": cryptocurrencies.map((i) => i).toList(),
      "supports_base_currencies": supportsBaseCurrencies,
      "supports_limits": supportsLimits,
      "supports_quote": supportsQuote,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the provider
  /// * [name]: Name of the provider
  /// * [cryptocurrencies]: List of cryptocurrencies supported by the provider
  /// * [supports_base_currencies]: True, if the provider supports base currencies and can be used in the method getOnRampProviderBaseCurrencies
  /// * [supports_limits]: True, if the provider supports limits retrieval using the method getOnRampPaymentLimits
  /// * [supports_quote]: True, if the provider supports quote retrieval using the method getOnRampPaymentQuote
  OnRampProvider copyWith({
    String? id,
    String? name,
    List<String>? cryptocurrencies,
    bool? supportsBaseCurrencies,
    bool? supportsLimits,
    bool? supportsQuote,
  }) =>
      OnRampProvider(
        id: id ?? this.id,
        name: name ?? this.name,
        cryptocurrencies: cryptocurrencies ?? this.cryptocurrencies,
        supportsBaseCurrencies:
            supportsBaseCurrencies ?? this.supportsBaseCurrencies,
        supportsLimits: supportsLimits ?? this.supportsLimits,
        supportsQuote: supportsQuote ?? this.supportsQuote,
      );

  /// TDLib object type
  static const String defaultObjectId = 'onRampProvider';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
