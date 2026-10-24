part of '../tdapi.dart';

/// **StarPaymentOption** *(starPaymentOption)* - basic class
///
/// Describes an option for buying Telegram Stars. Use telegramPaymentPurposeStars for out-of-store payments.
///
/// * [currency]: ISO 4217 currency code for the payment.
/// * [amount]: The amount to pay, in the smallest units of the currency.
/// * [starCount]: Number of Telegram Stars that will be purchased.
/// * [storeProductId]: Identifier of the store product associated with the option; may be empty if none.
/// * [isAdditional]: True, if the option must be shown only in the full list of payment options.
final class StarPaymentOption extends TdObject {
  /// **StarPaymentOption** *(starPaymentOption)* - basic class
  ///
  /// Describes an option for buying Telegram Stars. Use telegramPaymentPurposeStars for out-of-store payments.
  ///
  /// * [currency]: ISO 4217 currency code for the payment.
  /// * [amount]: The amount to pay, in the smallest units of the currency.
  /// * [starCount]: Number of Telegram Stars that will be purchased.
  /// * [storeProductId]: Identifier of the store product associated with the option; may be empty if none.
  /// * [isAdditional]: True, if the option must be shown only in the full list of payment options.
  const StarPaymentOption({
    required this.currency,
    required this.amount,
    required this.starCount,
    required this.storeProductId,
    required this.isAdditional,
  });

  /// ISO 4217 currency code for the payment
  final String currency;

  /// The amount to pay, in the smallest units of the currency
  final int amount;

  /// Number of Telegram Stars that will be purchased
  final int starCount;

  /// Identifier of the store product associated with the option; may be empty if none
  final String storeProductId;

  /// True, if the option must be shown only in the full list of payment options
  final bool isAdditional;

  /// Parse from a json
  factory StarPaymentOption.fromJson(Map<String, dynamic> json) =>
      StarPaymentOption(
        currency: json['currency'],
        amount: json['amount'],
        starCount: json['star_count'],
        storeProductId: json['store_product_id'],
        isAdditional: json['is_additional'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "amount": amount,
      "star_count": starCount,
      "store_product_id": storeProductId,
      "is_additional": isAdditional,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code for the payment
  /// * [amount]: The amount to pay, in the smallest units of the currency
  /// * [star_count]: Number of Telegram Stars that will be purchased
  /// * [store_product_id]: Identifier of the store product associated with the option; may be empty if none
  /// * [is_additional]: True, if the option must be shown only in the full list of payment options
  StarPaymentOption copyWith({
    String? currency,
    int? amount,
    int? starCount,
    String? storeProductId,
    bool? isAdditional,
  }) =>
      StarPaymentOption(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
        storeProductId: storeProductId ?? this.storeProductId,
        isAdditional: isAdditional ?? this.isAdditional,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starPaymentOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
