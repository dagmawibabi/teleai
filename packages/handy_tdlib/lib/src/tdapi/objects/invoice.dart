part of '../tdapi.dart';

/// **Invoice** *(invoice)* - basic class
///
/// Product invoice.
///
/// * [currency]: ISO 4217 currency code.
/// * [priceParts]: A list of objects used to calculate the total price of the product.
/// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debiting for subscription invoices; 0 if the invoice doesn't create subscription.
/// * [maxTipAmount]: The maximum allowed amount of tip in the smallest units of the currency.
/// * [suggestedTipAmounts]: Suggested amounts of tip in the smallest units of the currency.
/// * [recurringPaymentTermsOfServiceUrl]: An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay.
/// * [termsOfServiceUrl]: An HTTP URL with terms of service for non-recurring payments. If non-empty, then the user must accept the terms of service before allowed to pay.
/// * [isTest]: True, if the payment is a test payment.
/// * [needName]: True, if the user's name is needed for payment.
/// * [needPhoneNumber]: True, if the user's phone number is needed for payment.
/// * [needEmailAddress]: True, if the user's email address is needed for payment.
/// * [needShippingAddress]: True, if the user's shipping address is needed for payment.
/// * [sendPhoneNumberToProvider]: True, if the user's phone number will be sent to the provider.
/// * [sendEmailAddressToProvider]: True, if the user's email address will be sent to the provider.
/// * [isFlexible]: True, if the total price depends on the shipping method.
final class Invoice extends TdObject {
  /// **Invoice** *(invoice)* - basic class
  ///
  /// Product invoice.
  ///
  /// * [currency]: ISO 4217 currency code.
  /// * [priceParts]: A list of objects used to calculate the total price of the product.
  /// * [subscriptionPeriod]: The number of seconds between consecutive Telegram Star debiting for subscription invoices; 0 if the invoice doesn't create subscription.
  /// * [maxTipAmount]: The maximum allowed amount of tip in the smallest units of the currency.
  /// * [suggestedTipAmounts]: Suggested amounts of tip in the smallest units of the currency.
  /// * [recurringPaymentTermsOfServiceUrl]: An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay.
  /// * [termsOfServiceUrl]: An HTTP URL with terms of service for non-recurring payments. If non-empty, then the user must accept the terms of service before allowed to pay.
  /// * [isTest]: True, if the payment is a test payment.
  /// * [needName]: True, if the user's name is needed for payment.
  /// * [needPhoneNumber]: True, if the user's phone number is needed for payment.
  /// * [needEmailAddress]: True, if the user's email address is needed for payment.
  /// * [needShippingAddress]: True, if the user's shipping address is needed for payment.
  /// * [sendPhoneNumberToProvider]: True, if the user's phone number will be sent to the provider.
  /// * [sendEmailAddressToProvider]: True, if the user's email address will be sent to the provider.
  /// * [isFlexible]: True, if the total price depends on the shipping method.
  const Invoice({
    required this.currency,
    required this.priceParts,
    required this.subscriptionPeriod,
    required this.maxTipAmount,
    required this.suggestedTipAmounts,
    required this.recurringPaymentTermsOfServiceUrl,
    required this.termsOfServiceUrl,
    required this.isTest,
    required this.needName,
    required this.needPhoneNumber,
    required this.needEmailAddress,
    required this.needShippingAddress,
    required this.sendPhoneNumberToProvider,
    required this.sendEmailAddressToProvider,
    required this.isFlexible,
  });

  /// ISO 4217 currency code
  final String currency;

  /// A list of objects used to calculate the total price of the product
  final List<LabeledPricePart> priceParts;

  /// The number of seconds between consecutive Telegram Star debiting for subscription invoices; 0 if the invoice doesn't create subscription
  final int subscriptionPeriod;

  /// The maximum allowed amount of tip in the smallest units of the currency
  final int maxTipAmount;

  /// Suggested amounts of tip in the smallest units of the currency
  final List<int> suggestedTipAmounts;

  /// An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay
  final String recurringPaymentTermsOfServiceUrl;

  /// An HTTP URL with terms of service for non-recurring payments. If non-empty, then the user must accept the terms of service before allowed to pay
  final String termsOfServiceUrl;

  /// True, if the payment is a test payment
  final bool isTest;

  /// True, if the user's name is needed for payment
  final bool needName;

  /// True, if the user's phone number is needed for payment
  final bool needPhoneNumber;

  /// True, if the user's email address is needed for payment
  final bool needEmailAddress;

  /// True, if the user's shipping address is needed for payment
  final bool needShippingAddress;

  /// True, if the user's phone number will be sent to the provider
  final bool sendPhoneNumberToProvider;

  /// True, if the user's email address will be sent to the provider
  final bool sendEmailAddressToProvider;

  /// True, if the total price depends on the shipping method
  final bool isFlexible;

  /// Parse from a json
  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        currency: json['currency'],
        priceParts: List<LabeledPricePart>.from((json['price_parts'] ?? [])
            .map((item) => LabeledPricePart.fromJson(item))
            .toList()),
        subscriptionPeriod: json['subscription_period'],
        maxTipAmount: json['max_tip_amount'],
        suggestedTipAmounts: List<int>.from(
            (json['suggested_tip_amounts'] ?? []).map((item) => item).toList()),
        recurringPaymentTermsOfServiceUrl:
            json['recurring_payment_terms_of_service_url'],
        termsOfServiceUrl: json['terms_of_service_url'],
        isTest: json['is_test'],
        needName: json['need_name'],
        needPhoneNumber: json['need_phone_number'],
        needEmailAddress: json['need_email_address'],
        needShippingAddress: json['need_shipping_address'],
        sendPhoneNumberToProvider: json['send_phone_number_to_provider'],
        sendEmailAddressToProvider: json['send_email_address_to_provider'],
        isFlexible: json['is_flexible'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "price_parts": priceParts.map((i) => i.toJson()).toList(),
      "subscription_period": subscriptionPeriod,
      "max_tip_amount": maxTipAmount,
      "suggested_tip_amounts": suggestedTipAmounts.map((i) => i).toList(),
      "recurring_payment_terms_of_service_url":
          recurringPaymentTermsOfServiceUrl,
      "terms_of_service_url": termsOfServiceUrl,
      "is_test": isTest,
      "need_name": needName,
      "need_phone_number": needPhoneNumber,
      "need_email_address": needEmailAddress,
      "need_shipping_address": needShippingAddress,
      "send_phone_number_to_provider": sendPhoneNumberToProvider,
      "send_email_address_to_provider": sendEmailAddressToProvider,
      "is_flexible": isFlexible,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code
  /// * [price_parts]: A list of objects used to calculate the total price of the product
  /// * [subscription_period]: The number of seconds between consecutive Telegram Star debiting for subscription invoices; 0 if the invoice doesn't create subscription
  /// * [max_tip_amount]: The maximum allowed amount of tip in the smallest units of the currency
  /// * [suggested_tip_amounts]: Suggested amounts of tip in the smallest units of the currency
  /// * [recurring_payment_terms_of_service_url]: An HTTP URL with terms of service for recurring payments. If non-empty, the invoice payment will result in recurring payments and the user must accept the terms of service before allowed to pay
  /// * [terms_of_service_url]: An HTTP URL with terms of service for non-recurring payments. If non-empty, then the user must accept the terms of service before allowed to pay
  /// * [is_test]: True, if the payment is a test payment
  /// * [need_name]: True, if the user's name is needed for payment
  /// * [need_phone_number]: True, if the user's phone number is needed for payment
  /// * [need_email_address]: True, if the user's email address is needed for payment
  /// * [need_shipping_address]: True, if the user's shipping address is needed for payment
  /// * [send_phone_number_to_provider]: True, if the user's phone number will be sent to the provider
  /// * [send_email_address_to_provider]: True, if the user's email address will be sent to the provider
  /// * [is_flexible]: True, if the total price depends on the shipping method
  Invoice copyWith({
    String? currency,
    List<LabeledPricePart>? priceParts,
    int? subscriptionPeriod,
    int? maxTipAmount,
    List<int>? suggestedTipAmounts,
    String? recurringPaymentTermsOfServiceUrl,
    String? termsOfServiceUrl,
    bool? isTest,
    bool? needName,
    bool? needPhoneNumber,
    bool? needEmailAddress,
    bool? needShippingAddress,
    bool? sendPhoneNumberToProvider,
    bool? sendEmailAddressToProvider,
    bool? isFlexible,
  }) =>
      Invoice(
        currency: currency ?? this.currency,
        priceParts: priceParts ?? this.priceParts,
        subscriptionPeriod: subscriptionPeriod ?? this.subscriptionPeriod,
        maxTipAmount: maxTipAmount ?? this.maxTipAmount,
        suggestedTipAmounts: suggestedTipAmounts ?? this.suggestedTipAmounts,
        recurringPaymentTermsOfServiceUrl: recurringPaymentTermsOfServiceUrl ??
            this.recurringPaymentTermsOfServiceUrl,
        termsOfServiceUrl: termsOfServiceUrl ?? this.termsOfServiceUrl,
        isTest: isTest ?? this.isTest,
        needName: needName ?? this.needName,
        needPhoneNumber: needPhoneNumber ?? this.needPhoneNumber,
        needEmailAddress: needEmailAddress ?? this.needEmailAddress,
        needShippingAddress: needShippingAddress ?? this.needShippingAddress,
        sendPhoneNumberToProvider:
            sendPhoneNumberToProvider ?? this.sendPhoneNumberToProvider,
        sendEmailAddressToProvider:
            sendEmailAddressToProvider ?? this.sendEmailAddressToProvider,
        isFlexible: isFlexible ?? this.isFlexible,
      );

  /// TDLib object type
  static const String defaultObjectId = 'invoice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
