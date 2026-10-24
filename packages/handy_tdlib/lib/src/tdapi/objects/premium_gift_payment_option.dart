part of '../tdapi.dart';

/// **PremiumGiftPaymentOption** *(premiumGiftPaymentOption)* - basic class
///
/// Describes an option for gifting Telegram Premium to a user. Use telegramPaymentPurposePremiumGift for out-of-store payments or payments in Telegram Stars.
///
/// * [currency]: ISO 4217 currency code for the payment.
/// * [amount]: The amount to pay, in the smallest units of the currency.
/// * [starCount]: The alternative Telegram Star amount to pay; 0 if payment in Telegram Stars is not possible.
/// * [discountPercentage]: The discount associated with this option, as a percentage.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active.
/// * [storeProductId]: Identifier of the store product associated with the option.
/// * [sticker]: A sticker to be shown along with the option; may be null if unknown *(optional)*.
final class PremiumGiftPaymentOption extends TdObject {
  /// **PremiumGiftPaymentOption** *(premiumGiftPaymentOption)* - basic class
  ///
  /// Describes an option for gifting Telegram Premium to a user. Use telegramPaymentPurposePremiumGift for out-of-store payments or payments in Telegram Stars.
  ///
  /// * [currency]: ISO 4217 currency code for the payment.
  /// * [amount]: The amount to pay, in the smallest units of the currency.
  /// * [starCount]: The alternative Telegram Star amount to pay; 0 if payment in Telegram Stars is not possible.
  /// * [discountPercentage]: The discount associated with this option, as a percentage.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active.
  /// * [storeProductId]: Identifier of the store product associated with the option.
  /// * [sticker]: A sticker to be shown along with the option; may be null if unknown *(optional)*.
  const PremiumGiftPaymentOption({
    required this.currency,
    required this.amount,
    required this.starCount,
    required this.discountPercentage,
    required this.monthCount,
    required this.storeProductId,
    this.sticker,
  });

  /// ISO 4217 currency code for the payment
  final String currency;

  /// The amount to pay, in the smallest units of the currency
  final int amount;

  /// The alternative Telegram Star amount to pay; 0 if payment in Telegram Stars is not possible
  final int starCount;

  /// The discount associated with this option, as a percentage
  final int discountPercentage;

  /// Number of months the Telegram Premium subscription will be active
  final int monthCount;

  /// Identifier of the store product associated with the option
  final String storeProductId;

  /// A sticker to be shown along with the option; may be null if unknown
  final Sticker? sticker;

  /// Parse from a json
  factory PremiumGiftPaymentOption.fromJson(Map<String, dynamic> json) =>
      PremiumGiftPaymentOption(
        currency: json['currency'],
        amount: json['amount'],
        starCount: json['star_count'],
        discountPercentage: json['discount_percentage'],
        monthCount: json['month_count'],
        storeProductId: json['store_product_id'],
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "amount": amount,
      "star_count": starCount,
      "discount_percentage": discountPercentage,
      "month_count": monthCount,
      "store_product_id": storeProductId,
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code for the payment
  /// * [amount]: The amount to pay, in the smallest units of the currency
  /// * [star_count]: The alternative Telegram Star amount to pay; 0 if payment in Telegram Stars is not possible
  /// * [discount_percentage]: The discount associated with this option, as a percentage
  /// * [month_count]: Number of months the Telegram Premium subscription will be active
  /// * [store_product_id]: Identifier of the store product associated with the option
  /// * [sticker]: A sticker to be shown along with the option; may be null if unknown
  PremiumGiftPaymentOption copyWith({
    String? currency,
    int? amount,
    int? starCount,
    int? discountPercentage,
    int? monthCount,
    String? storeProductId,
    Sticker? sticker,
  }) =>
      PremiumGiftPaymentOption(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        monthCount: monthCount ?? this.monthCount,
        storeProductId: storeProductId ?? this.storeProductId,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumGiftPaymentOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
