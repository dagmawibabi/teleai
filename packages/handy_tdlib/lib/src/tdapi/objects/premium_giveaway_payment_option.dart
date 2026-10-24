part of '../tdapi.dart';

/// **PremiumGiveawayPaymentOption** *(premiumGiveawayPaymentOption)* - basic class
///
/// Describes an option for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members. Use telegramPaymentPurposePremiumGiftCodes or telegramPaymentPurposePremiumGiveaway for out-of-store payments.
///
/// * [currency]: ISO 4217 currency code for Telegram Premium gift code payment.
/// * [amount]: The amount to pay, in the smallest units of the currency.
/// * [winnerCount]: Number of users who will be able to activate the gift codes.
/// * [monthCount]: Number of months the Telegram Premium subscription will be active.
/// * [storeProductId]: Identifier of the store product associated with the option; may be empty if none.
/// * [storeProductQuantity]: Number of times the store product must be paid.
final class PremiumGiveawayPaymentOption extends TdObject {
  /// **PremiumGiveawayPaymentOption** *(premiumGiveawayPaymentOption)* - basic class
  ///
  /// Describes an option for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members. Use telegramPaymentPurposePremiumGiftCodes or telegramPaymentPurposePremiumGiveaway for out-of-store payments.
  ///
  /// * [currency]: ISO 4217 currency code for Telegram Premium gift code payment.
  /// * [amount]: The amount to pay, in the smallest units of the currency.
  /// * [winnerCount]: Number of users who will be able to activate the gift codes.
  /// * [monthCount]: Number of months the Telegram Premium subscription will be active.
  /// * [storeProductId]: Identifier of the store product associated with the option; may be empty if none.
  /// * [storeProductQuantity]: Number of times the store product must be paid.
  const PremiumGiveawayPaymentOption({
    required this.currency,
    required this.amount,
    required this.winnerCount,
    required this.monthCount,
    required this.storeProductId,
    required this.storeProductQuantity,
  });

  /// ISO 4217 currency code for Telegram Premium gift code payment
  final String currency;

  /// The amount to pay, in the smallest units of the currency
  final int amount;

  /// Number of users who will be able to activate the gift codes
  final int winnerCount;

  /// Number of months the Telegram Premium subscription will be active
  final int monthCount;

  /// Identifier of the store product associated with the option; may be empty if none
  final String storeProductId;

  /// Number of times the store product must be paid
  final int storeProductQuantity;

  /// Parse from a json
  factory PremiumGiveawayPaymentOption.fromJson(Map<String, dynamic> json) =>
      PremiumGiveawayPaymentOption(
        currency: json['currency'],
        amount: json['amount'],
        winnerCount: json['winner_count'],
        monthCount: json['month_count'],
        storeProductId: json['store_product_id'],
        storeProductQuantity: json['store_product_quantity'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "amount": amount,
      "winner_count": winnerCount,
      "month_count": monthCount,
      "store_product_id": storeProductId,
      "store_product_quantity": storeProductQuantity,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code for Telegram Premium gift code payment
  /// * [amount]: The amount to pay, in the smallest units of the currency
  /// * [winner_count]: Number of users who will be able to activate the gift codes
  /// * [month_count]: Number of months the Telegram Premium subscription will be active
  /// * [store_product_id]: Identifier of the store product associated with the option; may be empty if none
  /// * [store_product_quantity]: Number of times the store product must be paid
  PremiumGiveawayPaymentOption copyWith({
    String? currency,
    int? amount,
    int? winnerCount,
    int? monthCount,
    String? storeProductId,
    int? storeProductQuantity,
  }) =>
      PremiumGiveawayPaymentOption(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        winnerCount: winnerCount ?? this.winnerCount,
        monthCount: monthCount ?? this.monthCount,
        storeProductId: storeProductId ?? this.storeProductId,
        storeProductQuantity: storeProductQuantity ?? this.storeProductQuantity,
      );

  /// TDLib object type
  static const String defaultObjectId = 'premiumGiveawayPaymentOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
