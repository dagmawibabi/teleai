part of '../tdapi.dart';

/// **PaymentProvider** *(paymentProvider)* - parent
///
/// Contains information about a payment provider.
sealed class PaymentProvider extends TdObject {
  /// **PaymentProvider** *(paymentProvider)* - parent
  ///
  /// Contains information about a payment provider.
  const PaymentProvider();

  /// a PaymentProvider return type can be :
  /// * [PaymentProviderSmartGlocal]
  /// * [PaymentProviderStripe]
  /// * [PaymentProviderOther]
  factory PaymentProvider.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PaymentProviderSmartGlocal.defaultObjectId:
        return PaymentProviderSmartGlocal.fromJson(json);
      case PaymentProviderStripe.defaultObjectId:
        return PaymentProviderStripe.fromJson(json);
      case PaymentProviderOther.defaultObjectId:
        return PaymentProviderOther.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PaymentProvider)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PaymentProvider copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'paymentProvider';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentProviderSmartGlocal** *(paymentProviderSmartGlocal)* - child of PaymentProvider
///
/// Smart Glocal payment provider.
///
/// * [publicToken]: Public payment token.
/// * [tokenizeUrl]: URL for sending card tokenization requests.
final class PaymentProviderSmartGlocal extends PaymentProvider {
  /// **PaymentProviderSmartGlocal** *(paymentProviderSmartGlocal)* - child of PaymentProvider
  ///
  /// Smart Glocal payment provider.
  ///
  /// * [publicToken]: Public payment token.
  /// * [tokenizeUrl]: URL for sending card tokenization requests.
  const PaymentProviderSmartGlocal({
    required this.publicToken,
    required this.tokenizeUrl,
  });

  /// Public payment token
  final String publicToken;

  /// URL for sending card tokenization requests
  final String tokenizeUrl;

  /// Parse from a json
  factory PaymentProviderSmartGlocal.fromJson(Map<String, dynamic> json) =>
      PaymentProviderSmartGlocal(
        publicToken: json['public_token'],
        tokenizeUrl: json['tokenize_url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "public_token": publicToken,
      "tokenize_url": tokenizeUrl,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [public_token]: Public payment token
  /// * [tokenize_url]: URL for sending card tokenization requests
  @override
  PaymentProviderSmartGlocal copyWith({
    String? publicToken,
    String? tokenizeUrl,
  }) =>
      PaymentProviderSmartGlocal(
        publicToken: publicToken ?? this.publicToken,
        tokenizeUrl: tokenizeUrl ?? this.tokenizeUrl,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentProviderSmartGlocal';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentProviderStripe** *(paymentProviderStripe)* - child of PaymentProvider
///
/// Stripe payment provider.
///
/// * [publishableKey]: Stripe API publishable key.
/// * [needCountry]: True, if the user country must be provided.
/// * [needPostalCode]: True, if the user ZIP/postal code must be provided.
/// * [needCardholderName]: True, if the cardholder name must be provided.
final class PaymentProviderStripe extends PaymentProvider {
  /// **PaymentProviderStripe** *(paymentProviderStripe)* - child of PaymentProvider
  ///
  /// Stripe payment provider.
  ///
  /// * [publishableKey]: Stripe API publishable key.
  /// * [needCountry]: True, if the user country must be provided.
  /// * [needPostalCode]: True, if the user ZIP/postal code must be provided.
  /// * [needCardholderName]: True, if the cardholder name must be provided.
  const PaymentProviderStripe({
    required this.publishableKey,
    required this.needCountry,
    required this.needPostalCode,
    required this.needCardholderName,
  });

  /// Stripe API publishable key
  final String publishableKey;

  /// True, if the user country must be provided
  final bool needCountry;

  /// True, if the user ZIP/postal code must be provided
  final bool needPostalCode;

  /// True, if the cardholder name must be provided
  final bool needCardholderName;

  /// Parse from a json
  factory PaymentProviderStripe.fromJson(Map<String, dynamic> json) =>
      PaymentProviderStripe(
        publishableKey: json['publishable_key'],
        needCountry: json['need_country'],
        needPostalCode: json['need_postal_code'],
        needCardholderName: json['need_cardholder_name'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "publishable_key": publishableKey,
      "need_country": needCountry,
      "need_postal_code": needPostalCode,
      "need_cardholder_name": needCardholderName,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [publishable_key]: Stripe API publishable key
  /// * [need_country]: True, if the user country must be provided
  /// * [need_postal_code]: True, if the user ZIP/postal code must be provided
  /// * [need_cardholder_name]: True, if the cardholder name must be provided
  @override
  PaymentProviderStripe copyWith({
    String? publishableKey,
    bool? needCountry,
    bool? needPostalCode,
    bool? needCardholderName,
  }) =>
      PaymentProviderStripe(
        publishableKey: publishableKey ?? this.publishableKey,
        needCountry: needCountry ?? this.needCountry,
        needPostalCode: needPostalCode ?? this.needPostalCode,
        needCardholderName: needCardholderName ?? this.needCardholderName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentProviderStripe';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentProviderOther** *(paymentProviderOther)* - child of PaymentProvider
///
/// Some other payment provider, for which a web payment form must be shown.
///
/// * [url]: Payment form URL.
final class PaymentProviderOther extends PaymentProvider {
  /// **PaymentProviderOther** *(paymentProviderOther)* - child of PaymentProvider
  ///
  /// Some other payment provider, for which a web payment form must be shown.
  ///
  /// * [url]: Payment form URL.
  const PaymentProviderOther({
    required this.url,
  });

  /// Payment form URL
  final String url;

  /// Parse from a json
  factory PaymentProviderOther.fromJson(Map<String, dynamic> json) =>
      PaymentProviderOther(
        url: json['url'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "url": url,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [url]: Payment form URL
  @override
  PaymentProviderOther copyWith({
    String? url,
  }) =>
      PaymentProviderOther(
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentProviderOther';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
